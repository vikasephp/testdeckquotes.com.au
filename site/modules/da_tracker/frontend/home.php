<?php
$pagenum = $fwRequest->getparam('pagenum','');
$tablePages = new Fw_Db_Table($TABLE);
$export = $fwRequest->getParam('export', 0);
$short = $fwRequest->getParam('s', '');

$fwViewData['ran'] =  rand(100000,999999);


$indb = $fwRequest->getParam('indb', '');
if($indb)
{
	 $keys_2 = array_keys($indb);
	 $ky_2 = $keys_2[0];
	 $val_2 = $indb[$ky_2];
	
	  $detail['da_in_database'] = $val_2;
	  $tablePages->setWhere("da_id = ".$ky_2);
	  if($tablePages->rowExists())
	  {
		 $this_id = $tablePages->updateRow($detail);
	  }	  	
}


$listdata = $fwRequest->getParam($TABLE, array());

$keyword = $listdata['keyword'];
$where = "WHERE 1=1 ";

if($keyword) {
$_SESSION['keyword'] = $keyword;
$fwViewData['keyword']=$_SESSION['keyword'];
}
else { unset($_SESSION['keyword']); }

	
if($keyword):
$where .= "AND ".$TABLE.".re_position LIKE '%".$keyword."%'";
	
	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword'] && $pagenum > 0):

$where .= "AND ".$TABLE.".re_position LIKE '%".$keyword."%'";
	
	$fwViewData['keyword']=$_SESSION['keyword'];
endif;
   
$ord =  " ORDER BY if( da_create_date = ' ' OR da_create_date IS NULL , 1, 0 ) , STR_TO_DATE(da_create_date, '%d-%m-%Y' ) DESC ";  

$close_date = $fwRequest->getParam('close_date', '');
if(!empty($close_date)) {
	$ord =  " ORDER BY if( da_close_date = ' ' OR da_close_date IS NULL , 1, 0 ) , STR_TO_DATE(da_close_date, '%d-%m-%Y' ) DESC "; 
}
 
$da_create_date = $fwRequest->getParam('da_create_date', '');
if(!empty($da_create_date)) {
	$ord =  " ORDER BY if( da_create_date = ' ' OR da_create_date IS NULL , 1, 0 ) , STR_TO_DATE(da_create_date, '%d-%m-%Y' ) DESC "; 
}   
$sql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where ." ".$ord;	


if($sql){$userData = $fwDb->query($sql);}

if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

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
$fwViewData['title'] = "DA Tracker";