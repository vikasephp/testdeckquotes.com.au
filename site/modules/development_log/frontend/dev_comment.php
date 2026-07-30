<?php
$fwMainView = 'file:' . getcwd() . '/dev_comment.tpl';
$table = new Fw_Db_Table('development_log');
 
$dev_comment = $fwRequest->getParam('dev_comment', '');

$de_id = $fwRequest->getParam('de_id', 0);
$fwViewData['de_id']= $de_id;
if($dev_comment)
{
	$de_id = $fwRequest->getParam('de_id', '');
	$commentData = $fwRequest->getParam('comment', '');
	
	
	$table->setWhere('de_id = '.$de_id);
	if($table->rowExists())
	{
		$reason['de_dev_comment'] = $commentData;
		$detail = $table->updateRow($reason);
	}	
	$fwViewData['opr'] = "Close";	
}
 
 
     $sqlreason = "Select de_dev_comment  from  development_log
	           where de_id = ".$de_id;
     
     $reasonData = $fwDb->queryOne($sqlreason);
	
     $fwViewData['commentData'] = $reasonData['de_dev_comment'];
	 
		 
 