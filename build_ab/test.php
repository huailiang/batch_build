<html>
	<body>

	<?php 
		 //echo shell_exec("id -a");
		 echo "<br>";
		 echo exec('whoami');
		 echo "<br>";
		 echo shell_exec("sh test.sh");
		 echo "<br>finish";
	?>	
    </body>
</html>
