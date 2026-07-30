<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$tablebs = new Fw_Db_Table('business_sellers');
$written = $fwRequest->getParam('written', '');
$gift = $fwRequest->getParam('gift', '');

// Save Comm Date 
$comm_date = $fwRequest->getParam('bs_cr_comm_date', '');
if(!empty($comm_date)) {
	$save_comm = $fwRequest->getParam('bs_cr_comm_date', '');
	
	foreach($save_comm as $kc=>$vc)
	{
		$commDetail['bs_cr_comm_date'] = $vc;
	
		$tablebs->setWhere('bs_business_id = '.$kc);
		$detail = $tablebs->updateRow($commDetail);		
	}
}
//End Comm Date 


$savedata = $fwRequest->getParam('savedata', '');
if($savedata) { 

if($_FILES['profit_loss'])
		{
			
			$bs_business_id = $fwRequest->getParam('bs_business_id', '');
			
						$doc1 = $_FILES['profit_loss']['name'];
						$file_type = $_FILES['profit_loss']['type'];	
						
										
						$datetime = trim(date('d_m_Y_H_i_'),'0');
						$doc1 = preg_replace('/[^A-Z0-9._]/i', '_', $doc1);
						$src =  $_FILES['profit_loss']['tmp_name']; 
						
						upload($doc1, $src);
						$plData['bs_profit_loss_excel'] = $doc1;
						
							
							$tablebs->setWhere('bs_business_id = '.$bs_business_id);
							if($tablebs->rowExists())
							{
								
								$detail = $tablebs->updateRow($plData);	
							}		
					}
}


$uploadletter = $fwRequest->getParam('uploadletter', '');
if($uploadletter)
 { 
        $bs_business_id = $fwRequest->getParam('bs_business_id', '');
	
	
        if($_FILES['upload_letter'])
		{
			
				$doc1 = $_FILES['upload_letter']['name'];
				$file_type = $_FILES['upload_letter']['type'];	
				
								
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$doc1 = preg_replace('/[^A-Z0-9._]/i', '_', $doc1);
				$src =  $_FILES['upload_letter']['tmp_name']; 
				
				upload($doc1, $src);
				$plData['bs_comm_30day_letter'] = $doc1;	
					

				
					$tablebs->setWhere('bs_business_id = '.$bs_business_id);
					if($tablebs->rowExists())
					{
						
						$detail = $tablebs->updateRow($plData);	
					}		
		}
}

$save1 = $fwRequest->getParam('save1', '');
if(!empty($save1))
{
	$video1 = $fwRequest->getParam('onlinepackage', '');	
	foreach($video1 as $k2 => $v2)
	{
	  $vdetail_1['bs_comp_compl_pkg'] = $v2;	
	  $tablebs->setWhere('bs_business_id = '.$k2);
	  if($tablebs->rowExists())
	  {
		$this_id = $tablebs->updateRow($vdetail_1);  
	  }
	}
}


$save2 = $fwRequest->getParam('save2', '');
if(!empty($save2))
{
	$video2 = $fwRequest->getParam('video', '');	
	foreach($video2 as $k2 => $v2)
	{
	  $vdetail_2['bc_ptt_letter'] = $v2;	
	  $tablebs->setWhere('bs_business_id = '.$k2);
	  if($tablebs->rowExists())
	  {
		$this_id = $tablebs->updateRow($vdetail_2);  
	  }
	}
}

$save3 = $fwRequest->getParam('save3', '');
if(!empty($save3))
{
	$video3 = $fwRequest->getParam('testimonialvideo', '');	
	foreach($video3 as $k2 => $v2)
	{
	  $vdetail_3['bs_testimonial_video'] = $v2;	
	  $tablebs->setWhere('bs_business_id = '.$k2);
	  if($tablebs->rowExists())
	  {
		$this_id = $tablebs->updateRow($vdetail_3);  
	  }
	}
}

if(!empty($written))
{
	 $dt1 = date('d-m-Y');
	 foreach($written as $kw=>$vw)
         {
	  $bsid = $kw; 
	  $value = $vw;
         }
	 
	 $detail['bc_cr_wt_yn'] = $value;
	 $detail['bc_cr_wt_yn_date'] = $dt1;

	 
	 $tablebs->setWhere('bs_business_id = '.$bsid);
	  if($tablebs->rowExists())
	  {
		$this_id = $tablebs->updateRow($detail);  
	  }
}

