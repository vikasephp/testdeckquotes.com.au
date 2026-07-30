<?php 
$fwMainView = 'file:' . getcwd() . '/timetracker_detail.tpl';
$table = new Fw_Db_Table('time_tracker');

$submit = $fwRequest->getParam('subAddDetail', '');
$pagenum = $fwRequest->getparamget('pagenum','');

$inspagenum = $fwRequest->getparamget('inspagenum','');
$mopagenum = $fwRequest->getparamget('mopagenum','');
$inforpagenum = $fwRequest->getparamget('inforpagenum','');

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
	$sql2= "select time_tracker.* from time_tracker WHERE time_tracker.tt_id = ".$buse_id;
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

	$table_id =  (int)$detail['tt_id'];
	$detail['be_created_date'] = $current_date;
	unset($detail['tt_id']);

						if($table_id > 0)
							{
								$table->setWhere("tt_id=".$table_id);
								$table_id= $table->updateRow($detail);
							}
						else
							{			
								$detail['be_user'] = $user_id;			
								$table_id=$table->insertRow($detail);
							}
							
					    
							
							
$fwViewData['msg'] = $table_id;
}

