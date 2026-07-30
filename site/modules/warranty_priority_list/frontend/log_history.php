<?php
$fwMainView = 'file:' . getcwd() . '/log_history.tpl';
$wa_project = $fwRequest->getParam('wa_project', '');

$wa_project = str_replace("%20", " ",$wa_project);
$fwViewData['wa_project'] = $wa_project;
	
$matsql = "select * from warranty_log where wa_project = '".$wa_project."'";
$userData = $fwDb->query($matsql);
	
	
if(!empty($userData))
{
if (!(isset($pagenum))){ $pagenum = 1; } 
    $rows = count($userData);
    $page_rows = 300;
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


foreach($listsnew as $k => $v2)
{
  
  $sq12= "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
         bus_customers.bcust_misc_moble from business_sellers 		
	     Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	     Inner Join business ON business_sellers.bs_business_id = business.bsn_id where business.bsn_name Like '%".$v2['wa_project']."%'";  
	
  $data = $fwDb->queryOne($sq12);
  
 					$dayscount='';
					$ccdate = $v2['wa_date'];
					if(!empty($ccdate)) {
					$Statusdate = changedate_y_m_d($ccdate);
					$curdate_y_m_d = date('Y-m-d');
					$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
					}
  
  $sql_t = "Select wa_id  from trade_responsibility where wa_log_number = ".$v2['wa_id'];
  $data_tr = $fwDb->queryOne($sql_t);
  
  
  $sqlenq = "Select we_answer from warranty_enquiry where we_wa_id = ".$v2['wa_id'];
  $ansdata = $fwDb->query($sqlenq);
  
  $sql_ud = "Select max(ws_date) as update_date from warranty_supplier_update where  ws_wa_id = ".$v2['wa_id'];
  $udData = $fwDb->queryOne($sql_ud);
  
  $sql_nt = "Select max(STR_TO_DATE(wn_date, '%d-%m-%Y' )) as notes_date from warranty_log_notes where wn_wa_id = ".$v2['wa_id']; 
  $ntdata = $fwDb->queryOne($sql_nt);
  	 

  $sql_nt2 = "Select max(ws_date) as notes_date2 from warranty_supplier_update where ws_wa_id = ".$v2['wa_id']; 
  $ntdata2 = $fwDb->queryOne($sql_nt2);
  
   
  if(strtotime($ntdata['notes_date']) > strtotime($ntdata2['notes_date2']))
     {
		 $ndate =  $ntdata['notes_date'];
	 }
	 else {
		  $ndate =  $ntdata2['notes_date2'];
	 }
  
	
   $sql100 = "select sa_co_id from supplier_warranty where sa_wa_id = ".$v2['wa_id'];
   $data100 = $fwDb->query($sql100);	 
	
	$red = 0; 
    foreach($data100 as $k10=>$v10)
	{
	    $sql101 = "Select se_co_id from supplier_email_warranty where se_co_id = ".$v10['sa_co_id']." and se_wa_id = ".$v2['wa_id'];
		$found = $fwDb->query($sql101);
		if(empty($found)) { $red = 1; }
				
	}
	 
	 
	 $setdata2[$k]['wa_id'] = $v2['wa_id'];
	 $setdata2[$k]['wa_project'] = stripslashes($v2['wa_project']);
	 $setdata2[$k]['wa_date'] = $v2['wa_date'];
	 $setdata2[$k]['wa_problem'] = $v2['wa_problem'];
	 $setdata2[$k]['wa_cgfb_person'] = $v2['wa_cgfb_person'];
	 $setdata2[$k]['wa_supplier'] = $v2['wa_supplier'];
	 $setdata2[$k]['wa_status'] = $v2['wa_status'];
	 $setdata2[$k]['wa_image_1'] = $v2['wa_image_1'];
	 $setdata2[$k]['wa_image_2'] = $v2['wa_image_2'];
	 $setdata2[$k]['wa_image_3'] = $v2['wa_image_3'];
	 $setdata2[$k]['wa_image_4'] = $v2['wa_image_4'];
	 $setdata2[$k]['wa_image_5'] = $v2['wa_image_5'];
	 $setdata2[$k]['wa_type'] = $v2['wa_type'];
	 $setdata2[$k]['wa_qicc'] = $v2['wa_qicc'];
	 $setdata2[$k]['wa_priority'] = $v2['wa_priority'];
	 $setdata2[$k]['wa_date_inspected'] = $v2['wa_date_inspected'];
	 $setdata2[$k]['wa_tenanted'] = $v2['wa_tenanted'];
	 $setdata2[$k]['bcust_fname'] = $data['bcust_fname'];
	 $setdata2[$k]['bcust_lname'] = $data['bcust_lname'];
	 $setdata2[$k]['bcust_misc_moble'] = $data['bcust_misc_moble'];
	 $setdata2[$k]['wa_com_close_letter'] = $v2['wa_com_close_letter'];
	 $setdata2[$k]['wa_video'] = $v2['wa_video'];
	 $setdata2[$k]['wa_user'] = $v2['wa_user'];
	 $setdata2[$k]['wa_resp_staff'] = $v2['wa_resp_staff'];
	 $setdata2[$k]['dayscount'] = $dayscount;
	 $setdata2[$k]['wa_include_supplier'] = $v2['wa_include_supplier'];
	 $setdata2[$k]['wa_status_date'] = $v2['wa_status_date'];
	 $setdata2[$k]['wa_selected'] = $red;
	 $setdata2[$k]['update_date'] = changedate_d_m_y($udData['update_date']);
	 $setdata2[$k]['notes_date']  = changedate_d_m_y($ndate);
	 $setdata2[$k]['wa_walkthrough_date'] = $v2['wa_walkthrough_date'];
	 
	 if(!empty($data_tr['wa_id'])) {  $setdata2[$k]['wa_button'] =  $data_tr['wa_id']; }
	 
	 $setdata2[$k]['enquiry_pen'] = 0;
	 foreach($ansdata as $k4=>$v4) {
		 if(strlen(trim($v4['we_answer'])) == 0 || $v4['we_answer'] == NULL) {
			 $setdata2[$k]['enquiry_pen'] = 1;
			 break;
		 }
	 }
	 $sql4 = "select count(*) as tot from warranty_supplier_update where ws_wa_id = ".$v2['wa_id'];
	$cudata = $fwDb->queryOne($sql4);	

	if($cudata['tot']> 0 ) {
		 $setdata2[$k]['supplier_upadate'] = true;	
	}
	  
	$setdata2[$k]['wa_lia_acc'] = $v2['wa_lia_acc'];  
}

$fwViewData['list'] = $setdata2;