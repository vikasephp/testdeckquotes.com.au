<?php
$this_id = (int)$fwRequest->getparamget('dhd_id', 0);
if($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('brochures_hub_docs');
		$thisTable->setWhere("dhd_id = $this_id");
		$filedata =  $thisTable->getRow();
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
		$thisTable->deleteRow();	
echo "delete.";				
	}
exit;