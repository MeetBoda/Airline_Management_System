<?php
// Database connection
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
    input[type=submit]{
        font-size:25px;
        font-family: 'Pacifico', cursive;
        margin-left:47%;
    }
</style>";

if($_SERVER["REQUEST_METHOD"] == "POST") {
    $src = $_POST['source'];
    $dest = $_POST['dest'];
    $dat = $_POST['dat'];

    // $sql = "SELECT * FROM `flight` 
    // WHERE `flight_no` IN (SELECT `flight_no` FROM `schedule_flight` 
    // WHERE `flight_date` = '$dat' AND `flight_no` IN (SELECT `flight_no` FROM `flight` 
    // WHERE `src` = '$src' AND `dest` = '$dest'))";
    $sql = "SELECT * FROM `flight` WHERE `dep_date`='$dat' AND `src`='$src' AND `dest`='$dest' AND `seats_left` > 0";
    if ($result = mysqli_query($link, $sql)) {
        if (mysqli_num_rows($result) > 0) {
            echo "<h1>Flights Available</h1>";
            echo '<table>';
            echo "<thead>";
            echo "<tr>";
            echo "<th>Flight No</th>";
            echo "<th>Departure Date</th>";
            echo "<th>Departure Time</th>";
            echo "<th>Arrival Date</th>";
            echo "<th>Arrival Time</th>";
            echo "<th>Seats Left</th>";
            echo "<th>Price</th>";
            echo "</tr>";
            echo "</thead>";
            echo "<tbody>";
            while ($row = mysqli_fetch_array($result)) {
                echo "<tr>";
                echo "<td>" . $row['flight_no'] . "</td>";
                echo "<td>" . $row['dep_date'] . "</td>";
                echo "<td>" . $row['deptime'] . "</td>";
                echo "<td>" . $row['arrival_date'] . "</td>";
                echo "<td>" . $row['arrivaltime'] . "</td>";
                echo "<td>" . $row['seats_left'] . "</td>";
                echo "<td>". "₹" . $row['price'] . "</td>";
                echo "</tr>";
            }
            echo "</tbody>";
            echo "</table>";
            // Free result set
            mysqli_free_result($result);
            echo "<br>";
            echo"<form action='booking.html'><input type='submit' name='book' value='Book Now'></form>";
        } else {
            echo "<script>alert('No Flights were found');
                window.history.back(1);</script>";
            // echo '<em>No Flights were found.</em>';
        }
    } else {
        echo "<script>alert('Oops! Something went wrong. Please try again later.');
                window.history.back(1);</script>";
        //echo "Oops! Something went wrong. Please try again later.";
    }
}
// Close connection
mysqli_close($link);
?>