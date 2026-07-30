<?php

$value = $fwRequest->getparam('value', '');
$value2 = $fwRequest->getparam('value2', '');
$value3 = $fwRequest->getparam('value3', '');
$rcd = $fwRequest->getparam('rcd', '');

if(!empty($value))
{

	$sqlT = "select bsn_id from business where bsn_name like '%".$value."'";
	$dataT = $fwDb->queryOne($sqlT);
	
	$sql2 = "Select bs_c_in_p_comm_onsite from business_sellers where bs_business_id = ".$dataT['bsn_id'];
	$data2 = $fwDb->queryOne($sql2);
	
	$output = $data2['bs_c_in_p_comm_onsite'];
	
	//echo "Tana";
	echo $output;
		
}

if(!empty($value2))
{
	$sql2 = "select bsn_cip_total_days_added from business where bsn_name like '%".$value2."'";
        $data2 = $fwDb->queryOne($sql2);
       
        //$sqltd = "select tc_days_delay, tc_sync from timeline_center where tc_project like '%".$value2."%'";
	//$daysData = $fwDb->query($sqltd);
	

        echo $data2['bsn_cip_total_days_added'];
		
}

//if(!empty($value3))
//{
//		//$days = $detail['tc_days_delay'];
//		$dt = date('d-m-Y',strtotime($rcd. ' + '.$value3.' days'));;
//       		 echo $dt;
//		
//}


 exit;