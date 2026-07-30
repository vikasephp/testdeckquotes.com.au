<?php
$pagenum = $fwRequest->getparam('pagenum','');

//$table = new Fw_Db_Table('pcp_report_hide');
$tablebusiness = new Fw_Db_Table('business');
$searchaddr = $fwRequest->getParam('searchaddr', '');
$searchchk = $fwRequest->getParam('searchchk', '');

$tabledpn = new Fw_Db_Table('document_proposal_name');

$where = " WHERE document_proposal_name.dpn_pcp_show = 1  and document_proposal_name.dpn_pcp_hide = 0";
$fwViewData['ran'] =  rand(100000,999999);


$pbns = $fwRequest->getParam('pbns', '');
if($pbns)
{
	 foreach($pbns as $k9=>$v9)
	 {
		  $id = $k9; 
	 }
	
	  $detail['dpn_pbns_hide'] = $v9;
	
	  $tabledpn->setWhere("dpn_unique_id = ".$id);
	  if($tabledpn->rowExists())
	  {
		 $this_id = $tabledpn->updateRow($detail);
	  }
}


$pbd = $fwRequest->getParam('pbd', '');
if(!empty($pbd)) {
	//$ord =  " Order by  business.bsn_pcp_pbd ";
	$ord =  "ORDER BY if(  business.bsn_pcp_pbd = ' '
                 OR business.bsn_pcp_pbd IS NULL , 1, 0 ) , STR_TO_DATE( business.bsn_pcp_pbd, '%d-%m-%Y' ) ";
}

$fsp = $fwRequest->getParam('fsp', '');

// Save Proposal Book Date
$pro_book = $fwRequest->getParam('bsn_pcp_pbd', '');
if(!empty($pro_book)) {
	$saves_pbd = $fwRequest->getParam('bsn_pcp_pbd', '');
	
	foreach($saves_pbd as $kp=>$vp)
	{
		$pbdDetail['bsn_pcp_pbd'] = $vp;
	
		$tablebusiness->setWhere('bsn_id = '.$kp);
		$detail = $tablebusiness->updateRow($pbdDetail);		
	}
}
//End roposal Book Date

// Save Tentetive Proposal Date
$dpn_pcp_tent_date = $fwRequest->getParam('dpn_pcp_tent_date', '');
if(!empty($dpn_pcp_tent_date)) {

        $tentData = $fwRequest->getParam('dpn_pcp_tent_date', '');
	$key = array_keys($tentData);
	$ky = $key[0];
	$tentDetail['dpn_pcp_tent_date'] = $tentData[$ky];
	$tabledpn->setWhere('dpn_unique_id = '.$ky);
	$detail = $tabledpn->updateRow($tentDetail);		
}
// End Tentitive Proposal Date



// Save HIA Booked Date
$hia_book = $fwRequest->getParam('bsn_pcp_hbd', '');
if(!empty($hia_book)) {
	$save_hbd = $fwRequest->getParam('bsn_pcp_hbd', '');
	
	foreach($save_hbd as $kp=>$vp)
	{
		$hbdDetail['bsn_pcp_hbd'] = $vp;
	
		$tablebusiness->setWhere('bsn_id = '.$kp);
		$detail = $tablebusiness->updateRow($hbdDetail);		
	}
}
//End HIA Booked Date


$hide = $fwRequest->getParam('hide', '');
$unhide = $fwRequest->getParam('unhide', '');

if($hide)
{
  
	$key = array_keys($hide);
	$ky = $key[0];
	$hDetail['dpn_pcp_hide'] = $hide[$ky];
	$tabledpn->setWhere('dpn_unique_id = '.$ky);
	$detail = $tabledpn->updateRow($hDetail);

}

