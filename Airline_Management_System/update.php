<?php
// Include config file
require_once "connection.php";

$passenger_no = $_POST['passenger_no'];

$sequel = "SELECT * FROM `passenger` WHERE `passenger_no`='$passenger_no'";
$result = mysqli_query($link, $sequel);
if (mysqli_num_rows($result) > 0) {
    if(isset($_POST['email_id']) && !empty($_POST['email_id'])){
        $email_id = $_POST['email_id'];
        $sql = "UPDATE `passenger` SET `email_id`='$email_id' WHERE `passenger_no`='$passenger_no'";
        $stmt = mysqli_query($link, $sql);
        echo "<script>alert('Email ID Updated Successfully');</script>";
        // echo "<br>";
        // echo "<br>";
    }

    if(isset($_POST['address']) && !empty($_POST['address'])){
        $address = $_POST['address'];
        $sql = "UPDATE `passenger` SET `address`='$address' WHERE `passenger_no` = '$passenger_no'";
        $stmt = mysqli_query($link, $sql);
        echo "<script>alert('Address Updated Successfully');</script>";
        // echo "<br>";
        // echo "<br>";
    }

    if(isset($_POST['contact_no']) && !empty($_POST['contact_no'])){
        $contact_no = $_POST['contact_no'];
        $sql = "UPDATE `passenger` SET `contact_no`='$contact_no' WHERE `passenger_no`='$passenger_no'";
        $stmt = mysqli_query($link, $sql);
        echo "<script>alert('Contact No Updated Successfully');</script>";
        // echo "<br>";
        // echo "<br>";
    }
    echo "<script>window.history.back(1);</script>";
}
else{
    echo "<script>alert('Passenger No entered is Invalid.');</script>";
}

// Close connection
mysqli_close($link);
?>