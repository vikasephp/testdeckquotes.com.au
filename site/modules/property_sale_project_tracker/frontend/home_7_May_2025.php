<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('debt_recovery_report');
$tableSD = new Fw_Db_Table('property_sale_stage_detail');

$where = " WHERE 1 = 1";

$hidden = $fwRequest->getParam('hidden', '');
	if(!empty($hidden)) {
	$where = " WHERE 1 = 1";	
}

 	$clear = $fwRequest->getParam('clear', '');
		if(!empty($clear)) {
			    unset($_SESSION['address']);
				$where = " where 1 = 1";	
		}


// Save Link name and link
$stage = $fwRequest->getParam('stage', '');
if(!empty($stage)) {
	
	
	$ps_id = $fwRequest->getParam('ps_id', '');
	
	$sdDetail['sd_ps_id'] = $ps_id;
	$sdDetail['sd_stage_id'] = $stage;

	$detail_l = $tableSD->insertRow($sdDetail);
}

$project_view = $fwRequest->getParam('project_view', '');
if($project_view) {
	unset($_SESSION['show']);
	//unset($_SESSION['where']);
	unset($_SESSION['report']);
	
	$fwViewData['show'] =  1;
	$fwViewData['report'] =  "Project View";
	//$where =  " where cs_stage = 2";
	
	$_SESSION['show'] = 1;
	//$_SESSION['where'] = " where cs_stage = 2" ;
	$_SESSION['report'] =  "Project View";
	
}

$task_table = $fwRequest->getParam('task_table', '');
if($task_table) {
	unset($_SESSION['show']);
	//unset($_SESSION['where']);
	unset($_SESSION['report']);
	
	$fwViewData['show'] =  2;
	$fwViewData['report'] =  "Task Table";
	//$where =  " where cs_stage = 2";
	
	$_SESSION['show'] = 2;
	//$_SESSION['where'] = " where cs_stage = 2" ;
	$_SESSION['report'] =  "Task Table";
	
	
}

$address = $fwRequest->getParam('address', '');
if($address):

	$where .= " AND quote_management_report.qm_project LIKE '%".$address."%'";
		
	$_SESSION['address'] = $address;
	$fwViewData['address']=$_SESSION['address'];

elseif($_SESSION['address'] ):

	$where .= " AND quote_management_report.qm_project LIKE '%".$_SESSION['address']."%' ";	
	
	$fwViewData['address']=$_SESSION['address'];
endif;
  
 
$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE .' '.$where ;	

if($matsql){$userData = $fwDb->query($matsql);}

$fwViewData['total'] = sizeof($userData);

if(!empty($userData))
{
if (!(isset($pagenum))){ $pagenum = 1; } 
    $rows = count($userData);
    $page_rows = 200;
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
    $sql_1 = "select property_sale_stage_detail.*, property_sale_project_stage.* from property_sale_stage_detail 
			  Inner Join property_sale_project_stage ON property_sale_stage_detail.sd_stage_id = property_sale_project_stage.st_id
			  where sd_ps_id = ".$v['ps_id'];	
    $data = $fwDb->query($sql_1);
	
   
    //$link = BASE_URL."business.detail/bsn_id/".$data['bsn_id'];
   
    // $sql_2 = "select pt_name from project_type where pt_id = ".$data['bsn_type'];
    //$typedata = $fwDb->queryOne($sql_2);
		
	$listsnew[$k]['stage'] = $data;
    $listsnew[$k]['project_type'] = $typedata['pt_name'];

}

$fwViewData['list'] = $listsnew;

$fwViewData['list'] = $listsnew;
$fwViewData['title'] = $MODULE_PLURAL;

$sqlpr = "Select * from property_sale_project_stage";
$fwViewData['stagedetail'] = $fwDb->query($sqlpr); 
