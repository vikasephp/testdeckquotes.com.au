<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('construction_scheduler_report');
 
$fwViewData['show'] =  1;
$where =  " where cs_stage = 1";
$fwViewData['report'] =  "Construction Handover";

$conhand = $fwRequest->getParam('conhand', '');
if(!empty($conhand))
{
	$where =  " where cs_stage <= 5";
	$_SESSION['where'] = $where;	
}

$calshow = $fwRequest->getParam('calshow', '');
if(!empty($calshow))
{
	$where =  " where cs_stage >= 2 and cs_stage <=5";
	$_SESSION['where'] = $where;	
}

$floorshow = $fwRequest->getParam('floorshow', '');
if(!empty($floorshow))
{
	$where =  " where cs_stage >= 3 and cs_stage <=5";
	$_SESSION['where'] = $where;	
}
$closeupshow = $fwRequest->getParam('closeupshow', '');
if(!empty($closeupshow))
{
	$where =  " where cs_stage >= 4 and cs_stage <=5";
	$_SESSION['where'] = $where;	
}
$show_hidden = $fwRequest->getParam('show_hidden', '');
if(!empty($show_hidden))
{
	$where =  " where cs_stage = 0";
	$_SESSION['where'] = $where;	
}

if(isset($_SESSION['show']))  { $fwViewData['show'] = $_SESSION['show'] ; }
if(isset($_SESSION['where'])) { $fwViewData['where'] = $_SESSION['where'] ; }
if(isset($_SESSION['report'])) { $fwViewData['report'] = $_SESSION['report'] ; }

$const_hand = $fwRequest->getParam('const_hand', '');
if($const_hand) {
	unset($_SESSION['show']);
	unset($_SESSION['where']);
	unset($_SESSION['report']);
	
	$fwViewData['show'] =  1;
	$fwViewData['report'] =  "Construction Handover";
	$where =  " where cs_stage = 1";
	
	$_SESSION['show'] = 1;
	$_SESSION['where'] = " where cs_stage = 1" ;
	$_SESSION['report'] =  "Construction Handover";
	
}

$calendar = $fwRequest->getParam('calendar', '');
if($calendar) {
	unset($_SESSION['show']);
	unset($_SESSION['where']);
	unset($_SESSION['report']);
	
	$fwViewData['show'] =  2;
	$fwViewData['report'] =  "Calendar";
	$where =  " where cs_stage = 2";
	
	$_SESSION['show'] = 2;
	$_SESSION['where'] = " where cs_stage = 2" ;
	$_SESSION['report'] =  "Calendar";
	
}

$floor_system = $fwRequest->getParam('floor_system', '');
if($floor_system) {
	
	unset($_SESSION['show']);
	unset($_SESSION['where']);
	unset($_SESSION['report']);
	
	$fwViewData['show'] =  3;
	$fwViewData['report'] =  "Floor System";
	$where =  " where cs_stage = 3";
	
	$_SESSION['show'] = 3;
	$_SESSION['where'] = " where cs_stage = 3" ;
	$_SESSION['report'] =  "Floor System";
}

$close_up = $fwRequest->getParam('close_up', '');
if($close_up) {
	unset($_SESSION['show']);
	unset($_SESSION['where']);
	unset($_SESSION['report']);
	
	$fwViewData['show'] =  4;
	$fwViewData['report'] =  "Close Up";
	$where =  " where cs_stage = 4";
	
	$_SESSION['show'] = 4;
	$_SESSION['where'] = " where cs_stage = 4" ;
	$_SESSION['report'] =  "Close Up";
	
}

$walkthrough = $fwRequest->getParam('walkthrough', '');
if($walkthrough) {
	unset($_SESSION['show']);
	unset($_SESSION['where']);
	unset($_SESSION['report']);
	
	$fwViewData['show'] =  5;
	$fwViewData['report'] =  "Walkthrough";
	$where =  " where cs_stage = 5";
	
	$_SESSION['show'] = 5;
	$_SESSION['where'] = " where cs_stage = 5" ;
	$_SESSION['report'] =  "Walkthrough";
	
}


$move_cal = $fwRequest->getParam('move_cal', '');
if($move_cal)
{
	 $keys = array_keys($move_cal);
	 $ky = $keys[0];
	 $val = $move_cal[$ky];
	
	  $detail['cs_stage'] = $val;
	  $table->setWhere("cs_id = ".$ky);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }
	  $fwViewData['show'] =  1;	  	
}

