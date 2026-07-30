<?php
$pagenum = $fwRequest->getparam('pagenum','');

$keyword = $fwRequest->getParam('keyword', '');

$where = "WHERE 1=1 ";

$fwViewData['ran'] =  rand(100000,999999);



	
if($keyword):
$where .= "AND business.bsn_sub_status LIKE '%".$keyword."%'";
	
	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword'] && $pagenum > 0):

	$where .= "AND business.bsn_sub_status LIKE '%".$_SESSION['keyword']."%'";
	
	$fwViewData['keyword']=$_SESSION['keyword'];
endif;
   
if(empty($pagenum))
	{
	unset($_SESSION['last_tdsql']);
	}
		


$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
		bus_customers.bcust_misc_email1,bus_customers.bcust_misc_email2,bus_customers.bcust_misc_moble,bus_customers.bcust_misc_business,
		bus_customers.bcust_misc_home,business.bsn_advert_text,
        business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status_sys_date, business.bsn_address
		from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where. " 
		And  business.bsn_status like '%|3|%' Order By business.bsn_status_sys_date DESC";



if($sql){$userData = $fwDb->query($sql);}



$fwViewData['total'] = sizeof($userData);

if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

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
	$numstartvounter =  $page_rows * ($pagenum-1) + 1;
	$fwViewData['numstartvounter'] = $numstartvounter;
		
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
    
    $sql2 =  $sql." ".$max;

