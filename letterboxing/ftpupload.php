
<?php 
// FTP server details
//$ftp_host   = 'ftp.example.com';
//$ftp_username = 'ftpuser';
//$ftp_password = '*****';
 

$ftp_host   = 'ftp.deckquotes.com.au';
$ftp_username = 'admin3';
$ftp_password = 'ephpvikas2*'; 
 
 
// open an FTP connection
$conn_id = ftp_connect($ftp_host) or die("Couldn't connect to $ftp_host");
 
// login to FTP server
$ftp_login = ftp_login($conn_id, $ftp_username, $ftp_password);
 
 
 $filename = $_FILES['file']['name'];
 $tmp = $_FILES['file']['tmp_name'];
 $d = '/public_html/upload/'.$filename;
 
 
 //echo $filename ."<br>";
 //echo $tmp ."<br>";
 //echo $d;
 
// local & server file path
$localFilePath  = 'C:\large.htm';
$remoteFilePath = '/home/admin3/public_html/';
 
// try to upload file
//if(ftp_put($conn_id, $remoteFilePath, $localFilePath, FTP_ASCII)){
if(ftp_put($conn_id, $d, $tmp, FTP_ASCII)){	
    echo "File transfer successful - $localFilePath";
}else{
    echo "There was an error while uploading $localFilePath";
}
 
// close the connection
ftp_close($conn_id);

?>