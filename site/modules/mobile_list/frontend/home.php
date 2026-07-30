<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$listdata = $fwRequest->getParam($TABLE, array());


$keyword = $fwRequest->getParam('keyword', '');
$where = "WHERE 1=1 ";
 

if($keyword):
$where .= " AND mo_mobile_number like '%".$keyword."%' 
            Or mo_stream like '%".$keyword."%'
	    Or mo_network like '%".$keyword."%'";
	
	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword'] && $pagenum > 0):

	$where .= " AND mo_mobile_number like '%".$_SESSION['keyword']."%' 
		    Or mo_stream like '%".$_SESSION['keyword']."%'
		    Or mo_network like '%".$_SESSION['keyword']."%'";
	
	$fwViewData['keyword']=$_SESSION['keyword'];
endif; 
 

  
$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where." ORDER BY ".$TABLE.".".$ID." ASC";	

if($matsql){$userData = $fwDb->query($matsql);}


if(!empty($userData))
{
if (!(isset($pagenum))){ $pagenum = 1; } 
    $rows = count($userData);
    $page_rows = 5000;
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

$sql_1 = "select * from mobile_list_status";
$fwViewData['statusData']  =  $fwDb->query($sql_1);

$sql_2 = "select * from mobile_list_stream";
$fwViewData['streamData']  =  $fwDb->query($sql_2);
