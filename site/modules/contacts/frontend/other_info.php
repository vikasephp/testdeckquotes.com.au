<?php
$fwMainView = 'file:' . getcwd() . '/other_info.tpl';

$submit = $fwRequest->getParam('subAddDetail', '');
$cs_id = $fwRequest->getParam('cs_id', 0);

	$table = new Fw_Db_Table('contacts');
	$table->setWhere("cs_id = $cs_id");
	$fwViewData['list'] = $table->getRows();
        $fwViewData['title'] = 'Other Info';
	
	
	
$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
        $notes = $fwRequest->getParam('notes', '');
	$sql = "update contacts set cs_notes = '".$notes. "' where cs_id = ".$cs_id;

	$fwDb->queryOne($sql);
}

$matsql = "SELECT contacts.* , companies.co_id, companies.co_company_name, companies.co_categry, type_options.to_option, 
           companies.co_resp_status  from contacts 
           Left join companies ON contacts.cs_company = companies.co_id
	   Left join type_options on contacts.cs_position = type_options.to_id where contacts.cs_id = ".$cs_id;
	   
	   $list = $fwDb->query($matsql);
	   $fwViewData['list'] = $list;
	   
	  // db($list[0]['co_company_name']);

$sendemail = $fwRequest->getParam('sendemail', '');
if(!empty($sendemail)) {	   
	
	$to = $list[0]['cs_primary_email'];
	//$to = "manojsoniephp@gmail.com";
	$to_name = $list[0]['cs_first_name'];
	$from_name = "Cgfb Inclusion Team";
	$from = "inclusions@cgfb.com.au";
	$subject = "Update contact form";
	
	$message = $to_name .",<br><br>" ;
	$message .= "Please click on the following link and fill the form and click on save <br>";
$message .= "<a href =  ".BASE_URL."site.contact_update_form/cs_id/".$cs_id .">".BASE_URL."site.contact_update_form/cs_id/".$cs_id."</a>";
	$message .= "<br><br>";
	$message .= "Regards, <br>CGFB Inclusions Team "; 
	
	send_email($to_name, $to, $from_name, $from, $subject, $message, $attachment='');

}
	   