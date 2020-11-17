#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author: penghuailiang
# @Date  : 10/23/19


"""
python jenkins api

run command on terminal at first:

    sudo pip3 install python-jenkins
"""

import jenkins
import time


def connect(url, user, password):
    """
    连接服务器
    :param url: jenkins server
    :param user: 用户名
    :param password: 密码
    :return:
    """
    jks = jenkins.Jenkins(url, username=user, password=password)
    user = jks.get_whoami()
    version = jks.get_version()
    print(version, user['fullName'])
    return jks


def jenkins_job_info(jks):
    """
    获取所有job信息
    :param jks: Jenkins
    :return:
    """
    print("jobs count:", jks.jobs_count())
    jobs = jks.get_jobs()
    for idx, job in enumerate(jobs):
        print("{0} {1} {2}".format(idx, job['fullname'], job['url']))
    return jobs


def jenkins_plugin_info(jks):
    """
    获取插件信息
    :param jks: jenkins
    :return:
    """
    plugins = jks.get_plugins()
    print(plugins)


def jenkins_build(jks, job_name, macro):
    """
    开始build
    """
    uid = time.strftime('%Y%m%d%H%M%S', time.localtime(time.time()))
    jks.build_job(job_name, parameters={'uid': uid, 'branch': 'master', 'macro': macro, 'clean': False})


def jenkins_build_info(jks, job_name):
    """
    获取build信息
    :param jks: jenkins
    :param job_name: job名字
    :return:
    """
    last_build_number = jks.get_job_info(job_name)['lastCompletedBuild']['number']
    build_info = jks.get_build_info(job_name, last_build_number)
    print("build info:\n", build_info)


if __name__ == '__main__':
    server = connect('http://10.253.48.151:8080', 'admin', 'admin')
    if server is not None:
        jobs = jenkins_job_info(server)
        idx = input("input job index(0-{0}):\n".format(len(jobs)))

        try:
            job = jobs[int(idx)]["fullname"]
            print("current job is: {0}".format(job))
            jenkins_build(server, job, 'FMOD_LIVEUPDATE;UNITY_POST_PROCESSING_STACK_V2;CINEMACHINE_TIMELINE')
            jenkins_build_info(server, job)
        except Exception as e:
            print("error ", e)
            raise
