<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('contact_update_form');

	$where = " WHERE 1 = 1 ";



$clear = $fwRequest->getParam('clear', '');
if($clear) {
	 $fwViewData['due_date']='';
}

$keyword = $fwRequest->getParam('keyword', '');
if($keyword):

	$where .= " AND phone_log.ph_name LIKE '%".$keyword."%' OR 
	            phone_log.ph_company LIKE '%".$keyword."%' OR 
                    phone_log.ph_user_created  LIKE '%".$keyword."%' OR 
		    phone_log.ph_steam  LIKE '%".$keyword."%'  ";
		    
	
	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword'] && $pagenum > 0):

	$where .= " AND phone_log.ph_name LIKE '%".$_SESSION['keyword']."%' OR 
	            phone_log.ph_company LIKE '%".$_SESSION['keyword']."% OR 
		    phone_log.ph_user_created 	 LIKE '%".$_SESSION['keyword']."%' OR 
		    phone_log.ph_steam LIKE '%".$_SESSION['keyword']."%' ";	
	
	$fwViewData['keyword']=$_SESSION['keyword'];
endif;
  
$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where;	


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



