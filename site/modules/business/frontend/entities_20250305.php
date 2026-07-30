<?php
$fwMainView = 'file:' . getcwd() . '/entities.tpl';
$fwViewData['calcjs'] = 'file:' . getcwd() . '/calcjs.tpl';

$requset = $fwRequest->getparamget('a_req', '');
$editrequset = $fwRequest->getparamget('e_req', '');

$iPad    = stripos($_SERVER['HTTP_USER_AGENT'], "iPad");
$fwViewData['ipad'] = $iPad;

$fwViewData['ran'] =  rand(100000, 999999);

$fwViewData['business_id'] = $bus_id = $_REQUEST['bus_id'];
$fwViewData['checklist_id']  = $_REQUEST['checklist_id'];
$fwViewData['action_name'] =  $_REQUEST['action_name'];
$fwViewData['checklist_entities_referral_id'] = $checklist_entities_referral_id =  $_REQUEST['checklist_entities_referral_id'];
$fwViewData['er_document'] =  $_REQUEST['er_document'];
$fwViewData['er_id'] =  $_REQUEST['er_id'];

$result = [];
if ($requset) {

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
        // echo "<pre>"; print_r($entities_referral_result); echo "</pre>";
        $dpnRec = $fwDb->queryOne("SELECT * FROM `document_proposal_name` WHERE dpn_bsn_id = $bus_id");
        foreach ($entities_referral_result as $key => $value) {
            $foundRec = true;
            $sql2 = "SELECT * FROM `checklist_entities_referral` where checklist_entities_referral.bsn_id= '" . $bus_id . "' and entites_referral_id = '" . $value['er_id'] . "'";
            $result2 = $fwDb->query($sql2);
            if (!empty($result2)) {
                $result2[0]['date_applied'] = $newDate = (strtotime($result2[0]['date_applied']) > 0 ? date("d-m-Y", strtotime($result2[0]['date_applied'])) : '');
                $entities_referral_result[$key]['checklist_entities_referral'] = $result2[0];
                $foundRec = true;
            } else {
                $entities_referral_result[$key]['checklist_entities_referral'] = $result2;
                $foundRec = false;
            }

            $entities_referral_result[$key]['er_id'] = $value['er_id'];
            $entities_referral_result[$key]['er_document'] = $value['er_document'];

            $sql3 = "SELECT * FROM `document_check_list` where doc_bsn_id= '" . $bus_id . "' and doc_name_id = '" . $value['er_dc_uid'] . "'";
            $result3 = $fwDb->query($sql3);
            if (!empty($result3)) {
                $result3[0]['doc_date_uploaded_full'] = $result3[0]['doc_date_uploaded'];
                $result3[0]['doc_date_uploaded'] = date("d-m-Y", strtotime($result3[0]['doc_date_uploaded']));
                $entities_referral_result[$key]['document_check_list'] = $result3[0];
            } else {
                $entities_referral_result[$key]['document_check_list'] = $result3;
            }
            
            $sql4 = "SELECT count(dpn_bsn_id) as count FROM `document_proposal_name` where dpn_bsn_id = '".$bus_id."' ";
            $result4 = $fwDb->query($sql4);
            //echo "<pre>"; print_r($result4); print_r($result4[0][count]); exit('checking');
            if($result4[0][count] > 0 ) {
                $sql5 = "SELECT `dpn_unique_id`,`dpn_heritage_ref`,`dpn_water_ref`,`dpn_electric_ref`,`dpn_gas_ref`,`dpn_storm_ref` FROM `document_proposal_name` where dpn_bsn_id = '".$bus_id."' ";
                $result5 = $fwDb->query($sql5);
                //echo "<pre>"; print_r($result5); exit('checking');
                $entities_referral_result[$key]['document_status'] = $result5 ;
            } else {
                $entities_referral_result[$key]['document_status'] = '' ;
            }
                
            // if(!$foundRec){

            //     $status = '';
            //     $er_dc_uid = $value['er_dc_uid'];
            //     if($er_dc_uid == '628'){
            //         $status = $dpnRec['dpn_electric_ref'];
            //     }elseif($er_dc_uid == '627'){
            //         $status = $dpnRec['dpn_water_ref'];
            //     }elseif($er_dc_uid == '630'){
            //         $status = $dpnRec['dpn_storm_ref'];
            //     }elseif($er_dc_uid == '382'){
            //         $status = $dpnRec['dpn_tree_ref'];
            //     }elseif($er_dc_uid == '629'){
            //         $status = $dpnRec['dpn_gas_ref'];
            //     }elseif($er_dc_uid == '716'){
            //         $status = $dpnRec['dpn_heritage_ref'];
            //     }
                
            //     $tableTask = new Fw_Db_Table('checklist_entities_referral');
            //     $newRec = [
            //         'bsn_id' => $bus_id,
            //         'user_id' => $_SESSION['user']['user_id'],
            //         'entites_referral_id' => $value['er_id'],
            //         'date_applied' => strtotime($result3[0]['doc_date_uploaded_full']) > 0 ? $result3[0]['doc_date_uploaded_full'] : null,
            //         'assessment_doc' => $result3[0]['doc_file_name'] ?? '',
            //         'status' => $status,
            //         'assessment_upload_doc_date' => strtotime($result3[0]['doc_date_uploaded_full']) > 0 ? $result3[0]['doc_date_uploaded_full'] : null,
            //     ];
            //     $tableTask->insertRow($newRec);

            //     $entities_referral_result[$key]['checklist_entities_referral']['status'] = $status;
            // }
            // $upsertSql = $foundRec ? 'UPDATE checklist_entities_referral SET ' : 'INSERT INTO checklist_entities_referral(bsn_id, user_id, entites_referral_id, date_applied, assessment_doc, status, condition_snapshot, condition_snapshot_upload_date, assessment_upload_doc_date) VALUES("' . $bus_id . '", "' . $value['er_id'] . '", "' . $value['er_id'] . '", "' . date($result3[0]['doc_date_uploaded'] ?? '') . '", "' . ($result3[0]['doc_file_name'] ?? '') . '", "' . ($result3[0]['doc_date_uploaded'] ?? '') . '")';

        }
        $project_checklist_list[0]['checklist_entities_referral'] = $entities_referral_result;
    }
}
///echo "<pre>"; print_r($project_checklist_list); echo "</pre>";
$fwViewData['project_checklist_list'] = $project_checklist_list;
