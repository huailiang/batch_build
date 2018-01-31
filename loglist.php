<!--
data: 2018-01-24
auth: huailiang.peng
功能:  日志查询系统
//-->

<html>
<title>龙之谷-日志查询系统</title>

	<?php 
        $id=$_GET['log'];
        $log="log/".$id.".log";
        if(file_exists($log))
        {
            echo "<b>日志".$id.":</b><br><br>";
            $txt = file_get_contents($log);
            $txt = preg_replace('/\n|\r\r/', '<br>', $txt);
            echo $txt;
        }
        else
        {
            echo "对不起，你查询的日志不存在！";
        }

	?>	

</html>
