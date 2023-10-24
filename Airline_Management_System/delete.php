<?php
// Include config file
require_once "connection.php";

$passenger_no = $_POST['passenger_no'];

$sequel = "SELECT * FROM `passenger` WHERE `passenger_no`='$passenger_no'";
$result = mysqli_query($link, $sequel);
if (mysqli_num_rows($result) > 0) {
    $sql2 = "SELECT * FROM `schedule_passenger` WHERE `passenger_no`='$passenger_no'";
    $result2 = mysqli_query($link, $sql2);
    $row1 = mysqli_fetch_assoc($result2);
    $flight_no = $row1['flight_no'];
    $sql1 = "DELETE FROM `passenger` WHERE `passenger_no`='$passenger_no'";
    $stmt = mysqli_query($link, $sql1);
    $sql3 = "DELETE FROM `schedule_passenger` WHERE `passenger_no`='$passenger_no'";
    $result3 = mysqli_query($link, $sql3);
    $sql4 = "SELECT * FROM `flight` WHERE `flight_no` = '$flight_no'";
    $result4 = mysqli_query($link, $sql4);
    $row = mysqli_fetch_assoc($result4);
    $seats_left = $row['seats_left'];
    $seats_left++;
    $sql5 = "UPDATE `flight` SET `seats_left`='$seats_left' WHERE `flight_no` = '$flight_no'";   
    $result5 = mysqli_query($link, $sql5);
    echo "<script>alert('Your Booking has been Cancelled Successfully');
    window.history.back(1);</script>";
}
else{
    echo "<script>alert('Passenger No entered is Invalid.');
    window.history.back(1);</script>";
}
// Close connection
mysqli_close($link);
?>