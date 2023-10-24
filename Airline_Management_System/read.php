<?php 
// Include config file
require_once "connection.php";

echo "<style>
    h1{ 
        text-align:center;
        font-family: 'Pacifico', cursive;
        background-color:black;
        color:white;
    }
    table {
        font-family: times new roman, sans-serif;
        border-collapse: collapse;
        width:100%;
    }
    th {
        border: 1px solid red;
        background-color:black;
        color:white;
        padding: 12px;
        font-family: 'Pacifico', cursive;
        font-size:25px;
    }
    td {
        border: 1px solid red;
        text-align: left;
        padding: 12px;
        font-size:25px;
        font-family: 'Pacifico', cursive;
    }
        tr:nth-child(odd) {
        background-color:#fea116;
    }
        tr:nth-child(even) {
        background-color:white;
    }

    p{
        font-size: 25px;
        margin-left: 50px;
        text-align:center;
        font-family: 'Pacifico', cursive;
    }
</style>";

$passenger_no = $_POST['passenger_no'];

// Attempt select query execution
$sql = "SELECT * FROM `passenger` WHERE `passenger_no`='$passenger_no'";
if ($result = mysqli_query($link, $sql)) {
    //echo "Your Personal Details :<br>";
    if (mysqli_num_rows($result) > 0) {
        // while ($row = mysqli_fetch_array($result)) {
            echo "<h1>Your Personal Details</h1>";
            echo '<table>';
            echo "<thead>";
            echo "<tr>";
            echo "<th>Passenger No</th>";
            echo "<th>Name</th>";
            echo "<th>Address</th>";
            echo "<th>Email ID</th>";
            echo "<th>Contact No</th>";
            echo "</tr>";
            echo "</thead>";
            echo "<tbody>";
            while ($row = mysqli_fetch_array($result)) {
                echo "<tr>";
                echo "<td>" . $row['passenger_no'] . "</td>";
                echo "<td>" . $row['name'] . "</td>";
                echo "<td>" . $row['address'] . "</td>";
                echo "<td>" . $row['email_id'] . "</td>";
                echo "<td>" . $row['contact_no'] . "</td>";
                echo "</tr>";
            }
            echo "</tbody>";
            echo "</table>";
            // echo "Passenger No : " . $row['passenger_no'] . "<br>";
            // echo "Name : " . $row['name'] . "<br>";
            // echo "Address : " . $row['address'] . "<br>";
            // echo "Email ID : " . $row['email_id'] . "<br>";
            // echo "Contact No :". $row['contact_no'] . "<br>";
            echo "<br><br>";
            // Free result set
            mysqli_free_result($result);
    }
    else{
        echo "<script>alert('No Details were found.');
        window.history.back(1);</script>";
        echo "<br><br>";
    }
}
else {
    echo "Oops! Something went wrong. Please try again later.";
}
// echo "Your Bookings<br>";
//$flight_no = 0;
$sql1 = "SELECT * FROM `flight` WHERE `flight_no`=(SELECT `flight_no` FROM `schedule_passenger` WHERE `passenger_no`='$passenger_no')";
if ($result1 = mysqli_query($link, $sql1)) {
    //echo "Your Bookings :<br>";
    if (mysqli_num_rows($result1) > 0) {
        //while ($row = mysqli_fetch_array($result1)) {
            echo "<h1>Your Bookings</h1>";
            echo '<table>';
            echo "<thead>";
            echo "<tr>";
            echo "<th>Flight No</th>";
            echo "<th>Source</th>";
            echo "<th>Destination</th>";
            echo "<th>Departure Date</th>";
            echo "<th>Departure Time</th>";
            echo "<th>Arrival Date</th>";
            echo "<th>Arrival Time</th>";
            echo "<th>Price</th>";
            echo "</tr>";
            echo "</thead>";
            echo "<tbody>";
            while ($row = mysqli_fetch_array($result1)) {
                echo "<tr>";
                echo "<td>" . $row['flight_no'] . "</td>";
                echo "<td>" . $row['src'] . "</td>";
                echo "<td>" . $row['dest'] . "</td>";
                echo "<td>" . $row['dep_date'] . "</td>";
                echo "<td>" . $row['deptime'] . "</td>";
                echo "<td>" . $row['arrival_date'] . "</td>";
                echo "<td>" . $row['arrivaltime'] . "</td>";
                echo "<td>". "₹ " . $row['price'] . "</td>";
                echo "</tr>";
                $flight_no = $row['flight_no'];
            }
            echo "</tbody>";
            echo "</table>";
            // echo "Flight No : " . $row['flight_no'] . "<br>";
            // echo "Source : " . $row['src'] . "<br>";
            // echo "Destination : " . $row['dest'] . "<br>";
            // echo "Depature Time : " . $row['deptime'] . "<br>";
            // echo "Arrival Time :". $row['arrivaltime'] . "<br>";
            // echo "Price : ₹". $row['price'] . "<br>";

        echo "<br><br>";
        // Free result set
        mysqli_free_result($result1);
    } 
    else {
        echo '<em>No Bookings were found.</em>';
        echo "<br><br>";
    }
}
else {
    echo "Oops! Something went wrong. Please try again later.";
}

$sql2 = "SELECT * FROM `pilot` WHERE `pilot_no` IN (SELECT `pilot_no` FROM `pilot_schedule` WHERE `flight_no`='$flight_no')";
if ($result2 = mysqli_query($link, $sql2)) {
    //echo "Meet Your Pilots :<br>";
    if (mysqli_num_rows($result2) > 0) {
        //while ($row = mysqli_fetch_array($result2)) {
            echo "<h1>Meet Your Pilots</h1>";
            echo '<table>';
            echo "<thead>";
            echo "<tr>";
            echo "<th>Pilot No</th>";
            echo "<th>Name</th>";
            echo "<th>Experience</th>";
            echo "</tr>";
            echo "</thead>";
            echo "<tbody>";
            while ($row = mysqli_fetch_array($result2)) {
                echo "<tr>";
                echo "<td>" . $row['pilot_no'] . "</td>";
                echo "<td>" . $row['name'] . "</td>";
                echo "<td>" . $row['experience'] . "  Years" . "</td>";
                echo "</tr>";
            }
            echo "</tbody>";
            echo "</table>";
            // echo "Pilot No : " . $row['pilot_no'] . "<br>";
            // echo "Name : " . $row['name'] . "<br>";
            // echo "Experience : " . $row['experience'] . " Years<br>";
            // echo "<br>";
        // Free result set
        mysqli_free_result($result2);
    } 
    else {
        echo '<em>No Pilot Details were found.</em>';
    }
}
else {
    echo "Oops! Something went wrong. Please try again later.";
}
// Close connection
mysqli_close($link);
?>