// Save HasReno
$hasreno = $fwRequest->getParam('hasreno', '');
if(!empty($hasreno)) {

        $renoData = $fwRequest->getParam('hasreno', '');
	$key = array_keys($renoData);
	$ky = $key[0];
	$renoDetail['dpn_pcp_hasreno'] = $renoData[$ky];
	$tabledpn->setWhere('dpn_unique_id = '.$ky);
	$detail = $tabledpn->updateRow($renoDetail);		
}
// Start Has Reno



//$showall = 0;
if($unhide) 
{

$where = " WHERE document_proposal_name.dpn_pcp_show = 1";
}
$i = 0;
$hideall = $fwRequest->getParam('hideall', '');
if(!empty($hideall))
{
	     
	      $sql_all = "SELECT business.bsn_id, document_proposal_name.*
	      FROM business
	      INNER JOIN document_check_list_mini_count ON business.bsn_id = document_check_list_mini_count.dcnt_bsn_id
	      RIGHT JOIN document_proposal_name ON business.bsn_id = document_proposal_name.dpn_bsn_id";	
	    
	     $data99 = $fwDb->query($sql_all);
	   
	    
	    foreach($data99 as $k9 => $v9)
	    {
	    	$table->setWhere('ph_checklist_number = '.$va['dpn_unique_id']);
 		 if(!$table->rowExists())
 		 {
			 $ui =  $v9['dpn_unique_id'];
			 $detail9['ph_checklist_number'] =  $ui;
			 $detail9['ph_hide'] = 1;
  			 $this_id = $table->insertRow($detail9);  
					 
			 
		  } 		
	    }	   
}


if(!empty($searchaddr)) {
	$searchkey = $fwRequest->getParam('searchkey', '');
}

if(!empty($searchchk)) {
	$keyword = $fwRequest->getParam('keyword', '');
}
	
if($keyword):
$showall = 1;
$where .= " AND document_proposal_name.dpn_unique_id = ".$keyword;
	
	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword'] && $pagenum > 0):

	$where .= " AND document_proposal_name.dpn_unique_id = ".$_SESSION['keyword'];
	
	$fwViewData['keyword']=$_SESSION['keyword'];
	
	
endif;
   
 $flat='';  
   
if($searchkey):

$flag = 'true';

$where .= " AND business.bsn_address LIKE '%".$searchkey."%'";
	
	$_SESSION['searchkey'] = $searchkey;
	$fwViewData['searchkey']=$_SESSION['searchkey'];

elseif($_SESSION['searchkey'] && $pagenum > 0):

	$where .= " AND business.bsn_address LIKE '%".$_SESSION['searchkey']."%'" ;
	
	$fwViewData['searchkey']=$_SESSION['searchkey'];
endif;   
   
if(empty($pagenum))
	{
	unset($_SESSION['last_tdsql']);
	}
		
 
//  $sql = "Select business.bsn_id, business.bsn_address, business.bsn_sub_status, business.bsn_status_sys_date, business.bsn_pcp_pbd,
//             business.bsn_pcp_hbd, business.bsn_pcp_letter_text, business.bsn_where_we_are, business.bsn_pbns_hide,
//	     business.bsn_pcp_status ,
//	     document_proposal_name.* from business 
//	     Inner Join document_check_list_mini_count ON business.bsn_id  = document_check_list_mini_count.dcnt_bsn_id
//	     Right Join document_proposal_name on business.bsn_id  = document_proposal_name.dpn_bsn_id 
//		". $where . $ord;


  $sql = " select document_proposal_name.* from document_proposal_name ". $where . $ord;

if($sql){$userData = $fwDb->query($sql);}


$fwViewData['total'] = sizeof($userData);

if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
    $page_rows = 1000;
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
		$unauto = "SELECT proposal_tasks.bt_complete FROM proposal_tasks WHERE bt_bsn_id = " .$v['dpn_bsn_id'] . "
			   AND bt_task_id = 35 AND bt_task_list_number = " .$v['dpn_proposal_number'];
			      
		$dataua = $fwDb->queryOne($unauto);	      
		//if(!empty($dataua)) {