$move_floor = $fwRequest->getParam('move_floor', '');
if($move_floor)
{
	 $keys = array_keys($move_floor);
	 $ky = $keys[0];
	 $val = $move_floor[$ky];
	
	  $detail['cs_stage'] = $val;
	  $table->setWhere("cs_id = ".$ky);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }
	  $fwViewData['show'] =  2;	  	
}

$termite_pro = $fwRequest->getParam('termite_pro', '');
if($termite_pro)
{
	 $keys = array_keys($termite_pro);
	 $ky = $keys[0];
	 $val = $termite_pro[$ky];
	
	  $detail['cs_termite_pro'] = $val;
	  $table->setWhere("cs_id = ".$ky);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }
	  $fwViewData['show'] =  3;	  	
}

$termite_pro_peri = $fwRequest->getParam('termite_pro_peri', '');
if($termite_pro_peri)
{
	 $keys = array_keys($termite_pro_peri);
	 $ky = $keys[0];
	 $val = $termite_pro_peri[$ky];
	
	  $detail['cs_termite_pro_para'] = $val;
	  $table->setWhere("cs_id = ".$ky);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }
	  $fwViewData['show'] =  3;	  	
}

$footing_insp = $fwRequest->getParam('footing_insp', '');
if($footing_insp)
{
	 $keys = array_keys($footing_insp);
	 $ky = $keys[0];
	 $val = $footing_insp[$ky];
	
	  $detail['cs_footing_inspection'] = $val;
	  $table->setWhere("cs_id = ".$ky);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }
	  $fwViewData['show'] =  3;	  	
}


$fs_pier_insp = $fwRequest->getParam('fs_pier_insp', '');
if($fs_pier_insp)
{
	 $keys = array_keys($fs_pier_insp);
	 $ky = $keys[0];
	 $val = $fs_pier_insp[$ky];
	
	  $detail['cs_fs_pierinsp'] = $val;
	  $table->setWhere("cs_id = ".$ky);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }
	  $fwViewData['show'] =  3;	  	
}

$fs_drain_repo = $fwRequest->getParam('fs_drain_repo', '');
if($fs_drain_repo)
{
	 $keys = array_keys($fs_drain_repo);
	 $ky = $keys[0];
	 $val = $fs_drain_repo[$ky];
	
	  $detail['cs_fs_drain_report'] = $val;
	  $table->setWhere("cs_id = ".$ky);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }
	  $fwViewData['show'] =  3;	  	
}


$ff_ground = $fwRequest->getParam('ff_ground', '');
if($ff_ground)
{
	 $keys = array_keys($ff_ground);
	 $ky = $keys[0];
	 $val = $ff_ground[$ky];
	
	  $detail['cs_fs_ff_ground'] = $val;
	  $table->setWhere("cs_id = ".$ky);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }
	  $fwViewData['show'] =  3;	  	
}

$ff_first = $fwRequest->getParam('ff_first', '');
if($ff_first)
{
	 $keys = array_keys($ff_first);
	 $ky = $keys[0];
	 $val = $ff_first[$ky];
	
	  $detail['cs_fs_ff_first'] = $val;
	  $table->setWhere("cs_id = ".$ky);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }
	  $fwViewData['show'] =  3;	  	
}

$fs_inspection = $fwRequest->getParam('fs_inspection', '');
if($fs_inspection)
{
	 $keys = array_keys($fs_inspection);
	 $ky = $keys[0];
	 $val = $fs_inspection[$ky];
	
	  $detail['cs_fs_ff_insp'] = $val;
	  $table->setWhere("cs_id = ".$ky);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }
	  $fwViewData['show'] =  3;	  	
}


$slab_insp = $fwRequest->getParam('slab_insp', '');
if($slab_insp)
{
	 $keys = array_keys($slab_insp);
	 $ky = $keys[0];
	 $val = $slab_insp[$ky];
	
	  $detail['cs_slab_insp'] = $val;
	  $table->setWhere("cs_id = ".$ky);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }
	  $fwViewData['show'] =  3;	  	
}


