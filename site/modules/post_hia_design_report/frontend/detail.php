<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
	//echo "<pre>"; print_r($detail); exit();
	if (!empty($detail['ph_bsn_name'])) {
		$detail['ph_bsn_name'] = preg_replace('/\s*\(ID:\d+\)$/', '', $detail['ph_bsn_name']);
	}
	$this_id = (int)$detail[$ID];

	$detail['ph_create_date'] = date('d-m-Y');
	unset($detail[$ID]);
	
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

$sql = "SELECT bsn_id, bsn_name from business where bsn_sub_status = 'Open'";
$fwViewData['projdetail'] = $fwDb->query($sql);	

$sqlst = "SELECT  * from post_hia_urgency ";
$fwViewData['urgencydetail'] = $fwDb->query($sqlst);	

$sqltype = "SELECT  * from post_hia_type ";
$fwViewData['typedetail'] = $fwDb->query($sqltype);