//			$table->setWhere('ph_checklist_number = '.$v['dpn_unique_id']);
//			  if($table->rowExists())
//			  {
//				 // $table->deleteRow();	
//			  }
//		}
		
		$link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$v['dpn_bsn_id'];	
		
		$sqlbusiness = "Select business.bsn_id, business.bsn_address, business.bsn_sub_status, business.bsn_status_sys_date,
		        business.bsn_pcp_pbd, business.bsn_pcp_hbd, business.bsn_pcp_letter_text, business.bsn_where_we_are, 
			business.bsn_pbns_hide, business.bsn_pcp_status from business where business.bsn_id = ".$v['dpn_bsn_id'];
		$busdata = $fwDb->queryOne($sqlbusiness);
		
		$ccdate = $v['bsn_status_sys_date'];
		$Statusdate = changedate_y_m_d($ccdate);
		$curdate_y_m_d = date('Y-m-d');
		$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
		   

//		$sqlhide = "Select pcp_report_hide.* from pcp_report_hide
//			   where pcp_report_hide.ph_checklist_number = ". $v['dpn_unique_id'];
//		$hidedata = $fwDb->queryOne($sqlhide);
	
				
		$sql17 = "SELECT document_check_list_mini.doc_file_name, document_check_list_mini.doc_date_uploaded, 
		          document_proposal_name.dpn_unique_id, document_proposal_name.dpn_pbns_hide
			  FROM document_check_list_mini
			  INNER JOIN document_proposal_name ON document_check_list_mini.doc_bsn_id = document_proposal_name.dpn_bsn_id
			  WHERE document_check_list_mini.doc_name_id = 17
			  AND document_check_list_mini.doc_checklist_number = " .$v['dpn_proposal_number'] . "
			  AND document_proposal_name.dpn_bsn_id =  " .$v['dpn_bsn_id'] . "
			  AND document_proposal_name.dpn_unique_id =" .$v['dpn_unique_id'];
			 
		$data17 = $fwDb->queryOne($sql17);
		$time = strtotime($data17['checklist17_date']);
		$newformat = date('Y-m-d',$time);
		$data17['checklist17_date'] = $newformat ;
	
	
		$box_1_date='';
		if(!empty($data17['doc_file_name'])){
			$box_1_date = date('Y-m-d', strtotime($data17['doc_date_uploaded'] .' +7 day'));
		}
		
		$box_2_date='';
		if(!empty($v['dpn_pcp_tent_date'])){
			$box_2_date = date('Y-m-d', strtotime($v['dpn_pcp_tent_date'] .' -2 day'));
		}
		
		
		$sql31 = "SELECT document_check_list_mini. * , document_proposal_name.dpn_unique_id
			FROM document_check_list_mini
			INNER JOIN document_proposal_name ON document_check_list_mini.doc_bsn_id = document_proposal_name.dpn_bsn_id
			WHERE document_check_list_mini.doc_name_id = 31
			AND document_check_list_mini.doc_checklist_number = " .$v['dpn_proposal_number'] . "
			AND document_proposal_name.dpn_bsn_id =  " .$v['dpn_bsn_id'] . "
			AND document_proposal_name.dpn_unique_id =" .$v['dpn_unique_id'];
				 
		$data31 = $fwDb->queryOne($sql31);
		
	
		$sql48 = "SELECT document_check_list_mini. * , document_proposal_name.dpn_unique_id
			FROM document_check_list_mini
			INNER JOIN document_proposal_name ON document_check_list_mini.doc_bsn_id = document_proposal_name.dpn_bsn_id
			WHERE document_check_list_mini.doc_name_id = 48
			AND document_check_list_mini.doc_checklist_number = " .$v['dpn_proposal_number'] . "
			AND document_proposal_name.dpn_bsn_id =  " .$v['dpn_bsn_id'] . "
			AND document_proposal_name.dpn_unique_id =" .$v['dpn_unique_id'];
				 
		$data48 = $fwDb->queryOne($sql48);
		
		$sql61 = "SELECT document_check_list_mini. * , document_proposal_name.dpn_unique_id
			FROM document_check_list_mini
			INNER JOIN document_proposal_name ON document_check_list_mini.doc_bsn_id = document_proposal_name.dpn_bsn_id
			WHERE document_check_list_mini.doc_name_id = 61
			AND document_check_list_mini.doc_checklist_number = " .$v['dpn_proposal_number'] . "
			AND document_proposal_name.dpn_bsn_id =  " .$v['dpn_bsn_id'] . "
			AND document_proposal_name.dpn_unique_id =" .$v['dpn_unique_id'];
				 
		$data61 = $fwDb->queryOne($sql61);
		
							
		$sql8 = "SELECT document_check_list_mini. * , document_proposal_name.dpn_unique_id
			FROM document_check_list_mini
			INNER JOIN document_proposal_name ON document_check_list_mini.doc_bsn_id = document_proposal_name.dpn_bsn_id
			WHERE document_check_list_mini.doc_name_id = 8
			AND document_check_list_mini.doc_checklist_number = " .$v['dpn_proposal_number'] . "
			AND document_proposal_name.dpn_bsn_id =  " .$v['dpn_bsn_id'] . "
			AND document_proposal_name.dpn_unique_id =" .$v['dpn_unique_id'];
			
		$data8 = $fwDb->queryOne($sql8);
		
		
		$sql62 = "SELECT document_check_list_mini. * , document_proposal_name.dpn_unique_id
			FROM document_check_list_mini
			INNER JOIN document_proposal_name ON document_check_list_mini.doc_bsn_id = document_proposal_name.dpn_bsn_id
			WHERE document_check_list_mini.doc_name_id = 62
			AND document_check_list_mini.doc_checklist_number = " .$v['dpn_proposal_number'] . "
			AND document_proposal_name.dpn_bsn_id =  " .$v['dpn_bsn_id'] . "
			AND document_proposal_name.dpn_unique_id =" .$v['dpn_unique_id'];
			
		$data62 = $fwDb->queryOne($sql62);
		
		
		
		$sql56 = "SELECT document_check_list_mini. * , document_proposal_name.dpn_unique_id
			FROM document_check_list_mini
			INNER JOIN document_proposal_name ON document_check_list_mini.doc_bsn_id = document_proposal_name.dpn_bsn_id
			WHERE document_check_list_mini.doc_name_id = 56
			AND document_check_list_mini.doc_checklist_number = " .$v['dpn_proposal_number'] . "
			AND document_proposal_name.dpn_bsn_id =  " .$v['dpn_bsn_id'] . "
			AND document_proposal_name.dpn_unique_id =" .$v['dpn_unique_id'];
			
		$data56 = $fwDb->queryOne($sql56);
		
		
		$sql57 = "SELECT document_check_list_mini. * , document_proposal_name.dpn_unique_id
			FROM document_check_list_mini
			INNER JOIN document_proposal_name ON document_check_list_mini.doc_bsn_id = document_proposal_name.dpn_bsn_id
			WHERE document_check_list_mini.doc_name_id = 57
			AND document_check_list_mini.doc_checklist_number = " .$v['dpn_proposal_number'] . "
			AND document_proposal_name.dpn_bsn_id =  " .$v['dpn_bsn_id'] . "
			AND document_proposal_name.dpn_unique_id =" .$v['dpn_unique_id'];
		$data57 = $fwDb->queryOne($sql57);
		
	
		
		$sql10 = "SELECT document_check_list_mini. * , document_proposal_name.dpn_unique_id
			FROM document_check_list_mini
			INNER JOIN document_proposal_name ON document_check_list_mini.doc_bsn_id = document_proposal_name.dpn_bsn_id
			WHERE document_check_list_mini.doc_name_id = 10
			AND document_check_list_mini.doc_checklist_number = " .$v['dpn_proposal_number'] . "
			AND document_proposal_name.dpn_bsn_id =  " .$v['dpn_bsn_id'] . "
			AND document_proposal_name.dpn_unique_id =" .$v['dpn_unique_id'];
				 
		$data10 = $fwDb->queryOne($sql10);
		
		$sqlTask72 = "SELECT proposal_tasks.bt_completed_date FROM proposal_tasks WHERE bt_bsn_id = " .$v['dpn_bsn_id'] . "
			      AND bt_task_id = 72 AND bt_task_list_number = " .$v['dpn_proposal_number'];
		$dataTask72 = $fwDb->queryOne($sqlTask72);
		
		$sqlTask1 = "SELECT proposal_tasks.bt_completed_date FROM proposal_tasks WHERE bt_bsn_id = " .$v['dpn_bsn_id'] . "
			      AND bt_task_id = 1 AND bt_task_list_number = " .$v['dpn_proposal_number'];
		$dataTask1 = $fwDb->queryOne($sqlTask1);
		
		
		$sqlTask64 = "SELECT proposal_tasks.bt_completed_date FROM proposal_tasks WHERE bt_bsn_id = " .$v['dpn_bsn_id'] . "
			      AND bt_task_id = 64 AND bt_task_list_number = " .$v['dpn_proposal_number'];
		$dataTask64 = $fwDb->queryOne($sqlTask64);
		
		$sqlTask65 = "SELECT proposal_tasks.bt_completed_date FROM proposal_tasks WHERE bt_bsn_id = " .$v['dpn_bsn_id'] . "
			      AND bt_task_id = 65 AND bt_task_list_number = " .$v['dpn_proposal_number'];
		$dataTask65 = $fwDb->queryOne($sqlTask65);
	
				
				//$setdata2[$k]['yes'] = $hidedata['ph_hide'];
				$setdata2[$k]['bsn_id'] = $busdata['bsn_id'];
				$setdata2[$k]['dpn_bsn_id'] = $v['dpn_bsn_id'];
				$setdata2[$k]['bsn_address'] = $busdata['bsn_address'];
				$setdata2[$k]['link'] = $link;
				$setdata2[$k]['dpn_unique_id'] = $v['dpn_unique_id'];
				$setdata2[$k]['checklist17'] = $data17['doc_file_name'];
				$setdata2[$k]['checklist17_date'] = $data17['doc_date_uploaded'];
				$setdata2[$k]['dpn_pbns_hide'] = $data17['dpn_pbns_hide'];
				$setdata2[$k]['bsn_pcp_letter_text'] = $busdata['bsn_pcp_letter_text'];
				$setdata2[$k]['bsn_where_we_are'] = $busdata['bsn_where_we_are'];
				$setdata2[$k]['checklist31'] = $data31['doc_file_name'];
				$setdata2[$k]['checklist31_date'] = changedate_d_m_y($data31['doc_date_uploaded']);
				$setdata2[$k]['checklist48'] = $data48['doc_file_name'];
				$setdata2[$k]['checklist48_date'] = changedate_d_m_y($data48['doc_date_uploaded']);
				$setdata2[$k]['checklist61'] = $data61['doc_file_name'];
				$setdata2[$k]['checklist61_date'] = changedate_d_m_y($data61['doc_date_uploaded']);
				$setdata2[$k]['checklist8'] = $data8['doc_file_name'];
				$setdata2[$k]['checklist8_date'] = changedate_d_m_y($data8['doc_date_uploaded']);
				$setdata2[$k]['checklist62'] = $data62['doc_file_name'];
				$setdata2[$k]['checklist62_date'] = changedate_d_m_y($data62['doc_date_uploaded']);
				$setdata2[$k]['checklist56'] = $data56['doc_file_name'];
				$setdata2[$k]['checklist56_date'] = changedate_d_m_y($data56['doc_date_uploaded']);
				$setdata2[$k]['checklist57'] = $data57['doc_file_name'];
				$setdata2[$k]['checklist57_date'] = changedate_d_m_y($data57['doc_date_uploaded']);
				$setdata2[$k]['checklist10'] = $data10['doc_file_name'];
				$setdata2[$k]['checklist10_date'] = changedate_d_m_y($data10['doc_date_uploaded']);
				$setdata2[$k]['uid72'] = changedate_d_m_y($dataTask72['bt_completed_date']);
				$setdata2[$k]['uid1'] = changedate_d_m_y($dataTask1['bt_completed_date']);
				$setdata2[$k]['bsn_pcp_pbd'] = $busdata['bsn_pcp_pbd'];
				$setdata2[$k]['bsn_pcp_hbd'] = $busdata['bsn_pcp_hbd'];
				$setdata2[$k]['bsn_pbns_hide'] = $busdata['bsn_pbns_hide'];
				$setdata2[$k]['bsn_pcp_status'] = $busdata['bsn_pcp_status'];
				$setdata2[$k]['dpn_pcp_hasreno'] = $v['dpn_pcp_hasreno'];
				$setdata2[$k]['dpn_pcp_trafic_light'] = $v['dpn_pcp_trafic_light'];
				$setdata2[$k]['dpn_pcp_tl_user'] = $v['dpn_pcp_tl_user'];
				$setdata2[$k]['dpn_pcp_tl_date'] = $v['dpn_pcp_tl_date'];
				$setdata2[$k]['dpn_pcp_esti_cost'] = $v['dpn_pcp_esti_cost'];
				$setdata2[$k]['dpn_pcp_site_scope'] = $v['dpn_pcp_site_scope'];
				$setdata2[$k]['box_1_date'] = changedate_d_m_y($box_1_date);
				$setdata2[$k]['uid64'] = changedate_d_m_y($dataTask64['bt_completed_date']);
				$setdata2[$k]['uid65'] = changedate_d_m_y($dataTask65['bt_completed_date']);
				$setdata2[$k]['dpn_pcp_tent_date'] = $v['dpn_pcp_tent_date'];
				$setdata2[$k]['box_2_date'] = changedate_d_m_y($box_2_date);
				$setdata2[$k]['dpn_proposal_number'] = $v['dpn_proposal_number'];
				
		
		
		//if($showall == 1) 
