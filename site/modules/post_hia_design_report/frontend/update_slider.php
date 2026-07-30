<?php

$id = $fwRequest->getParam('ph_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$usr = $_SESSION['user']['user_name'];

if(!empty($id))
{
	$sql_1 = "Update post_hia_design_report set  ph_slider  = ".$value." where ph_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	
	$sql_2 = "Update post_hia_design_report set  ph_slider_user  = '".$dt."' where ph_id = ".$id;	 
	$fwDb -> queryOne($sql_2);
	
	$sql_3 = "Update post_hia_design_report set  ph_slider_date  = '".$usr."' where ph_id = ".$id;	 
	$fwDb -> queryOne($sql_3);
	
	$sql = "select ph_slider_user ,  ph_slider_date from post_hia_design_report where ph_id = ".$id;
	$data = $fwDb->queryOne($sql);

    $output = $data['ph_slider_user']."<br>".$data['ph_slider_date'];
	echo $output;
}



 exit;