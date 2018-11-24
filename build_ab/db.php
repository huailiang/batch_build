<?php   
    
    /**
    * author: huailiang.peng
    * data:   2018-01-24
    * 功能:    数据库操作
    */
    class DB 
    {
        
        public static function create()
        {
            $sql_db = "CREATE DATABASE dn";
            $sql_tb = "CREATE TABLE Record 
            (
            Name varchar(15),
            Des varchar(15),
            Stamp DATETIME,
            Opt int
            )";

            if ($con->query($sql_db))
            {
              echo "Database created";
              // mysql_select_db("dn", $con);
              // mysql_query($sql_tb,$con);
              $con->query($sql_tb); 
            }
            else
            {
              echo "Error creating database: " . mysql_error();
            }
        }

        public static function insert($op,$t)
        {
            $user=$_COOKIE["name"];
            $con=new mysqli("127.0.0.1","root","123u123u","dn");
            if(!$con) die("could not connect:".mysql_error());
            // mysqli_select_db("dn", $con);
            $arr = array('pull git','build bundle',"push official and improve version",'reset option' );
            $sql = "INSERT INTO record (Name, log, Des, Stamp, Opt) VALUES ('".$user."', '".$t."', '".$arr[$op-1]."', now(),".$op.")";
            $con->query($sql); 
            $con->close();
        }

        public static function regist()
        {
            $user=$_COOKIE["name"];
            $pawd=$_COOKIE["pawd"];
            $con = new mysqli("127.0.0.1","root","123u123u","dn");
            if(!$con) die("could not connect:".mysql_error());
            // mysqli_select_db("dn", $con);
            $sql = "INSERT INTO user (Name, ltime) VALUES ('".$user."', now())";
            $con->query($sql); 
            $con->close(); 
        }


        public static function exist($name)
        {
            $rst=0;
            $con = new mysqli("127.0.0.1","root","123u123u","dn");
            if(!$con) die("could not connect:".mysql_error());
            // mysqli_select_db("dn", $con);
            $sql="select * from user where name = '".$name."'";
            $rest=$con->query($sql);
            if(mysqli_num_rows($rest)) $rst=1;
            $con->close();
            return $rst;
        }


        public static function update($name)
        {
            $con = new mysqli("127.0.0.1","root","123u123u","dn");
            if(!$con) die("could not connect:".mysql_error());
            mysqli_select_db($con,"dn");
            $sql="update user set ltime = now() where name = '".$name."'";
            // $rest=mysql_query($sql,$con);
            $con->query($sql); 
            $con->close();
        }


        public static function log($op,$log)
        {
            $user=$_COOKIE["name"];
            $con=mysqli_connect("127.0.0.1","root","123u123u","dn");
            if(!$con) die("could not connect:".mysql_error());
            mysqli_select_db("dn", $con);
            $sql = "INSERT INTO log (name, log, Stamp, Opt) VALUES ('".$user."', '".$log."', now(),".$op.")";
            // mysql_query($sql,$con); 
            $con->query($sql);
            $con->close();
        }

        public static function getstate()
        {
            $con=mysqli_connect("127.0.0.1","root","123u123u");
            if(!$con) die("could not connect:".mysql_error());
            mysqli_select_db("dn", $con);
            $sql = "select * from status";
            // $result = mysql_query($sql,$con); 
            $result = $con->query($sql);
            $con->close();
            return $result;  
        }

        //if $op=0 clear 
         public static function setstate($op)
         {
            $sql="truncate table status";
            $user=$_COOKIE["name"];
            $con=mysqli_connect("127.0.0.1","root","123u123u","dn");
            if(!$con) die("could not connect:".mysql_error());
            mysqli_select_db($con, "dn");
            $con->query($sql);
            // mysql_query($sql,$con); 
            if($op!=0)
            {
                $sql = "INSERT INTO status (name, step) VALUES ('".$user."', ".$op.")";
                // mysql_query($sql,$con); 
                $con->query($sql);
            }
             $con->close();
         }

    }

     
?>  