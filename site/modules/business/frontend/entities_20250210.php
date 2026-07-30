<?php
$fwMainView = 'file:' . getcwd() . '/entities.tpl';
$fwViewData['calcjs'] ='file:' . getcwd() . '/calcjs.tpl';

$requset = $fwRequest->getparamget('a_req', '');
$editrequset = $fwRequest->getparamget('e_req', '');

$iPad    = stripos($_SERVER['HTTP_USER_AGENT'],"iPad");
$fwViewData['ipad'] = $iPad;

$fwViewData['ran'] =  rand(100000,999999);

$fwViewData['business_id'] =$bus_id = $_REQUEST['bus_id'];
$fwViewData['checklist_id']  = $_REQUEST['checklist_id'];
$fwViewData['action_name'] =  $_REQUEST['action_name'];
$fwViewData['checklist_entities_referral_id'] = $checklist_entities_referral_id =  $_REQUEST['checklist_entities_referral_id'];
$fwViewData['er_document'] =  $_REQUEST['er_document'];
$fwViewData['er_id'] =  $_REQUEST['er_id'];

$result = [];
if($requset)
{
    
       if(!empty($checklist_entities_referral_id))
       {
            $ckhlist_sqlus23 = "SELECT * FROM `checklist_entities_referral` where id = '".$checklist_entities_referral_id."'";
        	$ckhlist_sqlus_r23 = $fwDb->query($ckhlist_sqlus23);
        	$fwViewData['checklist_entities_referral'] = $ckhlist_sqlus_r23[0];
        	
       }
       else
       {
           	$fwViewData['checklist_entities_referral'] = [];
       }
    
        $sql491 = "SELECT * FROM `entities_referral`" ;
        $entities_referral_result = $fwDb->query($sql491);
		


		if( !empty($entities_referral_result) )
		{
		   // echo "<pre>"; print_r($entities_referral_result); echo "</pre>";
		    foreach ($entities_referral_result as $key => $value) {
		        
		       $sql2 = "SELECT * FROM `checklist_entities_referral` where checklist_entities_referral.bsn_id= '".$bus_id."' and entites_referral_id = '".$value['er_id']."'" ;
		         $result2 = $fwDb->query($sql2);
                if(!empty($result2))
                {
                    $result2[0]['date_applied'] = $newDate = date("d-m-Y", strtotime($result2[0]['date_applied']));
                     $entities_referral_result[$key]['checklist_entities_referral'] = $result2[0] ;
                }
                else
                {
                     $entities_referral_result[$key]['checklist_entities_referral'] = $result2 ;
                }
               
                $entities_referral_result[$key]['er_id'] = $value['er_id'];
                $entities_referral_result[$key]['er_document'] = $value['er_document'];

                $sql3 = "SELECT * FROM `document_check_list` where doc_bsn_id= '".$bus_id."' and doc_name_id = '".$value['er_dc_uid']."'" ;
		        $result3 = $fwDb->query($sql3);
                if(!empty($result3)) {
                    $result3[0]['doc_date_uploaded'] = date("d-m-Y", strtotime($result3[0]['doc_date_uploaded']));
                    $entities_referral_result[$key]['document_check_list'] = $result3[0] ;
                } else {
                    $entities_referral_result[$key]['document_check_list'] = $result3 ;
                }
               
            }
            $project_checklist_list[0]['checklist_entities_referral'] = $entities_referral_result;
		}

} 
///echo "<pre>"; print_r($project_checklist_list); echo "</pre>";
$fwViewData['project_checklist_list'] = $project_checklist_list;