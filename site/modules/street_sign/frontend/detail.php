<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableDocuments = new Fw_Db_Table($TABLE);
$ss_id = $fwRequest->getParam($ID, '');
$submit = $fwRequest->getParam('subAddDetail', '');
$fwViewData['ss_id'] = $ss_id;


if(!empty($submit))
{
    $detail = $fwRequest->getParam('street_sign', array());
	$this_id=$detail[$ID];
	unset($detail[$ID]);
	
	
	if($_FILES['sign']['name'])
		{
				
				$docfile_1 = $_FILES['sign']['name'];
				$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$temp_name_1 = $_FILES['sign']['tmp_name'];
				$detail['ss_street_sign_image'] = $docfile_1;
				$detail['ss_sign_image_date'] = date('d-m-Y');
				upload($docfile_1, $temp_name_1);
		}
		
	if($_FILES['banner']['name'])
		{
				
				$docfile_2 = $_FILES['banner']['name'];
				$docfile_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
				$temp_name_2 = $_FILES['banner']['tmp_name'];
				$detail['ss_banner_image'] = $docfile_2;
				$detail['ss_banner_image_date'] = date('d-m-Y');
				upload($docfile_2, $temp_name_2);
		}
		
	
		if($_FILES['actmapi']['name'])
		{
				
				$docfile_3 = $_FILES['actmapi']['name'];
				$docfile_3 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_3);
				$temp_name_3 = $_FILES['actmapi']['tmp_name'];
				$detail['ss_actmapi_image'] = $docfile_3;
				$detail['ss_actmapi_image_date'] = date('d-m-Y');
				upload($docfile_3, $temp_name_3);
		}		
	
		
			if($this_id)
				{
							$tableDocuments->setWhere($ID." = ".$this_id);
							$this_id = $tableDocuments->updateRow($detail);		
				}
			else
				{
							$this_id = $tableDocuments->insertRow($detail); 
							         			
				}		
	
		if($this_id){$fwViewData['opr'] = "Success!"; $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;}
}	

if(!empty($ss_id)) {
	
	$tableDocuments->setWhere($ID." = ".$ss_id);
	$fwViewData['detail'] = $tableDocuments->getRow();
}
$fwViewData['title'] = "Add / Edit Street Sign";

$sql = "SELECT  bsn_name, bsn_address from business where 1 = 1 ";
//$fwViewData['projdetail'] = $fwDb->query($sql);
$projdetail = $fwDb->query($sql);
$fwViewData['projdetail'] = $projdetail;