$floor_system_qual = $fwRequest->getParam('floor_system_qual', '');
if($floor_system_qual)
{
	 $keys = array_keys($floor_system_qual);
	 $ky = $keys[0];
	 $val = $floor_system_qual[$ky];
	
	  $detail['cs_fs_quality_ass'] = $val;
	  $table->setWhere("cs_id = ".$ky);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }
	  $fwViewData['show'] =  3;	  	
}


$ff_post_slab = $fwRequest->getParam('ff_post_slab', '');
if($ff_post_slab)
{
	 $keys = array_keys($ff_post_slab);
	 $ky = $keys[0];
	 $val = $ff_post_slab[$ky];
	
	  $detail['cs_fs_postslab'] = $val;
	  $table->setWhere("cs_id = ".$ky);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }
	  $fwViewData['show'] =  3;	  	
}

$survey_id = $fwRequest->getParam('survey_id', '');
if($survey_id)
{
	 $keys = array_keys($survey_id);
	 $ky = $keys[0];
	 $val = $survey_id[$ky];
	
	  $detail['cs_survey_id'] = $val;
	  $table->setWhere("cs_id = ".$ky);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }
	  $fwViewData['show'] =  3;	  	
}

$site_works = $fwRequest->getParam('site_works', '');
if($site_works)
{
	 $keys = array_keys($site_works);
	 $ky = $keys[0];
	 $val = $site_works[$ky];
	
	  $detail['cs_site_works'] = $val;
	  $table->setWhere("cs_id = ".$ky);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }
	  $fwViewData['show'] =  3;	  	
}

$move_close = $fwRequest->getParam('move_close', '');
if($move_close)
{
	 $keys = array_keys($move_close);
	 $ky = $keys[0];
	 $val = $move_close[$ky];
	
	  $detail['cs_stage'] = $val;
	  $table->setWhere("cs_id = ".$ky);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }
	  $fwViewData['show'] =  3;	  	
}



$move_walk = $fwRequest->getParam('move_walk', '');
if($move_walk)
{
	 $keys = array_keys($move_walk);
	 $ky = $keys[0];
	 $val = $move_walk[$ky];
	
	  $detail['cs_stage'] = $val;
	  $table->setWhere("cs_id = ".$ky);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }
	  $fwViewData['show'] =  4;	  	
}


$hide = $fwRequest->getParam('hide', '');
if($hide)
{
	 $keys = array_keys($hide);
	 $ky = $keys[0];
	 $val = $hide[$ky];
	
	  $detail['cs_stage'] = $val;
	  $table->setWhere("cs_id = ".$ky);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }
	  $fwViewData['show'] = 5;	  	
}



$comm_notice = $fwRequest->getParam('comm_notice', '');


if($comm_notice)
{
	
	 $keys_1 = array_keys($comm_notice);
	 $ky_1 = $keys_1[0];
	 $val_1 = $comm_notice[$ky_1];
	
	  $detail['cs_comm_notice'] = $val_1;
	  $table->setWhere("cs_id = ".$ky_1);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}
 
$elect_up = $fwRequest->getParam('elect_up', '');
if($elect_up)
{
	 $keys_2 = array_keys($elect_up);
	 $ky_2 = $keys_2[0];
	 $val_2 = $elect_up[$ky_2];
	
	  $detail['cs_elect_upgrade'] = $val_2;
	  $table->setWhere("cs_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
} 
 

$save_pier = $fwRequest->getParam('save_pier', '');
if($save_pier) 
{ 
		if($_FILES['pier_insp']['name'])
		{

			$docfile_12 = $_FILES['pier_insp']['name'];
			$docfile_12 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_12);
			$temp_name_12 = $_FILES['pier_insp']['tmp_name'];
			$clData['cs_pier_insp'] = $docfile_12;
			
			upload($docfile_12, $temp_name_12);
			
			$cs_id = $fwRequest->getParam('cs_id', '');
				
				$table->setWhere('cs_id = '.$cs_id);
				if($table->rowExists())
				{
				
					$detail = $table->updateRow($clData);	
				}		
		}
		$fwViewData['show'] =  3;	
}


