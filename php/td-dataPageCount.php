<?php
header("Content-Type:application/json;charset=utf-8");
require('init.php');
$sql="SELECT count(tdId) FROM team_data";
$result=mysqli_query($conn,$sql);
$output=mysqli_fetch_row($result);
echo json_encode($output);
?>