//		{
//				$setdata2[$k]['yes'] = $hidedata['ph_hide'];
//				$setdata2[$k]['bsn_id'] = $v['dpn_bsn_id'];
//				$setdata2[$k]['bsn_address'] = $v['bsn_address'];
//				$setdata2[$k]['link'] = $link;
//				$setdata2[$k]['dpn_unique_id'] = $v['dpn_unique_id'];
//				$setdata2[$k]['checklist17'] = $data17['doc_file_name'];
//				$setdata2[$k]['checklist17_date'] = $data17['doc_date_uploaded'];
//				$setdata2[$k]['dpn_pbns_hide'] = $data17['dpn_pbns_hide'];
//				$setdata2[$k]['bsn_pcp_letter_text'] = $v['bsn_pcp_letter_text'];
//				$setdata2[$k]['bsn_where_we_are'] = $v['bsn_where_we_are'];
//				$setdata2[$k]['checklist31'] = $data31['doc_file_name'];
//				$setdata2[$k]['checklist31_date'] = changedate_d_m_y($data31['doc_date_uploaded']);
//				$setdata2[$k]['checklist48'] = $data48['doc_file_name'];
//				$setdata2[$k]['checklist48_date'] = changedate_d_m_y($data48['doc_date_uploaded']);
//				$setdata2[$k]['checklist61'] = $data61['doc_file_name'];
//				$setdata2[$k]['checklist61_date'] = changedate_d_m_y($data61['doc_date_uploaded']);
//				$setdata2[$k]['checklist8'] = $data8['doc_file_name'];
//				$setdata2[$k]['checklist62'] = $data62['doc_file_name'];
//				$setdata2[$k]['checklist62_date'] = changedate_d_m_y($data62['doc_date_uploaded']);
//				$setdata2[$k]['checklist56'] = $data56['doc_file_name'];
//				$setdata2[$k]['checklist56_date'] = changedate_d_m_y($data56['doc_date_uploaded']);
//				$setdata2[$k]['checklist57'] = $data57['doc_file_name'];
//				$setdata2[$k]['checklist57_date'] = changedate_d_m_y($data57['doc_date_uploaded']);
//				$setdata2[$k]['checklist10'] = $data10['doc_file_name'];
//				$setdata2[$k]['checklist10_date'] = changedate_d_m_y($data10['doc_date_uploaded']);
//				$setdata2[$k]['uid72'] = changedate_d_m_y($dataTask72['bt_completed_date']);
//				$setdata2[$k]['uid1'] = changedate_d_m_y($dataTask1['bt_completed_date']);
//				$setdata2[$k]['bsn_pcp_pbd'] = $v['bsn_pcp_pbd'];
//				$setdata2[$k]['bsn_pcp_hbd'] = $v['bsn_pcp_hbd'];
//				$setdata2[$k]['bsn_pbns_hide'] = $v['bsn_pbns_hide'];
//				$setdata2[$k]['bsn_pcp_status'] = $v['bsn_pcp_status'];
//				$setdata2[$k]['dpn_pcp_hasreno'] = $v['dpn_pcp_hasreno'];
//				$setdata2[$k]['dpn_pcp_trafic_light'] = $v['dpn_pcp_trafic_light'];
//				$setdata2[$k]['dpn_pcp_tl_user'] = $v['dpn_pcp_tl_user'];
//				$setdata2[$k]['dpn_pcp_tl_date'] = $v['dpn_pcp_tl_date'];
//				$setdata2[$k]['dpn_pcp_esti_cost'] = $v['dpn_pcp_esti_cost'];
//				$setdata2[$k]['dpn_pcp_site_scope'] = $v['dpn_pcp_site_scope'];
//				$setdata2[$k]['box_1_date'] = changedate_d_m_y($box_1_date);
//				$setdata2[$k]['uid64'] = changedate_d_m_y($dataTask64['bt_completed_date']);
//				$setdata2[$k]['uid65'] = changedate_d_m_y($dataTask65['bt_completed_date']);
//				$setdata2[$k]['dpn_pcp_tent_date'] = $v['dpn_pcp_tent_date'];
//				$setdata2[$k]['box_2_date'] = changedate_d_m_y($box_2_date);
//				
//		}
		
}
			
		if(!empty($fsp)) 
		{
			if(!empty($setdata2)) {
	 	       		 foreach ($setdata2 as $key => $row) 
		        	{
					$desig[$key]  = $row['checklist17_date'];
				}

				array_multisort($desig, SORT_ASC, $setdata2);


		   }
		}
		
		
 		$fwViewData['list'] =  $setdata2;
		
		if(!empty($setdata2)) {
			$report = new Fw_Db_Table('report_proposal_control_panel');
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
}