if(!empty($gift))
{
	
	  $dt2 = date('d-m-Y');
	
	 foreach($gift as $kg=>$vg)
         {
	  $bsidg = $kg; 
	  $valueg = $vg;
         }
	 
	 $detail['bc_cr_gift_yn'] = $valueg;
	 $detail['bc_cr_gift_yn_date'] = $dt2;

	 
	 $tablebs->setWhere('bs_business_id = '.$bsidg);
	  if($tablebs->rowExists())
	  {
		$this_id = $tablebs->updateRow($detail);  
	  }
}




$where = "WHERE 1=1 ";
$fwViewData['ran'] =  rand(100000,999999);
$keyword = $fwRequest->getParam('keyword', '');
	
if($keyword):
$where .= "AND business.bsn_name LIKE '%".$keyword."%'";
	
	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword'] && $pagenum > 0):

	$where .= "AND business.bsn_name LIKE '%".$_SESSION['keyword']."%'";
	
	$fwViewData['keyword']=$_SESSION['keyword'];
endif;
   
if(empty($pagenum))
	{
	unset($_SESSION['last_tdsql']);
	}
		


$ord =  " ORDER BY  if(  business_sellers.bs_cr_comm_date = ' '
OR business_sellers.bs_cr_comm_date IS NULL , 1, 0 ) desc , STR_TO_DATE( business_sellers.bs_cr_comm_date, '%d-%m-%Y' ) desc ";


