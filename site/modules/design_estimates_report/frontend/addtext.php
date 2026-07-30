<?php
$fwMainView = 'file:' . getcwd() . '/addtext.tpl';
$tableDesignInterface = new Fw_Db_Table($TABLE);

$this_id = (int)$fwRequest->getParam('di_id', 0);
$fwViewData['this_id'] = $this_id;

$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
	
        $tableDesignInterface->setWhere("$ID = ".$detail[di_id]);
        $opr = $tableDesignInterface->updateRow($detail);
		 	
	    $fwViewData['opr'] = $opr;
}

	$tableDesignInterface = new Fw_Db_Table($TABLE);
	$tableDesignInterface->setWhere("$ID = $this_id");
	$fwViewData['detail'] = $tableDesignInterface->getRow();
	