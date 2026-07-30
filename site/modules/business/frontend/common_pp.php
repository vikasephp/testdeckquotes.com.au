<?php
$fwMainView = 'file:' . getcwd() . '/common_pp.tpl';
$fwViewData['calcjs'] = 'file:' . getcwd() . '/calcjs.tpl';
$requset = $fwRequest->getparamget('a_req', '');
$editrequset = $fwRequest->getparamget('e_req', '');
$iPad    = stripos($_SERVER['HTTP_USER_AGENT'], "iPad");
$fwViewData['ipad'] = $iPad;
$fwViewData['ran'] =  rand(100000, 999999);

$fwViewData['business_id'] = $_REQUEST['bus_id'];
$fwViewData['document_id'] = $_REQUEST['pc_id'];
$fwViewData['doc_chk_list_chknm'] = $_REQUEST['chknm'];
if ($requset) {
	switch ($requset) {
		case "PPCheckList":
			$document_check_listTable = new Fw_Db_Table('project_planning_checklist');
			$admin_document_check_listTable = new Fw_Db_Table('planning_project_checklist_admin');
			$addList = $fwRequest->getParamget('addList', '');
			$bus_id = $fwRequest->getParamget('bus_id', '');
			$fwViewData['bus_id'] =  $bus_id;
			$sqldata = "Select * from project_planning_checklist_data where pd_bsn_id = " . $bus_id;
			$ppdata = $fwDb->queryOne($sqldata);
			$fwViewData['ppdata'] = $ppdata;
			$sql491 = "Select document_check_list.doc_file_name, document_check_list.doc_date_uploaded, users.user_name
			           from document_check_list
			           inner join users on document_check_list.doc_user_name  = users.user_id
			           where document_check_list.doc_bsn_id = " . $bus_id . " And document_check_list.doc_name_id = 491";
			$data491 = $fwDb->queryOne($sql491);
			$fwViewData['data491'] = $data491;
			$sql20 = "SELECT DCLM.doc_file_name, DCLM.doc_date_uploaded, U.user_name, DPN.dpn_unique_id FROM document_check_list_mini DCLM
				INNER JOIN users U ON DCLM.doc_user_name = U.user_id
				INNER JOIN document_proposal_name DPN ON DPN.dpn_proposal_number = DCLM.doc_checklist_number AND DPN.dpn_bsn_id = DCLM.doc_bsn_id
				WHERE DCLM.doc_bsn_id = " . $bus_id . " AND DCLM.doc_name_id = 20";
			$data20 = $fwDb->query($sql20);
			$fwViewData['data20'] = $data20;
			$sqldtype = "select bsn_ptt_d_type from business where bsn_id = " . $bus_id;
			$datadt = $fwDb->queryOne($sqldtype);
			$fwViewData['dtype'] = $datadt['bsn_ptt_d_type'];
			$sqlprty = "select * from planning_project_types";
			$fwViewData['typedetail'] = $fwDb->query($sqlprty);
			
			$sqlchk = "select dpn_unique_id from document_proposal_name where dpn_bsn_id = ".$bus_id;
			$datachk = $fwDb->query($sqlchk);
			$fwViewData['datachk'] = $datachk;
			
			if (!empty($addList) and $addList == 'add') {
				if ($bus_id > 0) {
					$businessTable = new Fw_Db_Table('business');
					$businessTable->setWhere('bsn_id =' . $bus_id);
					$pt_data = $businessTable->getRow();
					$pt_data1 = $pt_data['bsn_type'];
					$admin_document_check_listTable->setOrderBy('ppc_order ASC');
					$data_checklist = $admin_document_check_listTable->getRows();
					$fwViewData['data_checklist'] = $data_checklist;
					foreach ($data_checklist as $k => $v) {
						$data['pc_bsn_id'] = $bus_id;
						$data['pc_doc_id'] = $v['ppc_id'];
						$data['pc_document'] = trim($v['ppc_document']);
						$data['pc_type'] = $v['ppc_type'];
						$data['pc_link'] = $v['ppc_link'];
						$document_check_listTable->setWhere("pc_doc_id =" . $v['ppc_id'] . ' AND pc_bsn_id = ' . $bus_id);
						if (!$document_check_listTable->rowExists()) {
							$document_check_listTable->insertRow($data);
						}
					}
					$checkListErrorMsg = "Document Checklist has been added successfully.";
					$fwViewData['checkListErrorMsg'] = $checkListErrorMsg;
				} else {
					$fwViewData['checkListErrorMsg'] = 'Business Id is not available. Please save the business and then try again.';
				}
			}
			if ($bus_id > 0) {
				$sql_print_data =  "SELECT project_planning_checklist.* from project_planning_checklist 
			                    where pc_bsn_id = " . $bus_id . " order by pc_id";
				$print_data = $fwDb->query($sql_print_data);
				//db($print_data);
				foreach ($print_data as $kp => $vp) {
					$sql_1 = "select * from  project_planning_rule where ppr_ppc_id = " . $vp['pc_doc_id'];
					$data_1 = $fwDb->queryOne($sql_1);
					$sql_2 = "select bsn_ptt_opi, bsn_ptt_opi_date, bsn_ptt_opi_user from business where bsn_id = " . $bus_id;
					$data_2 = $fwDb->queryOne($sql_2);
					$sql_3 = "select  ppc_dc_uid from planning_project_checklist_admin where ppc_id = " . $vp['pc_doc_id'];
					$data_3 = $fwDb->queryOne($sql_3);
					$sql_4 = "Select document_check_list.doc_file_name, document_check_list.doc_date_uploaded, users.user_name
			           from document_check_list
			           inner join users on document_check_list.doc_user_name  = users.user_id
			           where document_check_list.doc_bsn_id = " . $bus_id . " And document_check_list.doc_name_id = " . $data_3['ppc_dc_uid'];
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
			break;
		case "ppchecklist":
			$fwViewData['ppiframe_data'] = 1;
			$pc_id = $fwRequest->getParamget('pc_id', '');
			if (!empty($pc_id)) {
				$sql_edit_data = "select * from project_planning_checklist
							      WHERE pc_id = $pc_id";
				$doc_data = $fwDb->queryOne($sql_edit_data);
				$fwViewData['doc_data'] = $doc_data;
				//******* Begin Store value in DB after submit*********//
				$submit_iframe = $fwRequest->getParam('submit_iframe', '');
				if (!empty($submit_iframe)) {
					ini_set('display_errors', 'On');
					$doc = $fwRequest->getParam('doc', '');
					$pc_id = $doc['pc_id'];
					unset($doc['pc_id']);
					if($doc['pc_live_link'] != $doc_data['pc_live_link']) {
						$doc['pc_live_link_date'] = date('d-m-Y');
						$doc['pc_live_link_user'] = $_SESSION['user']['user_name'];
					}
					if($doc['pc_design_plan'] != $doc_data['pc_design_plan']) {
						$doc['pc_design_plan_date'] = date('d-m-Y');
						$doc['pc_design_plan_user'] = $_SESSION['user']['user_name'];
					}
					$document_check_listTable = new Fw_Db_Table('project_planning_checklist');
					$document_check_listTable->setWhere("pc_id = $pc_id");
					$document_check_listTable->updateRow($doc);
					$fwViewData['ppiframe_data'] = 0;
					$fwViewData['iframe_msg'] = '1';
				}
				//******* End Store value in DB after submit*********//
			}
			break;
	}
}
