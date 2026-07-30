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
								
								$datetime = trim(date('d_m_Y_H_i_'),'0');
								$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
								$src = $_FILES['upload']['tmp_name'];
								$destination = BASE_DIR.FILE_PATH.'files/business_todo_documents/'.$docfile;
											
								if (!move_uploaded_file($src, $destination))
								{
									//echo "Possible file upload attack";
								}
								else
								{
									chmod($destination, 0664);
									$detail['btdl_docs_path']= $docfile;
									$detail['btdl_docs_name']= $docfile;							
									$detail['btdl_docs_type']= $file_type;	
								}
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