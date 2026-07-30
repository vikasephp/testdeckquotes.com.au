<?php
$fwMainView = 'file:' . getcwd() . '/view_checklist_status.tpl';
$table = new Fw_Db_Table('warranty_checklist');
$wa_id = $fwRequest->getParam('wa_id', '');
	
$mark = $fwRequest->getParam('mark', '');	
if(!empty($mark)) {
	$wa_id = $fwRequest->getParam('wa_id', '');
	
	$user = $_SESSION['user']['user_name'];
    $dt = date('d-m-Y');
	
	$sql_da = "Update warranty_checklist set  ch_status  = 'Doesnt Apply' where ch_wa_id = ".$wa_id;	 
	$fwDb -> queryOne($sql_da);
	
	$sql_2 = "Update warranty_checklist set  ch_user  = '".$user."' where ch_wa_id = ".$wa_id;	 
	$fwDb -> queryOne($sql_2);
	
	$sql_3 = "Update warranty_checklist set  ch_date  = '".$dt."' where ch_wa_id = ".$wa_id;	 
	$fwDb -> queryOne($sql_3);
	
		
}
	
	$sqlb = "select wa_project,wa_type from warranty_log where wa_id = ".$wa_id;
	$logdata = $fwDb->queryOne($sqlb);
	$fwViewData['wa_project'] = $logdata['wa_project'];
	$fwViewData['wa_type'] = $logdata['wa_type'];
	$fwViewData['wa_id'] = $wa_id;
	
	$sql_1 = "Select * from warranty_checklist_admin";
	$ccData = $fwDb->query($sql_1);

    foreach($ccData as $k=>$v)
	{
		$detail['ch_wa_id'] = $wa_id;
		$detail['ch_checklist'] = $v['wc_id'];
		$detail['ch_order'] = $v['wc_order'];
		
		$table->setWhere('ch_wa_id = '.$wa_id . ' And ch_checklist = '. $v['wc_id']);
	    if(!$table->rowExists())
	    {
			 $this_id = $table->insertRow($detail);
	    } else {
			 $this_id = $table->updateRow($detail);
		}

		
	}
	
	$ord =  " ORDER BY if(  warranty_checklist.ch_date = ' '
    OR warranty_checklist.ch_date IS NULL , 1, 0 ) , STR_TO_DATE( warranty_checklist.ch_date, '%d-%m-%Y' ) ";
	
	
//   $sql_2 = "Select warranty_checklist.* , warranty_checklist_admin.* from warranty_checklist 
//             Inner join warranty_checklist_admin On warranty_checklist.ch_checklist = warranty_checklist_admin.wc_id
//			 where warranty_checklist.ch_wa_id = ".$wa_id ." order by warranty_checklist.ch_order";
			 
			 	
   $sql_2 = "Select warranty_checklist.* , warranty_checklist_admin.* from warranty_checklist 
             Inner join warranty_checklist_admin On warranty_checklist.ch_checklist = warranty_checklist_admin.wc_id
			 where warranty_checklist.ch_wa_id = ".$wa_id ." ". $ord;

			 
   $data = $fwDb->query($sql_2);
   $fwViewData['data'] = $data;