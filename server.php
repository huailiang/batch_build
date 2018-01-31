<?php   

    /**
    * author: huailiang.peng
    * data:   2018-01-24
    * 功能:    处理和 shell&数据库交互相关
    */

    require_once('./db.php');


    if (isset($_POST['action']))  
    {  
         on_pre_op();
         switch($_POST['action'])  
         {  
            case "1":
                btn_gitop();
                break;  
            case "2":
                btn_build_ab();
                break;  
            case "3":
                btn_push_publish();
                break;  
            case "4":
                btn_reset();
                break;  
             default:
                 break;  
         }  
    }  
      
     //合线 列出变化列表 
    function btn_gitop()  
    {        
        $t=(string)time();
        DB::setstate(1);
        DB::insert(1,$t);
        echo shell_exec("sudo sh do_gitop.sh");
        on_finish_op(1,$t);
    }  

    //build ab 生成 ab 列表 并且推送测试服
    function btn_build_ab()  
    {  
        $t=(string)time();
        DB::setstate(2);
        DB::insert(2,$t);
        echo shell_exec("sudo sh do_buildab.sh");
        on_finish_op(2,$t);
    }  

    //推送正式服 升版本号
    function btn_push_publish()  
    {  
        $t = (string)time();
        DB::setstate(3);
        DB::insert(3,$t);
        echo shell_exec("sh do_uploadofficial.sh");
        on_finish_op(3,$t);
    }

    //还原按钮事件
    function btn_reset()  
    {   
        $t = (string)time();
        DB::setstate(4);
        DB::insert(4,$t);
        echo shell_exec("sh do_reset.sh");
        on_finish_op(4,$t);
    }  

    //点击按钮前 先清掉上一次的残留
    function on_pre_op()
    {
        $path="/Library/WebServer/Documents/dn/log.txt";
        if(file_exists($path))
        {
            unlink($path);
        }
    }

     //点击按钮后 把日志存在数据库中
    function on_finish_op($op,$t)
    {
        $path="log.txt";
        $dest= "../".$t.".log";
        if(file_exists($path))
        {
           copy($path,$dest);
        }
        shell_exec("sudo sh logmv.sh");
        DB::setstate(0);
    }

?>  