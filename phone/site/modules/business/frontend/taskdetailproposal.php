<?php
$tableTasks = new Fw_Db_Table('proposal_tasks');
$bus_id = $fwRequest->getparam('bsn_id', 0);
$taskId = $fwRequest -> getParamget('uid','');
$fwViewData['pp'] = $fwRequest -> getParamget('pp','');
$fwViewData['pcr'] = $fwRequest -> getParamget('pcr','');
$tsn = $fwRequest -> getParamget('tsn','');
$fwViewData['tsn'] = $tsn;
$dat = $fwRequest->getParam('comp', array());
$user = $_SESSION['user']['user_id'];

//db(date('m-d-Y'));

if($dat) {
	

	if($dat['co']=='on')
	{
		$tcdetail['bt_complete'] = 1;
		$tcdetail['bt_completed_by'] = $user;
		$tcdetail['bt_completed_date'] = date('Y-m-d h:i:s');
		$tableTasks->setWhere("bt_bsn_id = ". $bus_id. " and bt_task_id = ".$taskId. " and bt_task_list_number = ".$dat['tsn']);
		$tableTasks->updateRow($tcdetail);
		
		
	} else {
	
		$tcdetail['bt_complete'] = 0;
		$tcdetail['bt_completed_by'] = '';
		$tcdetail['bt_completed_date'] = '';
		$tableTasks->setWhere("bt_bsn_id = ". $bus_id. " and bt_task_id = ".$taskId.  " and bt_task_list_number = ".$dat['tsn']);
		$tableTasks->updateRow($tcdetail);
	
	}
		
}


$sql1 = "select business.bsn_name from business where bsn_id = ". $bus_id;
$fwViewData['busdata'] = $fwDb->queryOne($sql1);

$sql = "SELECT bt.*,  bst.bst_id,  bst.bst_task_id, bst.bst_task_name, bst.bst_document, bst.bst_task_doc_link,
        bst.bst_order, bst_posid, pos.p_name, bst.bst_task_id, bst.bst_instruction, bst_video_link, u.user_name, et.et_id
	FROM proposal_tasks as bt
	
	INNER JOIN  proposal_task_list as bst
	ON bt.bt_task_id = bst.bst_task_id AND bt.bt_task_types_id = 0
	LEFT JOIN users as u
	ON bt.bt_completed_by = u.user_id
	LEFT JOIN email_template as et
	ON bt.bt_task_id = et.et_task AND et.et_status = 1
	LEFT JOIN positions as pos
	ON bst.bst_posid  = pos.p_id
	WHERE bt.bt_bsn_id = ". $bus_id. " And bst.bst_task_id = ". $taskId. " And bt.bt_task_list_number = ".$tsn; 

$all = $fwDb->query($sql);


				
	foreach($all as $kk => $allt)
	{
		$all[$kk]['bst_instruction'] = preg_replace('/[^A-Z0-9._<>\/&;]/i', ' ', $allt['bst_instruction']);	
	}
	
	foreach($all as $dv)
	{
		$dv['bst_task_doc_link'] =  explode(',',$dv['bst_task_doc_link']);	
		$all2[] = $dv;
	}
	

	$fwViewData['allTasks']= $all2;


	$tpsql = "select * from proposal_task_list_procedures";
	$fwViewData['allTasksProc'] = $fwDb->query($tpsql);
	
	$tpsqlemail = "select * from emaillibrary";
	$fwViewData['emaillinks'] = $fwDb->query($tpsqlemail);
				
$submit_nrt = $fwRequest->getParam('not_required_task_save', '');

if(!empty($submit_nrt))
		{
			
			$tablebt = new Fw_Db_Table('proposal_tasks');
			$nrdata_task = $fwRequest->getParam('not_required_task', array());
						
			foreach($nrdata_task as $nrd_task)
			{
				$bt_id = $nrd_task['bt_id'];
				if(!empty($nrd_task['bt_task_not_required'])) { $value1 =  1; } else { $value1 =  0; }
				$tablebt->setWhere("bt_id = ". $bt_id);
				$nrdetail['bt_task_not_required'] =  $value1;
				$tablebt->updateRow($nrdetail);
			}
			
		Location(BASE_URL . "business.taskdetailproposal/bsn_id/".$bus_id."/uid/".$taskId."/tsn/".$tsn);	
		}