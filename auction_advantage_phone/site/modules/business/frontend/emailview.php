<?php 

$fwMainView = 'file:' . getcwd() . '/emailview.tpl';


//$id = $fwRequest->getParamget('elog_id', '');
$id = $fwRequest->getParam('elog_id', '');
if($id)
{
	$sql = "SELECT * from email_log where elog_id = " .$id;

	$emailData = $fwDb->queryOne($sql);
	
	$fwViewData['emailData']  =  $emailData;
	
	//$attach = unserialize($emailData['et_attachment']);
//
//	if(!empty($attach))
//	{
//	foreach($attach as $k=>$v)
//	{
//	 $file = explode('/',$v);	
//
//	 $attachment[] = $file[count($file)-1];
//	}
//	
//	$fwViewData['attachment'] = $attachment;
//	}
	
}