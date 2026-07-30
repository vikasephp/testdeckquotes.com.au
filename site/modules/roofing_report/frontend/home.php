<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$listdata = $fwRequest->getParam($TABLE, array());
$table = new Fw_Db_Table('roofing_report');

$where = " where 1 = 1";

$looking = $fwRequest->getParam('looking', '');
if($looking)
{
	 $keys_2 = array_keys($looking);
	 $ky_2 = $keys_2[0];
	 $val_2 = $looking[$ky_2];
	
	  $detail['rr_are_we'] = $val_2;
	  $detail['rr_are_we_date'] = date('d-m-Y');
	  $detail['rr_are_we_user'] = $_SESSION['user']['user_name'];
	  $table->setWhere("rr_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}
  
$save_insprepo = $fwRequest->getParam('save_insprepo', '');
if($save_insprepo) 
{ 
		if($_FILES['inspection_report']['name'])
		{

			$docfile_12 = $_FILES['inspection_report']['name'];
			$docfile_12 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_12);
			$temp_name_12 = $_FILES['inspection_report']['tmp_name'];
			$irData['rr_inspection_report'] = $docfile_12;
			$irData['rr_insp_report_user'] = $_SESSION['user']['user_name'];
			$irData['rr_insp_report_date'] = date('d-m-Y');
			upload($docfile_12, $temp_name_12);
			
			$rr_id = $fwRequest->getParam('rr_id', '');
				
				$table->setWhere('rr_id = '.$rr_id);
				if($table->rowExists())
				{
				
					$detail = $table->updateRow($irData);	
				}		
		}	
}

$save_workword = $fwRequest->getParam('save_workword', '');
if($save_workword) 
{ 
		if($_FILES['work_word']['name'])
		{

			$docfile_1 = $_FILES['work_word']['name'];
			$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
			$temp_name_1 = $_FILES['work_word']['tmp_name'];
			$wwData['rr_work_prop_word'] = $docfile_1;
			$wwData['rr_work_prop_word_user'] = $_SESSION['user']['user_name'];
			$wwData['rr_work_prop_word_date'] = date('d-m-Y');
			upload($docfile_1, $temp_name_1);
			
			$rr_id = $fwRequest->getParam('rr_id', '');
				
				$table->setWhere('rr_id = '.$rr_id);
				if($table->rowExists())
				{
				
					$detail = $table->updateRow($wwData);	
				}		
		}	
}  
  
$save_workpdf = $fwRequest->getParam('save_workpdf', '');
if($save_workpdf) 
{ 
	if($_FILES['work_pdf']['name'])
	{
		$docfile_2 = $_FILES['work_pdf']['name'];
		$docfile_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
		$temp_name_2 = $_FILES['work_pdf']['tmp_name'];
		$wpData['rr_work_prop_pdf'] = $docfile_2;
		$wpData['rr_work_prop_pdf_user'] = $_SESSION['user']['user_name'];
		$wpData['rr_work_prop_pdf_date'] = date('d-m-Y');
		upload($docfile_2, $temp_name_2);
		
		$rr_id = $fwRequest->getParam('rr_id', '');
			
			$table->setWhere('rr_id = '.$rr_id);
			if($table->rowExists())
			{
			
				$detail = $table->updateRow($wpData);	
			}		
	}	
}  
 
$save_docusign = $fwRequest->getParam('save_docusign', '');
if($save_docusign) 
{ 
	if($_FILES['docusign']['name'])
	{
		$docfile_3 = $_FILES['docusign']['name'];
		$docfile_3 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_3);
		$temp_name_3 = $_FILES['docusign']['tmp_name'];
		$dsData['rr_docusign_agr'] = $docfile_3;
		$dsData['rr_docusign_agr_user'] = $_SESSION['user']['user_name'];
		$dsData['rr_docusign_agr_date'] = date('d-m-Y');
		upload($docfile_3, $temp_name_3);
		
		$rr_id = $fwRequest->getParam('rr_id', '');
			
			$table->setWhere('rr_id = '.$rr_id);
			if($table->rowExists())
			{
			
				$detail = $table->updateRow($dsData);	
			}		
	}	
}

$save_intro = $fwRequest->getParam('save_intro', '');
if($save_intro) 
{ 
	if($_FILES['intro_letter']['name'])
	{
		$docfile_4 = $_FILES['intro_letter']['name'];
		$docfile_4 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_4);
		$temp_name_4 = $_FILES['intro_letter']['tmp_name'];
		$ilData['rr_intro_letter'] = $docfile_4;
		$ilData['rr_intro_letter_user'] = $_SESSION['user']['user_name'];
		$ilData['rr_intro_letter_date'] = date('d-m-Y');
		upload($docfile_4, $temp_name_4);
		
		$rr_id = $fwRequest->getParam('rr_id', '');
			
			$table->setWhere('rr_id = '.$rr_id);
			if($table->rowExists())
			{
			
				$detail = $table->updateRow($ilData);	
			}		
	}	
}
 
  
    
