
<?php

$id = $fwRequest->getParam('cb_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($id))
{
		
	$sql_1 = "Update cash_in_bank set  cb_accuracy  = ".$value." where cb_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	
}

 exit;