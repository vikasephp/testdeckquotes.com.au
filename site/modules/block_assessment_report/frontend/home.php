<?php
$pagenum = $fwRequest->getparam('pagenum','');
$export = $fwRequest->getParam('export', 0);
$short = $fwRequest->getParam('s', '');

$listdata = $fwRequest->getParam($TABLE, array());
$searchaddr = $fwRequest->getParam('searchaddr', '');
$keyword = $listdata['keyword'];
$where = '' ;

$clear = $fwRequest->getParam('clear', '');

$searchkey = $fwRequest->getParam('searchkey', '');

 if($searchkey):

		$where .= " AND business.bsn_address LIKE '%".$searchkey."%'";
			
			$_SESSION['searchkey'] = $searchkey;
			$fwViewData['searchkey']=$_SESSION['searchkey'];
		
		elseif($_SESSION['searchkey'] && $pagenum > 0):
		
			$where .= " AND business.bsn_address LIKE '%".$_SESSION['searchkey']."%'";
			
		$fwViewData['searchkey']=$_SESSION['searchkey'];
endif;
   
  if($clear)
  {
	unset($_SESSION['searchkey']);
	$_SESSION['searchkey']='';
	$searchkey='';
	$fwViewData['searchkey']='';
	$where =  '';
 }

		
$sql = "Select business.bsn_id, business.bsn_address, business.bsn_status, business.bsn_esmr_eng_ame , business.bsn_esmr_notes,
        business.bsn_esmr_service_mark, business.bsn_bar_crown_heading , business.bsn_bar_building_file, business.bsn_bar_build_approve,
		business.bsn_bar_block_type  from business
        where  business.bsn_status like '%|2|%'  OR business.bsn_status like '%|12|%' "  ;  

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

 $setdata2 = $fwDb->query($sql2);
 
foreach($setdata2 as $k => $v)
{
	
	  	$status_string = "'".$v['bsn_status']."'";
		$status='';
	
		
		if(strpos($status_string, '|2|') > 0) { $status = "Planning Approvals" ; }
		if(strpos($status_string, '|12|') > 0) { $status = "Design Phase" ; }
		if(strpos($status_string, '|2|') > 0 && strpos($status_string, '|12|') > 0 ) { $status = "Design Phase and Planning Approvals" ; }
	  
	  
	    $sql288 = "Select document_check_list.doc_file_name from document_check_list
			      where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 288
				  Order By document_check_list.doc_date_uploaded DESC ";
		$data288 = $fwDb->queryOne($sql288);
		
		
		$sql287 = "Select document_check_list.doc_file_name from document_check_list
			      where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 287
				  Order By document_check_list.doc_date_uploaded DESC ";
		$data287 = $fwDb->queryOne($sql287);
	  
	  //////
	  
	  
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
		$setdata2[$k]['doc_file_name_288'] = $data288['doc_file_name'];
		$setdata2[$k]['doc_file_name_287'] = $data287['doc_file_name'];
		
		/////
		
		
		$setdata2[$k]['bsn_esmr_eng_ame'] = $v['bsn_esmr_eng_ame'];
		$setdata2[$k]['bsn_esmr_notes'] = $v['bsn_esmr_notes'];
		$setdata2[$k]['bsn_esmr_service_mark'] = $v['bsn_esmr_service_mark'];
		
		$setdata2[$k]['uid577complete'] = $data577['bt_complete'];
		$setdata2[$k]['uid577date'] = changedate_d_m_y($data577['bt_completed_date']);
		$setdata2[$k]['uid577nr'] = $data577['bt_task_not_required'];
		
		$setdata2[$k]['uid701complete'] = $data701['bt_complete'];
		$setdata2[$k]['uid701date'] = changedate_d_m_y($data701['bt_completed_date']);
		$setdata2[$k]['uid701nr'] = $data701['bt_task_not_required'];
		
		
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
$fwViewData['title'] = "Block Assessment Report";