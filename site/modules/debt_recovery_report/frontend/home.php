<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('debt_recovery_report');

$where = " WHERE 1 = 1";

$hidden = $fwRequest->getParam('hidden', '');
	if(!empty($hidden)) {
	$where = " WHERE 1 = 1";	
}

 	$clear = $fwRequest->getParam('clear', '');
			if(!empty($clear)) {
			    unset($_SESSION['address']);
				$where = " where 1 = 1";	
		}


$sent_to_client = $fwRequest->getParam('sent_to_client', '');
if($sent_to_client)
{
		
	 $keys_2 = array_keys($sent_to_client);
	 $ky_2 = $keys_2[0];
	 $val_2 = $sent_to_client[$ky_2];
	
	  $detail['dr_send_to_client'] = $val_2;
	  $detail['dr_send_to_client_date'] = date('d-m-Y');
	  $detail['dr_send_to_client_user'] = $_SESSION['user']['user_name'];
	  $table->setWhere("dr_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}


//$ord =  " ORDER BY if(  dr_call_date  = ' '
       //  OR dr_call_date  IS NULL , 1, 0 ) , STR_TO_DATE( dr_call_date, '%d-%m-%Y' ) DESC";

$ord = " Order by dr_id DESC ";

$address = $fwRequest->getParam('address', '');
if($address):

	$where .= " AND debt_recovery_report.dr_project_address LIKE '%".$address."%'";
		
	$_SESSION['address'] = $address;
	$fwViewData['address']=$_SESSION['address'];

elseif($_SESSION['address'] ):

	$where .= " AND debt_recovery_report.dr_project_address LIKE '%".$_SESSION['address']."%' ";	
	
	$fwViewData['address']=$_SESSION['address'];
endif;
  
  
 
$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE .' '.$where . $ord;	

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


foreach($listsnew as $k=>$v)
{
    $sql_1 = "select bsn_id from business where bsn_name='".$v['dr_project_address']."'";	
    $data = $fwDb->queryOne($sql_1);
    
    $link = BASE_URL."business.detail/bsn_id/".$data['bsn_id'];
	
	$sql_2 = "select bcust_fname, bcust_lname , bcust_misc_moble from business_sellers 
	          Inner Join business on business_sellers.bs_business_id = business.bsn_id
			  Inner Join bus_customers on business_sellers.bs_customers_id  = bus_customers.bcust_id
			  where business_sellers.bs_business_id = ".$data['bsn_id'];
	$data_2 = $fwDb->queryOne($sql_2);
	

		
	$listsnew[$k]['link'] = $link;
	$listsnew[$k]['customer'] = $data_2['bcust_fname']. ' '.$data_2['bcust_lname'];
	$listsnew[$k]['phone'] = $data_2['bcust_misc_moble'];
	
}

$fwViewData['list'] = $listsnew;

$fwViewData['title'] = $MODULE_PLURAL;

$sql2 = "SELECT  * from  debt_recovery_call_result";
$fwViewData['resultdetail'] = $fwDb->query($sql2);



