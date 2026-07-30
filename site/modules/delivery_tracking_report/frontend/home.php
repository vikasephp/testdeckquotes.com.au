<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('delivery_tracking_report');

$where = " WHERE 1 = 1  ";

$saveall = $fwRequest->getParam('saveall', '');
if($saveall) {
	$delivery = $fwRequest->getParam('delivery', '');
	
	 foreach($delivery as $k=>$v)
	 {
		 foreach($v as $k1=>$v1)
		 {
			 $sqlUpdate = "Update delivery_tracking_report set ".$k . " = '" .$v1 ."' where dtr_id = ".$k1;
			 $fwDb -> queryOne($sqlUpdate);
		 }
	 }
}


  $search_project = $fwRequest->getParam('search_project', '');

  if($search_project):
	
       $where .= " AND dtr_project_name  LIKE '%".$search_project."%'  ";
       $_SESSION['search_project'] = $search_project;
       $fwViewData['search_project']=$_SESSION['search_project'];

  elseif($_SESSION['search_project'] && $pagenum > 0):
		
       $where .= " AND dtr_project_name LIKE  '%".$_SESSION['search_project']."%' ";
       $fwViewData['search_project']=$_SESSION['search_project'];

  endif;
 
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

//db($listsnew);
//exit; 
//
//if(!empty($listsnew)) {
//	
//	foreach($listsnew as $k => $v2)
//	{
//	 
//
//	
//		  $listsnew[$k]['car_project'] = stripslashes($v2['car_project']);
//	
//		  $listsnew[$k]['bcust_fname'] = $data['bcust_fname'];
//		  $listsnew[$k]['bcust_lname'] = $data['bcust_lname'];
//	
//		  
//		  if(empty($data['bcust_fname']) && !empty($where2)) {  unset($listsnew[$k]); }
//
//	}
//}

//$fwViewData['list'] = $listsnew;
//$fwViewData['list'] = $setdata2;
$fwViewData['title'] = $MODULE_PLURAL;

$sqlp = "SELECT  business.* from business";
$fwViewData['projdetail'] = $fwDb->query($sqlp);

$fwViewData['color'] =  Array('','white','green','orange','grey','red');
//db($color[1]);
