<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('post_hia_design_report');

//echo "<pre>"; print_r($fwRequest); echo "</pre>";die;
//$where  = " where 1 = 1 and ph_phdr_hide != 1";
$where  = " where ph_phdr_hide = 0";

if (isset($_FILES['upload_doc_file']) && isset($_POST['ph_bsn_id'])) {
	$ph_bsn_id = $_POST['ph_bsn_id'];
	$docfile = $_FILES['upload_doc_file']['name'];
	$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
	$tmpname = $_FILES['upload_doc_file']['tmp_name'];
	upload($docfile, $tmpname);

	$assessment_doc_detail['doc_file_name']= $docfile;
	$assessment_doc_detail['doc_user_name'] = $_SESSION['user']['user_id'];
	$assessment_doc_detail['doc_date_uploaded'] = date('Y-m-d H:i');

	$document_check_listTable = new Fw_Db_Table('document_check_list');
	$document_check_listTable->setWhere("doc_bsn_id = $ph_bsn_id and doc_name_id = 639");
	if($document_check_listTable->rowExists()){ 
		$document_check_listTable->updateRow($assessment_doc_detail);
		echo json_encode(["status" => "success", "upload_doc_file" => $docfile]);die;
	}else{
		echo json_encode(["status" => "error", "message" => "No record found"]);die;
	}
}

$unhide = $fwRequest->getParam('unhide_phdr', '');
if ($unhide != '') {
    $where  = " where 1 = 1";
}

$clear = $fwRequest->getParam('clear', '');
if($clear) {
	 unset($_SESSION['search_project']);
	 unset($_SESSION['type_search']);
}

  $search_project = $fwRequest->getParam('project_name', '');

  if($search_project):
    
       $where .= " AND ph_bsn_name  LIKE '%".$search_project."%'  ";
       $_SESSION['search_project'] = $search_project;
       $fwViewData['search_project']=$_SESSION['search_project'];

  elseif($_SESSION['search_project'] && $pagenum > 0):
		
       $where .= " AND ph_bsn_name LIKE  '%".$_SESSION['search_project']."%' ";
       $fwViewData['search_project']=$_SESSION['search_project'];
	
  endif;
  
  $type_search = $fwRequest->getParam('type_search', '');

  if($type_search):
    
       $where .= " AND ph_type = ".$type_search;
       $_SESSION['type_search'] = $type_search;
       $fwViewData['type_search']=$_SESSION['type_search'];

  elseif($_SESSION['type_search'] && $pagenum > 0):
		
       $where .= " AND ph_type = ".$_SESSION['type_search'];
       $fwViewData['type_search']=$_SESSION['type_search'];
	
  endif;
  
  
    $urgency_search = $fwRequest->getParam('urgency_search', '');

  if($urgency_search):
    
       $where .= " AND ph_urgency = ".$urgency_search;
       $_SESSION['urgency_search'] = $urgency_search;
       $fwViewData['urgency_search']=$_SESSION['urgency_search'];

  elseif($_SESSION['urgency_search'] && $pagenum > 0):
		
       $where .= " AND ph_urgency = ".$_SESSION['urgency_search'];
       $fwViewData['urgency_search']=$_SESSION['urgency_search'];
	
  endif;
  

$notified = $fwRequest->getParam('notified', '');
if($notified)
{
	 $keys_1 = array_keys($notified);
	 $ky_1 = $keys_1[0];
	 $val_1 = $notified[$ky_1];
	
	  $detail['ph_client_notified'] = $val_1;
	  $detail['ph_client_noti_date'] = date('d-m-Y');
	  $detail['ph_client_noti_user'] = $_SESSION['user']['user_name'];
	  
	  $table->setWhere("ph_id = ".$ky_1);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}


