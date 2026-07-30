<?php
$tableTasks = new Fw_Db_Table('business_tasks');
$bsn_id = $fwRequest->getparam('bsn_id', 0);
$taskId = $fwRequest->getParamget('uid', '');
$fwViewData['pp'] = $fwRequest->getParamget('pp', '');
$fwViewData['pcr'] = $fwRequest->getParamget('pcr', '');

$dat = $fwRequest->getParam('comp', array());
$user = $_SESSION['user']['user_id'];

$bsn_id = $fwRequest->getParam('bsn_id', '');
$fwViewData['bsn_id'] = $bsn_id;

if (isset($_SESSION['shval'])) {
	$fwViewData['shval'] = $_SESSION['shval'];
} else {
	$fwViewData['shval'] = 1;
}

if (isset($_SESSION['shval_ppd'])) {
	$fwViewData['shval_ppd'] = $_SESSION['shval_ppd'];
} else {
	$fwViewData['shval_ppd'] = 1;
}


$show_hide = $fwRequest->getParam('show_hide', '');
if (!empty($show_hide)) {
	$shval = $fwRequest->getParam('shval', '');
	if ($shval == 1) {
		$fwViewData['shval'] = 0;
		$_SESSION['shval'] = 0;
	} else {
		$fwViewData['shval'] = 1;
		$_SESSION['shval'] = 1;
	}
}


$show_hide_ppd = $fwRequest->getParam('show_hide_ppd', '');
if (!empty($show_hide_ppd)) {
	$shval_ppd = $fwRequest->getParam('shval_ppd', '');
	if ($shval_ppd == 1) {
		$fwViewData['shval_ppd'] = 0;
		$_SESSION['shval_ppd'] = 0;
	} else {
		$fwViewData['shval_ppd'] = 1;
		$_SESSION['shval_ppd'] = 1;
	}
}


$sql = "Select bsn_name from business where bsn_id = " . $bsn_id;
$data = $fwDb->queryOne($sql);

$fwViewData['bsn_name'] = $data['bsn_name'];

$taskId = $fwRequest->getparam('bt_task_id', 0);

if ($dat) {

	if ($dat['co'] == 'on') {
		$tcdetail['bt_complete'] = 1;
		$tcdetail['bt_completed_by'] = $user;
		$tcdetail['bt_completed_date'] = date('Y-m-d h:i:s');

		$keys_2 = array_keys($taskId);
		$ky_2 = $keys_2[0];
		$val_2 = $taskId[$ky_2];

		$tableTasks->setWhere("bt_bsn_id = " . $bsn_id . " and bt_task_id = " . $val_2);
		$tableTasks->updateRow($tcdetail);
	} else {

		$keys_2 = array_keys($taskId);
		$ky_2 = $keys_2[0];
		$val_2 = $taskId[$ky_2];

		$tcdetail['bt_complete'] = 0;
		$tcdetail['bt_completed_by'] = '';
		$tcdetail['bt_completed_date'] = '';
		$tableTasks->setWhere("bt_bsn_id = " . $bsn_id . " and bt_task_id = " . $val_2);
		$tableTasks->updateRow($tcdetail);
	}
}
//exit;

$sql1 = "select business.bsn_name from business where bsn_id = " . $bsn_id;
$fwViewData['busdata'] = $fwDb->queryOne($sql1);

$sql = "SELECT bt.*, bs.st_name, bst.bst_id,  bst.bst_task_id, bst.bst_task_name, bst.bst_document, bst.bst_task_doc_link,
        bst.bst_order, bst_posid, pos.p_name, bst.bst_task_id, bst.bst_instruction, bst_video_link, u.user_name, et.et_id, bst.bst_auto_email_text,
		bst.bst_auto_sms_text
		FROM business_tasks as bt
		INNER JOIN busness_status as bs
		ON bt.bt_task_status_id = bs.st_id
		INNER JOIN  busness_status_task as bst
		ON bt.bt_task_id = bst.bst_task_id AND bt.bt_task_types_id = 0
		LEFT JOIN users as u
		ON bt.bt_completed_by = u.user_id
		LEFT JOIN email_template as et
		ON bt.bt_task_id = et.et_task AND et.et_status = 1
		LEFT JOIN positions as pos
		ON bst.bst_posid  = pos.p_id
		WHERE bt.bt_bsn_id = " . $bsn_id . " AND bt.bt_task_status_id = 2  ORDER BY bst_order ASC";

