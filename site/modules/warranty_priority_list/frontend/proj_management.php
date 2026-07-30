<?php
$fwMainView = 'file:' . getcwd() . '/proj_management.tpl';
$table = new Fw_Db_Table('warranty_log');
$email = $fwRequest->getParam('email', '');
if($email)
{
	 $keys_2 = array_keys($email);
	 $ky_2 = $keys_2[0];
	 $val_2 = $email[$ky_2];
	
	  $detail['wa_weekly_email'] = $val_2;
	  $table->setWhere("wa_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}

$sql = "SELECT * FROM warranty_log
        WHERE ( wa_status = 'Open' OR wa_status = 'Pending' )
        GROUP BY wa_project ";

$Data = $fwDb->query($sql);

foreach($Data as $k => $v)
{

	 $sq11= "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname,
	 bus_customers.bcust_lname,
         bus_customers.bcust_misc_email1
	 from business_sellers 		
	 Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	 Inner Join business ON business_sellers.bs_business_id = business.bsn_id where business.bsn_name = '".$v['wa_project']."'";  
	
	 $contact = $fwDb->queryOne($sq11);
	 
	 $sql2 = "Select count(wa_project) as tot_logs from warranty_log where ( wa_status = 'Open' OR wa_status = 'Pending' ) and wa_project = '".$v['wa_project']."'";
	
	 $logs = $fwDb->queryOne($sql2);
	
	 $Data[$k]['contact_info'] = $contact['bcust_misc_email1'];
	 $Data[$k]['tot_logs'] = $logs['tot_logs']; 

}
$fwViewData['Data'] = $Data;