//$_SESSION['last_sql'] = $sql;
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Proposal Control Panel Report";
$sqls = "select * from proposal_report_status ";
$fwViewData['statusData'] = $fwDb->query($sqls);



// Export to Excel

$export = $fwRequest->getParam('export', 0);

if($export > 0)
	{
	
require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";
$objPHPExcel = new PHPExcel();

$objPHPExcel->getProperties()->setCreator("Deckquotes")
							 ->setLastModifiedBy("Nick C")
							 ->setTitle("Office 2007 XLSX Test Document")
							 ->setSubject("Office 2007 XLSX Test Document")
							 ->setDescription("Proposal Control Panel Report exported to Office 2007 XLSX.")
							 ->setKeywords("office 2007 openxml php")
							 ->setCategory("Proposal Control Panel Report");


//$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth(50);
$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('G')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('H')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('I')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('J')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('L')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('M')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('N')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('O')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('P')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('Q')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('R')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('S')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('T')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('U')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('V')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('W')->setAutoSize(true);
//$objPHPExcel->getActiveSheet()->getColumnDimension('X')->setAutoSize(true);
	
// Add some data
$objPHPExcel->setActiveSheetIndex(0)
           	->setCellValue('A1', 'Address')
	   	->setCellValue('B1', 'Link')
		->setCellValue('C1', 'Proposal Checklist Number')
		->setCellValue('D1', 'Has Reno')
		->setCellValue('E1', 'Design Sent Off For Signing')
		->setCellValue('F1', 'Final Signed Plans')
		->setCellValue('G1', 'Letter Text')
		->setCellValue('H1', 'Where Are We At')
		->setCellValue('I1', 'Estimate Build Cost')
		->setCellValue('J1', 'Estimate Site Scope Value')
		->setCellValue('K1', 'S.S. Proposal PDF')
		->setCellValue('L1', 'Proposal PDF')
		->setCellValue('M1', 'Brochure A')
		->setCellValue('N1', 'Brochure B')
		->setCellValue('O1', 'Box 1 Due Date')
		->setCellValue('P1', 'Box 1 Sent')
		->setCellValue('Q1', 'Box 2 Due Date')
		->setCellValue('R1', 'Box 2 Sent')
		->setCellValue('S1', 'Tentative Proposal Date')
		->setCellValue('T1', 'Proposal Booked Date')
		->setCellValue('U1', 'Proposal Action Items')
		->setCellValue('V1', 'Revised PDF sent')
		->setCellValue('W1', 'HIA Booked Date')	
		
		;

$from = "A1"; // or any value
$to = "Y1"; // or any value
$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold( true );


$row=2;
$sr=1;
foreach($setdata2 as $k=>$v)
{

			$objPHPExcel->getActiveSheet()
			->setCellValue('A'.$row, $v['bsn_address'])
			->setCellValue('B'.$row, $v['link'])
			->setCellValue('C'.$row, $v['dpn_unique_id'])
			->setCellValue('D'.$row, $v['dpn_pcp_hasreno'])
			->setCellValue('E'.$row, $v['uid1'])
			->setCellValue('F'.$row, $v['checklist17_date'])
			->setCellValue('G'.$row, $v['bsn_pcp_letter_text'])
			->setCellValue('H'.$row, $v['bsn_where_we_are'])
			->setCellValue('I'.$row, $v['dpn_pcp_esti_cost'])
			->setCellValue('J'.$row, $v['dpn_pcp_site_scope'])
			->setCellValue('K'.$row, $v['checklist31_date'])
			->setCellValue('L'.$row, $v['checklist10_date'])
			->setCellValue('M'.$row, $v['checklist8_date'])
			->setCellValue('N'.$row, $v['checklist62_date'])
			->setCellValue('O'.$row, $v['box_1_date'])
			->setCellValue('P'.$row, $v['uid64'])
			->setCellValue('Q'.$row, $v['box_2_date'])
			->setCellValue('R'.$row, $v['uid65'])
			->setCellValue('S'.$row, $v['dpn_pcp_tent_date'])
			->setCellValue('T'.$row, $v['bsn_pcp_pbd'])
			->setCellValue('U'.$row, $v['checklist61_date'])
			->setCellValue('V'.$row, $v['uid72'])
			->setCellValue('W'.$row, $v['bsn_pcp_hbd'])
			;	
	$row= $row+1;			
	$sr=$sr+1;
}

// Rename worksheet
$objPHPExcel->getActiveSheet()->setTitle('Proposal Report');

$objPHPExcel->setActiveSheetIndex(0);
header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="proposal_control_panel_report.xls"');
header('Cache-Control: max-age=0');
// If you're serving to IE 9, then the following may be needed
header('Cache-Control: max-age=1');

// If you're serving to IE over SSL, then the following may be needed
header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
header ('Pragma: public'); // HTTP/1.0

$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
$objWriter->save('php://output');
exit;

	}