$all = $fwDb->query($sql);



foreach ($all as $kk => $allt) {
	$all[$kk]['bst_instruction'] = preg_replace('/[^A-Z0-9._<>\/&;]/i', ' ', $allt['bst_instruction']);
}

foreach ($all as $dv) {
	$dv['bst_task_doc_link'] =  explode(',', $dv['bst_task_doc_link']);
	$all2[] = $dv;
}


$fwViewData['allTasks'] = $all2;

$tpsql = "select * from busness_status_task_procedures";
$fwViewData['allTasksProc'] = $fwDb->query($tpsql);

$tpsql_team = "SELECT template_hub_docs.dhd_link_pdf, template_hub_docs.dhd_link_word, 
				  busness_status_task_msteam.btp_bst_id  ,busness_status_task_msteam.btp_doc_longtext FROM template_hub_docs
				  INNER JOIN busness_status_task_msteam ON template_hub_docs.dhd_dh_id = busness_status_task_msteam.btp_doc";

$fwViewData['allTasksTeam'] = $fwDb->query($tpsql_team);

$tpsqlemail = "select * from emaillibrary";
$fwViewData['emaillinks'] = $fwDb->query($tpsqlemail);

$submit_nrt = $fwRequest->getParam('not_required_task_save', '');

if (!empty($submit_nrt)) {


	$tablebt = new Fw_Db_Table('business_tasks');
	$nrdata_task = $fwRequest->getParam('not_required_task', array());


	foreach ($nrdata_task as $nrd_task) {

		$bt_id = $nrd_task['bt_id'];
		if (!empty($nrd_task['bt_task_not_required'])) {
			$value1 =  1;
		} else {
			$value1 =  0;
		}
		$tablebt->setWhere("bt_id = " . $bt_id);
		$nrdetail['bt_task_not_required'] =  $value1;

		$tablebt->updateRow($nrdetail);
	}

	Location(BASE_URL . "planning_task_tracker.view_project/bsn_id/" . $bsn_id);
}





// Start of Planning Project Checklist Section



$requset = $fwRequest->getparamget('a_req', '');
$editrequset = $fwRequest->getparamget('e_req', '');

$iPad    = stripos($_SERVER['HTTP_USER_AGENT'], "iPad");
$fwViewData['ipad'] = $iPad;

$fwViewData['ran'] =  rand(100000, 999999);

$fwViewData['business_id'] = $_REQUEST['bsn_id'];
$fwViewData['document_id'] = $_REQUEST['pc_id'];
$fwViewData['doc_chk_list_chknm'] = $_REQUEST['chknm'];


$document_check_listTable = new Fw_Db_Table('project_planning_checklist');
$admin_document_check_listTable = new Fw_Db_Table('planning_project_checklist_admin');


$bsn_id = $fwRequest->getParamget('bsn_id', '');
$fwViewData['bsn_id'] =  $bsn_id;

$sqldata = "Select * from project_planning_checklist_data where pd_bsn_id = " . $bsn_id;
$ppdata = $fwDb->queryOne($sqldata);
$fwViewData['ppdata'] = $ppdata;

$sql491 = "Select document_check_list.doc_file_name, document_check_list.doc_date_uploaded, users.user_name
			           from document_check_list
			           inner join users on document_check_list.doc_user_name  = users.user_id
			           where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 491";
$data491 = $fwDb->queryOne($sql491);


$fwViewData['data491'] = $data491;

$sqldtype = "select bsn_ptt_d_type from business where bsn_id = " . $bsn_id;
$datadt = $fwDb->queryOne($sqldtype);
$fwViewData['dtype'] = $datadt['bsn_ptt_d_type'];

$sqlprty = "select * from planning_project_types";
$fwViewData['typedetail'] = $fwDb->query($sqlprty);


// For DA 
$sqlDAPos = "select project_planning_checklist.pc_bsn_id from project_planning_checklist
		             left join planning_project_checklist_admin on  project_planning_checklist.pc_doc_id = planning_project_checklist_admin.ppc_id
				     where planning_project_checklist_admin.ppc_required = 'DA' 
				     and  project_planning_checklist.pc_bsn_id = " . $bsn_id;
$dataDAPOS = $fwDb->query($sqlDAPos);

$fwViewData['possible'] = sizeof($dataDAPOS);

