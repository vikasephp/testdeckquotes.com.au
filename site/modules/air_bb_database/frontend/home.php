<?php
$pagenum = $fwRequest->getparam('pagenum','');
$tablePages = new Fw_Db_Table($TABLE);
$export = $fwRequest->getParam('export', 0);
$short = $fwRequest->getParam('s', '');

$listdata = $fwRequest->getParam($TABLE, array());

$keyword = $listdata['keyword'];
$where = " WHERE 1=1 ";

//if($keyword) {
//$_SESSION['keyword'] = $keyword;
//$fwViewData['keyword']=$_SESSION['keyword'];
//}
//else { unset($_SESSION['keyword']); }
	
//if($keyword):
//$where .= "AND ".$TABLE.".re_position LIKE '%".$keyword."%'";

//	$_SESSION['keyword'] = $keyword;
//	$fwViewData['keyword']=$_SESSION['keyword'];

//elseif($_SESSION['keyword'] && $pagenum > 0):

//$where .= "AND ".$TABLE.".re_position LIKE '%".$keyword."%'";

//	$fwViewData['keyword']=$_SESSION['keyword'];
//endif;
   
$sql = "SELECT ".$TABLE.".* FROM ".$TABLE . $where;	

if($sql){$userData = $fwDb->query($sql);}

if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
    $page_rows = 50;
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

if($sql2)
{  

 $setdata = $fwDb->query($sql2);
 $fwViewData['list'] =  $setdata;
 
 }
}

$_SESSION['last_sql'] = $sql;
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Air B&B Database";