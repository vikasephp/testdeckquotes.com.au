<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table('missing_variation_invoice');
$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail[$ID];
    $detail['mv_inv_upload_user'] = $_SESSION['user']['user_name'];
	$detail['mv_inv_upload_date'] = date('d-m-Y');
	
	$detail['mv_inv_create_user'] = $_SESSION['user']['user_name'];
	$detail['mv_inv_sent_user'] = $_SESSION['user']['user_name'];
	unset($detail[$ID]);
	
	
	if($_FILES['invoice']['name'])
		{
				$docfile_1 = $_FILES['invoice']['name'];
				$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$temp_name_1 = $_FILES['invoice']['tmp_name'];
				$detail['mv_invoice'] = $docfile_1;
				upload($docfile_1, $temp_name_1);
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


$sql = "SELECT  business.bsn_name from business";
$fwViewData['projdetail'] = $fwDb->query($sql);

