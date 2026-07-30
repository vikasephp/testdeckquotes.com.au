<?php

$id = $fwRequest->getparam('qb_id', '');

if(!empty($id))
{

	$sqlT = "select qb_default_message  from quote_builder_component where qb_id = ".$id;
	$dataT = $fwDb->queryOne($sqlT);
	

	$output = $dataT['qb_default_message'];
	
	//echo "Tana";
	echo $output;
		
}

 exit;