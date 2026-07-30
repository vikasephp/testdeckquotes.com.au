<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$table = new Fw_Db_Table('project_progress_report');

$fwViewData['title'] = "Project Progress Report";
$where = " where 1 = 1";


$clear = $fwRequest->getParam('clear', '');

if(!empty($clear)) {
	unset($_SESSION['keyword']);
	unset($keyword);
	$fwViewData['keyword']='';	
}
	
if($keyword):
$where .= " AND  project_progress_report.pp_project  LIKE '%".$keyword."%'";
            	
	    $_SESSION['keyword'] = $keyword;
	    $fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword']):

$where .= " AND project_progress_report.pp_project  LIKE '%".$_SESSION['keyword']."%' ";	
	
	    $fwViewData['keyword']=$_SESSION['keyword'];
endif;
 
 

	 

  
if(empty($pagenum))
	{
	unset($_SESSION['last_tdsql']);
	}
		
$sql = "SELECT  * from project_progress_report " . $where;
$userData = $fwDb->query($sql);

if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

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
	$numstartvounter =  $page_rows * ($pagenum-1) + 1;
	$fwViewData['numstartvounter'] = $numstartvounter;
		
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
    
    $sql2 =  $sql." ".$max;
  
 $setdata = $fwDb->query($sql2);
 $fwViewData['list'] =  $setdata;
 }
 
 
//if(!empty($setdata)) { 
//	foreach($setdata as $k => $v)
//	{
//			$sqla = "Select bsn_id, bsn_type, bsn_starting_onsite_date from business where bsn_name  = '". $v['qt_project_address']."'" ;
//			$data = $fwDb->queryOne($sqla);
//			
//			$sqlb = "select pt_name from project_type where pt_id = ".$data['bsn_type'];
//			$data_2 = $fwDb->queryOne($sqlb);
//		
//			$setdata[$k]['bsn_id']  = $data['bsn_id'];
//			$setdata[$k]['bsn_starting_onsite_date']  = $data['bsn_starting_onsite_date'];
//			$setdata[$k]['pt_name'] = $data_2['pt_name'];	
//	}		
//}
// 	$fwViewData['list'] =  $setdata;
		