$sqlDAReq = "select project_planning_checklist.pc_bsn_id from project_planning_checklist
		             left join planning_project_checklist_admin on  project_planning_checklist.pc_doc_id = planning_project_checklist_admin.ppc_id
				     where planning_project_checklist_admin.ppc_required = 'DA' AND project_planning_checklist.pc_required = 1
				     and  project_planning_checklist.pc_bsn_id = " . $bsn_id;
$dataDAReq = $fwDb->query($sqlDAReq);

$fwViewData['required'] = sizeof($dataDAReq);

$sqlDAll = "select project_planning_checklist.pc_bsn_id from project_planning_checklist
		           left join planning_project_checklist_admin on  project_planning_checklist.pc_doc_id = planning_project_checklist_admin.ppc_id
				   where planning_project_checklist_admin.ppc_required = 'DA' AND 
				   project_planning_checklist.pc_required = 1
				   and length(TRIM(project_planning_checklist.pc_live_link)) > 0
				   and  project_planning_checklist.pc_bsn_id = " . $bsn_id;
$datotll = $fwDb->query($sqlDAll);



$sql99 = "select doc_file_name, doc_bsn_id , ppc_id from document_check_list 
		               inner join planning_project_checklist_admin on document_check_list.doc_name_id = planning_project_checklist_admin.ppc_dc_uid 
				       where document_check_list.doc_bsn_id = " . $bsn_id . " and length(TRIM(document_check_list.doc_file_name)) > 0
				        and planning_project_checklist_admin.ppc_required = 'DA'";

$dataotherDA = $fwDb->query($sql99);

$x = 0;
foreach ($dataotherDA as $k1 => $v1) {
	$sqlX = " select pc_bsn_id, pc_live_link from project_planning_checklist 
				          where pc_doc_id = " . $v1['ppc_id'] . " and pc_bsn_id = " . $v1['doc_bsn_id'];

	$dataX = $fwDb->queryOne($sqlX);

	if (empty($dataX['pc_live_link'])) {
		$x++;
	}
}


$added = sizeof($datotll);
// $t1 = sizeof($dataotherDA);

$fwViewData['added'] = $added + $x;


$sqlDAApp = "select project_planning_checklist.pc_bsn_id from project_planning_checklist
		           left join planning_project_checklist_admin on  project_planning_checklist.pc_doc_id = planning_project_checklist_admin.ppc_id
				   where planning_project_checklist_admin.ppc_required = 'DA' 
				   and project_planning_checklist.pc_ready_for = 1
				   and  project_planning_checklist.pc_bsn_id = " . $bsn_id;
$datotAPP = $fwDb->query($sqlDAApp);
$fwViewData['approved'] = sizeof($datotAPP);

// DA Ends


// For BA 
$sqlBAPos = "select project_planning_checklist.pc_bsn_id from project_planning_checklist
		             left join planning_project_checklist_admin on  project_planning_checklist.pc_doc_id = planning_project_checklist_admin.ppc_id
				     where planning_project_checklist_admin.ppc_required = 'BA' 
				     and  project_planning_checklist.pc_bsn_id = " . $bsn_id;
$dataBAPOS = $fwDb->query($sqlBAPos);

$fwViewData['possible_ba'] = sizeof($dataBAPOS);

$sqlBAReq = "select project_planning_checklist.pc_bsn_id from project_planning_checklist
		             left join planning_project_checklist_admin on  project_planning_checklist.pc_doc_id = planning_project_checklist_admin.ppc_id
				     where planning_project_checklist_admin.ppc_required = 'BA' AND project_planning_checklist.pc_required = 1
				     and  project_planning_checklist.pc_bsn_id = " . $bsn_id;
$dataBAReq = $fwDb->query($sqlBAReq);

$fwViewData['required_ba'] = sizeof($dataBAReq);

$sqlBAll = "select project_planning_checklist.pc_bsn_id from project_planning_checklist
		           left join planning_project_checklist_admin on  project_planning_checklist.pc_doc_id = planning_project_checklist_admin.ppc_id
				   where planning_project_checklist_admin.ppc_required = 'BA' AND 
				   project_planning_checklist.pc_required = 1
				   and length(TRIM(project_planning_checklist.pc_live_link)) > 0
				   and  project_planning_checklist.pc_bsn_id = " . $bsn_id;
$batotll = $fwDb->query($sqlBAll);

