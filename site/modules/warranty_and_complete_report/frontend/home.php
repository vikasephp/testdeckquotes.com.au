<?php
$pagenum = $fwRequest->getparam('pagenum','');
$tablebs = new Fw_Db_Table('business_sellers');
$tablebuscustomers = new Fw_Db_Table('bus_customers');

$savedata_1 = $fwRequest->getParam('savedata_1', '');
if($savedata_1) 
{ 	
		if($_FILES['q1_report']['name'])
		{
			$bcust_id = $fwRequest->getParam('bcust_id', '');
			
			$docfile_1 = $_FILES['q1_report']['name'];
			$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
			$temp_name_1 = $_FILES['q1_report']['tmp_name'];
			$letterData['bcust_wcr_q1_report1']  = $docfile_1;
			upload($docfile_1, $temp_name_1);

				$tablebuscustomers->setWhere('bcust_id = '.$bcust_id);
				if($tablebuscustomers->rowExists())
				{
					
					$detail = $tablebuscustomers->updateRow($letterData);	
				}		
		}	
}

$savedata_2 = $fwRequest->getParam('savedata_2', '');
if($savedata_2) 
{ 	
		if($_FILES['q1_final']['name'])
		{
			$bcust_id = $fwRequest->getParam('bcust_id', '');
			
			$docfile_2 = $_FILES['q1_final']['name'];
			$docfile_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
			$temp_name_2 = $_FILES['q1_final']['tmp_name'];
			$letterData['bcust_wcr_q1_report_final']  = $docfile_2;
			upload($docfile_2, $temp_name_2);

				$tablebuscustomers->setWhere('bcust_id = '.$bcust_id);
				if($tablebuscustomers->rowExists())
				{
					
					$detail = $tablebuscustomers->updateRow($letterData);	
				}		
		}	
}

$where = "WHERE 1=1 ";
$fwViewData['ran'] =  rand(100000,999999);
$keyword = $fwRequest->getParam('keyword', '');
	
if($keyword):
$where .= " AND business.bsn_name LIKE '%".$keyword."%'";
	
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
		
//$ord =  " ORDER BY  if(  bus_customers.bcust_wcr_occ_date = ' '
//OR bus_customers.bcust_wcr_occ_date IS NULL , 1, 0 ) desc , STR_TO_DATE( bus_customers.bcust_wcr_occ_date, '%d-%m-%Y' ) ASC ";

$ord = " Order by STR_TO_DATE( bus_customers.bcust_wcr_occ_date, '%d-%m-%Y' ) DESC ";

$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, business.bsn_name, bus_customers.bcust_id,
	bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_wacr_handover,
        business.bsn_address, bus_customers.bcust_vr_comp_date, bus_customers.bcust_vr_who, bus_customers.bcust_wcr_occ_date, 
        bus_customers.bcust_wcr_occ_dt_who, bus_customers.bcust_wcr_q1_report1, bus_customers.bcust_wcr_q1_report_final 
	from business_sellers 		
	Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where. " 
	And  business.bsn_status like '%|4|%' Group by business.bsn_id " .$ord;
	
if($sql){$userData = $fwDb->query($sql);}

$fwViewData['total'] = sizeof($userData);

