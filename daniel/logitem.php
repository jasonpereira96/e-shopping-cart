<?php
require("conn_manager.php");
//log an item
//$trolley_no = $_POST["TrolleyNo"];
//$barcode = $_POST["barcode"];

$trolley_no = 1;
$barcode = 'k002';


$conn = connect();

$query = "select * from Items where barcode = '" . $barcode . "';"; 
$result = mysqli_query($conn, $query);
$row = mysqli_fetch_assoc($result);     //echo "id is: " . $row["Id"]; //This is case sensitive :'( 
$itemId = $row["Id"]; //got this

//at this point, we also need to put the data in a json and echo it back, if we're gonna use a pi screen
echo json_encode($row);

$query = "select * from Trolleys where TrolleyNo = " . $trolley_no . ";"; 
$result = mysqli_query($conn, $query);
$row = mysqli_fetch_assoc($result);
$Tid = $row["Tid"]; //got this    
/*
The query for Item ID and Trolley No are used in both places
We can improve this!
*/
//log the item to Transactions
//first check if its already there, then only increase qty
$query = "SELECT * FROM `transactions` where Iid = " . $itemId . " and TrolleyNo = ". $trolley_no ." ;";
$result = mysqli_query($conn, $query);
$exists = mysqli_num_rows($result) > 0;

if ($exists) {
    //to check
    /*
    SELECT * FROM `transactions` where Iid = (select Id from Items where barcode = 'k002') and TrolleyNo = 1;
    */
    $query = "update transactions set qty = qty + 1 where TrolleyNo = " . $trolley_no . " and Iid = " . $itemId . " ;";
    $result = mysqli_query($conn, $query);
    //to increase qty
    /*
    update transactions set qty = qty + 1 where TrolleyNo = 1 and Iid = (select Iid from Items where barcode = 'k002');
    */
} else {
    $stmt = $conn->prepare(
            "INSERT INTO `transactions` (`Id`, `Tid`, `Iid`, `qty`, `TrolleyNo`, `Paid`) " . 
            "VALUES " . 
            "(NULL, ?, ?, 1, ?, 0);"
    );
    $stmt->bind_param("iii", $Tid, $itemId, $trolley_no);
    $stmt->execute();
    $stmt->close();
}
mysqli_close($conn);

?>