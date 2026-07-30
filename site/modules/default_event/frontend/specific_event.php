<?php
$fwMainView = 'file:' . getcwd() . '/specific_event.tpl';
$thisTable = new Fw_Db_Table("specific_event");
$table = new Fw_Db_Table("default_event");
$fwViewData['sedata'] = $thisTable->getAllRows(); 

$de_id = $fwRequest->getParam('de_id', '');

$add_se = $fwRequest->getParam('add_se', '');
if(!empty($add_se))
{
	$sevent = $fwRequest->getParam('speve', '');
	
	if($sevent) {
		$str='|';
		foreach($sevent as $k=>$v)
		{
			$str .= $k.'|';
		}
	}
	
	$detail['de_specific_events'] = $str;
	$table->setWhere('de_id = '.$de_id);
	$table->updateRow($detail);
	
}

if($de_id > 0) {

 	$table->setWhere('de_id = '.$de_id);
	$se = $table->getRow();
	$data = explode('|', $se['de_specific_events']);
	$fwViewData['data'] = $data;
}