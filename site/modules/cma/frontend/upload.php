<?php
$fwMainView = 'file:' . getcwd() . '/upload.tpl';
$tableBusiness = new Fw_Db_Table($TABLE);
$tabledocs= new Fw_Db_Table('cma_images');
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
								$destination = BASE_DIR.FILE_PATH.'files/cma/'.$docfile;
											
								if (!move_uploaded_file($src, $destination))
								{
									//echo "Possible file upload attack";
								}
								else
								{
									chmod($destination, 0664);
									$detail['cma_name']= $docfile;
									
								}
			}

 	$tabledocs->insertRow($detail);             			
	$fwViewData['opr'] = " Data Successfully updated!";				
}	
if ($btdl_id > 0)
	{
		$sql1 = "Select ".$TABLE.".* from ".$TABLE." where ".$TABLE.".c_id = ". $btdl_id;
		$detail = $fwDb->queryOne($sql1);			 
		$fwViewData['detail'] = $detail;
		$fwViewData['title'] = 'Upload File';
	}