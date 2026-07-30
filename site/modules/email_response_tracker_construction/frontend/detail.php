<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail[$ID];
    $detail['ar_user'] = $_SESSION['user']['user_name'];
	unset($detail[$ID]);
	
		if($_FILES['snapshot']['name'])
		{
				$docfile_1 = $_FILES['snapshot']['name'];
				$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$temp_name_1 = $_FILES['snapshot']['tmp_name'];
				$detail['er_email_snapshot'] = $docfile_1;
				upload($docfile_1, $temp_name_1);
		}
	
	
	  if($_FILES['response_snapshot']['name'])
		{
				$docfile_2 = $_FILES['response_snapshot']['name'];
				$docfile_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
				$temp_name_2 = $_FILES['response_snapshot']['tmp_name'];
				$detail['er_response_snapshot'] = $docfile_2;
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

$sql = "SELECT  bsn_name from business where bsn_sub_status ='Open'";
$fwViewData['projdetail'] = $fwDb->query($sql);

$sql = "SELECT  * from email_response_status";
$fwViewData['statusdetail'] = $fwDb->query($sql);

$sql_t = "SELECT  * from email_response_type";
$fwViewData['typedetail'] = $fwDb->query($sql_t);