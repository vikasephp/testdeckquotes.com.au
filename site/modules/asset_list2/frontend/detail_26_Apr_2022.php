<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table($TABLE);

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail[$ID];

	unset($detail[$ID]);
	
	if($_FILES['image1'])
	{
		$docfile_1 = $_FILES['image1']['name'];
		$detail['al_photo'] = $docfile_1;
		
		$path = getcwd();
			
        $zipfile = $_FILES['image1']['name'];
        $resource_id = 1;
        $error_type = "File Uploading to AWS Bucket";

        header('Access-Control-Allow-Origin: *');

        $filetoinclude = $_SERVER['DOCUMENT_ROOT'].'/file_upload/server/s3/S3.php';
	include_once $filetoinclude;

        $date = date("Y-m-d H:i:s");
        		
        try {
            if(move_uploaded_file($_FILES['image1']['tmp_name'], $path .'/'.  basename( $_FILES["image1"]["name"])))
					{  
            $s3 = new S3('AKIA2AMNCYNN7O5EFUFK', 'VEZHhG7ktp6XuszgBHV/V4GESsxHNIsfVHzYlkzz');

            //print_r($s3);exit;
            
            $flag = 0;
            
            if ($s3->putObjectFile($path . "/" . $zipfile, 'deckquote', $zipfile, S3::ACL_PUBLIC_READ)) {
                $flag = 1; //die('in putobject');
            } else {
                sleep(10);
                if ($s3->putObjectFile($path . "/" . $zipfile, 'deckquote', $zipfile, S3::ACL_PUBLIC_READ))
					$flag = 1;
					//die('in putobject in 10');
            }

        }else{
            echo 'not moved';exit;
        }
        } catch (ErrorException $ex) {
            //$this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
        echo $ex->getLine();
            return false;
        }
				
				
									
	}
	
	$rem = $path .'/'.  basename( $_FILES["image1"]["name"]);
	
	unlink($rem);
		
	
    if($this_id > 0)
    	{
       		 $tableqa->setWhere("$ID = $this_id");
	     	 $opr = $tableqa->updateRow($detail);   
    	}
	else
	{
	
		 $opr = $tableqa->insertRow($detail); 
	}    	
   	
    $fwViewData['opr'] = $opr;
		
		//Location(BASE_URL . $XFA['home']);
}

$this_id = (int)$fwRequest->getParam($ID, 0);
if ($this_id > 0)
{
	$tableqa = new Fw_Db_Table($TABLE);
	$tableqa->setWhere("$ID = $this_id");
	$detail = $tableqa->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
         $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	