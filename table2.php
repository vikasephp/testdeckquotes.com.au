<?php
 
// Create connection

$con = mysql_connect('localhost','admin3_deckuser','TMN)xgK#~0Py');

mysql_select_db('admin3_deckquot8thFeb');

 $query = mysql_query("SELECT * FROM users");

    // fetch the result / convert resulte in to array 
	$resultArray = array();
	$tempArray = array();
    while ($rows = mysql_fetch_array($query)):
	
		print_r($rows);
		
       //$rows = $rows['Name'];
       //$address = $rows['Address'];
       //$email = $rows['Email'];
       //$subject = $rows['Subject'];
       //$comment = $rows['Comment'];

       //echo "$Name<br>$Address<br>$Email<br>$Subject<br>$Comment<br><br>";

		$tempArray = $row;
	    array_push($resultArray, $tempArray);
       
	   endwhile;
	   
	   //echo json_encode($resultArray);
	   
?>