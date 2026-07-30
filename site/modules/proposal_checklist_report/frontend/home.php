<?php
//get the current limit
$memlimit = ini_get('memory_limit');
//set it to something else
ini_set("memory_limit", "2048M");
ini_set('max_execution_time', 0);

$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$table = new Fw_Db_Table('pro_chk_report_hide');
$searchaddr = $fwRequest->getParam('searchaddr', '');


$where = "WHERE 1=1 ";

$fwViewData['ran'] =  rand(100000,999999);


$hide = $fwRequest->getParam('hide', '');
$unhide = $fwRequest->getParam('unhide', '');
if($hide)
{
 
 foreach($hide as $k=>$v)
 {
	  $chkno = $k; 
 }
 

  $detail['ph_checklist_number'] = $chkno;
  $detail['ph_hide'] = $v;
  
  $table->setWhere('ph_checklist_number = '.$chkno);
  if(!$table->rowExists())
  {
  	$this_id = $table->insertRow($detail);  
  }
  else {
	  //$this_id = $table->updateRow($detail);
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
	
if($keyword):
$where .= " AND document_proposal_name.dpn_unique_id = ".$keyword;
	
	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword'] && $pagenum > 0):

	$where .= " AND document_proposal_name.dpn_unique_id = ".$_SESSION['keyword'];
	
	$fwViewData['keyword']=$_SESSION['keyword'];
endif;
   
   
   
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
		
 
  $sql = "Select business.bsn_id, business.bsn_address, business.bsn_sub_status, business.bsn_status_sys_date,
        document_proposal_name.* from business 
		Inner Join document_check_list_mini_count ON business.bsn_id  = document_check_list_mini_count.dcnt_bsn_id
		Right Join document_proposal_name on business.bsn_id  = document_proposal_name.dpn_bsn_id 
		". $where . " Order by document_proposal_name.dpn_unique_id Desc ";

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
		//$sqla = "Select document_check_list.* from document_check_list
		//	      where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 64";
		//$data = $fwDb->queryOne($sqla);
		
		$link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$v['bsn_id'];	
		
		
		$ccdate = $v['bsn_status_sys_date'];
		$Statusdate = changedate_y_m_d($ccdate);
		$curdate_y_m_d = date('Y-m-d');
		$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
		   

		$sqlhide = "Select pro_chk_report_hide.* from pro_chk_report_hide
					where pro_chk_report_hide.ph_checklist_number = ". $v['dpn_unique_id'];
		$hidedata = $fwDb->queryOne($sqlhide);
	
	  
		$sql30 = "SELECT document_check_list_mini. * , document_proposal_name.dpn_unique_id
				FROM document_check_list_mini
				INNER JOIN document_proposal_name ON document_check_list_mini.doc_bsn_id = document_proposal_name.dpn_bsn_id
				WHERE document_check_list_mini.doc_name_id =30
				AND document_check_list_mini.doc_checklist_number = " .$v['dpn_proposal_number'] . "
				AND document_proposal_name.dpn_bsn_id =  " .$v['bsn_id'] . "
				AND document_proposal_name.dpn_unique_id =" .$v['dpn_unique_id'];
				 
		$data30 = $fwDb->queryOne($sql30);
		
		$sql5 = "SELECT document_check_list_mini. * , document_proposal_name.dpn_unique_id
				FROM document_check_list_mini
				INNER JOIN document_proposal_name ON document_check_list_mini.doc_bsn_id = document_proposal_name.dpn_bsn_id
				WHERE document_check_list_mini.doc_name_id = 5
				AND document_check_list_mini.doc_checklist_number = " .$v['dpn_proposal_number'] . "
				AND document_proposal_name.dpn_bsn_id =  " .$v['bsn_id'] . "
				AND document_proposal_name.dpn_unique_id =" .$v['dpn_unique_id'];
				 
		$data5= $fwDb->queryOne($sql5);
		
		$sql37 = "SELECT document_check_list_mini. * , document_proposal_name.dpn_unique_id
				FROM document_check_list_mini
				INNER JOIN document_proposal_name ON document_check_list_mini.doc_bsn_id = document_proposal_name.dpn_bsn_id
				WHERE document_check_list_mini.doc_name_id = 37
				AND document_check_list_mini.doc_checklist_number = " .$v['dpn_proposal_number'] . "
				AND document_proposal_name.dpn_bsn_id =  " .$v['bsn_id'] . "
				AND document_proposal_name.dpn_unique_id =" .$v['dpn_unique_id'];
				 
		$data37 = $fwDb->queryOne($sql37);
		
		$sql31 = "SELECT document_check_list_mini. * , document_proposal_name.dpn_unique_id
				FROM document_check_list_mini
				INNER JOIN document_proposal_name ON document_check_list_mini.doc_bsn_id = document_proposal_name.dpn_bsn_id
				WHERE document_check_list_mini.doc_name_id = 31
				AND document_check_list_mini.doc_checklist_number = " .$v['dpn_proposal_number'] . "
				AND document_proposal_name.dpn_bsn_id =  " .$v['bsn_id'] . "
				AND document_proposal_name.dpn_unique_id =" .$v['dpn_unique_id'];
				 
		$data31 = $fwDb->queryOne($sql31);
		
		
		$sql17 = "SELECT document_check_list_mini. * , document_proposal_name.dpn_unique_id
				FROM document_check_list_mini
				INNER JOIN document_proposal_name ON document_check_list_mini.doc_bsn_id = document_proposal_name.dpn_bsn_id
				WHERE document_check_list_mini.doc_name_id = 17
				AND document_check_list_mini.doc_checklist_number = " .$v['dpn_proposal_number'] . "
				AND document_proposal_name.dpn_bsn_id =  " .$v['bsn_id'] . "
				AND document_proposal_name.dpn_unique_id =" .$v['dpn_unique_id'];
				 
		$data17 = $fwDb->queryOne($sql17);
		
		$sql6 = "SELECT document_check_list_mini. * , document_proposal_name.dpn_unique_id
				FROM document_check_list_mini
				INNER JOIN document_proposal_name ON document_check_list_mini.doc_bsn_id = document_proposal_name.dpn_bsn_id
				WHERE document_check_list_mini.doc_name_id = 6
				AND document_check_list_mini.doc_checklist_number = " .$v['dpn_proposal_number'] . "
				AND document_proposal_name.dpn_bsn_id =  " .$v['bsn_id'] . "
				AND document_proposal_name.dpn_unique_id =" .$v['dpn_unique_id'];
				 
		$data6 = $fwDb->queryOne($sql6);
		
		
		$sql7 = "SELECT document_check_list_mini. * , document_proposal_name.dpn_unique_id
				FROM document_check_list_mini
				INNER JOIN document_proposal_name ON document_check_list_mini.doc_bsn_id = document_proposal_name.dpn_bsn_id
				WHERE document_check_list_mini.doc_name_id = 7
				AND document_check_list_mini.doc_checklist_number = " .$v['dpn_proposal_number'] . "
				AND document_proposal_name.dpn_bsn_id =  " .$v['bsn_id'] . "
				AND document_proposal_name.dpn_unique_id =" .$v['dpn_unique_id'];
				 
		$data7 = $fwDb->queryOne($sql7);
		
		
		$sql10 = "SELECT document_check_list_mini. * , document_proposal_name.dpn_unique_id
				FROM document_check_list_mini
				INNER JOIN document_proposal_name ON document_check_list_mini.doc_bsn_id = document_proposal_name.dpn_bsn_id
				WHERE document_check_list_mini.doc_name_id = 10
				AND document_check_list_mini.doc_checklist_number = " .$v['dpn_proposal_number'] . "
				AND document_proposal_name.dpn_bsn_id =  " .$v['bsn_id'] . "
				AND document_proposal_name.dpn_unique_id =" .$v['dpn_unique_id'];
				 
		$data10 = $fwDb->queryOne($sql10);
		
		
		$sql20 = "SELECT document_check_list_mini. * , document_proposal_name.dpn_unique_id
				FROM document_check_list_mini
				INNER JOIN document_proposal_name ON document_check_list_mini.doc_bsn_id = document_proposal_name.dpn_bsn_id
				WHERE document_check_list_mini.doc_name_id = 20
				AND document_check_list_mini.doc_checklist_number = " .$v['dpn_proposal_number'] . "
				AND document_proposal_name.dpn_bsn_id =  " .$v['bsn_id'] . "
				AND document_proposal_name.dpn_unique_id =" .$v['dpn_unique_id'];
				 
		$data20 = $fwDb->queryOne($sql20);
		
		
		$sql36 = "SELECT document_check_list_mini. * , document_proposal_name.dpn_unique_id
				FROM document_check_list_mini
				INNER JOIN document_proposal_name ON document_check_list_mini.doc_bsn_id = document_proposal_name.dpn_bsn_id
				WHERE document_check_list_mini.doc_name_id = 36
				AND document_check_list_mini.doc_checklist_number = " .$v['dpn_proposal_number'] . "
				AND document_proposal_name.dpn_bsn_id =  " .$v['bsn_id'] . "
				AND document_proposal_name.dpn_unique_id =" .$v['dpn_unique_id'];
				 
		$data36 = $fwDb->queryOne($sql36);
		
		
		
		$sqlTask10 = "SELECT proposal_tasks.* FROM proposal_tasks WHERE bt_bsn_id = " .$v['bsn_id'] . "
					  AND bt_task_id = 10 AND bt_task_list_number = " .$v['dpn_proposal_number'];
		
		$dataTask10 = $fwDb->queryOne($sqlTask10);		
		
		$sqlTask8 = "SELECT proposal_tasks.* FROM proposal_tasks WHERE bt_bsn_id = " .$v['bsn_id'] . "
					  AND bt_task_id = 8 AND bt_task_list_number = " .$v['dpn_proposal_number'];
		
		$dataTask8 = $fwDb->queryOne($sqlTask8);	
		
		
		$sqlTask38 = "SELECT proposal_tasks.* FROM proposal_tasks WHERE bt_bsn_id = " .$v['bsn_id'] . "
					  AND bt_task_id = 38 AND bt_task_list_number = " .$v['dpn_proposal_number'];
		
		$dataTask38 = $fwDb->queryOne($sqlTask38);
		
		$sqlTask25 = "SELECT proposal_tasks.* FROM proposal_tasks WHERE bt_bsn_id = " .$v['bsn_id'] . "
					  AND bt_task_id = 25 AND bt_task_list_number = " .$v['dpn_proposal_number'];
		
		$dataTask25 = $fwDb->queryOne($sqlTask25);
		
	
		if(!count($hidedata) > 0  ) 
		{
				
				$setdata2[$k]['bsn_id'] = $v['bsn_id'];
				$setdata2[$k]['bsn_address'] = $v['bsn_address'];
				$setdata2[$k]['hia_sign_date'] = changedate_d_m_y($ccdate);
				$setdata2[$k]['link'] = $link;
				$setdata2[$k]['dpn_unique_id'] = $v['dpn_unique_id'];
				$setdata2[$k]['dayscount'] = $dayscount;
				$setdata2[$k]['checklist30'] = $data30['doc_file_name'];
				$setdata2[$k]['checklist5']  = $data5['doc_file_name'];
				$setdata2[$k]['checklist37'] = $data37['doc_file_name'];
				$setdata2[$k]['checklist31'] = $data31['doc_file_name'];
				$setdata2[$k]['checklist17'] = $data17['doc_file_name'];
				$setdata2[$k]['checklist6'] = $data6['doc_file_name'];
				$setdata2[$k]['checklist7'] = $data7['doc_file_name'];
				$setdata2[$k]['checklist10'] = $data10['doc_file_name'];
				$setdata2[$k]['checklist20'] = $data20['doc_file_name'];
				$setdata2[$k]['checklist36'] = $data36['doc_file_name'];
				
				$setdata2[$k]['uid10complete'] = $dataTask10['bt_complete'];
				$setdata2[$k]['uid10'] = changedate_d_m_y($dataTask10['bt_completed_date']);
				$setdata2[$k]['uid8complete'] = $dataTask8['bt_complete'];
				$setdata2[$k]['uid8'] = changedate_d_m_y($dataTask8['bt_completed_date']);
				$setdata2[$k]['uid38complete'] = $dataTask38['bt_complete'];
				$setdata2[$k]['uid38'] = changedate_d_m_y($dataTask38['bt_completed_date']);
				$setdata2[$k]['uid25complete'] = $dataTask25['bt_complete'];
				$setdata2[$k]['uid25'] = changedate_d_m_y($dataTask25['bt_completed_date']);
		}
		
		
		if($showall == 1) 
		{
				$setdata2[$k]['yes'] = $hidedata['ph_hide'];
				$setdata2[$k]['bsn_id'] = $v['bsn_id'];
				$setdata2[$k]['bsn_address'] = $v['bsn_address'];
				$setdata2[$k]['hia_sign_date'] = changedate_d_m_y($ccdate);
				$setdata2[$k]['link'] = $link;
				$setdata2[$k]['dpn_unique_id'] = $v['dpn_unique_id'];
				$setdata2[$k]['dayscount'] = $dayscount;
				$setdata2[$k]['checklist30'] = $data30['doc_file_name'];
				$setdata2[$k]['checklist5']  = $data5['doc_file_name'];
				$setdata2[$k]['checklist37'] = $data37['doc_file_name'];
				$setdata2[$k]['checklist31'] = $data31['doc_file_name'];
				$setdata2[$k]['checklist17'] = $data17['doc_file_name'];
				$setdata2[$k]['checklist6'] = $data6['doc_file_name'];
				$setdata2[$k]['checklist7'] = $data7['doc_file_name'];
				$setdata2[$k]['checklist10'] = $data10['doc_file_name'];
				$setdata2[$k]['checklist20'] = $data20['doc_file_name'];
				$setdata2[$k]['uid10complete'] = $dataTask10['bt_complete'];
				$setdata2[$k]['uid10'] = changedate_d_m_y($dataTask10['bt_completed_date']);
				$setdata2[$k]['uid8complete'] = $dataTask8['bt_complete'];
				$setdata2[$k]['uid8'] = changedate_d_m_y($dataTask8['bt_completed_date']);
				$setdata2[$k]['uid38complete'] = $dataTask38['bt_complete'];
				$setdata2[$k]['uid38'] = changedate_d_m_y($dataTask38['bt_completed_date']);
				$setdata2[$k]['uid25complete'] = $dataTask25['bt_complete'];
				$setdata2[$k]['uid25'] = changedate_d_m_y($dataTask25['bt_completed_date']);
		}
		
}

 	$fwViewData['list'] =  $setdata2;
	
		
	$report = new Fw_Db_Table('report_proposal_checklist');
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
$fwViewData['title'] = "Proposal Checklist Report";