if($sql2)
{  

 $setdata = $fwDb->query($sql2);
 
foreach($setdata as $k => $v)
{
		$sqla = "Select document_check_list.* from document_check_list
			      where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 64";
		$data = $fwDb->queryOne($sqla);
		$link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$v['bsn_id'];	
		
		
					$ccdate = $v['bsn_status_sys_date'];
					$Statusdate = changedate_y_m_d($ccdate);
					$curdate_y_m_d = date('Y-m-d');
					$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
				   
				
		
		
		// Uid 555 starts
				
				$sqluid555 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 555";
		     	$data555 = $fwDb->queryOne($sqluid555);
		
		// Uid 555 ends
		
		
		// Uid 474 starts
				
				$sqluid474 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 474";
		     	$data474 = $fwDb->queryOne($sqluid474);
		
		// Uid 474 ends
		
		
		// Uid 312 starts
				
				$sqluid312 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 312";
				$data312 = $fwDb->queryOne($sqluid312);
	
		// Uid 312 ends
		
		
		// Uid 301 starts
				
				$sqluid301 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 301";
				$data301 = $fwDb->queryOne($sqluid301);
	
		// Uid 301 ends
		
		// Uid 330 starts
				
				$sqluid330 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 330";
				$data330 = $fwDb->queryOne($sqluid330);
	
		// Uid 330 ends
		
		
		// Uid 369 starts
				
				$sqluid369 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 369";
				$data369 = $fwDb->queryOne($sqluid369);
	
		// Uid 369 ends
		
		
		// Uid 340 starts
				
				$sqluid340 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 340";
				$data340 = $fwDb->queryOne($sqluid340);
	
		// Uid 340 ends
		
		// Uid 40 planning assessment report
				
			$sql44 = "Select document_check_list.* from document_check_list
			          where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 44";
			$data44 = $fwDb->queryOne($sql44);
				
		// Uid 40 ends
		
		
		// Phone follow ups
		
		 $sfu = "Select count(*) as tot from  sales_followup where sf_pid = ".$v['bsn_id'];
         $sfData = $fwDb->queryOne($sfu);
				
		//
		
		// Last follow up date
		
		 $lfd = "Select max(sf_date) as last_followup_date from  sales_followup where sf_pid = ".$v['bsn_id'];
         $lfdData = $fwDb->queryOne($lfd);
		// Last follow up date ends
		
		
		// Uid 45 Signed Design Agreement
				
			$sql45 = "Select document_check_list.* from document_check_list
			          where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 45";
			$data45 = $fwDb->queryOne($sql45);
				
		// Uid 45 ends
		
		// Uid 2 need analysis survey support
				
			$sql2 = "Select document_check_list.* from document_check_list
			         where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 2";
			$data2 = $fwDb->queryOne($sql2);
				
		// Uid 2 ends
		
		
		// Uid 302 starts
				
				$sqluid302 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 302";
		     	$data302 = $fwDb->queryOne($sqluid302);
		
		// Uid 302ends
		
		
		$setdata2[$k]['bsn_id'] = $v['bsn_id'];
		$setdata2[$k]['bsn_address'] = $v['bsn_address'];
		$setdata2[$k]['hia_sign_date'] = changedate_d_m_y($ccdate);
		$setdata2[$k]['link'] = $link;
		$setdata2[$k]['status'] = $v['bsn_sub_status'];
		$setdata2[$k]['dayscount'] = $dayscount;
		$setdata2[$k]['budget'] = $v['bsn_advert_text'];
		
		$setdata2[$k]['uid555complete'] = $data555['bt_complete'];
		$setdata2[$k]['uid555'] = $data555['bt_completed_date'];
		
		$setdata2[$k]['uid474complete'] = $data474['bt_complete'];
		$setdata2[$k]['uid474'] = $data474['bt_completed_date'];
		
		$setdata2[$k]['uid312complete'] = $data312['bt_complete'];
		$setdata2[$k]['uid312'] = $data312['bt_completed_date'];
		
		$setdata2[$k]['uid301complete'] = $data301['bt_complete'];
		$setdata2[$k]['uid301'] = $data301['bt_completed_date'];
		
		
		$setdata2[$k]['uid330complete'] = $data330['bt_complete'];
		$setdata2[$k]['uid330'] = $data330['bt_completed_date'];
		
		
		$setdata2[$k]['uid369complete'] = $data369['bt_complete'];
		$setdata2[$k]['uid369'] = $data369['bt_completed_date'];
		
		$setdata2[$k]['uid340complete'] = $data340['bt_complete'];
		$setdata2[$k]['uid340'] = $data340['bt_completed_date'];
		
		$setdata2[$k]['checklist44'] = $data44['doc_file_name'];
		
		$setdata2[$k]['salesfolloup'] = $sfData['tot'];
		$setdata2[$k]['lastfoldt'] = $lfdData['last_followup_date'];
		
		$setdata2[$k]['checklist45'] = $data45['doc_file_name'];
		
		$setdata2[$k]['checklist2'] = $data2['doc_file_name'];
		
		if($data302['bt_complete'] == 1) {
			$setdata2[$k]['boxsent'] = $data302['bt_completed_date'];	
		}
		
		$setdata2[$k]['bcust_fname'] = $v['bcust_fname'];
		$setdata2[$k]['bcust_lname'] = $v['bcust_lname'];
		
		$setdata2[$k]['bcust_misc_email1'] = $v['bcust_misc_email1'];
		$setdata2[$k]['bcust_misc_email2'] = $v['bcust_misc_email2'];
		$setdata2[$k]['bcust_misc_moble'] = $v['bcust_misc_moble'];
		$setdata2[$k]['bcust_misc_business'] = $v['bcust_misc_business'];
		$setdata2[$k]['bcust_misc_home'] = $v['bcust_misc_home'];
		
}
 
 
 
 	$fwViewData['list'] =  $setdata2;
	
	$report = new Fw_Db_Table('report_construction');
		$report->setWhere("1=1");
		$report->deleteRows();
	
		foreach($setdata2 as $rk => $rv)
		{
			if(!empty($rv['bsn_id'])) {
				$detailrp['re_bsn_id'] = $rv['bsn_id'];
				$this_id = $report->insertRow($detailrp);
			}
		}

 }
}

//$_SESSION['last_sql'] = $sql;
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Construction Report";