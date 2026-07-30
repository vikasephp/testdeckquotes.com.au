<?php
$fwMainView = 'file:' . getcwd() . '/txtmsg_erc.tpl';
$table= new Fw_Db_Table('document_renovation_name');

$submit = $fwRequest->getParam('submit', '');

$dpn_unique_id = $fwRequest->getParam('dpn_unique_id', 0);
$fwViewData['dpn_unique_id']= $dpn_unique_id;
if($submit)
{
	$bsn_id = $fwRequest->getParam('dpn_unique_id', '');
	$textmsg = $fwRequest->getParam('textmsg', '');
	
	$table->setWhere('dpn_unique_id = '.$dpn_unique_id);
	if($table->rowExists())
	{
		$data['dpn_dr_erc_comm'] = $textmsg;
		$detail = $table->updateRow($data);
	}	
	$fwViewData['opr'] = "Close";	
}


$fwViewData['id']= $id;

if($dpn_unique_id > 0)
{

$sql = "SELECT document_renovation_name.dpn_dr_erc_comm from document_renovation_name where dpn_unique_id = ".$dpn_unique_id;	

$whatdata =  $fwDb->queryOne($sql);

$fwViewData['whatdata'] = $whatdata['dpn_dr_erc_comm'];

}