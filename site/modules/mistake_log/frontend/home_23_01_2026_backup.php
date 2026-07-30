<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('mistake_log');
$listdata = $fwRequest->getParam($TABLE, array());

$mistake = $fwRequest->getParam('mistake', '');
if(!empty($mistake)) {
$keyword = $mistake['keyword'];
}
$where = " WHERE  ml_hide = 0";

$showall = $fwRequest->getParam('showall', '');
if(!empty($showall))
{
$where = " Where 1=1 ";	
}

$showhidden = $fwRequest->getParam('showhidden', '');
if(!empty($showhidden))
{
$where = " WHERE ml_status = 'Unresolved'";	
}

$hide = $fwRequest->getParam('hide', '');
if($hide)
{
	 $keys_2 = array_keys($hide);
	 $ky_2 = $keys_2[0];
	 $val_2 = $hide[$ky_2];
	
	  $detail['ml_hide'] = $val_2;
	  
	  $table->setWhere("ml_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}



$status = $fwRequest->getParam('status', '');
if($status)
{
	 $keys_3 = array_keys($status);
	 $ky_3 = $keys_3[0];
	 $val_3 = $status[$ky_3];
	
	  $detail2['ml_status'] = $val_3;
	  
	 
	  $table->setWhere("ml_id = ".$ky_3);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail2);
	  }	  	
}

  
if($keyword) {
	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword']=$_SESSION['keyword'];
	$where = "WHERE 1=1 AND ml_mistake like '%".$keyword."%' 
	Or ml_person_created like '%".$keyword."%'  
	Or ml_priority like '%".$keyword."%'
	Or ml_owner like '%".$keyword."%'
	Or ml_date like '%".$keyword."%'";
}
else { unset($_SESSION['keyword']); }


$clearfilter = $fwRequest->getParam('clearfilter', '');
if(!empty($clearfilter))
{
	$where = " Where 1=1 ";
	unset($_SESSION['priority_filter']);	
}

$priority_filter = $fwRequest->getParam('priority_filter', '');
if(!empty($priority_filter)) {
	$where .= " and mistake_log.ml_priority = ".$priority_filter;
	$_SESSION['priority_filter'] = $priority_filter;
	
}
else if(!empty($_SESSION['priority_filter'])) {
	$where .= " and mistake_log.ml_priority = ".$_SESSION['priority_filter'];
	
}
  
$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where." ORDER BY ".$TABLE.".".$ID." DESC";

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

$sql = "select * from mistake_log_priority";
$fwViewData['prioritydata'] = $fwDb->query($sql);
