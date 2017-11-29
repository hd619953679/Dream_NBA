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
    $sql="SELECT p.photo,p.Chpname,t.ch_tname,pd.s_hit_rate,pd.t_hit_rate,pd.score,pd.rebound,
      pd.assist,pd.ST,pd.block_shot,pd.fault,pd.session FROM team t,player p,player_data pd
    WHERE t.team_id=p.team_id AND p.pid=pd.pid ORDER BY $orderBy DESC LIMIT $starti,$ppc";
    $result=mysqli_query($conn,$sql);
    $rows=mysqli_fetch_all($result,MYSQLI_ASSOC);
    echo json_encode($rows);
?>