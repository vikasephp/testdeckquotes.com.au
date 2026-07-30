<?php
$fwMainView = 'file:' . getcwd() . '/answer.tpl';
$tablecats = new Fw_Db_Table('business_qa');
$submit = $fwRequest->getParam('subAddDetail', '');
$user_id = $_SESSION['user']['user_id'];
if(!empty($submit))
{
    $detail = $fwRequest->getParam('business_qa', array());
    $this_id = (int)$detail['bqa_id'];
    unset($detail['bqa_id']);

      if($this_id > 0)
    	{
			$tablecats->setWhere("bqa_id = $this_id");
		    $detail['bqa_ans_plain'] = strip_tags($detail['bqa_ans']);
			if(!empty($detail['bqa_ans_plain']))
			{
				$detail['bqa_ans_date'] = date("Y-m-d H:i:s");
				$detail['bqa_ans_user_id'] = $user_id;
			  }
	        $opr = $tablecats->updateRow($detail);   
    	}

		$fwViewData['opr'] = $opr;
	
}

$this_id = (int)$fwRequest->getParam('bqa_id', 0);
if ($this_id > 0)
{
	$tablecats = new Fw_Db_Table('business_qa');
	$tablecats->setWhere("bqa_id = $this_id");
	$detail = $tablecats->getRow();
	
	//db($detail);
	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
	
	$sqlem = "select p_email from positions where p_id = ".$detail['bqa_who'];
	$fwViewData['emlData'] = $fwDb->queryOne($sqlem);
	
	$sqlbus = "select bsn_name from business where bsn_id = ".$detail['bqa_bsn_id'];
	$bus = $fwDb->queryOne($sqlbus);
	$fwViewData['bsn_name'] = $bus['bsn_name'];
	
	
}
else
{
    $fwViewData['title'] = 'Create '.$MODULE_SINGULAR;
}

$sqlpos = "SELECT * from positions"; 
$fwViewData['pos'] = $fwDb->query($sqlpos);
