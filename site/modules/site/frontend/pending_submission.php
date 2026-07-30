<?php
$email = $fwRequest->getParam('email', '');
$phone = $fwRequest->getParam('phone', '');

if(!isset($_SESSION['email']) && !empty($email)) {
  $_SESSION['email'] = $email;
}

$sql = "Select bcust_misc_email1 from bus_customers 
        where bcust_misc_email1 =  '".$email."' and REPLACE(bcust_misc_moble,' ','') = '".str_replace(' ','',$phone)."'";
$detail = $fwDb->queryOne($sql);


if(!empty(trim($detail['bcust_misc_email1']))  || isset($_SESSION['email'])) 
{
	if(!isset($_SESSION['email'])) { $_SESSION['email'] = $email; }

 		 
		 $sq11= "SELECT  business.bsn_name
				 from business_sellers 		
				 Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
				 Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
				 where bus_customers.bcust_misc_email1 = '".$_SESSION['email']."'";
		 $detail_1 = $fwDb->query($sq11);
	  
	    
	  
		 foreach($detail_1 as $k=>$v)
		  {
			  $matsql = "SELECT * from warranty_form where wf_status = 'Pending' and wf_property_address = '".$v['bsn_name']."'"; 
		      $detail_2 = $fwDb->queryOne($matsql);
			   
			 
			 if(!empty($detail_2)) {	   
			   $setdata[$k]['wf_property_address'] = $detail_2['wf_property_address'];
			   $setdata[$k]['wf_is_tented'] = $detail_2['wf_is_tented'];
			   $setdata[$k]['wf_is_completed'] = $detail_2['wf_is_completed'];
			   $setdata[$k]['wf_problem'] = $detail_2['wf_problem'];
			   
			   $setdata[$k]['wf_photo_1'] = $detail_2['wf_photo_1'];
			   $setdata[$k]['wf_photo_2'] = $detail_2['wf_photo_2'];
			   $setdata[$k]['wf_photo_3'] = $detail_2['wf_photo_3'];
			   $setdata[$k]['wf_photo_4'] = $detail_2['wf_photo_4'];
			   $setdata[$k]['wf_photo_5'] = $detail_2['wf_photo_5'];
			 }
			 
		  }
		 
	     $fwViewData['psdata'] = $setdata; 
		 //db($setdata);
		  


}
else {
	Location(BASE_URL ."site.home/error/1" );
		
}