$sql101 = "select doc_file_name, doc_bsn_id , ppc_id from document_check_list 
		          inner join planning_project_checklist_admin on document_check_list.doc_name_id = planning_project_checklist_admin.ppc_dc_uid 
				  where document_check_list.doc_bsn_id = " . $bsn_id . " and length(TRIM(document_check_list.doc_file_name)) > 0
				  and planning_project_checklist_admin.ppc_required = 'BA'";
$dataotherBA = $fwDb->query($sql101);


//$t2 = sizeof($dataotherBA);

$y = 0;

foreach ($dataotherBA as $k1 => $v1) {
	$sqlY = " select pc_bsn_id, pc_live_link from project_planning_checklist 
				          where pc_doc_id = " . $v1['ppc_id'] . " and pc_bsn_id = " . $v1['doc_bsn_id'];

	$dataY = $fwDb->queryOne($sqlY);

	if (empty($dataY['pc_live_link'])) {
		$y++;
	}
}


$fwViewData['added_ba'] = sizeof($batotll) + $y;


$sqlBAApp = "select project_planning_checklist.pc_bsn_id from project_planning_checklist
		           left join planning_project_checklist_admin on  project_planning_checklist.pc_doc_id = planning_project_checklist_admin.ppc_id
				   where planning_project_checklist_admin.ppc_required = 'BA' 
				   and project_planning_checklist.pc_ready_for = 1
				   and  project_planning_checklist.pc_bsn_id = " . $bsn_id;
$datotAPP = $fwDb->query($sqlBAApp);
$fwViewData['approved_ba'] = sizeof($datotAPP);

// BA Ends

if ($bsn_id > 0) {
	$businessTable = new Fw_Db_Table('business');
	$businessTable->setWhere('bsn_id =' . $bsn_id);
	$pt_data = $businessTable->getRow();
	$pt_data1 = $pt_data['bsn_type'];


	$admin_document_check_listTable->setOrderBy('ppc_order ASC');
	$data_checklist = $admin_document_check_listTable->getRows();


	$fwViewData['data_checklist'] = $data_checklist;

	foreach ($data_checklist as $k => $v) {
		$data['pc_bsn_id'] = $bsn_id;
		$data['pc_doc_id'] = $v['ppc_id'];
		$data['pc_document'] = $v['ppc_document'];

		$data['pc_type'] = $v['ppc_type'];
		$data['pc_link'] = $v['ppc_link'];
		$data['pc_live_link'] = $v['ppc_md_checklist_link'];

		$document_check_listTable->setWhere("pc_doc_id =" . $v['ppc_id'] . ' AND pc_bsn_id = ' . $bsn_id);
		if (!$document_check_listTable->rowExists()) {
			$document_check_listTable->insertRow($data);
		}
	}

	$checkListErrorMsg = "Document Checklist has been added successfully.";
	$fwViewData['checkListErrorMsg'] = $checkListErrorMsg;
} else {
	$fwViewData['checkListErrorMsg'] = 'Business Id is not available. Please save the business and then try again.';
}


if ($bsn_id > 0) {

	$sql_print_data =  "SELECT project_planning_checklist.* from project_planning_checklist 
			                    where pc_bsn_id = " . $bsn_id . " order by pc_id";
	$print_data = $fwDb->query($sql_print_data);


	foreach ($print_data as $kp => $vp) {
		$sql_1 = "select * from  project_planning_rule where ppr_ppc_id = " . $vp['pc_doc_id'];
		$data_1 = $fwDb->queryOne($sql_1);

		$sql_2 = "select bsn_ptt_opi, bsn_ptt_opi_date, bsn_ptt_opi_user from business where bsn_id = " . $bsn_id;
		$data_2 = $fwDb->queryOne($sql_2);

		$sql_3 = "select  ppc_dc_uid from planning_project_checklist_admin where ppc_id = " . $vp['pc_doc_id'];
		$data_3 = $fwDb->queryOne($sql_3);


		$sql_4 = "Select document_check_list.doc_file_name, document_check_list.doc_date_uploaded, users.user_name
			           from document_check_list
			           inner join users on document_check_list.doc_user_name  = users.user_id
			           where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = " . $data_3['ppc_dc_uid'];
		$data_4 = $fwDb->queryOne($sql_4);

		$print_data[$kp]['ppr_new_single'] = $data_1['ppr_new_single'];
		$print_data[$kp]['ppr_alterations'] = $data_1['ppr_alterations'];
		$print_data[$kp]['ppr_secondary'] = $data_1['ppr_secondary'];
		$print_data[$kp]['ppr_class10'] = $data_1['ppr_class10'];
		$print_data[$kp]['ppr_dual_occ'] = $data_1['ppr_dual_occ'];

		$print_data[$kp]['bsn_ptt_opi'] = $data_2['bsn_ptt_opi'];
		$print_data[$kp]['bsn_ptt_opi_date'] = $data_2['bsn_ptt_opi_date'];
		$print_data[$kp]['bsn_ptt_opi_user'] = $data_2['bsn_ptt_opi_user'];

		$print_data[$kp]['doc_file_name'] = $data_4['doc_file_name'];
		$print_data[$kp]['doc_date_uploaded'] = changedate_d_m_y($data_4['doc_date_uploaded']);
		$print_data[$kp]['user_name'] = $data_4['user_name'];
	}

	$fwViewData['print_data'] = $print_data;
}







