<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('cancelled_par_report');

$where = " WHERE cp_rebooking = 0";
//$where = " WHERE cb_hide = 0 ";

$showall = $fwRequest->getParam('showall', '');
	if(!empty($showall)) {
	$where = " WHERE 1 = 1";	
}


$clear = $fwRequest->getParam('clear', '');
if($clear) {
	 $fwViewData['due_date']='';
}


$escalation = $fwRequest->getParam('escalation', '');
if ($escalation) {
	$keys_2 = array_keys($escalation);
	$ky_2 = $keys_2[0];
	$val_2 = $escalation[$ky_2];

	$detail['cp_escalation_required'] = $val_2;
	$detail['cp_esc_req_dt'] = date('d-m-Y');
	$detail['cp_esc_req_usr'] = $_SESSION['user']['user_name'];
	  
	$table->setWhere("cp_id = " . $ky_2);
	if ($table->rowExists()) {
		$this_id = $table->updateRow($detail);
	}
}

$rebooking = $fwRequest->getParam('rebooking', '');
if($rebooking)
{
	 $keys_2 = array_keys($rebooking);
	 $ky_2 = $keys_2[0];
	 $val_2 = $rebooking[$ky_2];
	
	  $detail['cp_rebooking'] = $val_2;
	  $detail['cp_rebooking_date'] = date('d-m-Y');
	  $detail['cp_rebooking_user'] = $_SESSION['user']['user_name'];
	  $table->setWhere("cp_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}

$contact_status = $fwRequest->getParam('contact_status', '');
if($contact_status)
{
	 $keys_2 = array_keys($contact_status);
	 $ky_2 = $keys_2[0];
	 $val_2 = $contact_status[$ky_2];
	
	  $detail['cp_contact_status'] = $val_2;
	  $detail['cp_contact_status_dt'] = date('d-m-Y');
	  $detail['cp_contact_status_usr'] = $_SESSION['user']['user_name'];
	  $table->setWhere("cp_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}




   $search_project = $fwRequest->getParam('project_name', '');

  if($search_project):
    
       $where .= " AND cp_project_name  LIKE '%".$search_project."%'  ";
       $_SESSION['search_project'] = $search_project;
       $fwViewData['search_project']=$_SESSION['search_project'];

  elseif($_SESSION['search_project'] && $pagenum > 0):
		
       $where .= " AND cp_project_name LIKE  '%".$_SESSION['search_project']."%' ";
       $fwViewData['search_project']=$_SESSION['search_project'];
	
  endif;
  
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

foreach($listsnew as $k => $v)
{
	$sql = 'SELECT  bsn_id from business where bsn_name = "'.$v['cp_project_name'].'"';
    $bsid = $fwDb->queryOne($sql);
	
	$sql2 = "select bcust_fname, bcust_lname from business_sellers
	         Inner join bus_customers on business_sellers.bs_customers_id = bus_customers.bcust_id
			 Inner join business on  business_sellers.bs_business_id = business.bsn_id 
			 where business_sellers.bs_business_id = ".$bsid['bsn_id'];
	
			 
	 $cust = $fwDb->queryOne($sql2);	
	
	$listsnew[$k]['bcust_fname'] = $cust['bcust_fname'];
	$listsnew[$k]['bcust_lname'] = $cust['bcust_lname'];	 
}

$fwViewData['list'] = $listsnew;

$fwViewData['title'] = $MODULE_PLURAL;

$sql = "SELECT  bsn_name from business where bsn_sub_status = 'Open'";
$fwViewData['projdetail'] = $fwDb->query($sql);