$repricing = $fwRequest->getParam('repricing', '');
if($repricing)
{
	 $keys_2 = array_keys($repricing);
	 $ky_2 = $keys_2[0];
	 $val_2 = $repricing[$ky_2];
	
	  $detail['ph_repricing_req'] = $val_2;
	  $detail['ph_repricing_date'] = date('d-m-Y');
	  $detail['ph_repricing_user'] = $_SESSION['user']['user_name'];
	  
	  $table->setWhere("ph_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}	  
	

$signed = $fwRequest->getParam('signed', '');
if($signed)
{
	 $keys_3 = array_keys($signed);
	 $ky_3 = $keys_3[0];
	 $val_3 = $signed[$ky_3];
	
	  $detail['ph_client_signed'] = $val_3;
	  $detail['ph_client_sig_date'] = date('d-m-Y');
	  $detail['ph_client_sig_user'] = $_SESSION['user']['user_name'];
	  
	  $table->setWhere("ph_id = ".$ky_3);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}
	

//$matsql = "Select * from post_hia_design_report ".$where;  
$sort_by_day = $fwRequest->getParam('sort_by_day', '');
if ($sort_by_day != '') {
    $matsql = "SELECT 
        *,DATEDIFF(CURDATE(), STR_TO_DATE(ph_create_date, '%d-%m-%Y')) AS days_difference
    FROM 
        post_hia_design_report
        $where
    ORDER BY 
        days_difference DESC";
}else{
    $matsql = "Select * from post_hia_design_report ".$where ." ". $sort_by;
}


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
		 	
$sql_bus = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
            business.bsn_id, business.bsn_name,  business.bsn_address, business.bsn_status, business.bsn_status_sys_date, business.bsn_ptt_opi,
			business.bsn_ptt_opi_date, business.bsn_ptt_opi_user
		    from business_sellers 		
		    Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		    Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
		    where business.bsn_name  = '" .$v['ph_bsn_name']."'";
		
	$busData = $fwDb->queryOne($sql_bus);	
		
	$link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$busData['bsn_id'];
	
	$sql_b = "select dpn_unique_id from document_proposal_name where dpn_bsn_id = ".$busData['bs_business_id'];
    $ppt = $fwDb->queryOne($sql_b);
	
	$sqldt = "select dt_id from  designer_tracker where dt_checklist_no = '".$ppt['dpn_unique_id']."'";
	$dtdata = $fwDb->queryOne($sqldt);
	
	$sql_outs = "Select count(*) as out_c from task_designer_tracker where tdt_dt_id = ".$dtdata['dt_id']. " AND tdt_status <> 'COMPLETE' ";
	$outdata = $fwDb->queryOne($sql_outs);
	
	$sql639 = "select doc_file_name, doc_date_uploaded from document_check_list where doc_name_id = 639 and doc_bsn_id = ".$busData['bsn_id'];
	$data639 = $fwDb->queryOne($sql639);
	

	
		$status_string = "'".$busData['bsn_status']."'";
		$status='';
		
		if(strpos($status_string, '|1|') > 0) { $status .= "Convert<br>" ; }
		if(strpos($status_string, '|2|') > 0) { $status .= "Planning Approvals<br>" ; }
		if(strpos($status_string, '|3|') > 0) { $status .= "Construction<br>" ; }
		if(strpos($status_string, '|4|') > 0) { $status .= "Complete<br>" ; }
		if(strpos($status_string, '|5|') > 0) { $status .= "Inclusions<br>" ; }
		if(strpos($status_string, '|6|') > 0) { $status .= "Pre Construction<br>" ; }
		if(strpos($status_string, '|12|') > 0) { $status .= "Design Phase<br>" ; }
		
	
	
	   $dayscount='';
			
		$createdate = changedate_y_m_d($v['ph_create_date']);
		
		if(!empty($createdate))
		{
			$curdate_y_m_d = date('Y-m-d');
			$dayscount = daysDifference($curdate_y_m_d, $createdate);
		}
		
		
			
		 $sql491 = "Select document_check_list.doc_file_name, document_check_list.doc_date_uploaded
			           from document_check_list
			           where document_check_list.doc_bsn_id = ". $busData['bsn_id'] . " And document_check_list.doc_name_id = 491";
		 $data491 = $fwDb->queryOne($sql491);	
		
		
		
		$sqlpoa = "Select person_responsible_detail.* from person_responsible_detail
			    where person_responsible_detail.prd_bsn_id = ". $busData['bsn_id'] . 
			  " And person_responsible_detail.prd_position like '%Overseas Architect%' ";
		$dataOsa = $fwDb->queryOne($sqlpoa);

		
		$listsnew[$k]['dayscount'] = $dayscount;
		$listsnew[$k]['bsn_id'] = $busData['bs_business_id'];
		$listsnew[$k]['bcust_fname'] = $busData['bcust_fname'];
		$listsnew[$k]['bcust_lname'] = $busData['bcust_lname'];
		$listsnew[$k]['bsn_address'] = $busData['bsn_address'];
		$listsnew[$k]['link'] = $link;
	
		$listsnew[$k]['doc_file_name'] = $data491['doc_file_name'];
		$listsnew[$k]['doc_date_uploaded'] = changedate_d_m_y($data491['doc_date_uploaded']);
		$listsnew[$k]['status'] = $status;
		$listsnew[$k]['osarchi'] = $dataOsa['prd_name'];
		$listsnew[$k]['dayscount'] = $dayscount;
		$listsnew[$k]['o_task'] = $outdata['out_c'];
		$listsnew[$k]['doc_file_name_639'] = $data639['doc_file_name'];
		$listsnew[$k]['doc_date_uploaded_639'] = changedate_d_m_y($data639['doc_date_uploaded']);
		
		$listsnew[$k]['bsn_ptt_opi'] = $busData['bsn_ptt_opi'];
		$listsnew[$k]['bsn_ptt_opi_date'] = $busData['bsn_ptt_opi_date'];
		$listsnew[$k]['bsn_ptt_opi_user'] = $busData['bsn_ptt_opi_user'];
		 
}

$fwViewData['list'] = $listsnew;

$fwViewData['title'] = $MODULE_PLURAL;

$sql = "SELECT  bsn_name from business where bsn_sub_status = 'Open'";
$fwViewData['projdetail'] = $fwDb->query($sql);

$sqlst = "SELECT  * from post_hia_urgency";
$fwViewData['urgencydetail'] = $fwDb->query($sqlst);

$sqltype = "SELECT  * from post_hia_type";
$fwViewData['typedetail'] = $fwDb->query($sqltype);