$upload_post_slab = $fwRequest->getParam('upload_post_slab', '');
if($upload_post_slab) 
{ 
		if($_FILES['post_slab']['name'])
		{

			$docfile_11 = $_FILES['post_slab']['name'];
			$docfile_11 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_11);
			$temp_name_11 = $_FILES['post_slab']['tmp_name'];
			$psData['cs_post_slab'] = $docfile_11;
			
			upload($docfile_11, $temp_name_11);
			
			$cs_id = $fwRequest->getParam('cs_id', '');
				
				$table->setWhere('cs_id = '.$cs_id);
				if($table->rowExists())
				{
				
					$detail = $table->updateRow($psData);	
				}		
		}
		$fwViewData['show'] =  3;	
}

$whereand = '';
  
$search_proj = $fwRequest->getParam('search_proj', '');
if ($search_proj):
	$whereand .= " AND construction_scheduler_report.cs_project LIKE '%" . $search_proj . "%'";
	$_SESSION['search_proj'] = $search_proj;
	$fwViewData['search_proj'] = $_SESSION['search_proj'];
elseif (!empty($_SESSION['search_proj'])):

	$whereand .= " AND construction_scheduler_report.cs_project LIKE '%" . $_SESSION['search_proj'] . "%'";
	$fwViewData['search_proj'] = $_SESSION['search_proj'];
else:
	$whereand .= '';
endif;


$clear = $fwRequest->getParam('clear', '');
if($clear) {
	unset($_SESSION['search_proj']);
	unset($fwViewData['search_proj']);
	$fwViewData['search_proj'] = '';
	unset($whereand);
}

 if(isset($_SESSION['where'])) { $where = $_SESSION['where']; }
 
//$ord =  " ORDER BY if( dc_date = ' '
//        OR dc_date IS  NULL , 0, 1 ) , STR_TO_DATE( dc_date, '%d-%m-%Y' ) DESC "; 

//$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where ;
$matsql = "SELECT business.bsn_starting_onsite_date, ".$TABLE.".* FROM ".$TABLE." LEFT JOIN business on business.bsn_name = construction_scheduler_report.cs_project " .$where. " " .$whereand. " order by STR_TO_DATE(business.bsn_starting_onsite_date, '%d-%m-%Y') ASC";

if($matsql){$userData = $fwDb->query($matsql);}

if(!empty($userData))
{
if (!(isset($pagenum))){ $pagenum = 1; } 
    $rows = count($userData);
    $page_rows = 300;
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
	
	//$fwViewData['list'] = $listsnew;
  }
}


