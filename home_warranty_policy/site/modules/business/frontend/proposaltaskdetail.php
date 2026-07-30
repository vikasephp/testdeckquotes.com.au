<?php
$tableTasks = new Fw_Db_Table('proposal_tasks');
$bus_id = $fwRequest->getparam('bsn_id', 0);
$taskId = $fwRequest -> getParamget('uid','');
$fwViewData['pp'] = $fwRequest -> getParamget('pp','');
$fwViewData['pcr'] = $fwRequest -> getParamget('pcr','');
$tn = $fwRequest -> getParamget('tn','');
$fwViewData['tn'] = $tn;
$dat = $fwRequest->getParam('comp', array());
$user = $_SESSION['user']['user_id'];

if($dat) {
	
	
	if($dat['co']=='on')
	{
		$tcdetail['bt_complete'] = 1;
		$tcdetail['bt_completed_by'] = $user;
		$tcdetail['bt_completed_date'] = date('Y-m-d h:i:s');
		$tableTasks->setWhere("bt_bsn_id = ". $bus_id. " and bt_task_id = ".$taskId);
		$tableTasks->updateRow($tcdetail);
		
		
	} else {
	
		$tcdetail['bt_complete'] = 0;
		$tcdetail['bt_completed_by'] = '';
		$tcdetail['bt_completed_date'] = '';
		$tableTasks->setWhere("bt_bsn_id = ". $bus_id. " and bt_task_id = ".$taskId);
		$tableTasks->updateRow($tcdetail);
	
	}
		
}


$sql1 = "select business.bsn_name from business where bsn_id = ". $bus_id;
$fwViewData['busdata'] = $fwDb->queryOne($sql1);
 	
$sql = "SELECT bt.*, bst.bst_id, bst.bst_task_name, bst.bst_document, bst.bst_task_doc_link, bst.bst_order, 
	bst.bst_task_id, bst.bst_instruction, bst_video_link, u.user_name, et.et_id
	FROM proposal_tasks as bt
	INNER JOIN  proposal_task_list as bst
	ON bt.bt_task_id = bst.bst_id AND bt.bt_task_types_id = 0
	LEFT JOIN users as u
	ON bt.bt_completed_by = u.user_id
	LEFT JOIN email_template as et
	ON bt.bt_task_id = et.et_task AND et.et_status = 1
	WHERE bt.bt_bsn_id = ". $bus_id ." AND bt.bt_task_id =  ".$taskId. " AND bt.bt_task_list_number = ".$tn;	
	

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

//	$tpsql = "select * from busness_status_task_procedures";
//	$fwViewData['allTasksProc'] = $fwDb->query($tpsql);
//	
//	$tpsqlemail = "select * from emaillibrary";
//	$fwViewData['emaillinks'] = $fwDb->query($tpsqlemail);
	
	$tpsql = "select * from proposal_task_list_procedures";
	$fwViewData['allTasksProcProposal'] = $fwDb->query($tpsql);
	
	
	$elsql = "select * from proposal_task_list_email_link";
	$fwViewData['proposalEmailLink'] = $fwDb->query($elsql);
				
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
				
				//$sqlu = "update proposal_tasks set bt_task_not_required
			}
		Location(BASE_URL . "business.proposaltaskdetail/bsn_id/".$bus_id."/uid/".$taskId);	
		}