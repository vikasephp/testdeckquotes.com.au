<?php

$id_1 = $fwRequest->getParam('cs_id_1', '');
$id_2 = $fwRequest->getParam('cs_id_2', '');
$value_1 = $fwRequest->getparam('value_1', '');
$value_2 = $fwRequest->getparam('value_2', '');
	
	if($id_1) {
		$sql_1 = "Update construction_schedular set  cs_start_date  = '".$value_1."' where cs_id = ".$id_1;	 
		$fwDb -> queryOne($sql_1);
	}
	
	if($id_2) {
		$sql_2 = "Update construction_schedular set  cs_end_date   = '".$value_2."' where cs_id = ".$id_2;	 
		$fwDb -> queryOne($sql_2);
	}
	
	   
	  $sql = "select cs_start_date , cs_end_date from construction_schedular where cs_id = ".$id_2;
	  $detail = $fwDb->queryOne($sql);
	  
	    $d1 = changedate_y_m_d($detail['cs_start_date']);
		$d2 = changedate_y_m_d($detail['cs_end_date']);
		
		$diff = daysDifference($d2, $d1);
		echo $diff;
	
 exit;