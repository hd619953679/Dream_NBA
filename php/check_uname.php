<?php
	header('content-type:application/json;charset=utf-8');
//筛选重复的用户名！！
	@$uname=$_REQUEST['uname'] or die('{"code":-1,"msg":"用户名不能为空!"}');
	require('init.php');
	$sql="SELECT * FROM user WHERE uname='$uname'";
	$result=mysqli_query($conn,$sql);
	$row=mysqli_fetch_assoc($result);
	if(!$row){
		echo '{"code":1,"msg":"该用户名可以使用"}';
	}else{
		echo '{"code":-2,"msg":"该用户名已被占用!"}';
	}
?>