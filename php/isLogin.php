<?php
    header('content-type:application/json;charset=utf-8');
    @$uid=$_COOKIE['uid'] or die(json_encode(["false"]));
    @$uname=$_COOKIE['uname'] or die(json_encode(["false"]));
    $arr=["true",$uname];
    //session_start();////找到房间号
// $output['uname']=$_session['uname']
// $output['uname']=$_session['uid']
    echo json_encode($arr);
?>