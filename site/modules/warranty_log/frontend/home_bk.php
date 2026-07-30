<?php
//get the current limit
$memlimit = ini_get('memory_limit');
//set it to something else
ini_set("memory_limit", "1024M");
ini_set('max_execution_time', 0);	



$pagenum = $fwRequest->getparamget('pagenum',0);
$listdata = $fwRequest->getParam($TABLE, array());
$table = new Fw_Db_Table('warranty_log');

$savedata = $fwRequest->getParam('savedata', '');
if($savedata) { 

if($_FILES['pr_letter']['name'])
		{
			$wa_id = $fwRequest->getParam('wa_id', '');
						
						$docfile_1 = $_FILES['pr_letter']['name'];
						$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
						$temp_name_1 = $_FILES['pr_letter']['tmp_name'];
						$detail['wa_com_close_letter'] = $docfile_1;
						upload($docfile_1, $temp_name_1);
							
							$table->setWhere('wa_id = '.$wa_id);
							if($table->rowExists())
							{
								
								$detail = $table->updateRow($detail);	
							}		
			}
}




$where = " WHERE ( wa_status = 'Open' Or wa_status = 'Pending' )";

$warranty_status = $fwRequest->getParam('warranty_status', '');

if(!empty($warranty_status)) {
	$where = " WHERE 1 = 1 ";
}

$submit = $fwRequest->getParam('openclose', '');
if(!empty($submit)) {
	$where = "WHERE 1=1";
	$_SESSION['openclose'] = 0;
	$_SESSION['where'] =  $where;	
}
$ord ='';
$submitclosed = $fwRequest->getParam('closedonly', '');
if(!empty($submitclosed)) {
	$where = "WHERE wa_status = 'Closed'";
	$_SESSION['closedonly'] = 0;
	$_SESSION['where'] =  $where;
	
	$ord =  " ORDER BY if(  warranty_log.wa_status_date = ' '
                OR warranty_log.wa_status_date IS NULL , 1, 0 ) , STR_TO_DATE( warranty_log.wa_status_date, '%d-%m-%Y' ) DESC";	
}