$search = $fwRequest->getParam('search', '');
if(!empty($search))
{
  $search_project = $fwRequest->getParam('project_name', '');

  if($search_project):
 	
       $where .= " AND dc_project  LIKE '%".$search_project."%'  ";
       $_SESSION['search_project'] = $search_project;
       $fwViewData['search_project']=$_SESSION['search_project'];

  elseif($_SESSION['search_project'] && $pagenum > 0):
		
       $where .= " AND dc_project LIKE  '%".$_SESSION['search_project']."%' ";
       $fwViewData['search_project']=$_SESSION['search_project'];
	
  endif;
  
    $_SESSION['where'] = $where; 
}  
   
 $status_search = $fwRequest->getParam('status_search', '');
 if(!empty($status_search))
 {
 	 $search_status = $fwRequest->getParam('dc_status', '');
	 
   if($search_status):
 	
       $where .= " AND dc_status  = ".$search_status;
       $_SESSION['search_status'] = $search_status;
       $fwViewData['search_status']=$_SESSION['search_status'];

  elseif($_SESSION['search_status'] && $pagenum > 0):
		
       $where .= " AND dc_status = ".$_SESSION['search_status'];
       $fwViewData['search_status']=$_SESSION['search_status'];
	
  endif;
  
    $_SESSION['where'] = $where; 
	 
 }
   
   
$clear = $fwRequest->getParam('clear', '');
if($clear) {
	unset($_SESSION['search_project']);
	unset($_SESSION['search_status']);
	unset($_SESSION['where']);
	unset($search_status);
}

 if(isset($_SESSION['where'])) { $where = $_SESSION['where']; }
 
//$ord =  " ORDER BY if( dc_date = ' '
//        OR dc_date IS  NULL , 0, 1 ) , STR_TO_DATE( dc_date, '%d-%m-%Y' ) DESC "; 
		
    
$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where ;	

if($matsql){$userData = $fwDb->query($matsql);}

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
	
	//$fwViewData['list'] = $listsnew;
  }
}

//foreach($listsnew as $k=>$v)
//{
//	$sq12= "SELECT  business_sellers.bs_business_id,  bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_email1,
//         	bus_customers.bcust_misc_moble from business_sellers 		
//	 	Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
//		Inner Join business ON business_sellers.bs_business_id = business.bsn_id where business.bsn_name = '".$v['rr_project']."'";  
//	
//	$data = $fwDb->queryOne($sq12);
//	$listsnew[$k]['bcust_fname'] = $data['bcust_fname'];
//	$listsnew[$k]['bcust_lname'] = $data['bcust_lname'];
//	$listsnew[$k]['bcust_misc_email1'] = $data['bcust_misc_email1'];
//	$listsnew[$k]['bcust_misc_moble'] = $data['bcust_misc_moble'];
//	
//	
//}

$fwViewData['list'] = $listsnew;
$fwViewData['title'] = $MODULE_PLURAL;
		
$sql_c = "Select * from roofing_occupancy";
$fwViewData['occdetail'] = $fwDb->query($sql_c);

$sql_ow = "Select * from roofing_they_want";
$fwViewData['rtwdetail'] = $fwDb->query($sql_ow);

$print = $fwRequest->getParam('print', 0);

