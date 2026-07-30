<?php
$fwMainView = 'file:' . getcwd() . '/show_detail.tpl';
$rm_id = $fwRequest->getParam('rm_id', 0);
$submit = $fwRequest->getParam('upload_file', '');

$fwViewData['rm_id'] =  $rm_id;

	$tableRecMeet = new Fw_Db_Table($TABLE);
	$tableRecMeet->setWhere("$ID = $rm_id");
	$fwViewData['detail'] = $tableRecMeet->getRow();
    $fwViewData['title'] = 'Detail';


if($submit) 
{
	$rm_id = $fwRequest->getParam('rm_id', 0);
	
		if($_FILES['file']['name'])
			 {
					 $filename = $_FILES['file']['name'];
					 $filename = preg_replace('/[^A-Z0-9._]/i', '_', $filename);
					 $tmp = $_FILES['file']['tmp_name'];
					 
					 //destination = BASE_DIR.'files/recorded_meetings/'.$filename;
					
					  upload($filename, $tmp);
						
					  $detail['rm_scribed_file'] = $filename;
					  //chmod($destination, 0664);
						
						$tableRecMeet = new Fw_Db_Table($TABLE);
						$tableRecMeet->setWhere("rm_id = $rm_id");
						$tableRecMeet->updateRow($detail);
					
							//if(!move_uploaded_file($tmp, $destination))
//									{
//										
//									}
//							else
//									{
//										$detail['rm_scribed_file'] = $filename;
//										chmod($destination, 0664);
//										
//										$tableRecMeet = new Fw_Db_Table($TABLE);
//										$tableRecMeet->setWhere("rm_id = $rm_id");
//										$tableRecMeet->updateRow($detail);
//										
//										$fwViewData['msg'] = "File has been uploaded successfully";
//											
//									}	
									
						 
			 }
}