foreach((array)$listsnew as $k=>$v)
{
	$sq1_1 = "SELECT  business.bsn_id, project_type.pt_name from business 
	        Inner join project_type on business.bsn_type = 	project_type.pt_id	
	 	where business.bsn_name = '".$v['cs_project']."'";  
	
	$data = $fwDb->queryOne($sq1_1);
	
	$sq1_2 = "SELECT  business.bsn_live_proj_calendar, business.bsn_qar_pre_sheet, business.bsn_qar_pre_walk from business 
	          where business.bsn_name = '".$v['cs_project']."'";  
	$data_2 = $fwDb->queryOne($sq1_2);
	
	
	$sql148 = "Select document_check_list.doc_file_name  from document_check_list
		    where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " And document_check_list.doc_name_id = 148";
	$data148 = $fwDb->queryOne($sql148);
	
	$sql421 = "Select document_check_list.doc_file_name  from document_check_list
		    where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " And document_check_list.doc_name_id = 421";
	$data421 = $fwDb->queryOne($sql421);
	
	$sql142 = "Select document_check_list.doc_file_name  from document_check_list
		    where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " And document_check_list.doc_name_id = 142";
	$data142 = $fwDb->queryOne($sql142);
	
	$sql615 = "Select document_check_list.doc_file_name  from document_check_list
		    where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " And document_check_list.doc_name_id = 615";
	$data615 = $fwDb->queryOne($sql615);
	
	$sql625 = "Select document_check_list.doc_file_name  from document_check_list
		    where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " And document_check_list.doc_name_id = 625";
	$data625 = $fwDb->queryOne($sql625);
	
	$sql254 = "Select document_check_list.doc_file_name  from document_check_list
		    where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " And document_check_list.doc_name_id = 254";
	$data254 = $fwDb->queryOne($sql254);
	
	$sql647 = "Select document_check_list.doc_file_name  from document_check_list
		    where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " And document_check_list.doc_name_id = 647";
	$data647 = $fwDb->queryOne($sql647);
	
	$sql148 = "Select document_check_list.doc_file_name  from document_check_list
		    where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " And document_check_list.doc_name_id = 148";
	$data148 = $fwDb->queryOne($sql148);
	
	
	$sql654 = "Select document_check_list.doc_file_name  from document_check_list
		    where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " And document_check_list.doc_name_id = 654";
	$data654 = $fwDb->queryOne($sql654);
	
	$sql648 = "Select document_check_list.doc_file_name  from document_check_list
		    where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " And document_check_list.doc_name_id = 648";
	$data648 = $fwDb->queryOne($sql648);
	
	$sql240 = "Select document_check_list.doc_file_name  from document_check_list
		    where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " And document_check_list.doc_name_id = 240";
	$data240 = $fwDb->queryOne($sql240);
	
	
	$sql261 = "Select document_check_list.doc_file_name  from document_check_list
		    where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " And document_check_list.doc_name_id = 261";
	$data261 = $fwDb->queryOne($sql261);
	
	$sql656 = "Select document_check_list.doc_file_name  from document_check_list
		    where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " And document_check_list.doc_name_id = 656";
	$data656 = $fwDb->queryOne($sql656);

	$sql649 = "Select document_check_list.doc_file_name  from document_check_list
		    where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " And document_check_list.doc_name_id = 649";
	$data649 = $fwDb->queryOne($sql649);
	
	$sql152 = "Select document_check_list.doc_file_name  from document_check_list
		    where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " And document_check_list.doc_name_id = 152";
	$data152 = $fwDb->queryOne($sql152);
	
	$sql235= "Select document_check_list.doc_file_name  from document_check_list
		    where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " And document_check_list.doc_name_id = 235";
	$data235 = $fwDb->queryOne($sql235);
	
	//
	$sql155= "Select document_check_list.doc_file_name  from document_check_list
		    where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " And document_check_list.doc_name_id = 155";
	$data155 = $fwDb->queryOne($sql155);
	
	$sql295= "Select document_check_list.doc_file_name  from document_check_list
		      where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " And document_check_list.doc_name_id = 295";
	$data295 = $fwDb->queryOne($sql295);
	
	
	$sql665= "Select document_check_list.doc_file_name  from document_check_list
		      where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " And document_check_list.doc_name_id = 665";
	$data665 = $fwDb->queryOne($sql665);
	
	
	$sql626 = "Select document_check_list.doc_file_name  from document_check_list
		    where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " And document_check_list.doc_name_id = 626";
	$data626 = $fwDb->queryOne($sql626);
	
	$sql783 = "Select document_check_list.doc_file_name  from document_check_list
		    where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " And document_check_list.doc_name_id = 783";
	$data783 = $fwDb->queryOne($sql783);
	
	//
	
	$sql_3 = "Select ppd_signoff_doc from progress_payment_detail
		  where ppd_bsn_id = ". $data['bsn_id']. " And ppd_stage like '%Floor Systems Complete%'";
	$data_3 = $fwDb->queryOne($sql_3);
	
	$sql_4 = "Select ppd_signoff_doc from progress_payment_detail
		  where ppd_bsn_id = ". $data['bsn_id']. " And ppd_stage like '%Close Up%'";
	$data_4 = $fwDb->queryOne($sql_4);
	
	$sql_5 = "Select ppd_signoff_doc from progress_payment_detail
			  where ppd_bsn_id = ". $data['bsn_id']. " And ppd_stage like '%Fixing%'";
	$data_5 = $fwDb->queryOne($sql_5);
		
	$sql_6 = "Select ppd_signoff_doc from progress_payment_detail
			  where ppd_bsn_id = ". $data['bsn_id']. " And ppd_stage like '%Painting%'";
	$data_6 = $fwDb->queryOne($sql_6);
	
	$sql650 = "Select document_check_list.doc_file_name  from document_check_list
		   where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " And document_check_list.doc_name_id = 650";
	$data650 = $fwDb->queryOne($sql650);

	$sql651 = "Select document_check_list.doc_file_name  from document_check_list
		   where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " And document_check_list.doc_name_id = 651";
	$data651 = $fwDb->queryOne($sql651);
	
	$sql652 = "Select document_check_list.doc_file_name  from document_check_list
		   where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " And document_check_list.doc_name_id = 652";
	$data652 = $fwDb->queryOne($sql652);
	
	$sql298 = "Select document_check_list.doc_file_name  from document_check_list
		    where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " And document_check_list.doc_name_id = 298";
	$data298 = $fwDb->queryOne($sql298);
	
	$sql660 = "Select document_check_list.doc_file_name  from document_check_list
		    where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " And document_check_list.doc_name_id = 660";
	$data660 = $fwDb->queryOne($sql660);
	
	$sql653 = "Select document_check_list.doc_file_name  from document_check_list
		    where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " And document_check_list.doc_name_id = 653";
	$data653 = $fwDb->queryOne($sql653);
	
	$sql478 = "Select document_check_list.doc_file_name  from document_check_list
		    where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " And document_check_list.doc_name_id = 478";
	$data478 = $fwDb->queryOne($sql478);

	$sql534 = "Select document_check_list.doc_file_name  from document_check_list
		    where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " And document_check_list.doc_name_id = 534";
	$data534 = $fwDb->queryOne($sql534);
	
	$sql289 = "Select document_check_list.doc_file_name  from document_check_list
		    where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " And document_check_list.doc_name_id = 289";
	$data289 = $fwDb->queryOne($sql289);
	
	$sql625 = "Select document_check_list.doc_file_name  from document_check_list
		    where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " And document_check_list.doc_name_id = 625";
	$data625 = $fwDb->queryOne($sql625);
	
	$sql655 = "Select document_check_list.doc_file_name  from document_check_list
		    where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " And document_check_list.doc_name_id = 655";
	$data655 = $fwDb->queryOne($sql655);
	
	$sql272 = "Select document_check_list.doc_file_name  from document_check_list
		    where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " And document_check_list.doc_name_id = 272";
	$data272 = $fwDb->queryOne($sql272);
	
	$sql258 = "Select document_check_list.doc_file_name from document_check_list
		    where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " And document_check_list.doc_name_id = 258";
	$data258 = $fwDb->queryOne($sql258);
	
	$sql795 = "Select document_check_list.doc_file_name from document_check_list
			   where document_check_list.doc_bsn_id = " . $data['bsn_id'] . " And document_check_list.doc_name_id = 795";
	$data795 = $fwDb->queryOne($sql795);
	
	$sql798 = "Select document_check_list.doc_file_name from document_check_list
			   where document_check_list.doc_bsn_id = " . $data['bsn_id'] . " And document_check_list.doc_name_id = 798";
	$data798 = $fwDb->queryOne($sql798);
	
	$sql788 = "Select document_check_list.doc_file_name from document_check_list
			   where document_check_list.doc_bsn_id = " . $data['bsn_id'] . " And document_check_list.doc_name_id = 788";
	$data788 = $fwDb->queryOne($sql788);
	
	$sql739 = "Select document_check_list.doc_file_name from document_check_list
			   where document_check_list.doc_bsn_id = " . $data['bsn_id'] . " And document_check_list.doc_name_id = 739";
	$data739 = $fwDb->queryOne($sql739);
	
	$sql777 = "Select document_check_list.doc_file_name from document_check_list
			   where document_check_list.doc_bsn_id = " . $data['bsn_id'] . " And document_check_list.doc_name_id = 777";
	$data777 = $fwDb->queryOne($sql777);
	
	$sql737 = "Select document_check_list.doc_file_name from document_check_list
			   where document_check_list.doc_bsn_id = " . $data['bsn_id'] . " And document_check_list.doc_name_id = 737";
	$data737 = $fwDb->queryOne($sql737);
	
	$sql156 = "Select document_check_list.doc_file_name from document_check_list
			   where document_check_list.doc_bsn_id = " . $data['bsn_id'] . " And document_check_list.doc_name_id = 156";
	$data156 = $fwDb->queryOne($sql156);
	
	$sql162 = "Select document_check_list.doc_file_name from document_check_list
			   where document_check_list.doc_bsn_id = " . $data['bsn_id'] . " And document_check_list.doc_name_id = 162";
	$data162 = $fwDb->queryOne($sql162);
	
	$sql318 = "Select document_check_list.doc_file_name from document_check_list
			   where document_check_list.doc_bsn_id = " . $data['bsn_id'] . " And document_check_list.doc_name_id = 318";
	$data318 = $fwDb->queryOne($sql318);
	
	$sql413 = "Select document_check_list.doc_file_name from document_check_list
			   where document_check_list.doc_bsn_id = " . $data['bsn_id'] . " And document_check_list.doc_name_id = 413";
	$data413 = $fwDb->queryOne($sql413);
	
	$sql735 = "Select document_check_list.doc_file_name from document_check_list
			   where document_check_list.doc_bsn_id = " . $data['bsn_id'] . " And document_check_list.doc_name_id = 735";
	$data735 = $fwDb->queryOne($sql735);
	
	$sql736 = "Select document_check_list.doc_file_name from document_check_list
			   where document_check_list.doc_bsn_id = " . $data['bsn_id'] . " And document_check_list.doc_name_id = 736";
	$data736 = $fwDb->queryOne($sql736);
	
	$sql738 = "Select document_check_list.doc_file_name from document_check_list
			   where document_check_list.doc_bsn_id = " . $data['bsn_id'] . " And document_check_list.doc_name_id = 738";
	$data738 = $fwDb->queryOne($sql738);
	
	$sql163 = "Select document_check_list.doc_file_name from document_check_list
			   where document_check_list.doc_bsn_id = " . $data['bsn_id'] . " And document_check_list.doc_name_id = 163";
	$data163 = $fwDb->queryOne($sql163);
	
	$sql296 = "Select document_check_list.doc_file_name from document_check_list
			   where document_check_list.doc_bsn_id = " . $data['bsn_id'] . " And document_check_list.doc_name_id = 296";
	$data296 = $fwDb->queryOne($sql296);
	
	$sql713 = "Select document_check_list.doc_file_name from document_check_list
			   where document_check_list.doc_bsn_id = " . $data['bsn_id'] . " And document_check_list.doc_name_id = 713";
	$data713 = $fwDb->queryOne($sql713);
	
	$sql714 = "Select document_check_list.doc_file_name from document_check_list
			   where document_check_list.doc_bsn_id = " . $data['bsn_id'] . " And document_check_list.doc_name_id = 714";
	$data714 = $fwDb->queryOne($sql714);
	
	$sql694 = "Select document_check_list.doc_file_name from document_check_list
			   where document_check_list.doc_bsn_id = " . $data['bsn_id'] . " And document_check_list.doc_name_id = 694";
	$data694 = $fwDb->queryOne($sql694);
	
	$sql637 = "Select document_check_list.doc_file_name from document_check_list
			   where document_check_list.doc_bsn_id = " . $data['bsn_id'] . " And document_check_list.doc_name_id = 637";
	$data637 = $fwDb->queryOne($sql637);
	

	$listsnew[$k]['link'] = BASE_URL."business.detail/bsn_id/".$data['bsn_id'];
	$listsnew[$k]['pt_name'] = $data['pt_name'];
	$listsnew[$k]['doc_file_name_655'] = $data655['doc_file_name'];
	$listsnew[$k]['doc_file_name_421'] = $data421['doc_file_name'];
	$listsnew[$k]['doc_file_name_142'] = $data142['doc_file_name'];
	$listsnew[$k]['doc_file_name_615'] = $data615['doc_file_name'];
	$listsnew[$k]['doc_file_name_625'] = $data625['doc_file_name'];
	$listsnew[$k]['doc_file_name_254'] = $data254['doc_file_name'];
	$listsnew[$k]['doc_file_name_647'] = $data647['doc_file_name'];
	$listsnew[$k]['doc_file_name_148'] = $data148['doc_file_name'];
	$listsnew[$k]['doc_file_name_654'] = $data654['doc_file_name'];
	$listsnew[$k]['doc_file_name_648'] = $data648['doc_file_name'];
	$listsnew[$k]['doc_file_name_240'] = $data240['doc_file_name'];
	$listsnew[$k]['doc_file_name_261'] = $data261['doc_file_name'];
	$listsnew[$k]['doc_file_name_656'] = $data656['doc_file_name'];
	$listsnew[$k]['doc_file_name_649'] = $data649['doc_file_name'];
	$listsnew[$k]['doc_file_name_152'] = $data152['doc_file_name'];
	$listsnew[$k]['doc_file_name_650'] = $data650['doc_file_name'];
	$listsnew[$k]['doc_file_name_651'] = $data651['doc_file_name'];
	$listsnew[$k]['doc_file_name_652'] = $data652['doc_file_name'];
	$listsnew[$k]['doc_file_name_298'] = $data298['doc_file_name'];
	$listsnew[$k]['doc_file_name_660'] = $data660['doc_file_name'];
	$listsnew[$k]['doc_file_name_653'] = $data653['doc_file_name'];
	$listsnew[$k]['doc_file_name_478'] = $data478['doc_file_name'];
	$listsnew[$k]['doc_file_name_534'] = $data534['doc_file_name'];
	$listsnew[$k]['doc_file_name_289'] = $data289['doc_file_name'];
	
	$listsnew[$k]['doc_file_name_235'] = $data235['doc_file_name'];
	
	$listsnew[$k]['doc_file_name_155'] = $data155['doc_file_name'];
	$listsnew[$k]['doc_file_name_295'] = $data295['doc_file_name'];
	$listsnew[$k]['doc_file_name_665'] = $data665['doc_file_name'];
	
	$listsnew[$k]['doc_file_name_626'] = $data626['doc_file_name'];
	$listsnew[$k]['doc_file_name_272'] = $data272['doc_file_name'];
	$listsnew[$k]['doc_file_name_258'] = $data258['doc_file_name'];
	
	$listsnew[$k]['doc_file_name_783'] = $data783['doc_file_name'];
	
	$listsnew[$k]['doc_file_name_795'] = $data795['doc_file_name'];
	$listsnew[$k]['doc_file_name_798'] = $data798['doc_file_name'];
	$listsnew[$k]['doc_file_name_788'] = $data788['doc_file_name'];
	$listsnew[$k]['doc_file_name_739'] = $data739['doc_file_name'];
	$listsnew[$k]['doc_file_name_777'] = $data777['doc_file_name'];
	$listsnew[$k]['doc_file_name_737'] = $data737['doc_file_name'];
	$listsnew[$k]['doc_file_name_156'] = $data156['doc_file_name'];
	$listsnew[$k]['doc_file_name_162'] = $data162['doc_file_name'];
	$listsnew[$k]['doc_file_name_318'] = $data318['doc_file_name'];
	$listsnew[$k]['doc_file_name_413'] = $data413['doc_file_name'];
	$listsnew[$k]['doc_file_name_735'] = $data735['doc_file_name'];
	$listsnew[$k]['doc_file_name_736'] = $data736['doc_file_name'];
	$listsnew[$k]['doc_file_name_738'] = $data738['doc_file_name'];
	$listsnew[$k]['doc_file_name_163'] = $data163['doc_file_name'];
	$listsnew[$k]['doc_file_name_296'] = $data296['doc_file_name'];
	$listsnew[$k]['doc_file_name_713'] = $data713['doc_file_name'];
	$listsnew[$k]['doc_file_name_714'] = $data714['doc_file_name'];
	$listsnew[$k]['doc_file_name_694'] = $data694['doc_file_name'];
	$listsnew[$k]['doc_file_name_637'] = $data637['doc_file_name'];
	
	
	$listsnew[$k]['floor_system'] = $data_3['ppd_signoff_doc'];
	$listsnew[$k]['close_up'] = $data_4['ppd_signoff_doc'];
	$listsnew[$k]['fixing'] = $data_5['ppd_signoff_doc'];
	$listsnew[$k]['painting'] = $data_6['ppd_signoff_doc'];
	
	$listsnew[$k]['calendar_link'] = $data_2['bsn_live_proj_calendar'];
	$listsnew[$k]['bsn_qar_pre_sheet'] = $data_2['bsn_qar_pre_sheet'];
	$listsnew[$k]['bsn_qar_pre_walk'] = $data_2['bsn_qar_pre_walk'];
	
}

$fwViewData['list'] = $listsnew;
$fwViewData['title'] = $MODULE_PLURAL;
		
$sql_c = "Select * from roofing_occupancy";
$fwViewData['occdetail'] = $fwDb->query($sql_c);

$sql_ow = "Select * from roofing_they_want";
$fwViewData['rtwdetail'] = $fwDb->query($sql_ow);

$print = $fwRequest->getParam('print', 0);


$sql_po = "Select distinct po_po_number from purchase_order";
$fwViewData['podetail'] = $fwDb->query($sql_po);

$sql_pro = "select distinct cs_project from construction_scheduler_report";
$fwViewData['project_data'] = $fwDb->query($sql_pro);

