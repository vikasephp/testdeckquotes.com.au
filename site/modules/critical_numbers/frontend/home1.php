<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$listdata = $fwRequest->getParam($TABLE, array());

//$keyword = $listdata['keyword'];
$where = "WHERE 1=1 ";
  
$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where." ORDER BY ".$TABLE.".".$ID." ASC";	

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



$dt = date('Y-m-d', strtotime(' -7 day'));
$sql7 = "select count(*) as tot from business where bsn_status_sys_date >= '".$dt."'";
$data = $fwDb->queryOne($sql7);

$sqlyear = "select count(*) as tot2 from business where bsn_status_sys_date >= '2021-01-01'";
$year = $fwDb->queryOne($sqlyear);

$sqlpl7 = "select count(*) as tot3 from document_check_list where doc_name_id = 45 and doc_date_uploaded >= '".$dt."'";
$planning = $fwDb->queryOne($sqlpl7);

$sqlplyear = "select count(*) as tot4 from document_check_list where doc_name_id = 45 and doc_date_uploaded >= '2021-01-01'";
$planningyear = $fwDb->queryOne($sqlplyear);


$fwViewData['7dayleads'] =  $data['tot'];
$fwViewData['year'] =  $year['tot2'];
$fwViewData['planning7'] =  $planning['tot3'];
$fwViewData['planningyear'] =  $planningyear['tot4'];