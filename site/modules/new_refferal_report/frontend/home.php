<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$listdata = $fwRequest->getParam($TABLE, array());
$table = new Fw_Db_Table('new_referral_report');

$where = " where rr_hide = 0 ";
//$keyword = $listdata['keyword'];
//$where = "WHERE wa_status = 'Open' ";
//
//$submit = $fwRequest->getParam('openclose', '');
//if(!empty($submit)) {
//$where = "WHERE 1=1";	
//}
//
//$sort_date = $fwRequest->getParam('sort_date', '');
//if(!empty($sort_date)) {
//$ord =  " ORDER BY if(  warranty_log.wa_date = ' '
//         OR warranty_log.wa_date IS NULL , 1, 0 ) , STR_TO_DATE( warranty_log.wa_date, '%d-%m-%Y' ) DESC";	
//}
//  
//  
//$sort_proj = $fwRequest->getParam('sort_proj', '');
//if(!empty($sort_proj)) {
//$ord =  " ORDER BY  warranty_log.wa_project ";	
//}
//    
  
$we_have = $fwRequest->getParam('we_have', '');
if($we_have)
{
	 $keys_1 = array_keys($we_have);
	 $ky_1 = $keys_1[0];
	 $val_1 = $we_have[$ky_1];
	
	  $detail_1['rr_have_online_referal'] = $val_1;
	  $detail_1['rr_online_referal_user'] = $_SESSION['user']['user_name'];
	  $detail_1['rr_online_referal_date'] = date('d-m-Y');
	  $table->setWhere("rr_id = ".$ky_1);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail_1);
	  }	  	
}


  
$gift = $fwRequest->getParam('gift', '');
if($gift)
{
	 $keys_2 = array_keys($gift);
	 $ky_2 = $keys_2[0];
	 $val_2 = $gift[$ky_2];
	
	  $detail_2['rr_gift_courier'] = $val_2;
	  $detail_2['rr_gift_courier_user'] = $_SESSION['user']['user_name'];
	  $detail_2['rr_gift_courier_date'] = date('d-m-Y');
	
	  $table->setWhere("rr_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail_2);
	  }	  	
} 
  
 $hide = $fwRequest->getParam('hide', '');
if($hide)
{
	 $keys_3 = array_keys($hide);
	 $ky_3 = $keys_3[0];
	 $val_3 = $hide[$ky_3];
	
	  $detail['rr_hide'] = $val_3;
	  $table->setWhere("rr_id = ".$ky_3);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
} 
  
  $hidden = $fwRequest->getParam('hidden', ''); 
  
  if(!empty($hidden)) {
	$where = " where 1 = 1 ";  
  }
  
$ord = ' Order by rr_id DESC';  
$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where .' ' .$ord;	

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


//foreach($listsnew as $k => $v2)
//{
//
//  
//  $sq12= "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
//         bus_customers.bcust_misc_moble
//	 from business_sellers 		
//	 Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
//	 Inner Join business ON business_sellers.bs_business_id = business.bsn_id where business.bsn_name = '".$v2['wa_project']."'";  
//	
//	  $data = $fwDb->queryOne($sq12);
// 	
//	 
//	 $setdata2[$k]['wa_id'] = $v2['wa_id'];
//	 $setdata2[$k]['wa_project'] = $v2['wa_project'];
//	 $setdata2[$k]['wa_date'] = $v2['wa_date'];
//	 $setdata2[$k]['wa_problem'] = $v2['wa_problem'];
//	 $setdata2[$k]['wa_cgfb_person'] = $v2['wa_cgfb_person'];
//
//}

//$fwViewData['list'] = $setdata2;
$fwViewData['title'] = $MODULE_PLURAL;