$sort_date = $fwRequest->getParam('sort_date', '');
if(!empty($sort_date)) {
$ord =  " ORDER BY if(  warranty_log.wa_date = ' '
         OR warranty_log.wa_date IS NULL , 1, 0 ) , STR_TO_DATE( warranty_log.wa_date, '%d-%m-%Y' ) DESC";
	 
	$_SESSION['ord'] = $ord; 	
}
  
  
$sort_proj = $fwRequest->getParam('sort_proj', '');
if(!empty($sort_proj)) {
	$ord =  " ORDER BY  warranty_log.wa_project ";
	$_SESSION['ord'] = $ord; 	
}
  
  $sort_priority = $fwRequest->getParam('sort_priority', '');
  if(!empty($sort_priority)) {
        $ord =  " ORDER BY  warranty_log.wa_priority";
	$_SESSION['ord'] = $ord; 	
  }
   
    

  $search_project = $fwRequest->getParam('project_name', '');

  if($search_project):
    
       $where .= " AND wa_project  LIKE '%".$search_project."%'  ";
       $_SESSION['search_project'] = $search_project;
       $fwViewData['search_project']=$_SESSION['search_project'];

  elseif($_SESSION['search_project'] && $pagenum > 0):
		
       $where .= " AND wa_project LIKE  '%".$_SESSION['search_project']."%' ";
       $fwViewData['search_project']=$_SESSION['search_project'];
	
  endif;
  
    $_SESSION['where'] = $where; 

  
  
  // supplier search starts
  
  $supplier_name = $fwRequest->getParam('supp_name', '');

  if($supplier_name):
	
       $where .= " AND wa_include_supplier  LIKE '%".$supplier_name."%'  ";
       $_SESSION['supplier_name'] = $supplier_name;
       $fwViewData['supplier_name']=$_SESSION['supplier_name'];

  elseif($_SESSION['supplier_name'] ):
		
       $where .= " AND wa_include_supplier LIKE  '%".$_SESSION['supplier_name']."%' ";
       $fwViewData['supplier_name']=$_SESSION['supplier_name'];
	
  endif;
  
    $_SESSION['where'] = $where; 

   // supplier search ends
  
  
    // Type search starts
  
  $warranty_type = $fwRequest->getParam('warranty_type', '');

  if($warranty_type):
	
       $where .= " AND wa_type  LIKE '%".$warranty_type."%'  ";
       $_SESSION['warranty_type'] = $warranty_type;
       $fwViewData['warranty_type']=$_SESSION['warranty_type'];

  elseif($_SESSION['warranty_type'] ):
		
       $where .= " AND wa_type LIKE  '%".$_SESSION['warranty_type']."%' ";
       $fwViewData['warranty_type']=$_SESSION['warranty_type'];
	
  endif;
  
    $_SESSION['where'] = $where; 

   // Type search ends
   
   
   
   
  // Status search starts
  
  $warranty_status = $fwRequest->getParam('warranty_status', '');

  if($warranty_status):
	
       $where .= " And wa_status  LIKE '%".$warranty_status."%'  ";
       $_SESSION['warranty_status'] = $warranty_status;
       $fwViewData['warranty_status']=$_SESSION['warranty_status'];

  elseif($_SESSION['warranty_status'] ):
		
       $where .= " And wa_status LIKE  '%".$_SESSION['warranty_status']."%' ";
       $fwViewData['warranty_status']=$_SESSION['warranty_status'];
	
  endif;
  
    $_SESSION['where'] = $where; 

   // Status search ends

  
   // Priority search starts
  
  $search_by_priority = $fwRequest->getParam('priority', '');

  if($search_by_priority):
	
       $where .= " AND wa_priority  = ".$search_by_priority;
       $_SESSION['search_by_priority'] = $search_by_priority;
       $fwViewData['search_by_priority']=$_SESSION['search_by_priority'];

  elseif($_SESSION['search_by_priority'] ):
		
       $where .= " AND wa_priority   = ".$_SESSION['search_by_priority'];
       $fwViewData['search_by_priority'] = $_SESSION['search_by_priority'];
	
  endif;
  
    $_SESSION['where'] = $where; 

   // Priority search ends
   
   
   
     // Filter By PRIORITY starts
  
  $filter_by_priority = $fwRequest->getParam('filter_by_priority', '');

  if($filter_by_priority):
	
       $where .= " AND wa_priority  = ".$filter_by_priority;
       $_SESSION['filter_by_priority'] = $filter_by_priority;
       $fwViewData['filter_by_priority']=$_SESSION['filter_by_priority'];

  elseif($_SESSION['filter_by_priority'] ):
		
       $where .= " AND wa_priority   = ".$_SESSION['filter_by_priority'];
       $fwViewData['filter_by_priority'] = $_SESSION['filter_by_priority'];
	
  endif;
  
    $_SESSION['where'] = $where; 

   // Filter By PRIORITY ends
   

  
   
  // Record No search starts
  
  $recno = $fwRequest->getParam('recno', '');

  if($recno):
  
   $where = " where 1 = 1";
   $where .= " and  wa_id  = ".$recno;
       $_SESSION['recno'] = $recno;
       $fwViewData['recno']=$_SESSION['recno'];
       $_SESSION['where'] = $where; 

  elseif($_SESSION['recno']):
  	    $where = " where 1 = 1";	
       $where .= " AND wa_id  = ".$_SESSION['recno'];
       $fwViewData['recno'] = $_SESSION['recno'];
       $_SESSION['where'] = $where; 
	
  endif; 
  // Record No search starts  
  
  
   // Responsible Staff search starts
  
  $res_staff = $fwRequest->getParam('search_by_rs', '');

  if($res_staff):
	
       $where .= " AND wa_resp_staff   LIKE '%".$res_staff."%'  ";
       $_SESSION['res_staff'] = $res_staff;
       $fwViewData['res_staff']=$_SESSION['res_staff'];

  elseif($_SESSION['res_staff'] ):
		
       $where .= " AND wa_resp_staff  LIKE  '%".$_SESSION['res_staff']."%' ";
       $fwViewData['res_staff']=$_SESSION['res_staff'];
	
  endif;
  
    $_SESSION['where'] = $where; 

   // Responsible Staff search ends
  
  
  $ren = $fwRequest->getParam('wa_id', '');
  if(!empty($ren)) {
	  $where = " where 1 = 1";
      $where .= " and  wa_id  = ".$ren;
	  	
  }

  
   
