<?php
require("conn_manager.php");
//get bill

$trolley_no = $_POST["TrolleyNo"];
//$trolley_no = 1;
$conn = connect();
//QUERY IS WRONG
//This one?
//select IName , des, cost, qty, TrolleyNo from transactions, Items where trolleyno = 1 and paid = 0 and Items.Id = Transactions.Iid;
$query = "select IName , des, cost, qty, TrolleyNo from transactions, Items " . 
    " where trolleyno = ". $trolley_no ." and paid = 0 and Items.Id = Transactions.Iid;";
$result = mysqli_query($conn, $query);
if (!$result) {
    echo "Could not successfully run query ($query) from DB: " . mysql_error();
    exit;
}
if (mysqli_num_rows($result) == 0) {
    //echo "No rows found, nothing to print so am exiting";
    echo "[]";
    exit;
}   
$rows = array();
while($r = mysqli_fetch_assoc($result)) {
    $rows[] = $r;
}
echo json_encode($rows);
?>