if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

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
		
		$link  = BASE_URL. "business.detail/bsn_id/".$v['bs_business_id'];
		$link2 = BASE_URL. "customer.detail/bcust_id/".$v['bcust_id'];
		
		$sql121 = "select doc_file_name from document_check_list 
		           where doc_name_id =  121 and doc_bsn_id  = ".$v['bs_business_id'];
		$data121 = $fwDb->queryOne($sql121);
		
		$sql173 = "select doc_file_name from document_check_list 
		           where doc_name_id =  173 and doc_bsn_id  = ".$v['bs_business_id'];
		$data173 = $fwDb->queryOne($sql173);
		
		$sql172 = "select doc_file_name from document_check_list 
		           where doc_name_id =  172 and doc_bsn_id  = ".$v['bs_business_id'];
		$data172 = $fwDb->queryOne($sql172);
		
		
		$sql610 = "select doc_file_name from document_check_list 
		           where doc_name_id =  610 and doc_bsn_id  = ".$v['bs_business_id'];
		$data610 = $fwDb->queryOne($sql610);
		
		$sqlopen = "select count(wa_project) as tot_log from warranty_log where wa_status = 'Open' 
		           and wa_project like '%".$v['bsn_name']."%'";
			   
		$openlog = $fwDb->queryOne($sqlopen);
		
		$setdata2[$k]['bs_business_id'] = $v['bs_business_id'];
		$setdata2[$k]['bs_customers_id'] = $v['bs_customers_id'];
		$setdata2[$k]['bcust_id'] = $v['bcust_id'];
		$setdata2[$k]['bcust_fname'] = $v['bcust_fname'];
		$setdata2[$k]['bcust_lname'] = $v['bcust_lname'];
		$setdata2[$k]['bsn_address'] = $v['bsn_address'];
		$setdata2[$k]['link'] = $link;
		$setdata2[$k]['link2'] = $link2;
		$setdata2[$k]['bcust_vr_comp_date'] = $v['bcust_vr_comp_date'];
		$setdata2[$k]['bcust_br_budget'] = $v['bcust_br_budget'];
		$setdata2[$k]['bcust_br_gp'] = $v['bcust_br_gp'];
		$setdata2[$k]['bcust_vr_who'] = $v['bcust_vr_who'];
		$setdata2[$k]['bcust_wcr_occ_date'] = $v['bcust_wcr_occ_date'];
		$setdata2[$k]['bcust_wcr_occ_dt_who'] = $v['bcust_wcr_occ_dt_who'];
		$setdata2[$k]['file_name_121'] = $data121['doc_file_name'];
		$setdata2[$k]['file_name_173'] = $data173['doc_file_name'];
		$setdata2[$k]['file_name_172'] = $data172['doc_file_name'];
		$setdata2[$k]['file_name_610'] = $data610['doc_file_name'];
		
		$setdata2[$k]['bcust_wcr_q1_report1'] = $v['bcust_wcr_q1_report1'];	
		$setdata2[$k]['bcust_wcr_q1_report_final'] = $v['bcust_wcr_q1_report_final'];
		$setdata2[$k]['tot_log'] = $openlog['tot_log'];	
		$setdata2[$k]['bcust_wacr_handover'] = $v['bcust_wacr_handover'];
						
}
 
 	$fwViewData['list'] =  $setdata2;
 
 }
}

$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Warranty And Complete Report";

	
	//  Merge Print Starts here
 
