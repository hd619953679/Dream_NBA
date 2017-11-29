<?php
    header('content-type:application/json;charset=utf-8');
    $teamId=$_REQUEST['teamId'];
    if(empty($teamId)){
        echo '{"code"-1:"msg":"球队编号未找到"}';
        return;
    }
    require('init.php');
    $sql="SELECT * FROM player WHERE team_id=$teamId";
    $result=mysqli_query($conn,$sql);
    $rows=mysqli_fetch_all($result,MYSQLI_ASSOC);
    echo json_encode($rows);
?>