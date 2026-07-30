<?php
$fwMainView = 'file:' . getcwd() . '/add_result.tpl';
$table = new Fw_Db_Table('debt_recovery_report');

$dr_id = $fwRequest->getParam('dr_id', '');

$detail['dr_send_to_client'] = 1;
$table->setWhere("dr_id = $dr_id");
$opr = $table->updateRow($detail);


$sql = "select * from debt_recovery_report where dr_id = ".$dr_id;
$data = $fwDb->queryOne($sql);
$fwViewData['data'] = $data;

//$submit = $fwRequest->getParam('subAddDetail', '');
//if(!empty($submit))
//{
//    $detail = $fwRequest->getParam('task', array());
//	
//	$this_id = (int)$detail['cr_id'];
//	unset($detail['cr_id']);
//	
//	
//    if($this_id > 0)
//    	{
//             
//      		 unset($detail['cr_id']);
//       		 $tableTask->setWhere("cr_id = $this_id");
//	     	 $opr = $tableTask->updateRow($detail);   
//    	}
//	else
//	{
//		    $opr = $tableTask->insertRow($detail); 
//	}    	
//	        $fwViewData['opr'] = $opr;	
//}