$mergeprint = $fwRequest->getParam('mergeprint', '');
if(!empty($mergeprint))
{
      $project = $fwRequest->getParam('project_name', '');

	$where = " where wa_project like '%".$project."%' and wa_status ='Open' "; 
       	$wasql = "SELECT * from warranty_log ".$where;

        if($wasql){$waData = $fwDb->query($wasql);}
	
	$heading = "Warranty Log Report";
		
	$html = '';	
	$html .= '<table border="1" width="100%" cellpadding="7">';
	
	
	$last_key = end(array_keys($waData));
	
	foreach($waData as $k => $m)
	{

		$sql_p = "Select pr_priority from warranty_log_priority where pr_id = ".$m["wa_priority"];
		$prData = $fwDb->queryOne($sql_p);	
		
		$sq12= "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
         		bus_customers.bcust_misc_moble from business_sellers 		
	 		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
			Inner Join business ON business_sellers.bs_business_id = business.bsn_id where business.bsn_name = '".$m['wa_project']."'";  
	
	        $data = $fwDb->queryOne($sq12);
		
		if($m["wa_qicc"]==1) { $qicc='Yes'; } else { $qicc='No'; }
		
		
		if(!empty($m["wa_image_1"])) {
			//$img1 = '<img src="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$m["wa_image_1"].'" height="150">';
			
			$folder_path = "files/warranty_log/";  $object_name = $m["wa_image_1"];
		    $file = get_file_raw_data($folder_path,$object_name);
		    $img1 = '<img src="'.$file.'" height="150">';
			
		} else {
		        $img1 = '';	
		}
		
		if(!empty($m["wa_image_2"])) {
			//$img2 = '<img src="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$m["wa_image_2"].'" height="150">';
			
			$folder_path = "files/warranty_log/";  $object_name = $m["wa_image_2"];
		    $file = get_file_raw_data($folder_path,$object_name);
		    $img1 = '<img src="'.$file.'" height="150">';
			
		} else {
		        $img2 = '';	
		}
		
		if(!empty($m["wa_image_3"])) {
			//$img3 = '<img src="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$m["wa_image_3"].'" height="150">';
			$folder_path = "files/warranty_log/";  $object_name = $m["wa_image_3"];
		    $file = get_file_raw_data($folder_path,$object_name);
		    $img1 = '<img src="'.$file.'" height="150">';
			
			
		} else {
		        $img3 = '';	
		}
		
		if(!empty($m["wa_image_4"])) {
			//$img4 = '<img src="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$m["wa_image_4"].'" height="150">';
			
			$folder_path = "files/warranty_log/";  $object_name = $m["wa_image_4"];
		    $file = get_file_raw_data($folder_path,$object_name);
		    $img1 = '<img src="'.$file.'" height="150">';
			
		} else {
		        $img4 = '';	
		}
	
	
		if(!empty($m["wa_image_5"])) {
			//$img5 = '<img src="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$m["wa_image_5"].'" height="150">';
			
			$folder_path = "files/warranty_log/";  $object_name = $m["wa_image_5"];
		    $file = get_file_raw_data($folder_path,$object_name);
		    $img1 = '<img src="'.$file.'" height="150">';
			
		} else {
		        $img5 = '';	
		}	
		$m["wa_problem"] = str_replace("’","'",$m["wa_problem"]);
		$m["wa_notes"] = str_replace("’","'",$m["wa_notes"]);
		
		$html .= '<tr style="background-color:#FF0; text-align:center">';
		$html .= '<th  colspan="2">Rec. No. '.$m["wa_id"].' </th>';
		$html .= '</tr>';
		
		$html .= '<tr>';
		$html .= '<td width="15%">Project</td>';
		$html .= '<td width="85%">'.$m["wa_project"].'</td>';
	        $html .= '</tr>';
		
		$html .= '<tr>';
		$html .= '<td width="15%">Contact Info</td>';
		$html .= '<td width="85%">'.$data['bcust_fname'].' '.$data['bcust_lname'].'</td>';
		$html .= '</tr>';
		
		$html .= '<tr>';
		$html .= '<td width="15%">Status</td>';
		$html .= '<td width="85%">'.$m["wa_status"].'</td>';
		$html .= '</tr>';
		
		$html .= '<tr>';
		$html .= '<td width="15%">Priority</td>';
		$html .= '<td width="85%">'.$prData['pr_priority'].'</td>';
		$html .= '</tr>';
		
		$html .= '<tr>';
		$html .= '<td width="15%">Problem</td>';
		$html .= '<td width="85%">'.$m["wa_problem"].'</td>';
		$html .= '</tr>';
		
		$html .= '<tr>';
	        $html .= '<td width="15%">Notes</td>';
		$html .= '<td width="85%">'.trim($m["wa_notes"]).'</td>';
		$html .= '</tr>';
		
		$html .= '<tr>';
	        $html .= '<td width="15%">Date</td>';
		$html .= '<td width="85%">'.trim($m["wa_date"]).'</td>';
		$html .= '</tr>';
		
		$html .= '<tr>';
	        $html .= '<td width="15%">Type</td>';
		$html .= '<td width="85%">'.$m["wa_type"].'</td>';
		$html .= '</tr>';
		
		$html .= '<tr>';
	        $html .= '<td width="15%">Tenated</td>';
		$html .= '<td width="85%">'.$m["wa_tenanted"].'</td>';
		$html .= '</tr>';
		
		$html .= '<tr>';
	        $html .= '<td width="15%">Q. Inspector Contaced Client</td>';
		$html .= '<td width="85%">'.trim($qicc).'</td>';
		$html .= '</tr>';
		
		$html .= '<tr>';
	        $html .= '<td width="15%">Date Inspected</td>';
		$html .= '<td width="85%">'.trim($m["wa_date_inspected"]).'</td>';
		$html .= '</tr>';
		
		$html .= '<tr>';
	        $html .= '<td width="15%">CGFB Person</td>';
		$html .= '<td width="85%">'.$m["wa_cgfb_person"].'</td>';
		$html .= '</tr>';
		
		$html .= '<tr>';
	        $html .= '<td width="15%">Supplier or Contact</td>';
		$html .= '<td width="85%">'.$m["wa_supplier"].'</td>';
		$html .= '</tr>';
		
		$html .= '<tr>';
		$html .= '<td colspan="2">'.$img1.'&nbsp;'.$img2.'&nbsp;'.$img3.'&nbsp;'.$img4.'&nbsp;'.$img5.'</td>';
		$html .= '</tr>';
			if ($k <> $last_key) {
				$html .= '<br pagebreak="true" />';
			}
		
	}
	
	$html .= '</table>';
	$html = utf8_encode($html);
	create_warranty_PDF($heading,$html,$fname);
   }
 
 // Merge Print Ends here 
 
 $sqlh = "Select * from wacr_handover_options";
 $fwViewData['datah'] = $fwDb->query($sqlh);
 