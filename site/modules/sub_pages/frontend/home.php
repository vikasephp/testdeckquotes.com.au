<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('sub_pages');

$where = " WHERE 1 = 1";
//$where = " WHERE cb_hide = 0 ";

$hidden = $fwRequest->getParam('hidden', '');
	if(!empty($hidden)) {
	$where = " WHERE 1 = 1";	
}


$clear = $fwRequest->getParam('clear', '');
if($clear) {
	 $fwViewData['due_date']='';
}


$update_req = $fwRequest->getParam('update_req', '');
if($update_req)
{
	 $keys_2 = array_keys($update_req);
	 $ky_2 = $keys_2[0];
	 $val_2 = $update_req[$ky_2];
	
	  $detail['sp_update_required'] = $val_2;
	  $detail['sp_update_req_date'] = date('d-m-Y');
	  $detail['sp_update_req_user'] = $_SESSION['user']['user_name'];
	  $table->setWhere("sp_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}


$qd = $fwRequest->getParam('qd', '');
if($qd)
{
	 $keys_2 = array_keys($qd);
	 $ky_2 = $keys_2[0];
	 $val_2 = $qd[$ky_2];
	
	  $detail['sp_qd'] = $val_2;
	  $detail['sp_qd_user'] = $_SESSION['user']['user_name'];
	  $table->setWhere("sp_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}

//$ord =  " ORDER BY if(  zm_meeting_date  = ' '
      //    OR zm_meeting_date  IS NULL , 1, 0 ) , STR_TO_DATE( zm_meeting_date, '%d-%m-%Y' ) DESC";

//$keyword = $fwRequest->getParam('keyword', '');
//if($keyword):
//
//	$where .= " AND phone_log.ph_name LIKE '%".$keyword."%' OR 
//	            phone_log.ph_company LIKE '%".$keyword."%' OR 
//                    phone_log.ph_user_created  LIKE '%".$keyword."%' OR 
//		    phone_log.ph_steam  LIKE '%".$keyword."%'  ";
//		    
//	
//	$_SESSION['keyword'] = $keyword;
//	$fwViewData['keyword']=$_SESSION['keyword'];
//
//elseif($_SESSION['keyword'] && $pagenum > 0):
//
//	$where .= " AND phone_log.ph_name LIKE '%".$_SESSION['keyword']."%' OR 
//	            phone_log.ph_company LIKE '%".$_SESSION['keyword']."% OR 
//		    phone_log.ph_user_created 	 LIKE '%".$_SESSION['keyword']."%' OR 
//		    phone_log.ph_steam LIKE '%".$_SESSION['keyword']."%' ";	
//	
//	$fwViewData['keyword']=$_SESSION['keyword'];
//endif;
  
  
  $status = $fwRequest->getParam('status', '');
	   
	   if($status): {
		    $where .= " AND sub_pages.sp_status   = ".$status;
		    $fwViewData['status']= $status;
			$_SESSION['status'] =  $status;
	    }
	   elseif($_SESSION['status'] ):

		$where .= " AND sub_pages.sp_status = " .$_SESSION['status'];
		$fwViewData['status']=$_SESSION['status'];
       endif;

		$clear = $fwRequest->getParam('clear', '');
			if(!empty($clear)) {
			unset($fwViewData['status']);
			unset($_SESSION['status']);	
			$where = " where 1 = 1";	
		} 
  
  
$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE .' '.$where ;	

if($matsql){$userData = $fwDb->query($matsql);}

$fwViewData['total'] = sizeof($userData);

if(!empty($userData))
{
if (!(isset($pagenum))){ $pagenum = 1; } 
    $rows = count($userData);
    $page_rows = 200;
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

$sqlT = "Select * from sub_pages_www ";
$fwViewData['wwwData'] = $fwDb->query($sqlT);

$sqlS = "Select * from sub_pages_status ";
$fwViewData['statusData'] = $fwDb->query($sqlS);



