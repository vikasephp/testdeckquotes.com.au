<?php

$fwMainView = 'file:' . getcwd() . '/show.tpl';
$this_id = $fwRequest->getParam('dd_id', '');
$tableDesign = new Fw_Db_Table('design_interface_designs');
$tableDesign->setWhere("dd_id = $this_id");
$img_data =$tableDesign->getRow();
if(!empty($img_data))
{
     $zipfile = $img_data['di_design_image'];
     $filetoinclude = $_SERVER['DOCUMENT_ROOT'].'/file_upload/server/s3/S3.php';
	    include_once $filetoinclude;
	     $s3 = new S3('AKIA2AMNCYNNR3C7ELXP', 'ut4HuWX5HovWcxoCaU8gSSE27/RBxidTIh3SqYe2');
        	 try {
        $bucket_name  = "deckquote";
    	$file_data = $s3->getObject($bucket_name,'files/design_interface/'.$zipfile, $saveTo = false); 
    //	echo "<pre>";print_r($file_data);  
    	$file_data = $file_data->body;
    	$type = pathinfo($zipfile, PATHINFO_EXTENSION);
        $raw_data = 'data:image/' . $type . ';base64,' . base64_encode($file_data);
    	 
        } catch (ErrorException $ex) {
            //$this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
        echo $ex->getLine();
            return false;
        }
  $img_data['img_raw_data'] = $raw_data ;  
}

$fwViewData['design_img'] =$img_data;
//db($fwViewData['design_img']);
