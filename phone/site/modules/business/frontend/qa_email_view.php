<?php 

$fwMainView = 'file:' . getcwd() . '/qa_email_view.tpl';


//$id = $fwRequest->getParamget('elog_id', '');
$id = $fwRequest->getParam('qal_id', '');
if($id)
{
	$sql = "SELECT * from qa_email_log where qal_id = " .$id;

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