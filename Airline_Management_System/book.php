<?php 
// Database connection
require_once "connection.php";
if($_SERVER["REQUEST_METHOD"] == "POST") {
    $flight_no = $_POST['flight_no'];
    $name = $_POST['name'];
    $contact_no = $_POST['contact_no'];
    $email_id = $_POST['email_id'];
    $address = $_POST['address'];
    $payment_method = $_POST['pay'];
    $sql4 = "SELECT * FROM `flight` WHERE `flight_no` = '$flight_no'";
    $result4 = mysqli_query($link, $sql4);
    $row = mysqli_fetch_assoc($result4);
    $seats_left = $row['seats_left'];
    if($seats_left == 0){
        echo "<script>alert('Sorry!! No Seats are Left');
        window.history.back(1);</script>";
    }
    else{
        $seats_left--;
        $sql1 = "INSERT INTO `passenger` (`name`, `address`,`contact_no`, `email_id`, `payment_method`) VALUES ('$name', '$address','$contact_no', '$email_id', '$payment_method')";   
        $result1 = mysqli_query($link, $sql1);
        $sql2 = "SELECT * FROM `passenger` WHERE `name`='$name' AND `email_id`='$email_id'";
        $result2 = mysqli_query($link, $sql2);
        $row = mysqli_fetch_assoc($result2);
        $passenger_no = $row['passenger_no'];
        $sql3 = "INSERT INTO `schedule_passenger` (`passenger_no`, `flight_no`) VALUES ('$passenger_no', '$flight_no')";   
        $result3 = mysqli_query($link, $sql3);
        $sql5 = "UPDATE `flight` SET `seats_left`='$seats_left' WHERE `flight_no` = '$flight_no'";   
        $result5 = mysqli_query($link, $sql5);
        echo "<script>alert('Your Ticket has been Booked Successfully');</script>";
        echo "<script>alert('Your Passenger No is : $passenger_no');</script>";
        // echo "<br>";
        echo "<script>alert('Kindly Save it for your Future Reference');
            window.history.back(1);</script>";
    }
}
mysqli_close($link);
?>