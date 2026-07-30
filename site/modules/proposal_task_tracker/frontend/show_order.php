<?php


$id = $fwRequest->getParam('bs_business_id', '');


if(!empty($id))
{
	$sql =  "select bs_ptt_sub_status_order from  business_sellers where bs_business_id = ".$id;	 
	$dataT  = $fwDb -> queryOne($sql);
	

	
	$output = $dataT['bs_ptt_sub_status_order'];
	
	//echo "Tana";
	echo $output;
}



 exit;