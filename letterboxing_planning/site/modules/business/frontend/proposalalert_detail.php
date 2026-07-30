<?php 
$fwMainView = 'file:' . getcwd() . '/proposalalert_detail.tpl';
$tablebusinessseller = new Fw_Db_Table('proposal_alert');

$current_date = date('Y-m-d');
$current_time = date('H:i');
$submit = $fwRequest->getParam('subAddDetail', '');
$pagenum = $fwRequest->getparamget('pagenum','');

$inspagenum = $fwRequest->getparamget('inspagenum','');
$mopagenum = $fwRequest->getparamget('mopagenum','');
$inforpagenum = $fwRequest->getparamget('inforpagenum','');


$user_id = $_SESSION['user']['user_id'];
$fwViewData['user_id']=$user_id;
$bsn_id = $fwRequest->getParam('bsn_id', '');
$buse_id = $fwRequest->getparam('buse_id', 0); 

if(empty($bsn_id))
{
$bsn_id = $fwRequest->getParam('bsns_id', '');
}

if(empty($bsn_id))
{
	if($buse_id){$bsn_id = $buse_id;}
}

$fwViewData['bsn_id'] = $bsn_id;


$buse_id = $fwRequest->getparam('buse_id', 0); 
if($buse_id > 0)
{
	$sql2= "select proposal_alert.* from proposal_alert WHERE proposal_alert.be_id = ".$buse_id;
	$userData= $fwDb->queryOne($sql2);
	$fwViewData['detail'] = $userData;

	$bsn_id =  $fwViewData['detail']['be_business_id'];
	$fwViewData['button'] = "Edit";
}else{$fwViewData['msg'] =0;
	$fwViewData['button'] = "Add";
}	

if($bsn_id){
$sql3="SELECT business.bsn_id, business.bsn_name,business.bsn_cd_enquiry_source FROM business WHERE business.bsn_id = ".$bsn_id;
$data= $fwDb->queryOne($sql3);
$fwViewData['business_name'] = $data['bsn_name'];
$fwViewData['bsn_cd_enquiry_source'] = $data['bsn_cd_enquiry_source'];
$fwViewData['bsn_id'] = $data['bsn_id'];
}


if($submit)
{
 $detail = $fwRequest->getParam($TABLE, array());	

	$titlesql = "Select business.bsn_address from business where business.bsn_id = " . $detail['be_business_id'];
	$titledata= $fwDb->queryOne($titlesql);

	$table_id =  (int)$detail['be_id'];
	$detail['be_created_date'] = $current_date;
	unset($detail['be_id']);

						if($table_id > 0)
							{
								$tablebusinessseller->setWhere("be_id=".$table_id);
								$table_id= $tablebusinessseller->updateRow($detail);
							}
						else
							{			
								$detail['be_user'] = $user_id;			
								$table_id=$tablebusinessseller->insertRow($detail);
							}
							
					    
							
							$emailid = explode('-',$detail['be_assign_to']);
							
							$toname = trim($emailid[0]);
							
							$to = trim($emailid[1]);
							
							//$to = 'manojsoniephp@gmail.com';
							
							$fromname = "CGFB";
							$from = 'info@cgfb.com.au';
							
							//$subject = 'Email alert from proposal alert';
							
							$subject = 'Proposal Alert - ' .$titledata['bsn_address'];
							
														
							$message = '<html><body>';
							$message .= $detail['be_alert_text']. '<br><br>';
							
							$message .= 'https://www.deckquotes.com.au/business.detail/bsn_id/'. $detail['be_business_id'];
							
							$message .= '</body></html>';
							//exit;
							
							
							$attachment='';
							send_email($toname,$to, $fromname, $from, $subject, $message, $attachment);
							
							
							
							
$fwViewData['msg'] = $table_id;
}

$ecsql = "select * from email_contact where ec_status = 1";
	$fwViewData['emailcontacts'] = $fwDb->query($ecsql);