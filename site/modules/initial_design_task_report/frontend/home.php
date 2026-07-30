<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$table = new Fw_Db_Table('initial_design_report_hide');
$searchaddr = $fwRequest->getParam('searchaddr', '');
$tablebusiness = new Fw_Db_Table('business');
$tablebs = new Fw_Db_Table('business_sellers');
$where = " ";

$fwViewData['ran'] =  rand(100000,999999);

// Start survey uploaded
$ss_book = $fwRequest->getParam('ss_book', '');

if($ss_book)
{
	 $dt = date('d-m-Y');
	 $keys = array_keys($ss_book);
	 $ky = $keys[0];
	 $val = $ss_book[$ky];
	 
	 $detail['bsn_idtr_ss_booked'] = $val;
	 $detail['bsn_idtr_ss_booked_dt'] = $dt;
	 $tablebusiness->setWhere('bsn_id = '.$ky);
	 if($tablebusiness->rowExists())
	 {
		$this_id = $tablebusiness->updateRow($detail);
	 }
}
// End survey uploaded


// Start ASI booked date
$asi_date = $fwRequest->getParam('asi_date', '');

if($asi_date)
{
	 $asidt = $fwRequest->getParam('bs_idtr_asi_book_date', '');
	 $keys = array_keys($asidt);
	 $ky = $keys[0];
	 $val = $asidt[$ky];
	 $detail2['bs_idtr_asi_book_date'] = $val;
	 $tablebs->setWhere('bs_business_id = '.$ky);
	 if($tablebs->rowExists())
	 {
		$this_id = $tablebs->updateRow($detail2);
	 }
}
// End ASI booked date


// Start Survey Who
$who = $fwRequest->getParam('who', '');

if($who)
{
	 $bs_idtr_who = $fwRequest->getParam('bs_idtr_who', '');
	 db($bs_idtr_who);
	// exit;
	 $keys = array_keys($bs_idtr_who);
	 $ky = $keys[0];
	 $val = $bs_idtr_who[$ky];
	 $detailw['bs_idtr_who'] = $val;
	 db($ky);
	 db($detailw['bs_idtr_who']);
	 //exit;
	 $tablebs->setWhere('bs_business_id = '.$ky);
	 if($tablebs->rowExists())
	 {
		$this_id = $tablebs->updateRow($detailw);
	 }
}
// End Survey Who


// Save survey status date
$survey = $fwRequest->getParam('survey', '');
if(!empty($survey)) {
	$savesd = $fwRequest->getParam('bs_dr_survey_date', '');
	
	foreach($savesd as $k=>$v)
	{
		$sDetail['bs_dr_survey_date'] = $v;
		
		$tablebs->setWhere('bs_business_id = '.$k);
		$detail = $tablebs->updateRow($sDetail);
				
	}
}
//End survey status date


$hide = $fwRequest->getParam('hide', '');
$unhide = $fwRequest->getParam('unhide', '');
if($hide)
{
 
 foreach($hide as $k=>$v)
 {
	  $bsnno = $k; 
 }
 

  $detail['ih_bsn_id'] = $bsnno;
  $detail['ih_hide'] = $v;
  
  $table->setWhere('ih_bsn_id = '.$bsnno);
  if(!$table->rowExists())
  {
  	$this_id = $table->insertRow($detail);  
  }
  else {
	 
	  $table->deleteRows();	
  }
}


$showall = 0;
if($unhide) 
{

$showall = 1;
}


if(!empty($searchaddr)) {
	$searchkey = $fwRequest->getParam('searchkey', '');
	
}
	
   
if($searchkey):

$where .= " AND business.bsn_address LIKE '%".$searchkey."%'";
	
	$_SESSION['searchkey'] = $searchkey;
	$fwViewData['searchkey']=$_SESSION['searchkey'];

elseif($_SESSION['searchkey'] && $pagenum > 0):

	$where .= " AND business.bsn_address LIKE '%".$_SESSION['searchkey']."%'";
	
	$fwViewData['searchkey']=$_SESSION['searchkey'];
endif;   
   
if(empty($pagenum))
	{
	unset($_SESSION['last_tdsql']);
	}
		
 
 // $sql = "Select business.bsn_id, business.bsn_address, business.bsn_sub_status, business.bsn_status_sys_date,
//          document_proposal_name.* from business 
//		Inner Join document_check_list_mini_count ON business.bsn_id  = document_check_list_mini_count.dcnt_bsn_id
//		Right Join document_proposal_name on business.bsn_id  = document_proposal_name.dpn_bsn_id 
//		". $where . " Order by document_proposal_name.dpn_unique_id Desc ";
		
   $sql = "Select business.bsn_id, business.bsn_address, business.bsn_sub_status, business.bsn_status_sys_date,
           business.bsn_idtr_ss_booked, business.bsn_idtr_ss_booked_dt , document_check_list.* from business 
	  Inner Join document_check_list ON business.bsn_id  = document_check_list.doc_bsn_id 	
	  where document_check_list.doc_name_id = 45 and document_check_list.doc_date_uploaded <> '0000-00-00 00:00:00'
	  ". $where . " order by document_check_list.doc_date_uploaded DESC";		

