<?php
$fwMainView = 'file:' . getcwd() . '/txtmsg.tpl';
$table= new Fw_Db_Table('business_sellers');

$submit = $fwRequest->getParam('submit', '');

$bsn_id = $fwRequest->getParam('bsn_id', 0);
$fwViewData['bsn_id']= $bsn_id;
if($submit)
{
	$bsn_id = $fwRequest->getParam('bsn_id', '');
	$textmsg = $fwRequest->getParam('textmsg', '');
	
	$table->setWhere('bs_business_id = '.$bsn_id);
	if($table->rowExists())
	{
		$data['bs_ppr_survey_what'] = $textmsg;
		$detail = $table->updateRow($data);
	}	
	$fwViewData['opr'] = "Close";	
}


$fwViewData['id']= $id;

if($bsn_id > 0)
{

$sql = "SELECT business_sellers.bs_ppr_survey_what from business_sellers where bs_business_id = ".$bsn_id;	

$whatdata =  $fwDb->queryOne($sql);

$fwViewData['whatdata'] = $whatdata['bs_ppr_survey_what'];

}