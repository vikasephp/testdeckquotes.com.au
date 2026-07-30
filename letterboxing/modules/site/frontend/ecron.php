<?php	 
$sedmail = 0;
$emailtemplate =  new Fw_Db_Table('email_template');
$reporttype = "Urgent Action Required:";
$project_status = 1;

$bussql = "SELECT business.bsn_id, business.bsn_name, business.bsn_address, business.bsn_suburb, business.bsn_state, bt.bt_completed_date, bt.bt_task_id, document_check_list.doc_file_name  
FROM business 
Left JOIN business_tasks as bt ON bt.bt_bsn_id = business.bsn_id AND bt.bt_task_id = 47 
Left JOIN business_tasks as btc ON btc .bt_bsn_id = business.bsn_id AND btc.bt_task_id = 43
LEFT JOIN document_check_list ON document_check_list.doc_bsn_id = business.bsn_id AND document_check_list.doc_name_id = 3	
WHERE bt.bt_complete = 1 AND btc.bt_complete = 0  AND bt.bt_completed_date > DATE_SUB(NOW(), INTERVAL 48 HOUR)";

$Data = $fwDb->query($bussql);
if($Data):
$emailtemplate->setWhere("et_section = 4 AND et_task_types = 4");
$emailtemp = $emailtemplate->getRow();

$title = $emailtemp['et_subject'];
$body = $emailtemp['et_body'];

foreach($Data as  $val):
unset($attach);
$attach[] = BASE_URL."files/document_check_list_files/".$val['doc_file_name'];
$att = serialize($attach);
$body = str_replace("{{projectname}}", $val['bsn_name'], $body);
$body = str_replace("{{date}}", (date('m/d/Y', strtotime($val['bt_completed_date']))), $body);


send_email("Frank Walmsley", "proposals@turnkeydecks.com.au", SITE_NAME, SITE_EMAIL, $title, $body, $att);
send_email("Frank Walmsley", "frank@businessbuys.com.au", SITE_NAME, SITE_EMAIL, $title, $body, $att);
send_email("Frank Walmsley", "service@turnkeydecks.com.au", SITE_NAME, SITE_EMAIL, $title, $body, $att);

//send_email("M", "manojs@ephpsolutions.com", SITE_NAME, SITE_EMAIL, $title, $body, $att);


endforeach;
endif;
echo "Send Successfully";
print_r($attach);
exit;