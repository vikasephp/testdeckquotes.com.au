<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('planning_meeting_list');

$where = " WHERE pm_hide = 0";

$hidden = $fwRequest->getParam('hidden', '');
	if(!empty($hidden)) {
	$where = " WHERE 1 = 1";	
}

$hide = $fwRequest->getParam('hide', '');
if($hide)
{
	 $keys_2 = array_keys($hide);
	 $ky_2 = $keys_2[0];
	 $val_2 = $hide[$ky_2];
	
	  $detail['pm_hide'] = $val_2;
	  $table->setWhere("pm_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}


$clear = $fwRequest->getParam('clear', '');
if($clear) {
	 $fwViewData['due_date']='';
}


$ord =  " ORDER BY if(  pm_meeting_date = ' '
         OR pm_meeting_date IS NULL , 1, 0 ) , STR_TO_DATE( pm_meeting_date, '%d-%m-%Y' ) DESC";


  $search_project = $fwRequest->getParam('search_project', '');


  if($search_project):
	
       $where .= " AND car_project  LIKE '%".$search_project."%'  ";
       $_SESSION['search_project'] = $search_project;
       $fwViewData['search_project']=$_SESSION['search_project'];

  elseif($_SESSION['search_project'] && $pagenum > 0):
		
       $where .= " AND car_project LIKE  '%".$_SESSION['search_project']."%' ";
       $fwViewData['search_project']=$_SESSION['search_project'];

 // elseif(isset($_SESSION['search_project'])) :
    		
	//$where .= " AND car_project LIKE  '%".$_SESSION['search_project']."%'  ";	
	
  endif;



//$sort_date = $fwRequest->getParam('sort_date', '');
//if(!empty($sort_date)) {
//$ord =  " ORDER BY if(  warranty_log.wa_date = ' '
//         OR warranty_log.wa_date IS NULL , 1, 0 ) , STR_TO_DATE( warranty_log.wa_date, '%d-%m-%Y' ) DESC";	
//}
//  
//  
//$sort_proj = $fwRequest->getParam('sort_proj', '');
//if(!empty($sort_proj)) {
//$ord =  " ORDER BY  warranty_log.wa_project ";	
//}
     
$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where .' ' .$ord;	

if($matsql){$userData = $fwDb->query($matsql);}

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



$fwViewData['title'] = $MODULE_PLURAL;

$sqlp = "SELECT  business.* from business";
$fwViewData['projdetail'] = $fwDb->query($sqlp);

$sqls = "select co_id, co_company_name from companies";
$fwViewData['supdetail'] = $fwDb->query($sqls);

$sql_1 = "select distinct car_project from construction_alert_report";
$fwViewData['project_data'] = $fwDb->query($sql_1 );

$sqlti = "Select tm_id from type_master where tm_type = 'Urgency Rating'";
$type_id = $fwDb->queryOne($sqlti); 
 		
$sqlto = "Select to_id, to_option from type_options where to_type_id  = ". $type_id['tm_id'];
$fwViewData['urgency'] = $fwDb->query($sqlto); 

$sql_2 = "select distinct car_supplier from construction_alert_report";
$fwViewData['supplier'] = $fwDb->query($sql_2);

$sql_3 = "select tm_id from type_master where tm_type = 'Construction Alert Report Team' " ;
$tmdata = $fwDb->queryOne($sql_3); 

$sql_4 = "select to_option from type_options where to_type_id = ". $tmdata['tm_id'] ;
$fwViewData['who'] = $fwDb->query($sql_4); 

$sql_5 = "select distinct apd_comp_date from action_plan_step_detail";
$fwViewData['date'] = $fwDb->query($sql_5 );