if(!empty($print)) {
	$rr_id = $fwRequest->getParam('print_rr_id', 0);
	
	$sqlp = "Select * from roofing_report where rr_id = ".$rr_id;
	$rd = $fwDb->queryOne($sqlp);
	
	$sqlr = "select * from roofing_occupancy where ro_id = ".$rd['rr_occupancy'];
	$occ = $fwDb->queryOne($sqlr);
	
	$sqlw = "select * from roofing_they_want where rt_id = ".$rd['rr_what_they_want'];
	$what = $fwDb->queryOne($sqlw);
	
	$we = "No";
	if($rd['rr_are_we']==1) { $we = 'Yes - '.$rd['rr_are_we_date'] ." - ".$rd['rr_are_we_user']; }
	
	$html = "<html><body>";
	$html .= '<h2>Roofing Report</h2>';
	$html .= '<table border="1" cellpadding="6" cellspacing="0" style="font-family:Calibri;">';
	$html .= '<tr>';
	$html .= '<td style="width:25%;"><strong>Project</strong></td>';
	$html .= '<td style="width:75%;">'.$rd['rr_project'].'</td>';
	$html .= '</tr><tr>';
	$html .= '<td style="width:25%;"><strong>Occupancy</strong></td>';
	$html .= '<td style="width:75%;">'.$occ['ro_occupancy'].'</td>';
	$html .= '</tr><tr>';
	$html .= '<td style="width:25%;"><strong>Client Name</strong></td>';
	$html .= '<td style="width:75%;">'.$rd['rr_client_name'].'</td>';
	$html .= '</tr><tr>';
	$html .= '<td style="width:25%;"><strong>Email</strong></td>';
	$html .= '<td style="width:75%;">'.$rd['rr_email'].'</td>';
	$html .= '</tr><tr>';
	$html .= '<td><strong>Phone</strong></td>';
	$html .= '<td>'.$rd['rr_phone'].'</td>';
	
	$html .= '</tr><tr>';
	$html .= '<td><strong>Budget</strong></td>';
	$html .= '<td>'.$rd['rr_budget'].'</td>';
	
	$html .= '</tr><tr>';
	$html .= '<td><strong>What They Want</strong></td>';
	$html .= '<td>'.$what['rt_they_want'].'</td>';
	
	$html .= '</tr><tr>';
	$html .= '<td><strong>Survey Result</strong></td>';
	if(!empty($rd['rr_survery_result'])) {
		$html .= '<td><a href="https://deckquote.s3.amazonaws.com/files/roofing_report/'.$rd['rr_survery_result'].'">Download</a></td>';
	} else { 
		$html .= '<td></td>';
	}
	
	$html .= '</tr><tr>';
	$html .= '<td><strong>Are We Booking In?</strong></td>';
	$html .= '<td>'.$we.'</td>';
	
	$html .= '</tr><tr>';
	$html .= '<td><strong>Onsite Booked</strong></td>';
	$html .= '<td><a href="'.$rd['rr_onsite_video'].'" target="_blank">Link</a></td>';
	
	$html .= '</tr><tr>';
	$html .= '<td><strong>Onsite Video</strong></td>';
	$html .= '<td>'.$rd['rr_onsite_booked'].'</td>';
	
	$html .= '</tr><tr>';
	$html .= '<td><strong>Price</strong></td>';
	$html .= '<td>'.$rd['rr_price'].'</td>';
	
	$html .= '</tr><tr>';
	$html .= '<td><strong>Inspection Report PDF</strong></td>';
	if(!empty($rd['rr_inspection_report'])) {
		$html .= '<td><a href="https://deckquote.s3.amazonaws.com/files/roofing_report/'.$rd['rr_inspection_report'].'" target="_blank">Download</a></td>';
	} else { 
		$html .= '<td></td>';
	}
	
	$html .= '</tr><tr>';
	$html .= '<td><strong>Works Proposal Word</strong></td>';
	if(!empty($rd['rr_work_prop_word'])) {
		$html .= '<td><a href="https://deckquote.s3.amazonaws.com/files/roofing_report/'.$rd['rr_work_prop_word'].'" target="_blank">Download</a></td>';
	} else { 
		$html .= '<td></td>';
	}
	
	$html .= '</tr><tr>';
	$html .= '<td><strong>Works Proposal PDF</strong></td>';
	if(!empty($rd['rr_work_prop_pdf'])) {
		$html .= '<td><a href="https://deckquote.s3.amazonaws.com/files/roofing_report/'.$rd['rr_work_prop_pdf'].'" target="_blank">Download</a></td>';
	} else { 
		$html .= '<td></td>';
	}
	
	$html .= '</tr><tr>';
	$html .= '<td><strong>DocuSign Agreement</strong></td>';
	if(!empty($rd['rr_docusign_agr'])) {
		$html .= '<td><a href="https://deckquote.s3.amazonaws.com/files/roofing_report/'.$rd['rr_docusign_agr'].'" target="_blank">Download</a></td>';
	} else { 
		$html .= '<td></td>';
	}
	
	$html .= '</tr><tr>';
	$html .= '<td><strong>Introduction Letter</strong></td>';
	if(!empty($rd['rr_intro_letter'])) {
		$html .= '<td><a href="https://deckquote.s3.amazonaws.com/files/roofing_report/'.$rd['rr_intro_letter'].'" target="_blank">Download</a></td>';
	} else { 
		$html .= '<td></td>';
	}
		 
	$html .= '</tr>';

	
	$html .= "</table>";
	
	$html .= "</body></html>";
	$heading = "Roofing Report";
	create_roofing_PDF($heading, $html,$id='');
}


