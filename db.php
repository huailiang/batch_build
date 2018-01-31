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

            if (mysql_query($sql_db,$con))
            {
              echo "Database created";
              mysql_select_db("dn", $con);
              mysql_query($sql_tb,$con);
            }
            else
            {
              echo "Error creating database: " . mysql_error();
            }
        }

        public static function insert($op,$t)
        {
            $user=$_COOKIE["name"];
            $con=mysql_connect("127.0.0.1","root","123u123u");
            if(!$con) die("could not connect:".mysql_error());
            mysql_select_db("dn", $con);
            $arr = array('pull git','build bundle',"push official and improve version",'reset option' );
            $sql = "INSERT INTO record (Name, log, Des, Stamp, Opt) VALUES ('".$user."', '".$t."', '".$arr[$op-1]."', now(),".$op.")";
            mysql_query($sql,$con); 
            mysql_close($con);  
        }

        public static function regist()
        {
            $user=$_COOKIE["name"];
            $pawd=$_COOKIE["pawd"];
            $con=mysql_connect("127.0.0.1","root","123u123u");
            if(!$con) die("could not connect:".mysql_error());
            mysql_select_db("dn", $con);
            $sql = "INSERT INTO user (Name, ltime) VALUES ('".$user."', now())";
            mysql_query($sql,$con); 
            mysql_close($con);  
        }


        public static function exist($name)
        {
            $rst=0;
            $con=mysql_connect("127.0.0.1","root","123u123u");
            if(!$con) die("could not connect:".mysql_error());
            mysql_select_db("dn", $con);
            $sql="select * from user where name = '".$name."'";
            $rest=mysql_query($sql,$con);
            if(mysql_num_rows($rest)) $rst=1;
            mysql_close($con);
            return $rst;
        }


        public static function update($name)
        {
            $con=mysql_connect("127.0.0.1","root","123u123u");
            if(!$con) die("could not connect:".mysql_error());
            mysql_select_db("dn", $con);
            $sql="update user set ltime = now() where name = '".$name."'";
            $rest=mysql_query($sql,$con);
            mysql_close($con);
        }


        public static function log($op,$log)
        {
            $user=$_COOKIE["name"];
            $con=mysql_connect("127.0.0.1","root","123u123u");
            if(!$con) die("could not connect:".mysql_error());
            mysql_select_db("dn", $con);
            $sql = "INSERT INTO log (name, log, Stamp, Opt) VALUES ('".$user."', '".$log."', now(),".$op.")";
            mysql_query($sql,$con); 
            mysql_close($con);  
        }

        public static function getstate()
        {
            $con=mysql_connect("127.0.0.1","root","123u123u");
            if(!$con) die("could not connect:".mysql_error());
            mysql_select_db("dn", $con);
            $sql = "select * from status";
            $result = mysql_query($sql,$con); 
            mysql_close($con);
            return $result;  
        }

        //if $op=0 clear 
         public static function setstate($op)
         {
            $sql="truncate table status";
            $user=$_COOKIE["name"];
            $con=mysql_connect("127.0.0.1","root","123u123u");
            if(!$con) die("could not connect:".mysql_error());
            mysql_select_db("dn", $con);
            mysql_query($sql,$con); 
            if($op!=0)
            {
                $sql = "INSERT INTO status (name, step) VALUES ('".$user."', ".$op.")";
                mysql_query($sql,$con); 
            }
             mysql_close($con);  
         }

    }

     
?>  