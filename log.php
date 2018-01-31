<!--
data: 2018-01-24
auth: huailiang.peng
功能:  日志查询系统
//-->

<html>
<title>龙之谷-日志查询系统</title>
<body>
	<?php 
         echo "龙之谷-日志查询系统<br><br>";
         $con=mysql_connect("127.0.0.1","root","123u123u");
         if(!$con) die("could not connect:".mysql_error());
         mysql_select_db("dn", $con);
         $sql="select * from record order by Stamp desc limit 30";
         $rest=mysql_query($sql,$con);
         echo "<table border='0' cellspacing='10'>";
         echo "<tr><th> 序列 </th><th> 用户名 </th> <th> 操作按钮 </th><th> 操作时间 </th><th> 日志ID </th></tr>";
         $index = 1;
          while($row = mysql_fetch_array($rest))
          {
              echo "<tr>";
              echo "<td>".$index."</td>";
              echo "<td>".$row["Name"]."</td>";
              echo "<td align='center'>".$row["Opt"]."</td>";
              echo "<td>".$row["Stamp"]."</td>";
              echo "<td><a href='loglist.php?log=".$row["log"]."'>".$row["log"]."</a></td>";
              echo "</tr>";
              $index=$index+1;
          }
         mysql_close($con);

	?>	
</body>
</html>
