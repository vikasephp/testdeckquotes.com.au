<?php


$table = new Fw_Db_Table("camera_log");
$submit = $fwRequest->getParam('subAddDetail', '');

$cd = date("d-m-Y h:i:sa");
//$user = $_SESSION['user']['user_name'];

if(!empty($submit))
{
	
    	$detail = $fwRequest->getParam('camera', array());
	$this_id = (int)$detail['ca_id'];
	
	$detail['ca_camera_lnumber'] = implode(", ",$detail['ca_camera_lnumber']);
	//db($detail);
	//exit;
	
	unset($detail['ca_id']);
	
    if($this_id > 0)
    	{
		
       		 $table->setWhere("ca_id = $this_id");
	     	 $opr = $table->updateRow($detail);
    	}
	else
	{	
	
		// $detail['ph_user_created'] = $user;
		 $detail['ca_date'] = $cd;
		 $opr = $table->insertRow($detail); 
		  $fwViewData['opr'] = $opr;
	}    	
		
		//Location(BASE_URL . $XFA['home']);
}


	
$sqlti = "Select tm_id from type_master where tm_type = 'Camera Label Number'";
$type_id = $fwDb->queryOne($sqlti); 
 		
$sqlto = "Select to_id, to_option from type_options where to_type_id  = ". $type_id['tm_id'];

$fwViewData['todetail'] = $fwDb->query($sqlto); 	
	


