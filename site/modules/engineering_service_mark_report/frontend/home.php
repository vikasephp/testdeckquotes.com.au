<?php
$pagenum = $fwRequest->getparam('pagenum','');
$export = $fwRequest->getParam('export', 0);
$short = $fwRequest->getParam('s', '');

$listdata = $fwRequest->getParam($TABLE, array());
$searchaddr = $fwRequest->getParam('searchaddr', '');
$keyword = $listdata['keyword'];
$where = '' ;

$table = new Fw_Db_Table('business');
$hide = $fwRequest->getParam('hide', '');
if($hide)
{
	 $keys_2 = array_keys($hide);
	 $ky_2 = $keys_2[0];
	 $val_2 = $hide[$ky_2];
	
	  $detail['bsn_esmr_hide'] = $val_2;
	  $table->setWhere("bsn_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}
$where = "  business.bsn_esmr_hide = 0 ";
$hidden = $fwRequest->getParam('hidden', '');
	if(!empty($hidden)) {
	$where = " 1 = 1";	
}




$searchkey = $fwRequest->getParam('searchkey', '');

 if($searchkey):

		$where .= " AND business.bsn_address LIKE '%".$searchkey."%'";
			
			$_SESSION['searchkey'] = $searchkey;
			$fwViewData['searchkey']=$_SESSION['searchkey'];
		
		elseif($_SESSION['searchkey']):
		
			$where .= " AND business.bsn_address LIKE '%".$_SESSION['searchkey']."%'";
			
		$fwViewData['searchkey']=$_SESSION['searchkey'];
endif;


$status_search = $fwRequest->getParam('status_search', '');

 if($status_search):

		$where .= " AND business.bsn_status LIKE '%".$status_search."%'";
			
			$_SESSION['status_search'] = $status_search;
			$fwViewData['status_search']=$_SESSION['status_search'];
		
		elseif($_SESSION['status_search']):
		
			$where .= " AND business.bsn_status LIKE '%".$_SESSION['status_search']."%'";
			$fwViewData['status_search']=$_SESSION['status_search'];
  endif;
   
$clear = $fwRequest->getParam('clear', '');

  if($clear)
  {
	unset($_SESSION['searchkey']);
	$_SESSION['searchkey']='';
	$searchkey='';
	$fwViewData['searchkey']='';
	unset($_SESSION['status_search']);
	$_SESSION['status_search']='';
	$searchkey='';
	$fwViewData['status_search']='';
	$where = "  business.bsn_esmr_hide = 0 ";
 }

		
$sql = "Select business.bsn_id, business.bsn_address, business.bsn_status, business.bsn_esmr_eng_ame , business.bsn_esmr_notes,
        business.bsn_esmr_service_mark, business.bsn_esmr_hide, business.bsn_esmr_person_resp from business
        where ( business.bsn_status like '%|2|%'  OR business.bsn_status like '%|3|%' ) AND " .$where   ;  

if($sql){$userData = $fwDb->query($sql);}

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
	
	  	$status_string = "'".$v['bsn_status']."'";
		$status='';
	
		
		if(strpos($status_string, '|2|') > 0) { $status = "Planning" ; }
		if(strpos($status_string, '|3|') > 0) { $status = "Construction" ; }
		
		if(strpos($status_string, '|2|') > 0 && strpos($status_string, '|3|') > 0 ) { $status = "Planning Approvals, Construction" ; }
	  
	  
	   	// Uid 577 starts
				
				$sqluid577 = "Select  business_tasks.bt_complete ,business_tasks.bt_completed_date , business_tasks.bt_task_not_required 
				  	         from business_tasks
				             where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 577";
		     	$data577 = $fwDb->queryOne($sqluid577);
		
		// Uid 577 ends
		
		
	   // Uid 701 starts
				
				$sqluid701 = "Select  business_tasks.bt_complete ,business_tasks.bt_completed_date , business_tasks.bt_task_not_required 
				  	         from business_tasks
				             where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 701";
		     	$data701 = $fwDb->queryOne($sqluid701);
		
		// Uid 701 ends
	  
	
		$sql116 = "Select document_check_list.doc_file_name from document_check_list
			      where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 116
				  Order By document_check_list.doc_date_uploaded DESC ";
		$data116 = $fwDb->queryOne($sql116);
		
		$link = BASE_URL."business.detail/bsn_id/".$v['bsn_id'];	
		
		
		$sql117 = "Select document_check_list.doc_file_name from document_check_list
			      where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 117
				  Order By document_check_list.doc_date_uploaded DESC ";
		$data117 = $fwDb->queryOne($sql117);
		
		$link = BASE_URL."business.detail/bsn_id/".$v['bsn_id'];
		
		
		$sql421 = "Select document_check_list.doc_file_name  from document_check_list
		           where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 421";
	    $data421 = $fwDb->queryOne($sql421);
		
		
  	   // Uid 658 starts
				
				$sqluid658 = "Select  business_tasks.bt_complete ,business_tasks.bt_completed_date , business_tasks.bt_task_not_required 
				  	         from business_tasks
				             where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 658";
		     	$data658 = $fwDb->queryOne($sqluid658);
		
		// Uid 658 ends
		
			
		$setdata2[$k]['bsn_id'] = $v['bsn_id'];
		$setdata2[$k]['bsn_address'] = $v['bsn_address'];
		$setdata2[$k]['link'] = $link;
		$setdata2[$k]['status'] = $status;
		$setdata2[$k]['bsn_esmr_eng_ame'] = $v['bsn_esmr_eng_ame'];
		$setdata2[$k]['bsn_esmr_notes'] = $v['bsn_esmr_notes'];
		$setdata2[$k]['bsn_esmr_service_mark'] = $v['bsn_esmr_service_mark'];
		$setdata2[$k]['bsn_esmr_hide'] = $v['bsn_esmr_hide'];
		$setdata2[$k]['bsn_esmr_person_resp'] = $v['bsn_esmr_person_resp'];
		
		$setdata2[$k]['uid577complete'] = $data577['bt_complete'];
		$setdata2[$k]['uid577date'] = changedate_d_m_y($data577['bt_completed_date']);
		$setdata2[$k]['uid577nr'] = $data577['bt_task_not_required'];
		
		$setdata2[$k]['uid701complete'] = $data701['bt_complete'];
		$setdata2[$k]['uid701date'] = changedate_d_m_y($data701['bt_completed_date']);
		$setdata2[$k]['uid701nr'] = $data701['bt_task_not_required'];
		
		$setdata2[$k]['doc_file_name_116'] = $data116['doc_file_name'];
		$setdata2[$k]['doc_file_name_117'] = $data117['doc_file_name'];
		$setdata2[$k]['doc_file_name_421'] = $data421['doc_file_name'];
		
		$setdata2[$k]['uid658complete'] = $data658['bt_complete'];
		$setdata2[$k]['uid658date'] = changedate_d_m_y($data658['bt_completed_date']);
		$setdata2[$k]['uid658nr'] = $data658['bt_task_not_required'];
	
		
}
 
 	$fwViewData['list'] =  $setdata2;
 
 }
}

//$_SESSION['last_sql'] = $sql;
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Engineering Service Mark Report";

$sqlpr = "Select * from esmr_person_responsible";
$fwViewData['prdata'] = $fwDb->query($sqlpr);