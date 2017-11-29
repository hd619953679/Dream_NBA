<?php
header('Content-Type:application/json;charset=utf-8');
require ('init.php');
$sql=array(
    "SELECT t.logo,t.ch_tname,td.score FROM team t,team_data td WHERE t.team_id=td.team_id ORDER BY td.score DESC LIMIT 0,5",

    "SELECT t.logo,t.ch_tname,td.rebound FROM team t,team_data td WHERE t.team_id=td.team_id ORDER BY td.rebound DESC LIMIT 0,5",

    "SELECT t.logo,t.ch_tname,td.assist FROM team t,team_data td WHERE t.team_id=td.team_id ORDER BY td.assist DESC LIMIT 0,5",

    "SELECT t.logo,t.ch_tname,td.ST FROM team t,team_data td WHERE t.team_id=td.team_id ORDER BY td.ST DESC LIMIT 0,5",

    "SELECT t.logo,t.ch_tname,td.block_shot FROM team t,team_data td WHERE t.team_id=td.team_id ORDER BY td.block_shot DESC LIMIT 0,5",

    "SELECT t.logo,t.ch_tname,td.fault FROM team t,team_data td WHERE t.team_id=td.team_id ORDER BY td.fault DESC LIMIT 0,5"
);
$output=[];
for ($i=0; $i<count($sql); $i++) {
    $result=mysqli_query($conn,$sql[$i]);
    $output[]=mysqli_fetch_all($result,MYSQLI_ASSOC);
}
echo json_encode($output);
?>