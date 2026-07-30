<?php


$id = $fwRequest->getParam('pp_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($id))
{
	
	
	$sql_1 = "Update project_progress_report set  pp_perc_comp  = ".$value." where pp_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
}



 exit;