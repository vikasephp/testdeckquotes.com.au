<?php


	$secret = $_POST["secretWord"];
	//if ("44fdcv8jf3" != $secret) exit; // note the same secret as the app - could be let out if this check is not required. secretWord is not entered by the user and is used to prevent unauthorized access to the database
	
	$item1 = $_POST['item1'];
	$item2 = $_POST['item2'];

	
// POST items should be checked for bad information before being added to the database.

// Create connection
	$mysqli=mysqli_connect('localhost','admin3_deckuser','TMN)xgK#~0Py','admin3_deckquot8thFeb'); // localhost, user name, user password, database name
 
// Check connection
	if (mysqli_connect_errno())
	{
	  echo " Failed to connect to MySQL: " . mysqli_connect_error();
	}
	
	$query = "insert into item (item1, item2) value ('".$item1."','".$item2."')";
	$result = mysqli_query($mysqli,$query);

	echo $result; // sends 1 if insert worked
	
	echo "Done";
?>