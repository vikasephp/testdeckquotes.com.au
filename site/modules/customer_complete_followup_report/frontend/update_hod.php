<?php


$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($id))
{
	$sql = "Update business set  bsn_ccf_handover_date  = '".$value."' where bsn_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$curdate_y_m_d = date('y-m-d');
	$dayscount = daysDifference($curdate_y_m_d, $value);
			
	if($dayscount < 0) {$dayscount = 0; } 
	
	echo $dayscount;
}

 exit;