<?php
	header('content-type:application/json;charset=utf-8');
	@$uname=$_REQUEST['uname'] or die ('{"code":-1,"msg":"未提交用户名!"}');
    @$upwd=$_REQUEST['upwd'] or die ('{"code":-2,"msg":"未提交密码!"}');
    require('init.php');
    $sql="SELECT * FROM user WHERE uname='$uname' AND upwd='$upwd'";
    $result=mysqli_query($conn,$sql);
    $rows=mysqli_fetch_all($result,MYSQLI_ASSOC);
    if($rows){
    	$loginTime="UPDATE user SET lastTime=now() WHERE uname='$uname'";
    	mysqli_query($conn,$loginTime);
    	$uid=$rows[0]['uid'];
        setcookie("uid","$uid",time()+3600);
        setcookie("uname","$uname",time()+3600);
        echo '{"code":1,"msg":"登陆成功"}';
        //session_start();//设置随机且唯一的房间号
        //$_SESSION['uname']=$uname;
//        $_SESSION['uid']=$rows[0]['uid'];

    }else{
    	echo '{"code":-3,"msg":"用户名或密码不存在!"}';
    }
?>