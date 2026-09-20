<?php
$fwMainView = 'file:' . getcwd() . '/subtask.tpl';
$bus_id = $fwRequest->getparam('bus_id', 0);
$tsid = $fwRequest->getParam('tsid', 0);
$tid = $fwRequest->getParam('tid', 0);

$fwViewData['tid'] = $tid;

//$sql = "SELECT * FROM business_tasks_sub where bts_bsn_id = ".$bus_id. " And bts_task_status_id = " .$tsid . " And bts_task_id = ".$tid;
//	   $fwViewData['subtaskdata'] = $fwDb->query($sql);
	   
$sql = "SELECT * FROM business_tasks_sub where bts_bsn_id = ".$bus_id. " And bts_task_id = ".$tid;
	   $fwViewData['subtaskdata'] = $fwDb->query($sql);
	   
if(!empty($fwViewData['subtaskdata'])) {
	
		}
else {
				  
		 $fwViewData['msg'] = "No Subtasks Exist";
	  }

 $sqlLp = "select busness_status_subtask_lp.* from busness_status_subtask_lp where bstlp_bst_id = ".$tid; 
 $fwViewData['subtaskdata_lp'] = $fwDb->query($sqlLp);
 
 $sqlMs = "select busness_status_subtask_msteam.*, template_hub_docs.dhd_link_pdf, template_hub_docs.dhd_link_word
  	   from busness_status_subtask_msteam 
           Inner Join template_hub_docs ON busness_status_subtask_msteam.bstlp_doc_name  = template_hub_docs.dhd_dh_id
	   where busness_status_subtask_msteam.bstlp_bst_id = ".$tid; 

 $fwViewData['subtaskdata_msteam'] = $fwDb->query($sqlMs);


$submit = $fwRequest->getParam('st_save', '');

if(!empty($submit))
{
	$data1 = $fwRequest->getParam('task', array());
	//$data2 = $fwRequest->getParam('bts_not_required', array());

	$bustasksub = new Fw_Db_Table('business_tasks_sub');
	
	foreach($data1 as $dt)
	{
		$bts_id = $dt['bts_id'];
		if(!empty($dt['bts_task_completed'])) { $value1 =  1; } else { $value1 =  0; }
		if(!empty($dt['bts_not_required'])) { $value2 =  1; } else { $value2 =  0; }
		
		$bustasksub->setWhere("bts_id = ".$bts_id);
		$detail['bts_complete'] = $value1;
		$detail['bts_not_required'] = $value2;
		$bustasksub->updateRow($detail);
	}
		
	header('Location: '.$_SERVER['REQUEST_URI']);
	//db($data2);
}
 