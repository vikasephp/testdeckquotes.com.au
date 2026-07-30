<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('camera_report');
$where = " WHERE 1 = 1 ";

$action = $fwRequest->getParam('action', '');
if($action)
{
	 $keys_1 = array_keys($action);
	 $ky_1 = $keys_1[0];
	 $val_1 = $action[$ky_1];
	
	  $detail['cr_on_site'] = $val_1;
	  $table->setWhere("cr_id = ".$ky_1);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }
}



$clear = $fwRequest->getParam('clear', '');
if($clear) {
	 $fwViewData['cr_site_address']='';
}

$keyword = $fwRequest->getParam('keyword', '');
if($keyword):

	$where .= " AND camera_report.cr_site_address LIKE '%".$keyword."%'  ";
		    
	
	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword'] && $pagenum > 0):

	$where .= " AND camera_report.cr_site_address LIKE '%".$_SESSION['keyword']."%'  ";	
	
	$fwViewData['keyword']=$_SESSION['keyword'];
endif;
  
$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where . " Order by cr_site_address ";	

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


