<?php

$fwMainView = 'file:' . getcwd() . '/emailsend.tpl';
$id = $fwRequest->getParam('id', '');
$bsn_id = $fwRequest->getParam('bsn_id', '');

	$emaillibTable = new Fw_Db_Table('emaillibrary');
	$emaillibTable->setWhere('eml_id = '.$id);
	$emldata = $emaillibTable->getRow();
	$fwViewData['emldata'] = $emldata;
	
	$sqlSign = "Select * from email_signature ";
	$fwViewData['signature'] = $fwDb->query($sqlSign);
	
	
	//db($emldata);

//$fwViewData['eml_id'] = $id;
//
//	$sql = "SELECT admin_document_check_list.admin_doc_name, document_check_list.doc_file_name FROM admin_document_check_list
//			Inner Join document_check_list on admin_document_check_list.admin_doc_id = doc_name_id 		
//			WHERE document_check_list.doc_bsn_id = " .$bsn_id. " And document_check_list.doc_file_name != '' ";
//	$fwViewData['docdata'] = $fwDb->query($sql);
//
//	$sql2  ="Select bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_email1 from business_sellers 
//			Inner Join bus_customers on business_sellers.bs_customers_id  = bus_customers.bcust_id 
//			where bs_business_id  = " .$bsn_id;
//	$custdata = $fwDb->queryOne($sql2);
//	
//	$firstname = $custdata['bcust_fname'];	
//	$fwViewData['to_email'] = $custdata['bcust_misc_email1'];
//    $fwViewData['to_name'] = $custdata['bcust_fname'] .' '. $custdata['bcust_lname'];
//

//	
//	$fwViewData['eml_code'] = $emldata['eml_code'];
//	
//	$sql4 = "Select business.bsn_name, business.bsn_address from business where business.bsn_id = ". $bsn_id;
//	$busDetail = $fwDb->queryOne($sql4);
//	
//	$emldata = str_replace("[first name]", $firstname, $emldata);
//	$emldata = str_replace("[Project Name]", $busDetail['bsn_address'], $emldata);
//	$emldata = str_replace("[Phase]",$emldata['eml_phase'], $emldata);
//	
//	$sqlSign = "Select es_signature from email_signature where es_name  = '".$emldata['eml_signarure_block']."'" ;
//	$signdata = $fwDb->queryOne($sqlSign);
//
//	$emldata = str_replace("[sender-email-signature]",$signdata['es_signature'], $emldata);
//	
//	$fwViewData['subject'] = $busDetail['bsn_name']. " - " .$emldata['eml_code'];
//	
//	$fwViewData['emldata'] =  $emldata;
//	
//	$sql3 = "SELECT u.user_id,u.user_name, u.user_email, ug.group_id, g.group_name
//             FROM users u, groups g, users_groups ug
//             WHERE u.user_id=ug.user_id AND ug.group_id=g.group_id AND g.group_id != 2 AND u.user_id != 1 
//	         ORDER BY g.group_id ASC, u.user_name ASC"; 
//    $fwViewData['users'] = $fwDb->query($sql3);
//
//	$sqltdocs = "Select template_docs.dh_title, template_hub_docs.dhd_name2 from template_docs
//	             Inner Join template_hub_docs On template_docs.dh_uid = template_hub_docs.dhd_dh_id
//				 Order By template_docs.dh_uid";
//
//	$fwViewData['templatedocs'] = $fwDb->query($sqltdocs);
		
?>


