<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table($TABLE);
$fwViewData['wa_id'] = (int)$fwRequest->getParam('wa_id', 0);
$submit = $fwRequest->getParam('subAddDetail', '');
$table = new Fw_Db_Table('warranty_log_detail_task');

$user = $_SESSION['user']['user_name'];
if(!empty($submit))
{
    	$detail = $fwRequest->getParam($TABLE, array());
	
	$this_id = (int)$detail[$ID];
	unset($detail[$ID]);
	
	
	if($_FILES['survey_pdf']['name'])
		{
			$docfile_1 = $_FILES['survey_pdf']['name'];
			$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
			$temp_name_1 = $_FILES['survey_pdf']['tmp_name'];
			$detail['cn_survey_pdf'] = $docfile_1;
			upload($docfile_1, $temp_name_1);
		}
		
	if($_FILES['response']['name'])
		{
			$docfile_2 = $_FILES['response']['name'];
			$docfile_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
			$temp_name_2 = $_FILES['response']['tmp_name'];
			$detail['cn_written_resp'] = $docfile_2;
			upload($docfile_2, $temp_name_2);
		}	
	
	 if($_FILES['response2']['name'])
		{
			$docfile_3 = $_FILES['response2']['name'];
			$docfile_3 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_3);
			$temp_name_3 = $_FILES['response2']['tmp_name'];
			$detail['cn_written_resp_2'] = $docfile_3;
			upload($docfile_3, $temp_name_3);
		}	
		
	if($_FILES['response3']['name'])
		{
			$docfile_4 = $_FILES['response3']['name'];
			$docfile_4 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_4);
			$temp_name_4 = $_FILES['response3']['tmp_name'];
			$detail['cn_written_resp_3'] = $docfile_4;
			upload($docfile_4, $temp_name_4);
		}		
	
	
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

$sql = "SELECT  bsn_name from business";
$fwViewData['projdetail'] = $fwDb->query($sql);

		
$sqlpr = "Select * from busness_status";
$fwViewData['stdetail'] = $fwDb->query($sqlpr); 	

$sql_c = "Select distinct ec_contact_name from email_contact order by ec_contact_name ASC";
$fwViewData['userdetail'] = $fwDb->query($sql_c);