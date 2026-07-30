<?php 
$fwMainView = 'file:' . getcwd() . '/meeting_recording_detail.tpl';
$recorded_meeting = new Fw_Db_Table('recorded_meeting');
$submit = $fwRequest->getParam('subAddDetail', '');

$bsn_id = $fwRequest->getParam('bsn_id', '');
$buse_id = $fwRequest->getparam('buse_id', 0); 

$ftp_host   = 'ftp.deckquotes.com.au';
$ftp_username = 'admin3';
$ftp_password = 'ephpvikas2*'; 


// open an FTP connection
$conn_id = ftp_connect($ftp_host) or die("Couldn't connect to $ftp_host");
 
// login to FTP server
$ftp_login = ftp_login($conn_id, $ftp_username, $ftp_password);

if(empty($bsn_id))
{
$bsn_id = $fwRequest->getParam('bsns_id', '');
}

if(empty($bsn_id))
{
if($buse_id){$bsn_id = $buse_id;}
}

$fwViewData['bsn_id'] = $bsn_id;
if($bsn_id){
$sql3="SELECT business.bsn_id, business.bsn_name FROM business WHERE business.bsn_id = ".$bsn_id;
$data= $fwDb->queryOne($sql3);
$fwViewData['business_name'] = $data['bsn_name'];
$fwViewData['bsn_id'] = $data['bsn_id'];
}
$action = $fwRequest->getParam('action', '');


if($buse_id > 0)
	{

	$sql2="SELECT recorded_meeting.* from recorded_meeting WHERE recorded_meeting.rm_id = ".$buse_id;
	
	
	$userData= $fwDb->queryOne($sql2);
	$fwViewData['detail'] = $userData;
	
	$fwViewData['button'] = "Edit";
	}else{$fwViewData['msg'] =0;
	$fwViewData['button'] = "Add";
}	

if($bsn_id){
$sql3="SELECT business.bsn_id, business.bsn_name,business.bsn_cd_enquiry_source FROM business WHERE business.bsn_id = ".$bsn_id;
$data= $fwDb->queryOne($sql3);
$fwViewData['business_name'] = $data['bsn_name'];
$fwViewData['bsn_cd_enquiry_source'] = $data['bsn_cd_enquiry_source'];
$fwViewData['bsn_id'] = $data['bsn_id'];
}


if($submit)
{
 $detail = $fwRequest->getParam('meeting', array());
 
 	if($_FILES['file'])
	 {
			 $filename = $_FILES['file']['name'];
			 $filename = preg_replace('/[^A-Z0-9._]/i', '_', $filename);
			 $tmp = $_FILES['file']['tmp_name'];
			 
			 
			 $destination = BASE_DIR.'files/recorded_meetings/'.$filename;
				
			 $fwViewData['msg'] = "Please wait file is uploading";
				
					if(!move_uploaded_file($tmp, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								//$detail['sb_document'] = $docfile_p;
								chmod($destination, 0664);
							}	
			 
//			 $d = '/public_html/files/recorded_meetings/'.$filename;
//			 ftp_put($conn_id, $d, $tmp, FTP_ASCII);
//			 //ftp_nb_put($conn_id, $d, $tmp, FTP_ASCII);
//			 ftp_close($conn_id);
			 
			 $sqladdr = "Select business.bsn_id, business.bsn_address from business where business.bsn_id = ".$detail['rm_bus_id'];
			 $addrData= $fwDb->queryOne($sqladdr);
			 $newname1 = $addrData['bsn_address']. ' - '.$detail['rm_date'];
			 $newname2 = str_replace(" ","_",$newname1);
		
			 if(!empty($filename)) {
			 $detail['rm_original_file'] = $filename;
			 $detail['rm_meeting_file'] = $newname1;
			 }
	 }
 
 	//db($detail);
	//exit;
 
 
 
	$table_id =  (int)$detail['rm_id'];
	unset($detail['rm_id']);

						if($table_id > 0)
							{
								
								$recorded_meeting->setWhere("rm_id=".$table_id);
								$table_id= $recorded_meeting->updateRow($detail);
								
							}
						else
							{			

								$table_id=$recorded_meeting->insertRow($detail);
							}
$fwViewData['msg'] = $table_id;
}