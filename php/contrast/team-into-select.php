<?php
header('content-type:application/json;charset=utf-8');
require('../init.php');
$sql="SELECT team_id,ch_tname FROM team";
$result=mysqli_query($conn,$sql);
$rows=mysqli_fetch_all($result,MYSQLI_ASSOC);
echo  json_encode($rows);
?>