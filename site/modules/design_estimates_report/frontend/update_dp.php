<?php

$value = $fwRequest->getparam('value', '');


	$sql = "Update design_profit set  dp_percent  = ".$value ." where dp_id = 1";	 
	$fwDb -> queryOne($sql);
	
	
	$sqlval = "select sum(dpn_dcr_value) as valtot from document_proposal_name where dpn_dr_hide = 0 ";

    $valuedata = $fwDb->queryOne($sqlval);
	$profit = $valuedata['valtot'] * $value / 100;
	
	$sql = "Update design_profit set  dp_profit  = '".$profit."' where dp_id = 1";	 
	$fwDb -> queryOne($sql);


 exit;