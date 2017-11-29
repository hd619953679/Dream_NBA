<?php
    header('Content-Type:application/json;charset=utf-8');
    @$team1Id=$_REQUEST['team1Id'];
    @$team2Id=$_REQUEST['team2Id'];
    if(empty($team1Id)||empty($team2Id)){
        echo '[]';
        return;
    }
    $arg=array($team1Id,$team2Id);
    require('../init.php');
    $output=[];
    for ($i=0; $i<count($arg); $i++) {
        $sqlR = "SELECT count(win)+1 FROM team t,team_data td WHERE t.team_id=td.team_id AND location=(SELECT location FROM team WHERE team_id=$arg[$i]) AND win>(SELECT win FROM team_data WHERE team_id=$arg[$i])";
        $resultR = mysqli_query($conn, $sqlR);
        $output[] = mysqli_fetch_row($resultR);
        $sqlD = "SELECT t.ch_tname,t.en_tname,t.location,t.logo,td.win,td.score,td .rebound,td.assist,td.ST,td.block_shot,td.fault FROM team t,team_data td WHERE t.team_id=td.team_id AND t.team_id=$arg[$i]";
        $resultD = mysqli_query($conn, $sqlD);
        $output[] = mysqli_fetch_assoc($resultD);
    }
    echo json_encode($output);
?>