<?php 
$fwMainView = 'file:' . getcwd() . '/msteam_detail.tpl';
$ms_team = new Fw_Db_Table('ms_team');
$submit = $fwRequest->getParam('subAddDetail', '');

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
if($bsn_id){
$sql3="SELECT business.bsn_id, business.bsn_name FROM business WHERE business.bsn_id = ".$bsn_id;
$data= $fwDb->queryOne($sql3);
$fwViewData['business_name'] = $data['bsn_name'];
$fwViewData['bsn_id'] = $data['bsn_id'];
}
$action = $fwRequest->getParam('action', '');


if($buse_id > 0)
	{

$sql2="SELECT ms_team.* from ms_team WHERE ms_team.ms_id = ".$buse_id;


$userData= $fwDb->queryOne($sql2);
$fwViewData['detail'] = $userData;

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
 $detail = $fwRequest->getParam('msteam', array());
 //db($detail); 
 //exit;	
	$table_id =  (int)$detail['ms_id'];
	unset($detail['ms_id']);

						if($table_id > 0)
							{
								
								$ms_team->setWhere("ms_id=".$table_id);
								$table_id= $ms_team->updateRow($detail);
								
							}
						else
							{			

								$table_id=$ms_team->insertRow($detail);
							}
$fwViewData['msg'] = $table_id;
}