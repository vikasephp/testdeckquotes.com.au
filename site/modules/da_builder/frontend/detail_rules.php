<?php
$fwMainView = 'file:' . getcwd() . '/detail_rules.tpl';
$tableqa = new Fw_Db_Table('report_rule');
$submit = $fwRequest->getParam('subAddDetail', '');
$mr_id = $fwRequest->getParam('mr_id', '');

if(!empty($submit))
{
    $detail = $fwRequest->getParam('rule', array());
	$this_id = (int)$detail['rr_id'];
    

	unset($detail['rr_id']);
	$detail['rr_mr_id'] = $mr_id;	
	
    if($this_id > 0)
    {
		     unset($detail['rr_mr_id']);
			  $detail['rr_responder'] = $_SESSION['user']['user_name'];
       		 $tableqa->setWhere("rr_id = $this_id");
	     	 $opr = $tableqa->updateRow($detail);
    }
	else
	{	
	     $detail['rr_requester'] = $_SESSION['user']['user_name'];
		 $opr = $tableqa->insertRow($detail); 
	}    	
    
	$fwViewData['opr'] = $opr;
					
}

$this_id = (int)$fwRequest->getParam('rr_id', 0);
if ($this_id > 0)
{
	
	$tableqa = new Fw_Db_Table('report_rule');
	$tableqa->setWhere("rr_id = $this_id");
    $detail = $tableqa->getRow();
	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;	
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	



//$sql = "SELECT  *  from report_build ";
//$fwViewData['typedetail'] = $fwDb->query($sql);