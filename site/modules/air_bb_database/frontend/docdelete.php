<?php
$this_id = $fwRequest->getparamget('pm_id', '');
$doc = $fwRequest->getparamget('doc', '');

if($this_id > 0)
	{
		
		//$id = explode("|",$this_id);

		$thisTable = new Fw_Db_Table('position_matrix');
		$thisTable->setWhere("pm_id = ".$this_id);
		
		if($doc == 1) {
			$delData['pm_recruitment_text']='';	
		}
		elseif($doc == 2) {
			$delData['pm_key_result_stm']='';	
		}
		elseif($doc == 3) {
			$delData['pm_pos_agreement']='';	
		}
		elseif($doc == 4) {
			$delData['pm_letter_of_offer']='';	
		}
		elseif($doc == 5) {
			$delData['pm_training_plan']='';	
		}
		
		$thisTable->updateRow($delData);

		if($filedata['dhd_docs_path']):	
		require_once LIB_DIR.'src/Google_Client.php';
		require_once LIB_DIR.'src/contrib/Google_DriveService.php';
		$client = new Google_Client();
		$drive = new Google_DriveService($client);
		if (isset($_SESSION['token'])) {
		  $client->setAccessToken($_SESSION['token']);
		}
		if ($client->getAccessToken()) {		
			
			$files = $drive->files->trash($filedata['dhd_docs_path']);	
		}	
		endif;	
		//$thisTable->deleteRow();	
echo "delete.";				
	}
exit;