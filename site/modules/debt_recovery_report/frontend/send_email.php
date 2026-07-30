<?php
$fwMainView = 'file:' . getcwd() . '/send_email.tpl';
$tableTask = new Fw_Db_Table('debt_recovery_call_result');

$table = new Fw_Db_Table('debt_recovery_report');

$dr_id = $fwRequest->getParam('dr_id', '');





$sql = "select * from debt_recovery_report where dr_id = ".$dr_id;
$data = $fwDb->queryOne($sql);
$fwViewData['data'] = $data;

$sql_2 = "select bsn_id from business where bsn_name =  '".$data['dr_project_address']."'";
$busData = $fwDb->queryOne($sql_2);


$sql_3 = "select business_sellers.bs_business_id, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_email1
          from business_sellers 
		  Inner join bus_customers on business_sellers.bs_customers_id = bus_customers.bcust_id
		  Inner join business on business_sellers.bs_business_id = business.bsn_id where business_sellers.bs_business_id = ".$busData['bsn_id'];
		  
$emlData = $fwDb->query($sql_3);

//db($emlData);

$email = '';
foreach($emlData as $k => $v)
{
	$email .=  $v['bcust_misc_email1'].",";	
}
$fwViewData['to'] = $email;


$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
	$detail['dr_send_to_client'] = 1;
$detail['dr_send_to_client_date'] = date('d-m-Y');
$detail['dr_send_to_client_user'] = $_SESSION['user']['user_name'];
$table->setWhere("dr_id = $dr_id");
$opr = $table->updateRow($detail);
	
    $detail = $fwRequest->getParam('email', array());
	//db($detail);

	$subject = "Ourstanding Payment of Your Project";
	$from = 'info@cgfb.com.au';
	$from_name = 'CGFB Team';
	
	$detail['email_to'] = rtrim($detail['email_to'],",");
	$emlDetail = explode(",",$detail['email_to']);
	//db($emlDetail);
	
	foreach($emlDetail as $k2=>$v2)
	{
		
		$sqlA = "select bcust_fname, bcust_lname from bus_customers where  bcust_misc_email1 = '".trim($v2)."'";
	    $custData = $fwDb->queryOne($sqlA);
		
		$toname = $custData['bcust_fname'].' '.$custData['bcust_lname'];
		$to = trim($v2);
	
		$message = "<p>Hello ".$custData['bcust_fname']."</p><br>";
		$message .= '<p>Project Address :'.$detail['project'].'</p><br>';
		$message .= '<p>'.$detail['dr_notes']."<p><br>";
		$message .= "<p>Regards,<br>CGFB Account Team<p>";
		
		
	
	//db($message);
	
	send_email($toname, $to, 'CGFB', 'accounts@cgfb.com.au', $subject, $message, $attachmentsend='');
	$fwViewData['msg'] = 'Email has been sent successfully';
	
	}
}

