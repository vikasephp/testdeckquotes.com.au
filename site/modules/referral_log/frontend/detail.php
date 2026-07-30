<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table($TABLE);
$fwViewData['wa_id'] = (int)$fwRequest->getParam('wa_id', 0);
$submit = $fwRequest->getParam('subAddDetail', '');

$fwViewData['currdate']  = date('d-m-Y');

if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail[$ID];

	$bs1 = explode("|",$detail['rl_reffering_address']);
	$detail['rl_reffering_bsn_id']  = $bs1[0];
	$detail['rl_reffering_address'] = $bs1[1];
	
	$bs2 = explode("|",$detail['rl_reffered_address']);
	$detail['rl_reffered_bsn_id']  = $bs2[0];
	$detail['rl_reffered_address'] = $bs2[1];

	if($detail['rl_ref_gift_sent'] == 'on') {
		$detail['rl_ref_gift_sent'] = 1;
	} else {
		$detail['rl_ref_gift_sent'] = 0;	
	}

	unset($detail[$ID]);

	
    if($this_id > 0)
    	{
			
			 unset($detail['rl_reffering_address']);
			 unset($detail['rl_reffered_address']);
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

   //db($detail);

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
	
	
	
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	

$sql = "SELECT bsn_id, bsn_name from business where bsn_sub_status = 'Open'";
		

$fwViewData['projdetail'] = $fwDb->query($sql);

