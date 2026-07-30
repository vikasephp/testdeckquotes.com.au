<?php
$this_id = $fwRequest->getparamget('mid', '');
$doc = $fwRequest->getparamget('doc', '');

		

if($this_id > 0)
	{
		
		//$id = explode("|",$this_id);

		$thisTable = new Fw_Db_Table('meeting_minutes');
		$thisTable->setWhere("mm_uminid = ".$this_id);
		
		if($doc == 1) {
			$delData['mm_doc_pdf']='';	
		}
		elseif($doc == 2) {
			$delData['mm_doc_word']='';	
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