$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        bus_customers.bcust_misc_email1, business.bsn_advert_text, business.bsn_id, business.bsn_name,business.bsn_sub_status,
        business.bsn_status_sys_date, business.bsn_address, business_sellers.bc_cr_wt_yn, business_sellers.bc_cr_wt_yn_date,
	business_sellers.bc_cr_gift_yn, business_sellers.bc_cr_gift_yn_date, business_sellers.bc_ptt_letter,
	business_sellers.bs_profit_loss_excel, business_sellers.bs_cr_comm_date, business_sellers.bs_comp_compl_pkg,
	business_sellers.bs_comm_30day_letter , business_sellers.bs_comp_phy_pkg, business_sellers.bs_comm_60day_letter,
	business_sellers.bs_testimonial_video, business_sellers.bs_google_review, business_sellers.bs_written_testimonial, 
	business_sellers.bs_365_letter, business_sellers.bs_365_conversation, business_sellers.bs_365_gift,
	business_sellers.bs_cr_design_no, business_sellers.bs_cr_video_qa
	from business_sellers 		
	Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where. " 
	And ( business.bsn_status like '%|4|%' Or business.bsn_addto_complete = 1 or  business_sellers.bs_moveto_complete = 1) Group by business.bsn_id ". $ord;
	
	//Order By business.bsn_status_sys_date DESC";

 
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
		$link = BASE_URL. "business.detail/bsn_id/".$v['bsn_id'];	
		
		$ccdate = $v['bsn_status_sys_date'];
		$Statusdate = changedate_y_m_d($ccdate);
		$curdate_y_m_d = date('Y-m-d');
		$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
				   
				
		$sqluid556 = "Select business_tasks.* from business_tasks
		              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 556";
		$data556 = $fwDb->queryOne($sqluid556);
				
		$sqluid557 = "Select business_tasks.* from business_tasks
		              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 557";
		$data557= $fwDb->queryOne($sqluid557);

				
		$sqluid558 = "Select business_tasks.* from business_tasks
			      where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 558";
		$data558 = $fwDb->queryOne($sqluid558);
	
				
		$sqluid560 = "Select business_tasks.* from business_tasks
			      where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 560";
		$data560 = $fwDb->queryOne($sqluid560);
	
			
		$sqluid559 = "Select business_tasks.* from business_tasks
			      where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 559";
		$data559 = $fwDb->queryOne($sqluid559);
	
	
				
		$sql431 = "Select document_check_list.* from document_check_list
			  where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 431";
		$data431 = $fwDb->queryOne($sql431);
		
		$sql432 = "Select document_check_list.* from document_check_list
			  where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 432";
		$data432 = $fwDb->queryOne($sql432);		
	
	
	
		$sql142 = "Select document_check_list.* from document_check_list
			  where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 142";
		$data142 = $fwDb->queryOne($sql142);
	
	
	
		$sqluid561 = "Select business_tasks.* from business_tasks
			      where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 561";
		$data561 = $fwDb->queryOne($sqluid561);
		
		$sqluid562 = "Select business_tasks.* from business_tasks
			      where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 562";
		$data562 = $fwDb->queryOne($sqluid562);
		
		
		$setdata2[$k]['bs_business_id'] = $v['bs_business_id'];
		$setdata2[$k]['bsn_id'] = $v['bsn_id'];
		$setdata2[$k]['bsn_address'] = $v['bsn_address'];
		$setdata2[$k]['bcust_fname'] = $v['bcust_fname'];
		$setdata2[$k]['bcust_lname'] = $v['bcust_lname'];
		$setdata2[$k]['hia_sign_date'] = changedate_d_m_y($ccdate);
		$setdata2[$k]['link'] = $link;
		$setdata2[$k]['status'] = $v['bsn_sub_status'];
		$setdata2[$k]['dayscount'] = $dayscount;
		
		
		$setdata2[$k]['uid142'] = changedate_d_m_y($data142['doc_date_uploaded']);
		
		$setdata2[$k]['uid556complete'] = $data556['bt_complete'];
		$setdata2[$k]['uid556'] = changedate_d_m_y($data556['bt_completed_date']);
		
		$setdata2[$k]['uid557complete'] = $data557['bt_complete'];
		$setdata2[$k]['uid557'] = changedate_d_m_y($data557['bt_completed_date']);
		
		$setdata2[$k]['uid558complete'] = $data558['bt_complete'];
		$setdata2[$k]['uid558'] = changedate_d_m_y($data558['bt_completed_date']);
		
		$setdata2[$k]['uid560complete'] = $data560['bt_complete'];
		$setdata2[$k]['uid560'] = changedate_d_m_y($data560['bt_completed_date']);
		
		$setdata2[$k]['uid559complete'] = $data559['bt_complete'];
		$setdata2[$k]['uid559'] = changedate_d_m_y($data559['bt_completed_date']);
		
		$setdata2[$k]['uid431'] = changedate_d_m_y($data431['doc_date_uploaded']);
		$setdata2[$k]['uid432'] = changedate_d_m_y($data432['doc_date_uploaded']);
		
		$setdata2[$k]['uid561'] = changedate_d_m_y($data561['bt_completed_date']);
		$setdata2[$k]['uid562'] = changedate_d_m_y($data562['bt_completed_date']);
		
		$setdata2[$k]['bc_cr_wt_yn'] = $v['bc_cr_wt_yn'];
		$setdata2[$k]['bc_cr_wt_yn_date'] = changedate_d_m_y($v['bc_cr_wt_yn_date']);
		
		$setdata2[$k]['bc_cr_gift_yn'] = $v['bc_cr_gift_yn'];
		$setdata2[$k]['bc_cr_gift_yn_date'] = changedate_d_m_y($v['bc_cr_gift_yn_date']);
		
		$setdata2[$k]['bc_ptt_letter'] = $v['bc_ptt_letter'];
		$setdata2[$k]['bs_profit_loss_excel'] = $v['bs_profit_loss_excel'];
		$setdata2[$k]['bs_cr_comm_date'] = $v['bs_cr_comm_date'];
		
		$setdata2[$k]['bs_comp_compl_pkg'] = $v['bs_comp_compl_pkg'];
		$setdata2[$k]['bs_comp_phy_pkg'] = $v['bs_comp_phy_pkg'];
		$setdata2[$k]['bs_comm_30day_letter'] = $v['bs_comm_30day_letter'];
		$setdata2[$k]['bs_comm_60day_letter'] = $v['bs_comm_60day_letter'];
		$setdata2[$k]['bs_testimonial_video'] = $v['bs_testimonial_video'];
		$setdata2[$k]['bs_google_review'] = $v['bs_google_review'];
		$setdata2[$k]['bs_written_testimonial'] = $v['bs_written_testimonial'];
		
		$setdata2[$k]['bs_365_letter'] = $v['bs_365_letter'];
		$setdata2[$k]['bs_365_conversation'] = $v['bs_365_conversation'];
		$setdata2[$k]['bs_365_gift'] = $v['bs_365_gift'];
		
		$setdata2[$k]['bs_cr_design_no'] = $v['bs_cr_design_no'];
		$setdata2[$k]['bs_cr_video_qa'] = $v['bs_cr_video_qa'];
		
}
 
 	$fwViewData['list'] =  $setdata2;
	
	$report = new Fw_Db_Table('report_complete');
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
$fwViewData['title'] = "Complete Report";