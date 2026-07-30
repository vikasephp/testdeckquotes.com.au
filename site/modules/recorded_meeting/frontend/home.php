<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$listdata = $fwRequest->getParam($TABLE, array());
$table_toplink = new Fw_Db_Table('top_links');


$update_link = $fwRequest->getParam('update_link', '');
if(!empty($update_link)){
	$idm = $fwRequest->getParam('idm', '');
	$par = $fwRequest->getParam('par', '');
	
	$tlDetail_1['tl_link'] = $idm;
	$tlDetail_2['tl_link'] = $par;
	$table_toplink->setWhere("tl_slug = 'recorded_meeting' AND tl_type = 'IDM'");
	$table_toplink->updateRow($tlDetail_1);
	$table_toplink->setWhere("tl_slug = 'recorded_meeting' AND tl_type = 'PAR'");
	$table_toplink->updateRow($tlDetail_2);
}

$submitrm = $fwRequest->getParam('savetorm', '');
if(!empty($submitrm)) {
	 $savetorm = $fwRequest->getParam('savetorm', '');
		
	foreach($savetorm as $k=>$v)
	{
	$rmDetail['rm_tobe_scribed'] = $v;
	$tablerm = new Fw_Db_Table('recorded_meeting');
	$tablerm->setWhere('rm_id = '.$k);
	$detail = $tablerm->updateRow($rmDetail);		
	}

}


$keyword = $listdata['keyword'];
$where = " where 1 ";

if($keyword) {
$_SESSION['keyword'] = $keyword;
$fwViewData['keyword']=$_SESSION['keyword'];
}
else { unset($_SESSION['keyword']); }

	
if($keyword):
	$where .= " AND business.bsn_name LIKE '%".$keyword."%' OR  recorded_meeting.rm_date LIKE '%".$keyword."%'  OR  recorded_meeting.rm_owner LIKE '%".$keyword."%' ";
	
			$_SESSION['keyword'] = $keyword;
			$fwViewData['keyword']=$_SESSION['keyword'];
	
elseif($_SESSION['keyword'] && $pagenum > 0):
	
		$where .= " AND business.bsn_name LIKE '%".$keyword."%' ";
		
		$fwViewData['keyword']=$_SESSION['keyword'];
endif;
  
 //$ord =    " ORDER BY ".$TABLE.".".'rm_date '." DESC"; 
 
  $ord =    " ORDER BY STR_TO_DATE(recorded_meeting.rm_date,'%d-%m-%Y') DESC"; 

  
$matsql = "SELECT ".$TABLE.".*, business.bsn_name  FROM ".$TABLE."
          Inner Join business On ".$TABLE.".rm_bus_id = business.bsn_id ".$where .$ord;	



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


$table_toplink->setWhere("tl_slug = 'recorded_meeting' AND tl_type = 'IDM'");
$fwViewData['idm_detail'] = $table_toplink->getRow();
$table_toplink->setWhere("tl_slug = 'recorded_meeting' AND tl_type = 'PAR'");
$fwViewData['par_detail'] = $table_toplink->getRow();
