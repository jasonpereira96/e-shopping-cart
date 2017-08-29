<?php
require("conn_manager.php");

//clear the bill

//$trolley_no = $_POST["TrolleyNo"];
$trolley_no = 1;

$conn = connect();

$query = "select * from Trolleys where TrolleyNo = " . $trolley_no . ";"; 
$result = mysqli_query($conn, $query);
$row = mysqli_fetch_assoc($result);
$Tid = $row["Tid"]; //got this    

$query = "update transactions set paid = 1 where TrolleyNo = " . $trolley_no . " and Tid = " . $Tid . " ;";
$result = mysqli_query($conn, $query);

$query = "update Trolleys set Tid = " . ($Tid + 1) . " where TrolleyNo = " . $trolley_no . ";";
$result = mysqli_query($conn, $query);

echo "Bill cleared.";
?>