if($sql){$userData = $fwDb->query($sql);}


$fwViewData['total'] = sizeof($userData);

if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
    $page_rows = 500;
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
		$sqla = "Select document_check_list.doc_date_uploaded, document_check_list.doc_file_name  from document_check_list
			      where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 287";
		$data = $fwDb->queryOne($sqla);
		
		$link = $BASE_URL."business.detail/bsn_id/".$v['bsn_id'];	
		
		
		$ccdate = $v['doc_date_uploaded'];
		$Statusdate = changedate_y_m_d($ccdate);
		$curdate_y_m_d = date('Y-m-d');
		$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
		 
		 
		$sqlsu = "Select doc_file_name, doc_date_uploaded from document_check_list where  doc_bsn_id  = ". $v['bsn_id']
		         . " And doc_name_id = 72 ";
		$suData = $fwDb->queryOne($sqlsu);   

		$sqlhide = "Select initial_design_report_hide.* from initial_design_report_hide
			   where initial_design_report_hide.ih_bsn_id = ". $v['bsn_id'];
		$hidedata = $fwDb->queryOne($sqlhide);
		
		$sqlss = "Select bs_dr_survey, bs_dr_survey_date, bs_idtr_asi_book_date, bs_idtr_who 
		          from business_sellers where bs_business_id = ". $v['bsn_id'];
		$ssData = $fwDb->queryOne($sqlss); 
		
		 $sql303 = "Select business_tasks.bt_completed_date from business_tasks
			     where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 303" ;
		
		$data303 = $fwDb->queryOne($sql303);
	
		if(!count($hidedata) > 0  ) 
		{
				
				$setdata2[$k]['bsn_id'] = $v['bsn_id'];
				$setdata2[$k]['bsn_address'] = $v['bsn_address'];
				$setdata2[$k]['doc_date_uploaded'] = changedate_d_m_y($v['doc_date_uploaded']);
				$setdata2[$k]['link'] = $link;
				$setdata2[$k]['dpn_unique_id'] = $v['dpn_unique_id'];
				$setdata2[$k]['dayscount'] = $dayscount;
				$setdata2[$k]['checklist45'] = $v['doc_file_name'];
				$setdata2[$k]['checklist287_date'] = changedate_d_m_y($data['doc_date_uploaded']);
				$setdata2[$k]['checklist287_doc'] = $data['doc_file_name'];
				$setdata2[$k]['bs_dr_survey'] = $ssData['bs_dr_survey'];
				$setdata2[$k]['bs_dr_survey_date'] = $ssData['bs_dr_survey_date'];
				$setdata2[$k]['bs_idtr_asi_book_date'] = $ssData['bs_idtr_asi_book_date'];
				$setdata2[$k]['bs_idtr_who'] = $ssData['bs_idtr_who'];
				$setdata2[$k]['bsn_idtr_ss_booked'] = $v['bsn_idtr_ss_booked'];
				$setdata2[$k]['bsn_idtr_ss_booked_dt'] = $v['bsn_idtr_ss_booked_dt'];
				$setdata2[$k]['survey_uploaded'] = $suData['doc_file_name'];
				$setdata2[$k]['tasklist303'] =  changedate_d_m_y($data303['bt_completed_date']);
		}
		
		
		if($showall == 1) 
		{
				$setdata2[$k]['yes'] = $hidedata['ih_hide'];
				$setdata2[$k]['bsn_id'] = $v['bsn_id'];
				$setdata2[$k]['bsn_address'] = $v['bsn_address'];
				$setdata2[$k]['doc_date_uploaded'] = changedate_d_m_y($v['doc_date_uploaded']);
				$setdata2[$k]['link'] = $link;
				$setdata2[$k]['dpn_unique_id'] = $v['dpn_unique_id'];
				$setdata2[$k]['dayscount'] = $dayscount;
				$setdata2[$k]['checklist45'] = $v['doc_file_name'];
				$setdata2[$k]['checklist287_date'] = changedate_d_m_y($data['doc_date_uploaded']);
				$setdata2[$k]['checklist287_doc'] = $data['doc_file_name'];
				$setdata2[$k]['bs_dr_survey'] = $ssData['bs_dr_survey'];
				$setdata2[$k]['bs_dr_survey_date'] = $ssData['bs_dr_survey_date'];
				$setdata2[$k]['bs_idtr_asi_book_date'] = $ssData['bs_idtr_asi_book_date'];
				$setdata2[$k]['bs_idtr_who'] = $ssData['bs_idtr_who'];
				$setdata2[$k]['bsn_idtr_ss_booked'] = $v['bsn_idtr_ss_booked'];
				$setdata2[$k]['bsn_idtr_ss_booked_dt'] = $v['bsn_idtr_ss_booked_dt'];
				$setdata2[$k]['survey_uploaded'] = $suData['doc_file_name'];
				$setdata2[$k]['tasklist303'] =  changedate_d_m_y($data303['bt_completed_date']);
				
		}
		
}

 	$fwViewData['list'] =  $setdata2;
  }
}

$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Initial Design Task Report";