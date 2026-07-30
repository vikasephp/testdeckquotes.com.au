<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$listdata = $fwRequest->getParam($TABLE, array());
$table = new Fw_Db_Table('trade_responsibility');
  
$matsql = "SELECT * from supplier_warranty order by sa_wa_id" ;	

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


foreach($listsnew as $k => $v1)
{

   $sql1 = "Select * from warranty_log where wa_id = ".$v1['sa_wa_id'];
   $wadata = $fwDb->queryOne($sql1);

  
  $sq12 = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
         bus_customers.bcust_misc_moble
	 from business_sellers 		
	 Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	 Inner Join business ON business_sellers.bs_business_id = business.bsn_id where business.bsn_name = '".$wadata['wa_project']."'";  
	
	  $data = $fwDb->queryOne($sq12);
 	
	 $setdata2[$k]['sa_id'] = $v1['sa_id'];	 
	 $setdata2[$k]['wa_id'] = $wadata['wa_id'];
	 $setdata2[$k]['wa_log_number'] = $wadata['wa_log_number'];
	 $setdata2[$k]['wa_project'] = $wadata['wa_project'];
	 $setdata2[$k]['wa_date'] = $wadata['wa_date'];
	 $setdata2[$k]['wa_problem'] = $wadata['wa_problem'];
	 $setdata2[$k]['wa_cgfb_person'] = $wadata['wa_cgfb_person'];
	 $setdata2[$k]['wa_supplier'] = $wadata['wa_supplier'];
	 $setdata2[$k]['wa_status'] = $wadata['wa_status'];
	 $setdata2[$k]['wa_image_1'] = $wadata['wa_image_1'];
	 $setdata2[$k]['wa_image_2'] = $wadata['wa_image_2'];
	 $setdata2[$k]['wa_image_3'] = $wadata['wa_image_3'];
	 $setdata2[$k]['wa_image_4'] = $wadata['wa_image_4'];
	  
	 $setdata2[$k]['wa_image_5'] = $wadata['wa_image_5'];
	 $setdata2[$k]['wa_notes'] = $wadata['wa_notes'];
	  
	 $setdata2[$k]['wa_type'] = $wadata['wa_type'];
	 $setdata2[$k]['wa_qicc'] = $wadata['wa_qicc'];
	 $setdata2[$k]['wa_priority'] = $wadata['wa_priority'];
	  
	  $setdata2[$k]['wa_date_inspected'] = $wadata['wa_date_inspected'];
	  $setdata2[$k]['wa_tenanted'] = $wadata['wa_tenanted'];
	  
	  $setdata2[$k]['bcust_fname'] = $data['bcust_fname'];
	  $setdata2[$k]['bcust_lname'] = $data['bcust_lname'];
	  $setdata2[$k]['bcust_misc_moble'] = $data['bcust_misc_moble'];
	  $setdata2[$k]['wa_com_close_letter'] = $wadata['wa_com_close_letter'];
	  $setdata2[$k]['wa_video'] = $wadata['wa_video'];
	  $setdata2[$k]['wa_user'] = $wadata['wa_user'];
	  
	   $setdata2[$k]['wa_who'] = $wadata['wa_who'];
	   $setdata2[$k]['wa_accepted_resp'] = $wadata['wa_accepted_resp']; 
	   $setdata2[$k]['wa_value'] = $wadata['wa_value']; 
	   $setdata2[$k]['wa_who_will_do'] = $wadata['wa_who_will_do'];  
	   $setdata2[$k]['wa_credit_note'] = $wadata['wa_credit_note']; 
	   $setdata2[$k]['wa_trades'] = $v1['sa_supplier'];
	   
	   $setdata2[$k]['sa_tr_accepted_res'] = $v1['sa_tr_accepted_res'];
	   $setdata2[$k]['sa_tr_value'] = $v1['sa_tr_value'];
	   $setdata2[$k]['sa_tr_who_will'] = $v1['sa_tr_who_will'];
	  
	     
	  
}

$fwViewData['list'] = $setdata2;
$fwViewData['title'] = $MODULE_PLURAL;

 		
$sqlpr = "Select * from warranty_log_priority";
$fwViewData['prdetail'] = $fwDb->query($sqlpr); 


$thisTable = new Fw_Db_Table("warranty_log_type");

$fwViewData['typedetail'] = $thisTable->getAllRows(); 