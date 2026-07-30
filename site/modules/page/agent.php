<?php
$fwMainView = 'file:' . getcwd() . '/agent.tpl';
$agent = $fwRequest->getparam('agent', '');
$adv_id = (int)$fwRequest->getparam('adv_id', 0);

if ($adv_id > 0)
{
	$tablePages = new Fw_Db_Table('advertisement');
	$tablePages->setWhere("adv_id =". $adv_id);
	$fwViewData['detail'] = $tablePages->getRow();
	
}

if($agent)
{
$fwViewData['support'] = $agent;
}