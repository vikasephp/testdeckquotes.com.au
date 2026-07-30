<?php
$fwMainView = 'file:' . getcwd() . '/upload.tpl';
$tableBusiness = new Fw_Db_Table($TABLE);
$tabledocs= new Fw_Db_Table('business_to_do_list_docs');
$btdl_id = $fwRequest->getParam($ID, '');
$submit = $fwRequest->getParam('subAddDetail', '');
	
if(!empty($submit))
{
    $detail = $fwRequest->getParam('upload', array());
		if($_FILES['upload'])
			{
			$docfile = $_FILES['upload']['name'];
			$file_type = $_FILES['upload']['type'];
						
	$drive = access_gdrive();	
	
	
	
	$parentId = $fwViewData['docs_folders']['TODO_LIST_DOCS']['Gcode'];
	
	$insertFile = insertFile($drive, $docfile, $docfile, $parentId, $file_type, $_FILES['upload']['tmp_name']);
									$detail['btdl_docs_path']= $insertFile['id'];
									$detail['btdl_docs_name']= $docfile;							
									$detail['btdl_docs_type']= $file_type;
									$detail['btdl_docs_status']= 1;		
			}
	$detail['btdl_list_id'] =  $detail['btdl_id'];
 	$tabledocs->insertRow($detail);             			
	$fwViewData['opr'] = " Data Successfully updated!";				
}	
if ($btdl_id > 0)
	{
		$sql1 = "Select ".$TABLE.".* from ".$TABLE." where ".$TABLE.".btdl_id = ". $btdl_id;
		$detail = $fwDb->queryOne($sql1);			 
		$fwViewData['detail'] = $detail;
		$fwViewData['title'] = 'Upload File';
	}