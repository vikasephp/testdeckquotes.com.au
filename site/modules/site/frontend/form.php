<?php


$table = new Fw_Db_Table("phone_log");
$submit = $fwRequest->getParam('subAddDetail', '');

$cd = date("d-m-Y h:i:sa");
//$user = $_SESSION['user']['user_name'];

if(!empty($submit))
{
	
    	$detail = $fwRequest->getParam('phone_log', array());
	$this_id = (int)$detail['ph_id'];

	
	unset($detail['ph_id']);
	
    if($this_id > 0)
    	{
		
       		 $table->setWhere("ph_id = $this_id");
	     	 $opr = $table->updateRow($detail);
    	}
	else
	{	
	
		// $detail['ph_user_created'] = $user;
		 $detail['ph_date_time'] = $cd;
		 $opr = $table->insertRow($detail); 
		  $fwViewData['opr'] = $opr;
	}    	
		
		//Location(BASE_URL . $XFA['home']);
}

//
//$sqls = "select co_id, co_company_name from companies";
//$fwViewData['supdetail'] = $fwDb->query($sqls);
//	
//$sqlti = "Select tm_id from type_master where tm_type = 'Urgency Rating'";
//$type_id = $fwDb->queryOne($sqlti); 
// 		
//$sqlto = "Select to_id, to_option from type_options where to_type_id  = ". $type_id['tm_id'];
//
//$fwViewData['todetail'] = $fwDb->query($sqlto); 	
//	
//$sql2= "select tm_id from type_master where tm_type = 'Construction Alert Report Team' " ;
//$tmdata = $fwDb->queryOne($sql2); 
//
//$sql2= "select to_option from type_options where to_type_id = ". $tmdata['tm_id'] ;
//$fwViewData['who'] = $fwDb->query($sql2); 
//
//$sql_s1= "select tm_id from type_master where tm_type = 'Alert Status' " ;
//$tmdata = $fwDb->queryOne($sql_s1); 
//
//$sql_s2= "select to_option from type_options where to_type_id = ". $tmdata['tm_id'] ;
//$fwViewData['statusdata'] = $fwDb->query($sql_s2); 	

