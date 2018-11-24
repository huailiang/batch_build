<p align="center">
    <a href="https://huailiang.github.io/" target="_blank">
    	<img src="https://huailiang.github.io/img/avatar-Alex-home.jpg" width="320" height="300">
    </a>
</p>


# Batch Build

<b>此项目包含两部分内容：</b>

- 出包脚本   build目录

- 出补丁脚本 build_ab目录


<b>Jenkins出包脚本:</b>

unity 支持以batch的模式打包，需要c#测预留好接口，Shell可以直接调用c#接口用以出包

如何安装jenkins， 可以参考读者的一篇文章: https://huailiang.github.io/2018/02/27/autopublish/

进入build目录，shell脚本说明：

- build_android.sh   用以出android包，生成apk
- build_ios.sh 	   	 用以出ios包，生成ipa 需要配置和脚本里对应的证书
- build_windows.sh   用以生成windows包，生成zip
- build_ios_batch.sh 可以指定git某个节点，生成ios包
- git.sh   			 git切分支，清理本地环境，拉取最新
- git_tag.sh 		 git清理环境，切到制定节点，跟分支无关
- qrcode.sh    		 用以生成二维码下载链接，如果是ios平台，需要相关企业证书和搭建支持items-services协议的环境
- sendmail.sh        打包生成后，给打包人发送邮件
- upload.sh          上传包体到本地web服务器，同时生成下载链接，作者在本地mac上搭建了一个apache服务器
- xbuild2dll.sh      将代码编程dll, 需要本地安装了MonoDeveloper
- mailformat		 邮件内容格式



<b>打补丁说明文档:</b>

进入build_ab目录：


1. 请严格按照步骤顺序执行，不要跨步操作

2. 如果执行了前两步，可以回退。如果执行了第三步，不可以回退（需要提升版本号）

3. 每一步如果顺利执行完，都会看到"*****"的结束行，否则就意味着中间步骤出错了（自检或者需要程序猿介入)

4. 只有加过权限的人才能进入该系统 默认对陌生人关闭，超级管理员网站请点击<a href='http://10.0.127.200/phpmyadmin/' target='_blank'>这里</a>

5. 查看日志记录，请点击<a href='http://10.0.127.200/dn/log.php' target='_blank'>这里</a>

点击第一个按钮：
	Git 清干净本地环境 
	Git OB拉最新 Release拉最新 OB->Release(Merge)
	统计和上个版本tag之间的文件变更，等待主管确认

点击第二个按钮：
	开始Build Bundle
	上传ab到qa测试服，等待qa测试

点击第三个按钮：
	上传ab到正式服
	提升版本号
	至此，你可以告知服务器同学和腾讯运营了

点击第四个按钮：
	回退本地操作（git）， 如果你点击了第三个按钮，版本号会提升 否则就没有

点击第五个按钮：
	日志系统 记录用户名、按钮id、时间戳、相关log信息
	日志系统是从数据库抓取最近三十条记录
	日志列表第一个链接如果是空，说明当前当做还在进行，进行完了日志就生成了


联系作者：peng_huailiang@qq.com
