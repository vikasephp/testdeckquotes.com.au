<?php

$postedData = $_POST ; 
$response = ['status'=>'false','errorList'=>['Action is not defined.'],'success'=>'','data'=>[] ];
 //echo "<pre>"; print_r($_FILES);  echo "</pre>";
if( !empty($postedData['action']) && $postedData['action'] == "checklist_entities_referralForm" )
{
     	$tableTask = new Fw_Db_Table('checklist_entities_referral'); $current_timestamp = date('Y-m-d H:i:s');
     	
        $bsn_id = $detail['bsn_id'] = $postedData['bsn_id'];
        $entities_referral_id =    $postedData['entities_referral_id'];
       // $checklist_id = $detail['checklist_uid'] =   $postedData['checklist_id'];
       $checklist_id = $detail['checklist_uid'] = 0;
        
        $status = $detail['status'] =  $postedData['status'];
        $er_id = $detail['entites_referral_id'] =  $postedData['er_id'];
        
        if(!empty($postedData['date_applied'])){
          $date_applied = $detail['date_applied'] =  $postedData['date_applied']; 
        }
        
        $sql2 = "SELECT checklist_entities_referral.id FROM `checklist_entities_referral` where bsn_id = '".$bsn_id."' and entites_referral_id ='".$er_id."'" ;
        $record_detail = $fwDb->query($sql2);
     	
    if( !empty($record_detail) ) 
    	{
       		 $tableTask->setWhere("bsn_id = '".$bsn_id."' and entites_referral_id ='".$er_id."'");  $l_result = $tableTask->updateRow($detail);  
       		  $response = ['status'=>'true','code'=>"2500",'errorList'=>[],'success'=>'','data'=>[] ];
    	}
	else
	{
		 $l_result = $tableTask->insertRow($detail); 
		 $response = ['status'=>'true','code'=>"2501",'errorList'=>[],'success'=>'','data'=>[] ];
	}
	
	if($_FILES['assessment_doc']['error'] == 0)
	{
	 //	$docfile = time()."__".rand()."__".$_FILES['assessment_doc']['name'];
	    $docfile = $_FILES['assessment_doc']['name'];
	    $docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
		$tmpname = $_FILES['assessment_doc']['tmp_name'];
	    upload_entites_data($docfile, $tmpname);
	    $assessment_doc_detail['assessment_doc'] = $docfile;$assessment_doc_detail['assessment_upload_doc_date'] = $current_timestamp;
	    $tableTask->setWhere("checklist_uid = '".$checklist_id."' and entites_referral_id ='".$er_id."'");  $l_result = $tableTask->updateRow($assessment_doc_detail);  
	}
	
	  if($_FILES['condition_snapshot']['error'] == 0)
	{
		//$docfile = time()."__".rand()."__".$_FILES['condition_snapshot']['name'];
		$docfile = $_FILES['assessment_doc']['name'];
	    $docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
		$tmpname = $_FILES['condition_snapshot']['tmp_name'];
		$destination = BASE_DIR.FILE_PATH. 'files/purchase_order_quote/'.$docfile;
		
       upload_entites_data($docfile, $tmpname);
       $condition_snapshot_detail['condition_snapshot'] = $docfile;$condition_snapshot_detail['condition_snapshot_upload_date'] = $current_timestamp;
       $tableTask->setWhere("checklist_uid = '".$checklist_id."' and entites_referral_id ='".$er_id."'");  $l_result = $tableTask->updateRow($condition_snapshot_detail);  
	}

}
header('Content-type: application/json');
echo json_encode($response); exit;

?>