<?php

$id = $fwRequest->getParam('ds_id', '');
$value = $fwRequest->getparam('value', '');

if(!empty($id))
{
	$sql = "Update delivery_schedule_report set  ds_po_number   = '".$value."' where ds_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql2 =  "select po_purchase_order from purchase_order where po_po_number =  '".$value."'";
	$data = $fwDb -> queryOne($sql2);
	
	$sql3 = "Update delivery_schedule_report set  ds_pdf_file   = '".$data['po_purchase_order']."' where ds_id = ".$id;	 
	$fwDb -> queryOne($sql3);
	
	$output = $data['po_purchase_order'];
		
	//echo "Tana";
	echo $output;
}

 exit;