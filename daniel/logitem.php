<?php
require("conn_manager.php");
//log an item
$trolley_no = $_POST["TrolleyNo"];
$barcode = $_POST["barcode"];

$conn = connect();

//log the item to Transactions


?>