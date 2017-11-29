<?php
    header('Content-Type:application/json;charset=utf-8');
    @$player1Id=$_REQUEST['player1Id'];
    @$player2Id=$_REQUEST['player2Id'];
    if(empty($player1Id)||empty($player2Id)){
        echo '[]';
        return;
    }
    $arg=array($player1Id,$player2Id);
    require('../init.php');
    $output=[];
    for ($i=0; $i<count($arg); $i++) {
        $sql="SELECT p.photo,p.Chpname,p.Enpname,p.num,p.position,p.tall,p.weight,pd.score,pd.rebound,pd.assist,pd.ST,pd.block_shot,pd.fault FROM player p,player_data pd WHERE p.pid=pd.pid AND p.pid=$arg[$i]";
        $result=mysqli_query($conn,$sql);
        $output[]=mysqli_fetch_assoc($result);
    }
    echo json_encode($output);
?>