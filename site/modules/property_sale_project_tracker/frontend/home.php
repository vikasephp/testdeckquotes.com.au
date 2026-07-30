<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('property_sale_project_tracker');
$tableSD = new Fw_Db_Table('property_sale_stage_detail');

$where = " WHERE ps_hide = 0";
$fwViewData['show'] =  1;
$fwViewData['report'] =  "Project View";

$wherestage = " and property_sale_stage_detail.sd_hide = 0 ";


$hidestage = $fwRequest->getParam('hidestage', '');
if($hidestage)
{
	 $keys_1 = array_keys($hidestage);
	 $ky_1 = $keys_1[0];
	 $val_1 = $hidestage[$ky_1];
	
	  $detailSD['sd_hide'] = $val_1;
	  $tableSD->setWhere("sd_id = ".$ky_1);
	  if($tableSD->rowExists())
	  {
		 $this_id = $tableSD->updateRow($detailSD);
	  }	  	
}

$hide = $fwRequest->getParam('hide', '');
if($hide)
{
	 $keys_2 = array_keys($hide);
	 $ky_2 = $keys_2[0];
	 $val_2 = $hide[$ky_2];
	
	  $detail['ps_hide'] = $val_2;
	  $table->setWhere("ps_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}


$hidden = $fwRequest->getParam('hidden', '');
	if(!empty($hidden)) {
	$where = " WHERE 1 = 1";	
}

$hidden_stage = $fwRequest->getParam('hidden_stage', '');
	if(!empty($hidden_stage)) {
		$wherestage = " ";
			
}


$wherest = '';
$stagefilter = $fwRequest->getParam('stagefilter', '');
if(!empty($stagefilter)) {
	$stage_id = $stagefilter;
	$wherest = " AND sd_stage_id = ".$stage_id;
}

 	$clear = $fwRequest->getParam('clear', '');
		if(!empty($clear)) {
			    //unset($_SESSION['address']);
				$wherest = " ";	
		}

// Save Link name and link
$stage = $fwRequest->getParam('stage', '');
if(!empty($stage)) {
		
	$ps_id = $fwRequest->getParam('ps_id', '');
	
	$sdDetail['sd_ps_id'] = $ps_id;
	$sdDetail['sd_stage_id'] = $stage;
	
	$tableSD->setWhere("sd_ps_id = ".$ps_id . " AND sd_stage_id = ".$stage);

	if(!$tableSD->rowExists()) {
		$detail_l = $tableSD->insertRow($sdDetail);
	}
}
//unset($_SESSION['show']);
$project_view = $fwRequest->getParam('project_view', '');
if($project_view || isset($_SESSION['project_view']) ) {
	//db('Project');
	unset($_SESSION['show']);
	unset($_SESSION['report']);
	$fwViewData['show'] =  1;
	$fwViewData['report'] =  "Project View";
	
	$_SESSION['show'] = 1;
	$_SESSION['report'] =  "Project View";	
	$_SESSION['project_view'] = true;
	unset($_SESSION['task_table']);
}

$task_table = $fwRequest->getParam('task_table', '');
if($task_table || isset($_SESSION['task_table'])) {
	//db('Task');
	unset($_SESSION['show']);
	unset($_SESSION['report']);
	
	$fwViewData['show'] =  2;
	$fwViewData['report'] =  "Task Table";
	
	$_SESSION['show'] = 2;
	$_SESSION['report'] =  "Task Table";
	
	$sql = "select * from property_sale_project_stage";
	$fwViewData['stageData'] =  $fwDb->query($sql);
	
	$_SESSION['task_table'] = true;
	unset($_SESSION['project_view']);	
}


//$address = $fwRequest->getParam('address', '');
//if($address):
//
//	$where .= " AND quote_management_report.qm_project LIKE '%".$address."%'";
//		
//	$_SESSION['address'] = $address;
//	$fwViewData['address']=$_SESSION['address'];
//
//elseif($_SESSION['address'] ):
//
//	$where .= " AND quote_management_report.qm_project LIKE '%".$_SESSION['address']."%' ";	
//	
//	$fwViewData['address']=$_SESSION['address'];
//endif;
  
 
$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE .' '.$where ;	

if($matsql){$userData = $fwDb->query($matsql);}

$fwViewData['total'] = sizeof($userData);

if(!empty($userData))
{
if (!(isset($pagenum))){ $pagenum = 1; } 
    $rows = count($userData);
    $page_rows = 100;
    $last = ceil($rows/$page_rows);    
    if ($pagenum <= 1)
    {
        $pagenum = 1;
    }
    elseif ($pagenum > $last)
    {
        $pagenum = $last;
    }
    $fwViewData['last'] = $last;
    $fwViewData['lastone'] = $last-1;
	$fwViewData['lasttow'] = $last-2;
    $fwViewData['pagenum'] = $pagenum;
	$pagenatedatanext = $pagenum;
	$pagenatedataprev = $pagenum;
	for($i=0; $i<9; $i++)
		{
		$paginate[$pagenatedatanext] = $pagenatedatanext;
		$pagenatedatanext ++;
		}
		$fwViewData['paginatenext'] = $paginate;
	$pagenatedataprev = $pagenum;	
	for($i=0; $i<9; $i++)
		{
		$paginateprev[$pagenatedataprev] = $pagenatedataprev;
		$pagenatedataprev --;
		}
	$fwViewData['paginateprev'] = array_reverse($paginateprev);
	
    $max = 'limit ' .($pagenum - 1) * $page_rows .',' .$page_rows;
    
    $sql2 =  $matsql." ".$max;
    if($sql2){$lists= $fwDb->query($sql2);

	foreach($lists as $list):

		$listsnew[] = $list;
	endforeach;
	
	$fwViewData['list'] = $listsnew;
  }
}


foreach($listsnew as $k=>$v)
{
    
     $sql_2 = "select bsn_id from business where bsn_name like  '%".$v['ps_project']."%'";
     $busdata = $fwDb->queryOne($sql_2);

	 $link = BASE_URL."business.detail/bsn_id/".$busdata['bsn_id'];
	
	 $sql_1 = "select property_sale_stage_detail.*, property_sale_project_stage.* from property_sale_stage_detail 
			  Inner Join property_sale_project_stage ON property_sale_stage_detail.sd_stage_id = property_sale_project_stage.st_id
			  where sd_ps_id = ".$v['ps_id'] . $wherest . $wherestage. " Order by property_sale_project_stage.st_id";	
			  
    $data = $fwDb->query($sql_1);
	
   
	
	foreach($data as $k1=>$v1)
	{
		$percomp = 0;
		$sql_2 = "select count(*) as tot_task from property_sale_task_detail where td_ps_id = ".$v['ps_id']. ' and td_st_id = '.$v1['st_id'];
		$cdata = $fwDb->queryOne($sql_2);
		
		$sql_3 = "select count(*) as tot_cn from property_sale_task_detail 
		          where td_ps_id = ".$v['ps_id']. ' and td_st_id = '.$v1['st_id'] . " AND ( td_status='Complete' OR td_status = 'Not Required') ";
		$comnotdata = $fwDb->queryOne($sql_3);
		
		if($comnotdata['tot_cn']>0) {
		
		$percomp = $comnotdata['tot_cn'] / $cdata['tot_task'] * 100;
		}
		$data[$k1]['percomp'] = round($percomp);
		
	}
  
	$listsnew[$k]['link'] = $link;	
	$listsnew[$k]['stage'] = $data;
    $listsnew[$k]['project_type'] = $typedata['pt_name'];

}

$fwViewData['list'] = $listsnew;

$fwViewData['list'] = $listsnew;
$fwViewData['title'] = $MODULE_PLURAL;

$sqlpr = "Select * from property_sale_project_stage";
$fwViewData['stagedetail'] = $fwDb->query($sqlpr); 