$clear = $fwRequest->getParam('clear', '');
if($clear) {
	
	
	$fwViewData['search_project'] = '';
	$where = "WHERE wa_status = 'Open' OR wa_status = 'Pending'";
	$fwViewData['oc'] = 1;
	$fwViewData['pr'] = '';
	unset($_SESSION['search_project']);
	unset($_SESSION['where']);
	unset($_SESSION['recno']);
	unset($_SESSION['supplier_name']);
	unset($_SESSION['warranty_status']);
	unset($_SESSION['warranty_type']);
	unset($_SESSION['search_by_priority']);
	unset($_SESSION['filter_by_priority']);
	unset($_SESSION['res_staff']);
	unset($supplier_name);
	
	unset($warranty_status);
	unset($search_by_priority);
	$fwViewData['warranty_status'] = '';
	$fwViewData['search_by_priority'] = '';
	$fwViewData['res_staff'] = '';
	
	
	
}
 

//  Merge Print Starts here
 
 $submit = $fwRequest->getParam('print', '');
if(!empty($submit))
{
      $search_project = $fwRequest->getParam('project_name', '');
      $supplier_name = $fwRequest->getParam('supp_name', '');
	  $warranty_type = $fwRequest->getParam('warranty_type', '');
	  $recno = $fwRequest->getParam('recno', '');
	  $warranty_status = $fwRequest->getParam('warranty_status', '');
	  $search_by_priority = $fwRequest->getParam('priority', '');
	  $res_staff = $fwRequest->getParam('search_by_rs', '');
	 
 	  $where = " WHERE 1=1";
	 
	  if(!empty($search_project)) {
	 	 $where .= " AND wa_project like '%".$search_project."%'  "; 
	  }
	  
	   if(!empty($supp_name)) {
	 	 $where .= " AND wa_include_supplier like '%".$supp_name."%'  "; 
	  }
	  
	  
	   if(!empty($warranty_type)) {
	 	 $where .= " AND wa_type like '%".$warranty_type."%'  "; 
	  }
	  
	   if(!empty($recno)) {
	 	 $where .= " AND wa_id like '%".$search_project."%'  "; 
	   }
	  
	   if(!empty($warranty_status)) {
	 	 $where .= " AND wa_status like '%".$warranty_status."%'  "; 
	   }
	   
	    if(!empty($search_by_priority)) {
	 	 $where .= " AND wa_priority like '%".$search_by_priority."%'  "; 
	   }
	   
	    if(!empty($res_staff)) {
	 	 $where .= " AND wa_resp_staff like '%".$res_staff."%'  "; 
	   }
	  
	  
  	
	$heading = "Warranty Log Report";

	$wasql = "SELECT * from warranty_log ".$where." order by wa_status DESC";
	
	
	

        if($wasql){$waData = $fwDb->query($wasql);}
	
		
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
			$img1 = '<img src="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$m["wa_image_1"].'" height="150">';
		} else {
		        $img1 = '';	
		}
		
		if(!empty($m["wa_image_2"])) {
			$img2 = '<img src="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$m["wa_image_2"].'" height="150">';
		} else {
		        $img2 = '';	
		}
		
		if(!empty($m["wa_image_3"])) {
			$img3 = '<img src="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$m["wa_image_3"].'" height="150">';
		} else {
		        $img3 = '';	
		}
		
		if(!empty($m["wa_image_4"])) {
			$img4 = '<img src="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$m["wa_image_4"].'" height="150">';
		} else {
		        $img4 = '';	
		}
	
	
		if(!empty($m["wa_image_5"])) {
			$img5 = '<img src="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$m["wa_image_5"].'" height="150">';
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
		$html .= '<td width="85%">'.$data['bcust_fname'].' '.$data['bcust_lname'].' - Mobile No :'.$data['bcust_misc_moble'].'</td>';
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
 
  
 
 //  7 Day Report Starts Here
 
 $submit7 = $fwRequest->getParam('sevenday', '');
if(!empty($submit7))
{
       	 $oc = $fwRequest->getParam('oc', '');
	 $ina = $fwRequest->getParam('ina', '');
	
	 if($oc == 1)
         {
		$where2 = " AND wa_status = 'Open' ";
         } elseif($oc == 2) {
		$where2 = " AND  wa_status = 'Closed' "; 
	 } 
	$fwViewData['oc'] = $oc;

	$heading = "Warranty Log Report";
	$todate = date('d-m-M', strtotime('- ' .'7 days'));
	
	$prsql = "SELECT distinct wa_project FROM warranty_log 
	          WHERE STR_TO_DATE(wa_date , '%d-%m-%Y' ) > CURDATE( ) - INTERVAL 7 DAY ".$where2. "  ORDER BY wa_project ASC";
        if($prsql){$prData = $fwDb->query($prsql);}



$html = '';	
foreach($prData as $pk => $pv)	
{	
	
	$wasql = "SELECT * FROM warranty_log 
	          WHERE STR_TO_DATE(wa_date , '%d-%m-%Y' ) > CURDATE( ) - INTERVAL 7 DAY ".$where2. " AND wa_project = '".$pv['wa_project']."'";
     if($wasql){$waData = $fwDb->query($wasql);}
	
	
		
	$html .= '<table border="1" width="100%" cellpadding="7">';
	$last_key = end(array_keys($waData));
	

	$sr = 1;
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
			$img1 = '<img src="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$m["wa_image_1"].'" height="150">';
		} else {
		        $img1 = '';	
		}
		
		if(!empty($m["wa_image_2"])) {
			$img2 = '<img src="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$m["wa_image_2"].'" height="150">';
		} else {
		        $img2 = '';	
		}
		
		if(!empty($m["wa_image_3"])) {
			$img3 = '<img src="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$m["wa_image_3"].'" height="150">';
		} else {
		        $img3 = '';	
		}
		
		if(!empty($m["wa_image_4"])) {
			$img4 = '<img src="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$m["wa_image_4"].'" height="150">';
		} else {
		        $img4 = '';	
		}
	
	
		if(!empty($m["wa_image_5"])) {
			$img5 = '<img src="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$m["wa_image_5"].'" height="150">';
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
		$html .= '<td width="85%">'.$data['bcust_fname'].' '.$data['bcust_lname'].' - Mobile No :'.$data['bcust_misc_moble'].'</td>';
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
		
		//$html = utf8_encode($html);
	
		$sr++;
	}
	$html .= '</table>';
	
   }
  
 
  
 create_warranty_PDF($heading,$html,$fname);
}


  
  if($pagenum > 1) {
	if(isset($_SESSION['ord'])) { $ord = $_SESSION['ord']; }
	if(isset($_SESSION['where'])) { $where = $_SESSION['where']; }
  }
 
 if(isset($_SESSION['where'])) { $where = $_SESSION['where']; }
  

  
