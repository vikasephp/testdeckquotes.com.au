<?php
//$dbServerName = "163.53.249.22";
$dbServerName = "localhost";
//$dbServerName = "www.deckquotes.com.au";
$dbUsername = "admin3_deckuser";
$dbPassword = "TMN)xgK#~0Py";
$dbName = "admin3_deckquot8thFeb";

// create connection
$conn = new mysqli($dbServerName, $dbUsername, $dbPassword, $dbName);
//$conn = mysqli_connect($dbServerName, $dbUsername, $dbPassword, $dbName);



$result = $conn -> query("SELECT * FROM news");
echo $result -> num_rows;

$result = $conn -> query("insert into news (news_title) values ('Manoj Soni')" );

// check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
    echo "Test";
}
echo "Connected successfully";

//echo "<script>window.open('https://www.capitalcommercial.com.au/bes/capitalcommercial/files/document_check_list_files/Poolwerx_Canberra_BIP.pdf', '_blank','toolbar=yes, width=800, height=550'); window.focus();</script>"; 
exit;
?> 