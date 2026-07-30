<?php
$fwMainView = 'file:' . getcwd() . '/viewstep.tpl';

$submit = $fwRequest->getParam('subAddDetail', '');
$car_id = $fwRequest->getParam('car_id', 0);
$fwViewData['car_id'] =  $car_id;
$table = new Fw_Db_Table('action_plan_step_detail');
$email_report = $fwRequest->getParam('email_report', '');

if($email_report)
{
	 
	 $keys = array_keys($email_report);
	 $ky = $keys[0];
	 $val = $email_report[$ky];
	 
	 $detail['apd_email_report'] = $val;
	 $table->setWhere('apd_id = '.$ky);
	 if($table->rowExists())
	 {
		$this_id = $table->updateRow($detail);
	 }
}



if(!empty($submit))
{
	
	$table_pd = new Fw_Db_Table('action_plan_step_detail');
	$detail = $fwRequest->getParam('step', array());
	
	//db($detail);
	//exit;
	
	foreach($detail as $k2 => $v2)
	{
	 	
	       $doc1 = $_FILES['image1']['name'][$k2];
	 
	       if($doc1)
			{
			
				
				$file_type = $_FILES['image1']['type'][$k2];	
								
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$doc1 = preg_replace('/[^A-Z0-9._]/i', '_', $doc1);
				$src =  $_FILES['image1']['tmp_name'][$k2]; 
				$destination = BASE_DIR.'files/cma/'.$doc1;
			
				if(!move_uploaded_file($src, $destination))
					{
						//echo "Possible file upload attack";
					}
				else
					{
						$savedata['apd_image'] = $doc1;
						chmod($destination, 0664);
					}
						
			}
	  
	  
	  	
	   $savedata['apd_comp_date'] = $v2['st_comp_date'];
	   $savedata['apd_who'] = $v2['apd_who'];
	   $savedata['apd_date_of_complete'] = $v2['apd_date_of_complete'];
	   $savedata['apd_res_staff'] = $v2['apd_res_staff'];

	  
	  $table_pd->setWhere("apd_id = " .$k2);
	  
	   if($table_pd->rowExists())
			 {
					$table_pd->updateRow($savedata);
			 }  
	   unset($savedata);		 
	   unset($doc1);		 
	}
}


$thisTable = new Fw_Db_Table("action_plan_step_master");
$steps = $thisTable->getAllRows(); 

//$tablesd = new Fw_Db_Table('action_plan_step_detail');
//		 
//	 foreach($steps as $k => $v)
//	 {
//		$tablesd->setWhere("apd_car_id = $car_id and apd_desc_id = ".$v['ap_id']);
//		if(!$tablesd->rowExists()) {
//			$stepDetail['apd_car_id'] = $car_id;
//			$stepDetail['apd_desc_id'] = $v['ap_id'];
//			$id = $tablesd->insertRow($stepDetail); 
//		}
//	 }


$sql = "Select  action_plan_step_detail.* from action_plan_step_detail
        where action_plan_step_detail.apd_car_id  = ".$car_id;
	
$fwViewData['stdetail'] = $fwDb->query($sql); 	

$sql2 = "SELECT  contacts.*, companies.co_company_name from contacts
         Inner join companies on contacts.cs_company = companies.co_id";
$fwViewData['contactdetail'] = $fwDb->query($sql2);

$sql_3 = "select tm_id from type_master where tm_type = 'Construction Alert Report Team' " ;
$tmdata = $fwDb->queryOne($sql_3); 

$sql_4 = "select to_option from type_options where to_type_id = ". $tmdata['tm_id'] ;
$fwViewData['who'] = $fwDb->query($sql_4); 

