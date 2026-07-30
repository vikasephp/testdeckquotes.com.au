<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');


$user = $_SESSION['user']['user_name'];
if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
	
	$this_id = (int)$detail[$ID];
	unset($detail[$ID]);
	
	
	if($_FILES['file_wav']['name'])
		{
			$docfile_1 = $_FILES['file_wav']['name'];
			$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
			$temp_name_1 = $_FILES['file_wav']['tmp_name'];
			$detail['pr_file'] = $docfile_1;
			upload($docfile_1, $temp_name_1);
		}
		
	if($_FILES['survey_result']['name'])
		{
			$docfile_2 = $_FILES['survey_result']['name'];
			$docfile_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
			$temp_name_2 = $_FILES['survey_result']['tmp_name'];
			$detail['pr_survey_result'] = $docfile_2;
			upload($docfile_2, $temp_name_2);
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

		
$sqlpr = "Select * from pcr_call_result ";
$fwViewData['crdetail'] = $fwDb->query($sqlpr); 	

$sqlst = "Select * from pcr_status_admin  ";
$fwViewData['stdetail'] = $fwDb->query($sqlst); 

$sql_c = "Select distinct ec_contact_name from email_contact order by ec_contact_name ASC";
$fwViewData['userdetail'] = $fwDb->query($sql_c);