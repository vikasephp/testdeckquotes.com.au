<?php
$fwMainView = 'file:' . getcwd() . '/upload.tpl';
$tableBusiness = new Fw_Db_Table($TABLE);
$tabledocs= new Fw_Db_Table($TABLE2);
$this_id = $fwRequest->getParam($ID, '');
$submit = $fwRequest->getParam('subAddDetail', '');	
if(!empty($submit))
{
    $detail = $fwRequest->getParam('upload', array());
		if($_FILES['upload']['name'])
			{
			$docfile = $_FILES['upload']['name'];
			$file_type = $_FILES['upload']['type'];
								
			$datetime = trim(date('d_m_Y_H_i_'),'0');
			$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
								
							$src = $_FILES['upload']['tmp_name'];
								upload($docfile_1, $src);
								
							$detail['bpd_name']= $docfile;
							$detail['bpd_type'] =$file_type;
							$detail['bpd_size'] =$_FILES['upload']['size'];
							$detail['bpd_insert_date'] = date('Y-m-d H:i');
							
						//	$destination = BASE_DIR.'files/business_polices/'.$docfile;
//										
//							if(!move_uploaded_file($src, $destination))
//								{
//									//echo "Possible file upload attack";
//								}
//							else
//								{
//									chmod($destination, 0664);
//									$detail['bpd_name']= $docfile;
//									$detail['bpd_type'] =$file_type;
//									$detail['bpd_size'] =$_FILES['upload']['size'];
//									$detail['bpd_insert_date'] = date('Y-m-d H:i');
//								}
			}
	$detail[$ID2] =  $detail[$ID];
	
 	if($docfile){ $tabledocs->setWhere("bpd_name = '".$docfile."'");
	if($tabledocs->rowExists())	{ $tabledocs->updateRow($detail); }else{ $tabledocs->insertRow($detail); } }
	             			
	$fwViewData['opr'] = " Data Successfully updated!";				
}	
if ($this_id > 0)
	{
		$sql1 = "Select ".$TABLE.".* from ".$TABLE." where ".$TABLE.".".$ID." = ". $this_id;
		$detail = $fwDb->queryOne($sql1);			 
		$fwViewData['detail'] = $detail;
		$fwViewData['title'] = 'Upload File';
	}