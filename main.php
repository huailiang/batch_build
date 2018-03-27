<!--
data: 2018-01-24
auth: huailiang.peng
功能:  此脚本主要处理登录信息 页面布局 事件处理
//-->
<?php ob_start(); ?>
<html>
<head><link rel="stylesheet" href="style.css" type="text/css"></head>
<title>龙之谷-AB打包系统</title>
	<body>

	<?php 
        
		// $ch = curl_init();
  //       curl_setopt($ch, CURLOPT_URL, 'https://gameadm.123u.com/ldap.php');
  //       curl_setopt($ch, CURLOPT_TIMEOUT, 10);
  //       curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
  //       curl_setopt($ch, CURLOPT_HEADER, 0);
  //       curl_setopt($ch, CURLOPT_POST, 1);//post提交方式
  //       $curlPost = 'u=' . $_POST["name"] . '&p=' . urlencode($_POST["pawd"] );
  //       curl_setopt($ch, CURLOPT_POSTFIELDS, $curlPost);
  //       $auth_rs = curl_exec($ch);
  //       curl_close($ch);
  //       $auth = json_decode($auth_rs);
  //       if ($auth->auth == false) 
  //       {
  //           echo "对不起，用户名不存在或者密码不正确";
  //           return;
  //       }

		require_once('./db.php');
        $query=DB::exist($_POST["name"]);
        if($query==0)
        {
            echo "对不起，你没有相关的权限";
            return;
        }
        else
        {
                        setcookie("name",$_POST["name"],time()+360000);
            setcookie("pawd",$_POST["pawd"],time()+360000);
            ob_end_flush();
            DB::update($_POST["name"]);
		    echo "<b>欢迎使用线上 ab打包系统</b>  &nbsp&nbsp&nbsp<a href='read.html' target='_blank'>说明文档</a><br><br>";
		  
        }

	?>	

	<script type="text/javascript" language="javascript"> 

		var xmlHttp;    
		var step;
        var doing;
        var timer;

        window.addEventListener("beforeunload", function (e) {
            var confirmationMessage = '确定离开此页吗？';
            (e || window.event).returnValue = confirmationMessage;     
            return confirmationMessage;                               
        });
    
        function createXMLHttpRequest()
        {   
            //检查浏览器是否支持 XMLHttpRequest 对象  
            if(window.ActiveXObject)
            {    
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");    
            }    
            else if(window.XMLHttpRequest)
            {    
                xmlHttp = new XMLHttpRequest();    
            }    
        }    

        function refresh(v1,v2,busy)
        {
        	document.getElementById("state").innerHTML=v1
        	document.getElementById("content").value = v2;
            document.getElementById("busy").style.display=busy;
        }

        function fun(n)
        {    
            if(doing)
            {
                alert("请等待当前操作完成");
            }
            else if(step == 1 && n.value == 3)
            {
                alert("不能跨步build");
            }
            else if(step ==2 && n.value == 1)
            {
                alert("当前步不能回退");
            }
            else if(n.value == 3)
            {
                var res = confirm("确定推送正式服吗，这样会提升版本号？");
                if(res == true){
                    doclick(n);
                }
            }
            else
            {
                doclick(n);
            }
		}

        function doclick(n)
        {
            doing=true;
            step = n.value;
            refresh("正在构建步骤"+ step +"中, 请稍后 ","","inline");
            createXMLHttpRequest();    
            var url="server.php";    
            xmlHttp.open("POST",url,true);   
            xmlHttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');  
            xmlHttp.onreadystatechange = callback;   
            xmlHttp.send("action=" + step);    
            window.clearInterval(timer);
            timer=window.setInterval(ontimer,500); 
        }
             
        function ontimer()
        {  
            var req = new XMLHttpRequest();     
            req.open("POST","log.txt",false);   
            req.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');      
            req.send(null);    
            refresh("正在构建步骤"+ step +"中, 请稍后 ",req.responseText,"inline");
        }

        function callback()
        {    
            /*
                readystate: 0.请求未初始化 1.服务器连接已建立 2.请求已接收 3.请求处理中 4.请求完成，且响应已就绪
                status: 200.ok( opera浏览器有时返回304)  404: "not fond page"  403. “Forbidden”
            */
            if(xmlHttp.readyState == 4)
            {    
                if(xmlHttp.status == 200 || xmlHttp.status == 304) 
                {  
                    var req = new XMLHttpRequest();     
                    req.open("POST","log.txt",false);   
                    req.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');     
                    req.send(null);    
                    refresh("完成构建步骤"+ step ,req.responseText,"none");  
                    
                    window.clearInterval(timer);
                    doing=false;
                } 
                else
                {
                    alert(req.responseText);
                    window.clearInterval(timer);
                    doing=false;
                }   
            }    
        }   

        function onload(stp,na)
        {
            if(stp>0)
            {
                doing=true;
                step=stp;
                alert(na+"正在构建步骤 "+step+" ,请等待TA操作完成，谢谢！");
                window.location.href="login.php";
            }
        }

	</script>

	<div>  
        <button type="button" class="btn" id="btn1" onclick="fun(this)" value="1">1.拉线-Check</button>  
        <button type="button" class="btn" id="btn2" onclick="fun(this)" value="2">2.BuildBundle 推送测试服</button>
        <button type="button" class="btn" id="btn3" onclick="fun(this)" value="3">3.推送正式 版本号提升</button>
        <button type="button" class="btn" id="btn4" onclick="fun(this)" value="4">4.重新开始 回退</button>  
    </div>  
    <br/>
    <label id="state"></label>
    <img id="busy" src="spinner.gif" style="display:none">
    <br/><br/>
    <textarea rows="56" cols="260" readOnly=true id="content" style="border-style:none"></textarea>
	</body>


    <?php
       $result = DB::getstate();
        if($row = mysql_fetch_array($result))
        {
            echo "<script>onload(".$row['step'].",'".$row['name']."');</script>";
        }
    ?>  
</html>
