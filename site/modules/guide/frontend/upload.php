<?php
$fwMainView = 'file:' . getcwd() . '/upload.tpl';
$tableBusiness = new Fw_Db_Table($TABLE);
$tabledocs= new Fw_Db_Table('bes_guide_docs');
$bg_id = $fwRequest->getParam($ID, '');
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
			$destination = BASE_DIR.'files/bes_guide/'.$docfile;
										
							if (!move_uploaded_file($src, $destination))
								{
									//echo "Possible file upload attack";
								}
							else
								{
									chmod($destination, 0664);
									$detail['bgd_name']= $docfile;
									$detail['bgd_type'] =$file_type;
									$detail['bgd_size'] =$_FILES['upload']['size'];
									$detail['bgd_insert_date'] = date('Y-m-d H:i');
								}		
			}
	
	$detail['bgd_dh_id'] =  $detail['bg_id'];
 	if($docfile){
	$tabledocs->setWhere("bgd_name = '".$docfile."'");
	if($tabledocs->rowExists())
		{
		$tabledocs->updateRow($detail);	
		}else{
		$tabledocs->insertRow($detail);   
		}
	}             			
	$fwViewData['opr'] = " Data Successfully updated!";				
}	
if($bg_id > 0)
	{
		$sql1 = "Select ".$TABLE.".* from ".$TABLE." where ".$TABLE.".bg_id = ".$bg_id;
		$detail = $fwDb->queryOne($sql1);			 
		$fwViewData['detail'] = $detail;
		$fwViewData['title'] = 'Upload File';
	}