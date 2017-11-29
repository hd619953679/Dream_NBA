<?php
    header("Content-Type:application/json;charset=utf-8");
    @$starti=$_REQUEST['starti'];
    @$ppc=$_REQUEST['ppc'];
    @$orderBy=$_REQUEST['orderBy'];
    if(!isset($starti)||empty($ppc)||empty($orderBy)){
        echo '[]';
        return;
    }
    require('init.php');
    $sql="SELECT t.logo,t.ch_tname,td.win,td.score,td.rebound,td.assist,td.ST,
td.block_shot,td.fault FROM team t,team_data td WHERE t.team_id=td.team_id 
ORDER BY td.$orderBy DESC LIMIT $starti,$ppc";
    $result=mysqli_query($conn,$sql);
    $rows=mysqli_fetch_all($result,MYSQLI_ASSOC);
    echo json_encode($rows);
?>