<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tablecats = new Fw_Db_Table('business_qa');
$submit = $fwRequest->getParam('subAddDetail', '');

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
			{$detail['bqa_ans_date'] = date("Y-m-d H:i:s");  }
	        $opr = $tablecats->updateRow($detail);   
    	}

		$fwViewData['opr'] = $opr;
	
}

$this_id = (int)$fwRequest->getParam('bqa_id', 0);
if ($this_id > 0)
{
	$tablecats = new Fw_Db_Table('business_qa');
	$tablecats->setWhere("bqa_id = $this_id");
	$fwViewData['detail'] = $tablecats->getRow();
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Create '.$MODULE_SINGULAR;
}

$sqlpos = "SELECT * from positions"; 
$fwViewData['pos'] = $fwDb->query($sqlpos);