$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where .' ' .$ord;	



if($matsql){$userData = $fwDb->query($matsql);}


$sql_open = "Select count(*) as open from warranty_log where wa_status = 'Open' ";
$fwViewData['tot_open'] = $fwDb->queryOne($sql_open);

$sql_seven = "SELECT count(*) as seven FROM warranty_log 
	         WHERE STR_TO_DATE(wa_date , '%d-%m-%Y' ) > CURDATE( ) - INTERVAL 7 DAY ";
$fwViewData['tot_seven'] = $fwDb->queryOne($sql_seven);

$sql_ninety = "SELECT count(*) as ninety FROM warranty_log 
	           WHERE wa_status = 'Open' and STR_TO_DATE(wa_date , '%d-%m-%Y' ) < CURDATE( ) - INTERVAL 90 DAY ";
$fwViewData['tot_ninety'] = $fwDb->queryOne($sql_ninety);

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
	
	$fwViewData['list'] = $listsnew;
  }
}


foreach($listsnew as $k => $v2)
{

  
  $sq12= "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
         bus_customers.bcust_misc_moble from business_sellers 		
	     Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	     Inner Join business ON business_sellers.bs_business_id = business.bsn_id where business.bsn_name Like '%".$v2['wa_project']."%'";  
	
  $data = $fwDb->queryOne($sq12);
  
 					$dayscount='';
					$ccdate = $v2['wa_date'];
					if(!empty($ccdate)) {
					$Statusdate = changedate_y_m_d($ccdate);
					$curdate_y_m_d = date('Y-m-d');
					$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
					}
  
  $sql_t = "Select wa_id  from trade_responsibility where wa_log_number = ".$v2['wa_id'];
  $data_tr = $fwDb->queryOne($sql_t);
  
  
  $sqlenq = "Select we_answer from warranty_enquiry where we_wa_id = ".$v2['wa_id'];
  $ansdata = $fwDb->query($sqlenq);
  
  $sql_ud = "Select max(ws_date) as update_date from warranty_supplier_update where  ws_wa_id = ".$v2['wa_id'];
  $udData = $fwDb->queryOne($sql_ud);
  
  $sql_nt = "Select max(STR_TO_DATE(wn_date, '%d-%m-%Y' )) as notes_date from warranty_log_notes where wn_wa_id = ".$v2['wa_id']; 
  $ntdata = $fwDb->queryOne($sql_nt);
  	 

  $sql_nt2 = "Select max(ws_date) as notes_date2 from warranty_supplier_update where ws_wa_id = ".$v2['wa_id']; 
  $ntdata2 = $fwDb->queryOne($sql_nt2);
  
   
  if(strtotime($ntdata['notes_date']) > strtotime($ntdata2['notes_date2']))
     {
		 $ndate =  $ntdata['notes_date'];
	 }
	 else {
		  $ndate =  $ntdata2['notes_date2'];
	 }
  
	
   $sql100 = "select sa_co_id from supplier_warranty where sa_wa_id = ".$v2['wa_id'];
   $data100 = $fwDb->query($sql100);	 
	
	$red = 0; 
    foreach($data100 as $k10=>$v10)
	{
	    $sql101 = "Select se_co_id from supplier_email_warranty where se_co_id = ".$v10['sa_co_id']." and se_wa_id = ".$v2['wa_id'];
		$found = $fwDb->query($sql101);
		if(empty($found)) { $red = 1; }
				
	}
	 
	 
	 $setdata2[$k]['wa_id'] = $v2['wa_id'];
	 $setdata2[$k]['wa_project'] = stripslashes($v2['wa_project']);
	 $setdata2[$k]['wa_date'] = $v2['wa_date'];
	 $setdata2[$k]['wa_problem'] = $v2['wa_problem'];
	 $setdata2[$k]['wa_cgfb_person'] = $v2['wa_cgfb_person'];
	 $setdata2[$k]['wa_supplier'] = $v2['wa_supplier'];
	 $setdata2[$k]['wa_status'] = $v2['wa_status'];
	 $setdata2[$k]['wa_image_1'] = $v2['wa_image_1'];
	 $setdata2[$k]['wa_image_2'] = $v2['wa_image_2'];
	 $setdata2[$k]['wa_image_3'] = $v2['wa_image_3'];
	 $setdata2[$k]['wa_image_4'] = $v2['wa_image_4'];
	 $setdata2[$k]['wa_image_5'] = $v2['wa_image_5'];
	
	 $setdata2[$k]['wa_type'] = $v2['wa_type'];
	 $setdata2[$k]['wa_qicc'] = $v2['wa_qicc'];
	 $setdata2[$k]['wa_priority'] = $v2['wa_priority'];
	 $setdata2[$k]['wa_date_inspected'] = $v2['wa_date_inspected'];
	 $setdata2[$k]['wa_tenanted'] = $v2['wa_tenanted'];
	 $setdata2[$k]['bcust_fname'] = $data['bcust_fname'];
	 $setdata2[$k]['bcust_lname'] = $data['bcust_lname'];
	 $setdata2[$k]['bcust_misc_moble'] = $data['bcust_misc_moble'];
	 $setdata2[$k]['wa_com_close_letter'] = $v2['wa_com_close_letter'];
	 $setdata2[$k]['wa_video'] = $v2['wa_video'];
	 $setdata2[$k]['wa_user'] = $v2['wa_user'];
	 $setdata2[$k]['wa_resp_staff'] = $v2['wa_resp_staff'];
	 $setdata2[$k]['dayscount'] = $dayscount;
	 
	 $setdata2[$k]['wa_include_supplier'] = $v2['wa_include_supplier'];
	 $setdata2[$k]['wa_status_date'] = $v2['wa_status_date'];
	 
	 $setdata2[$k]['wa_selected'] = $red;
	 
	 $setdata2[$k]['update_date'] = changedate_d_m_y($udData['update_date']);
	 //$setdata2[$k]['notes_date']  = changedate_d_m_y($ntdata['notes_date']);
	 
	  $setdata2[$k]['notes_date']  = changedate_d_m_y($ndate);
	 $setdata2[$k]['wa_walkthrough_date'] = $v2['wa_walkthrough_date'];
	 
	 if(!empty($data_tr['wa_id'])) {  $setdata2[$k]['wa_button'] =  $data_tr['wa_id']; }
	 
	 $setdata2[$k]['enquiry_pen'] = 0;
	 foreach($ansdata as $k4=>$v4) {
		 if(strlen(trim($v4['we_answer'])) == 0 || $v4['we_answer'] == NULL) {
			 $setdata2[$k]['enquiry_pen'] = 1;
			 break;
		 }
	 }
	 $sql4 = "select count(*) as tot from warranty_supplier_update where ws_wa_id = ".$v2['wa_id'];
	$cudata = $fwDb->queryOne($sql4);	

	if($cudata['tot']> 0 ) {
		 $setdata2[$k]['supplier_upadate'] = true;	
	}
	  
	$setdata2[$k]['wa_lia_acc'] = $v2['wa_lia_acc'];  
}


