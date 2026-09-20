<?php 
$fwMainView = 'file:' . getcwd() . '/custom_component.tpl';
$ms_team = new Fw_Db_Table('purchase_order_custom');
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
//if($bsn_id){
//$sql3="SELECT business.bsn_id, business.bsn_name FROM business WHERE business.bsn_id = ".$bsn_id;
//$data= $fwDb->queryOne($sql3);
//$fwViewData['business_name'] = $data['bsn_name'];
//$fwViewData['bsn_id'] = $data['bsn_id'];
//}
$action = $fwRequest->getParam('action', '');


if($buse_id > 0)
	{

$sql2="SELECT purchase_order_custom.* from purchase_order_custom WHERE purchase_order_custom.po_id = ".$buse_id;


$userData= $fwDb->queryOne($sql2);
$fwViewData['detail'] = $userData;

$fwViewData['button'] = "Edit";
}else{$fwViewData['msg'] =0;
$fwViewData['button'] = "Add";
}	



if($submit)
{
 $detail = $fwRequest->getParam('custom', array());
	
	$table_id =  (int)$detail['po_id'];
	unset($detail['po_id']);

						if($table_id > 0)
							{
								
								$ms_team->setWhere("po_id=".$table_id);
								$table_id= $ms_team->updateRow($detail);
								
							}
						else
							{			

								$table_id=$ms_team->insertRow($detail);
								
							}
$fwViewData['msg'] = $table_id;
$fwViewData['opr'] = "Success";
$fwViewData['opr2'] = "Success";

}