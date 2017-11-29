<?php
	header('content-type:application/json;charset=utf-8');
	@$uname=$_REQUEST['uname'] or die ('{"code":-1,"msg":"未提交用户名!"}');
	@$upwd=$_REQUEST['upwd'] or die ('{"code":-2,"msg":"未提交密码!"}');
	require('init.php');
	$sql="INSERT INTO user VALUES(null,'$uname','$upwd',now(),0)";
	$result=mysqli_query($conn,$sql);
	$size=mysqli_affected_rows($conn);
	if($size==1){
		echo '{"code":1,"msg":"注册成功!"}';
	}else{
		echo '{"code":-3,"msg":"注册失败!"}';
	}
?>