$fwViewData['list'] = $setdata2;
$fwViewData['title'] = $MODULE_PLURAL;

 		
$sqlpr = "Select * from warranty_log_priority";
$fwViewData['prdetail'] = $fwDb->query($sqlpr); 


$thisTable = new Fw_Db_Table("warranty_log_type");

$fwViewData['typedetail'] = $thisTable->getAllRows(); 



//  Merge Print Filter by priority
 
$submit = $fwRequest->getParam('print_filter', '');
if(!empty($submit))
{

        $pr = $fwRequest->getParam('search_by_priority', ''); 
	          
       if($pr > 0 )
       {
	    $where = " where wa_priority = ".$pr; 
	    
       }
	
	
	$heading = "Warranty Log Report";

	$wasql = "SELECT * from warranty_log ".$where." order by wa_status DESC";

        if($wasql){$waData = $fwDb->query($wasql);}
	
		
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
			
			$img_data_1 =  get_image_raw_data($m["wa_image_1"]); 
			//$img1 = '<img src="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$m["wa_image_1"].'" height="150">';
			$img1 = '<img src="'.$img_data_1.'" height="150">';
			
			
		} else {
		        $img1 = '';	
		}
		
		if(!empty($m["wa_image_2"])) {
			$img_data_2 =  get_image_raw_data($m["wa_image_2"]); 
			//$img2 = '<img src="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$m["wa_image_2"].'" height="150">';
			$img2 = '<img src="'.$img_data_2.'" height="150">';
			
		} else {
		        $img2 = '';	
		}
		
		if(!empty($m["wa_image_3"])) {
			$img_data_3 =  get_image_raw_data($m["wa_image_3"]); 
			//$img3 = '<img src="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$m["wa_image_3"].'" height="150">';
			$img3 = '<img src="'.$img_data_3.'" height="150">';
			
		} else {
		        $img3 = '';	
		}
		
		if(!empty($m["wa_image_4"])) {
			$img_data_4 =  get_image_raw_data($m["wa_image_4"]);
			//$img4 = '<img src="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$m["wa_image_4"].'" height="150">';
			$img4 = '<img src="'.$img_data_4.'" height="150">';
			
		} else {
		        $img4 = '';	
		}
	
	
		if(!empty($m["wa_image_5"])) {
			$img_data_5 =  get_image_raw_data($m["wa_image_5"]);
			//$img5 = '<img src="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$m["wa_image_5"].'" height="150">';
			$img5 = '<img src="'.$img_data_5.'" height="150">';
			
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
		$html .= '<td width="85%">'.$data['bcust_fname'].' '.$data['bcust_lname'].' - Mobile No :'.$data['bcust_misc_moble'].'</td>';
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
	unset($waData);
	//create_warranty_PDF($heading,$html,$fname);
	
	db($html);
  
}

 // Merge Print Ends here 
  
$sqlRe = "Select distinct cs_position from contacts where cs_position <> ''";
$fwViewData['rsdetail'] = $fwDb->query($sqlRe);
 
$sql_pro = "select distinct wa_project from warranty_log";
$fwViewData['project_data'] = $fwDb->query($sql_pro ); 


$sqls = "select co_id, co_company_name from companies";
$fwViewData['supdetail'] = $fwDb->query($sqls);

 
