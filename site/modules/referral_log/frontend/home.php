<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$listdata = $fwRequest->getParam($TABLE, array());
$table = new Fw_Db_Table('referral_log');


$hide = $fwRequest->getParam('hide', '');
if($hide)
{
	 $keys_2 = array_keys($hide);
	 $ky_2 = $keys_2[0];
	 $val_2 = $hide[$ky_2];
	
	  $detail['rl_hide'] = $val_2;

	  $table->setWhere("rl_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}

$where = " WHERE rl_hide = 0 ";


$showall = $fwRequest->getParam('showall', '');
if(!empty($showall)) {
$where = " WHERE 1=1 ";	
}

$ord =  " ORDER BY if(rl_date = ' '
         OR rl_date IS NULL , 1, 0 ) , STR_TO_DATE(rl_date, '%d-%m-%Y' ) DESC";	

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