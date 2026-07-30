<?php
//$fwMainView = 'file:' . getcwd() . '/update_task.tpl';
$table = new Fw_Db_Table('property_sale_task_detail');
 
$ps_id = $fwRequest->getParam('ps_id', 0);
$st_id = $fwRequest->getParam('st_id', 0);

$fwViewData['st_id'] = $st_id;
$fwViewData['ps_id'] = $ps_id;

$sqlbs = "select ps_project from  property_sale_project_tracker where ps_id = ".$ps_id;
$bsdata = $fwDb->queryOne($sqlbs);

$fwViewData['ps_project']= $bsdata['ps_project'];

$sqlstage = "select st_option from  property_sale_project_stage where st_id = ".$st_id;
$stagedata = $fwDb->queryOne($sqlstage);

$fwViewData['st_option']= $stagedata['st_option'];

$sql_1 = "select * from property_sale_task_master where tm_stage_id = ".$st_id;
$data_1 = $fwDb->query($sql_1);


foreach($data_1 as $k=>$v)
{
	$detail['td_ps_id'] = $ps_id;
	$detail['td_tm_id'] = $v['tm_id'];
	$detail['td_st_id'] = $st_id;
	
	$table->setWhere("td_ps_id = $ps_id and td_tm_id = ".$v['tm_id']);
	if (!$table->rowExists()) {
			$table->insertRow($detail);
		}
	//db($detail);
}

$sql_2 = "select property_sale_task_detail.* , property_sale_task_master.* from property_sale_task_detail 
         Inner Join property_sale_task_master ON  property_sale_task_detail.td_tm_id = property_sale_task_master.tm_id
		 where property_sale_task_detail.td_ps_id = ".$ps_id . " and 
		 property_sale_task_detail.td_st_id = ".$st_id . " and  property_sale_task_master.tm_stage_id = ".$st_id . 
		 " order by property_sale_task_master.tm_step_number ";
$data_2 = $fwDb->query($sql_2);

//db($data_2);

$fwViewData['taskdata']= $data_2;


if($add_notes)
{
	$sp_id = $fwRequest->getParam('sp_id', '');
	$notesData = $fwRequest->getParam('sp_notes', '');
	

	
	$table->setWhere('sp_id = '.$sp_id);
	if($table->rowExists())
	{
		$notes['sp_notes'] = $notesData;
		$detail = $table->updateRow($notes);
	}	
	$fwViewData['opr'] = "Close";	
}
 
 
     $sqlnotes = "Select sp_notes  from  sub_pages where sp_id = ".$sp_id;
     $notesData = $fwDb->queryOne($sqlnotes);
	 $fwViewData['sp_notes'] = $notesData['sp_notes'];
	 
		