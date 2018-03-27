<p align="center">
    <a href="https://huailiang.github.io/" target="_blank">
    	<img src="https://huailiang.github.io/img/avatar-Alex.jpg" width="320" height="300">
    </a>
</p>

<b>龙之谷打补丁说明文档:</b>

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


联系作者：penghuailiang@126.com