$fwViewData['ppiframe_data'] = 1;

$pc_id = $fwRequest->getParamget('pc_id', '');

if (!empty($pc_id)) {

	$sql_edit_data = "select * from project_planning_checklist WHERE pc_id = $pc_id";

	$doc_data = $fwDb->queryOne($sql_edit_data);

	$fwViewData['doc_data'] = $doc_data;

	//******* Begin Store value in DB after submit*********//
	$submit_iframe = $fwRequest->getParam('submit_iframe', '');
	if (!empty($submit_iframe)) {
		ini_set('display_errors', 'On');
		$doc = $fwRequest->getParam('doc', '');

		$pc_id = $doc['pc_id'];
		unset($doc['pc_id']);

		$doc['pc_live_link_date'] = date('d-m-Y');
		$doc['pc_live_link_user'] = $_SESSION['user']['user_name'];

		$document_check_listTable = new Fw_Db_Table('project_planning_checklist');
		$document_check_listTable->setWhere("pc_id = $pc_id");
		$document_check_listTable->updateRow($doc);
		$fwViewData['ppiframe_data'] = 0;
		$fwViewData['iframe_msg'] = '1';
	}
	//******* End Store value in DB after submit*********//
}

//*************** Utilites and referrals *****************//

$fwViewData['calcjs'] = 'file:' . getcwd() . '/calcjs.tpl';

$editrequset = $fwRequest->getparamget('e_req', '');

$fwViewData['business_id'] = $bus_id = $_REQUEST['bus_id'];
$fwViewData['action_name'] =  $_REQUEST['action_name'];
$fwViewData['checklist_entities_referral_id'] = $checklist_entities_referral_id =  $_REQUEST['checklist_entities_referral_id'];
$fwViewData['er_document'] =  $_REQUEST['er_document'];
$fwViewData['er_id'] =  $_REQUEST['er_id'];

$result = [];

if (!empty($checklist_entities_referral_id)) {
	$ckhlist_sqlus23 = "SELECT * FROM `checklist_entities_referral` where id = '" . $checklist_entities_referral_id . "'";
	$ckhlist_sqlus_r23 = $fwDb->query($ckhlist_sqlus23);
	$fwViewData['checklist_entities_referral'] = $ckhlist_sqlus_r23[0];
} else {
	$fwViewData['checklist_entities_referral'] = [];
}

$sql491 = "SELECT * FROM `entities_referral`";
$entities_referral_result = $fwDb->query($sql491);



if (!empty($entities_referral_result)) {
	foreach ($entities_referral_result as $key => $value) {

		$sql2 = "SELECT * FROM `checklist_entities_referral` where checklist_entities_referral.bsn_id= '" . $bsn_id . "' and entites_referral_id = '" . $value['er_id'] . "'";
		$result2 = $fwDb->query($sql2);
		if (!empty($result2)) {
			$result2[0]['date_applied'] = $newDate = (strtotime($result2[0]['date_applied']) > 0 ? date("d-m-Y", strtotime($result2[0]['date_applied'])) : '');
			$entities_referral_result[$key]['checklist_entities_referral'] = $result2[0];
		} else {
			$entities_referral_result[$key]['checklist_entities_referral'] = $result2;
		}

		$entities_referral_result[$key]['er_id'] = $value['er_id'];
		$entities_referral_result[$key]['er_document'] = $value['er_document'];
	}
	$project_checklist_list[0]['checklist_entities_referral'] = $entities_referral_result;
}

$fwViewData['project_checklist_list'] = $project_checklist_list;
