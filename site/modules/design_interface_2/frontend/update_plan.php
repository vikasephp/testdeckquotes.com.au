<?php

$id = $fwRequest->getParam('id', '');
$value = $fwRequest->getparam('value2', '');

$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

$value = str_replace('%20',' ',$value);

if(!empty($id))
{
	
	$sql_1 = "Select ic_icon_image from icon_list where ic_icon_name = '".$value ."'";	
	$data  = $fwDb -> queryOne($sql_1);
	
	$icon='';
	if(!empty($data['ic_icon_image'])) {
		$icon = $data['ic_icon_image'];
	}
		
	
	$sql = "Insert into  design_interface_bfpl_2 (dib_di_id, dib_legend, dib_icon) values (".$id.",'".$value."','".$icon."')";
	 
	$fwDb -> query($sql);
	
	
}

 exit;