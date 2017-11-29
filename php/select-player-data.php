<?php
    header('Content-Type:application/json;charset=utf-8');
    require ('init.php');
    $sql=array(
        "SELECT p.photo,p.Chpname,p.num,p.position,t.ch_tname,pd.score FROM player p,team t,
      player_data pd WHERE p.team_id=t.team_id AND p.pid=pd.pid ORDER BY score DESC LIMIT 0,5",

        "SELECT p.photo,p.Chpname,p.num,p.position,t.ch_tname,pd.rebound FROM player p,team t,
      player_data pd WHERE p.team_id=t.team_id AND p.pid=pd.pid ORDER BY rebound DESC LIMIT 0,5",

        "SELECT p.photo,p.Chpname,p.num,p.position,t.ch_tname,pd.assist FROM player p,team t,
      player_data pd WHERE p.team_id=t.team_id AND p.pid=pd.pid ORDER BY assist DESC LIMIT 0,5",

        "SELECT p.photo,p.Chpname,p.num,p.position,t.ch_tname,pd.ST FROM player p,team t,
      player_data pd WHERE p.team_id=t.team_id AND p.pid=pd.pid ORDER BY ST DESC LIMIT 0,5",

        "SELECT p.photo,p.Chpname,p.num,p.position,t.ch_tname,pd.block_shot FROM player p,team t,
      player_data pd WHERE p.team_id=t.team_id AND p.pid=pd.pid ORDER BY block_shot DESC LIMIT 0,5",

        "SELECT p.photo,p.Chpname,p.num,p.position,t.ch_tname,pd.fault FROM player p,team t,
      player_data pd WHERE p.team_id=t.team_id AND p.pid=pd.pid ORDER BY fault DESC LIMIT 0,5",
    );
    $output=[];
    for ($i=0; $i<count($sql); $i++) {
        $result=mysqli_query($conn,$sql[$i]);
        $output[]=mysqli_fetch_all($result,MYSQLI_ASSOC);
    }
    echo json_encode($output);
?>