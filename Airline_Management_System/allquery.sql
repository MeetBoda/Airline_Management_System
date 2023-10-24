-- Query to Read Flights available for specified route
SELECT * FROM `flight` WHERE `dep_date`='$dat' AND `src`='$src' AND `dest`='$dest' AND `seats_left` > 0;

-- Query to Read details of Flight booking for a Passenger
SELECT * FROM `flight` WHERE `flight_no`=(SELECT `flight_no` FROM `schedule_passenger` WHERE `passenger_no`='$passenger_no');

-- Query to Read details of Polits flying a Passenger's flight
SELECT * FROM `pilot` WHERE `pilot_no` IN (SELECT `pilot_no` FROM `pilot_schedule` WHERE `flight_no`='$flight_no');

-- Query to Read Passenger Details
SELECT * FROM `passenger` WHERE `passenger_no`='$passenger_no';

-- Query 13
SELECT * FROM `flight` WHERE `flight_no` = '$flight_no';

-- Query 11
SELECT * FROM `passenger` WHERE `name`='$name' AND `email_id`='$email_id';



-- Query to Update Email-ID of Passenger
UPDATE `passenger` SET `email_id`='$email_id' WHERE `passenger_no`='$passenger_no';

-- Query to Update Address of Passenger
UPDATE `passenger` SET `address`='$address' WHERE `passenger_no` = '$passenger_no';

-- Query to Update Contact No of Passenger
UPDATE `passenger` SET `contact_no`='$contact_no' WHERE `passenger_no`='$passenger_no';

-- Query to Update No of Seats Left after Booking or Cancellation of Ticket
UPDATE `flight` SET `seats_left`='$seats_left' WHERE `flight_no` = '$flight_no';

-- Query to Delete Passenger Details
DELETE FROM `passenger` WHERE `passenger_no`='$passenger_no';

-- Query to Delete Passenger record from Relationship Set between flight and passenger
DELETE FROM `schedule_passenger` WHERE `passenger_no`='$passenger_no';



-- Query to Create Passenger Record
INSERT INTO `passenger` (`name`, `address`,`contact_no`, `email_id`, `payment_method`) VALUES ('$name', '$address','$contact_no', '$email_id', '$payment_method');

-- Query to Create Passenger Record in Relationship Set between flight and passenger
INSERT INTO `schedule_passenger` (`passenger_no`, `flight_no`) VALUES ('$passenger_no', '$flight_no');


