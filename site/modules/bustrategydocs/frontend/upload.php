<?php
$fwMainView = 'file:' . getcwd() . '/upload.tpl';
$tableBusiness = new Fw_Db_Table($TABLE);
$tabledocs= new Fw_Db_Table('business_strategy_docs');
$bsd_id = $fwRequest->getParam($ID, '');
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
							
							
							upload($docfile, $src);
							$docs['dhd_name'] = $docfile;
							$docs['dhd_type'] = $file_type;
							$docs['dhd_size'] = $_FILES['docs']['size'];
							$docs['dhd_insert_date'] = date('Y-m-d H:i');
					

			
			}
	$detail['dhd_bsd_id'] =  $detail['bsd_id'];
	if($docfile){ $tabledocs->setWhere("dhd_name = '".$docfile."'");
	if($tabledocs->rowExists()){ $tabledocs->updateRow($detail); }else{	$tabledocs->insertRow($detail); }}
	      			
	$fwViewData['opr'] = " Data Successfully updated!";				
}	
if($bsd_id > 0)
	{
		$sql1 = "Select ".$TABLE.".* from ".$TABLE." where ".$TABLE.".bsd_id = ". $bsd_id;
		$detail = $fwDb->queryOne($sql1);			 
		$fwViewData['detail'] = $detail;
		$fwViewData['title'] = 'Upload File';
	}