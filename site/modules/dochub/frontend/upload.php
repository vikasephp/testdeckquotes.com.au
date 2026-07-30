<?php
$fwMainView = 'file:' . getcwd() . '/upload.tpl';
$tableBusiness = new Fw_Db_Table($TABLE);
$tabledocs= new Fw_Db_Table('document_hub_docs');
$dh_id = $fwRequest->getParam($ID, '');
$submit = $fwRequest->getParam('subAddDetail', '');
	
if(!empty($submit))
{
    $detail = $fwRequest->getParam('upload', array());
		if($_FILES['upload'])
			{
			$docfile = $_FILES['upload']['name'];
			$file_type = $_FILES['upload']['type'];
			//$drive = access_gdrive();	
			//$parentId = $fwViewData['docs_folders']['PROCEDURE_MASTER_DOCS']['Gcode'];
			//$insertFile = insertFile($drive, $docfile, $docfile, $parentId, $file_type, $_FILES['upload']['tmp_name']);
			
							$datetime = trim(date('d_m_Y_H_i_'),'0');
							$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
							$src = $_FILES['upload']['tmp_name'];
							
							upload($docfile, $src);
							$docs['dhd_name']= $docfile;
							$docs['dhd_type'] =$file_type;
							$docs['dhd_size'] =$_FILES['docs']['size'];
							$docs['dhd_insert_date'] = date('Y-m-d H:i');
							chmod($destination, 0664);
							
//							$destination = BASE_DIR.'files/business_documents_hub/'.$docfile;
//										
//							if (!move_uploaded_file($src, $destination))
//							{
//								//echo "Possible file upload attack";
//							}
//							else
//							{
//								chmod($destination, 0664);
//								//$detail['dhd_path']= $insertFile['id'];
//								$detail['dhd_name']= $docfile;
//								$detail['dhd_type'] =$file_type;
//								$detail['dhd_size'] =$_FILES['upload']['size'];
//								$detail['dhd_insert_date'] = date('Y-m-d H:i');
//							}
			}
	$detail['dhd_dh_id'] =  $detail['dh_id'];
	if($docfile){
	$tabledocs->setWhere("dhd_name = '".$docfile."'");
	if($tabledocs->rowExists())
		{
		$tabledocs->updateRow($detail);	
		}else{
		$tabledocs->insertRow($detail);   
		}
	}
	
	$fwViewData['opr'] = " Data Successfully updated!";				
}	
if ($dh_id > 0)
	{
		$sql1 = "Select ".$TABLE.".* from ".$TABLE." where ".$TABLE.".dh_id = ". $dh_id;
		$detail = $fwDb->queryOne($sql1);			 
		$fwViewData['detail'] = $detail;
	
		$fwViewData['title'] = 'Upload File';
	}