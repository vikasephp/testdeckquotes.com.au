<?php
$fwMainView = 'file:' . getcwd() . '/subtask.tpl';
$bus_id = $fwRequest->getparam('bus_id', 0);
$tsid = $fwRequest->getParam('tsid', 0);
$tid = $fwRequest->getParam('tid', 0);

$fwViewData['tid'] = $tid;

//$sql = "SELECT * FROM business_tasks_sub where bts_bsn_id = ".$bus_id. " And bts_task_status_id = " .$tsid . " And bts_task_id = ".$tid;
//	   $fwViewData['subtaskdata'] = $fwDb->query($sql);
	   
//$sql = "SELECT * FROM business_tasks_sub where bts_bsn_id = ".$bus_id. " And bts_task_id = ".$tid;
//	   $fwViewData['subtaskdata'] = $fwDb->query($sql);

// business_tasks_sub can hold several copies of the same subtask (same bts_bsst_id) for a project.
// Show one row per subtask; treat it as complete / not required if any copy is.
$sql = "SELECT t.*, g.grp_complete, g.grp_not_required
		FROM business_tasks_sub AS t
		INNER JOIN (
			SELECT MIN(bts_id) AS keep_id, MAX(bts_complete) AS grp_complete, MAX(bts_not_required) AS grp_not_required
			FROM business_tasks_sub
			WHERE bts_bsn_id = " . (int)$bus_id . " AND bts_task_id = " . (int)$tid . "
			GROUP BY IF(bts_bsst_id > 0, CONCAT('s', bts_bsst_id), CONCAT('r', bts_id))
		) AS g ON g.keep_id = t.bts_id
		ORDER BY t.bts_id";
$subtaskdata = $fwDb->query($sql);
if (!empty($subtaskdata)) {
	foreach ($subtaskdata as $sk => $sv) {
		$subtaskdata[$sk]['bts_complete'] = $sv['grp_complete'];
		$subtaskdata[$sk]['bts_not_required'] = $sv['grp_not_required'];
	}
}
$fwViewData['subtaskdata'] = $subtaskdata;
	   
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
		$bts_id = (int)$dt['bts_id'];
		if(!empty($dt['bts_task_completed'])) { $value1 =  1; } else { $value1 =  0; }
		if(!empty($dt['bts_not_required'])) { $value2 =  1; } else { $value2 =  0; }

		$row = $fwDb->queryOne("SELECT bts_bsn_id, bts_bsst_id FROM business_tasks_sub WHERE bts_id = " . $bts_id);
		if (empty($row) || (int)$row['bts_bsn_id'] !== (int)$bus_id) {
			continue;
		}

		// Apply the tick to every copy of this subtask so the copies stay in sync.
		if ((int)$row['bts_bsst_id'] > 0) {
			$bustasksub->setWhere("bts_bsn_id = " . (int)$row['bts_bsn_id'] . " AND bts_bsst_id = " . (int)$row['bts_bsst_id']);
		} else {
			$bustasksub->setWhere("bts_id = " . $bts_id);
		}
		$detail['bts_complete'] = $value1;
		$detail['bts_not_required'] = $value2;
		$bustasksub->updateRow($detail);
	}
		
	header('Location: '.$_SERVER['REQUEST_URI']);
	//db($data2);
}
 