<?php
    header('content-type:application/json;charset=utf-8');
    setcookie("uid",$_COOKIE['uid'],time()-3600);
    setcookie("uname",$_COOKIE['uname'],time()-3600);
    echo '{"code":1,"msg":"注销成功！"}';
?>