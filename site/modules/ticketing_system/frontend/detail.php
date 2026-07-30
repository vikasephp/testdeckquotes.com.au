<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table('task_detail');

$bsn_id = $fwRequest->getParam('bsn_id', '');
$chk_no = $fwRequest->getParam('chk_no', 0);

$fwViewData['chk_no'] = $chk_no;

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('task_detail', array());
	$this_id = (int)$detail['td_id'];

	
	unset($detail['td_id']);
	
	
    if($this_id > 0)
    	{
       		 $tableqa->setWhere("td_id = $this_id");
	     	 $opr = $tableqa->updateRow($detail);   
    	}
	else
	{
		$detail['td_bsn_id'] = $bsn_id ;
	        if($chk_no <> 0) {
			$detail['td_checklist_no'] = $chk_no;
		}
		
		$sqlT = "select td_task_id from task_detail order by td_task_id DESC limit 1";
		$tData =  $fwDb->queryOne($sqlT);
		
		if(empty($tData)) { $detail['td_task_id'] = 10001; }
		else { 
		$detail['td_task_id'] =  $tData['td_task_id'] + 1;
		}
		 $opr = $tableqa->insertRow($detail); 
	}    	
	$fwViewData['opr'] = $opr;
		
		//Location(BASE_URL . $XFA['home']);
}

$this_id = (int)$fwRequest->getParam('td_id', 0);
if ($this_id > 0)
{
	$tableqa = new Fw_Db_Table('task_detail');
	$tableqa->setWhere("td_id = $this_id");
	$detail = $tableqa->getRow();
	$fwViewData['detail'] = $detail;
	$fwViewData['chk_no'] = $detail['td_checklist_no'];
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	