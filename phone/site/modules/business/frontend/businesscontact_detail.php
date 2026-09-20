<?php
$fwMainView = 'file:' . getcwd() . '/businesscontact_detail.tpl';
$submit = $fwRequest->getParam('subAddDetail', '');
$user_id = $_SESSION['user']['user_id'];
$fwViewData['bsn_id'] = $fwRequest->getParam('bsn_id', '');
$tableenquirysource = new Fw_Db_Table('customers_type');
$tablecontact = new Fw_Db_Table('othercontact');
$tableenquirysource->setOrderBy('ct_id'.' ASC');
$fwViewData['contact_types']=$tableenquirysource->getAllRows();
$oc_id = $fwRequest->getparam('oc_id', 0); 
if($oc_id > 0)
	{
$sql2="SELECT * FROM othercontact WHERE oc_id = ".$oc_id;
$userData= $fwDb->queryOne($sql2);
$fwViewData['detail'] = $userData;
$fwViewData['button'] = "Edit";
}else{$fwViewData['msg'] =0;
$fwViewData['button'] = "Add";
}	
if($submit)
{
 $detail = $fwRequest->getParam($TABLE, array());	

$table_id =  (int)$detail['oc_id'];
	
unset($detail['oc_id']);
				
						if($table_id > 0)
						{
							$tablecontact->setWhere("oc_id=".$table_id);
							
							$id= $tablecontact->updateRow($detail);

						}
						else
						{						
							$id=$tablecontact->insertRow($detail);
						}

$fwViewData['msg'] = $id;
}

