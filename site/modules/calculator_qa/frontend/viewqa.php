<?php
$fwMainView = 'file:' . getcwd() . '/viewqa.tpl';

$this_id = (int)$fwRequest->getParam($ID, 0);
if ($this_id > 0)
{
	$tableqa = new Fw_Db_Table($TABLE);
	$tableqa->setWhere("$ID = $this_id");
	$detail = $tableqa->getRow();
	
	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Question And Answer';
}