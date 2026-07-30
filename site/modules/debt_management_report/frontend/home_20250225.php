<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('debt_management');

$where = " WHERE 1 = 1";

$hidden = $fwRequest->getParam('hidden', '');
	if(!empty($hidden)) {
	$where = " WHERE 1 = 1";	
}


$clear = $fwRequest->getParam('clear', '');
if($clear) {
	 $fwViewData['due_date']='';
}


$first_email = $fwRequest->getParam('first_email', '');
if($first_email)
{
	 $keys_1 = array_keys($first_email);
	 $ky_1 = $keys_1[0];
	 $val_1 = $first_email[$ky_1];
	
	  $detail['dm_first_email'] = $val_1;

	  $table->setWhere("dm_id = ".$ky_1);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}


$second_email = $fwRequest->getParam('second_email', '');
if($second_email)
{
	 $keys_2 = array_keys($second_email);
	 $ky_2 = $keys_2[0];
	 $val_2 = $second_email[$ky_2];
	
	  $detail['dm_second_email'] = $val_2;

	  $table->setWhere("dm_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}
  $where = " WHERE 1 = 1";
  $status = $fwRequest->getParam('status', '');
	   
	   if($status): {
		    $where .= " AND debt_management.dm_status   = '".$status."'";
		    $fwViewData['status']= $status;
			$_SESSION['status'] =  $status;
	    }
	   elseif($_SESSION['status'] ):

			$where .= " AND debt_management.dm_status = '" .$_SESSION['status']."'";
			$fwViewData['status']=$_SESSION['status'];
		
       endif;

	$clear = $fwRequest->getParam('clear', '');
		if(!empty($clear)) {
		unset($fwViewData['status']);
		unset($_SESSION['status']);	
		$where = " where 1 = 1";	
	} 
  


$phone_call = $fwRequest->getParam('phone_call', '');
if($phone_call)
{
	 $keys_3 = array_keys($phone_call);
	 $ky_3 = $keys_3[0];
	 $val_3 = $phone_call[$ky_3];
	
	  $detail['dm_phone_call'] = $val_3;

	  $table->setWhere("dm_id = ".$ky_3);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}

$ord =  " ORDER BY if(  dm_next_contact_date 	  = ' '
       OR dm_next_contact_date 	  IS NULL , 1, 0 ) , STR_TO_DATE( dm_next_contact_date 	, '%d-%m-%Y' ) ";

$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE ." ".$where. " ".$ord  ;	

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





