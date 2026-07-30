<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$listdata = $fwRequest->getParam($TABLE, array());
$table = new Fw_Db_Table('30_days_rec_report');
$tableUp = new Fw_Db_Table('30_days_file');
$tablela = new Fw_Db_Table('30_days_last_audited');


$upload = $fwRequest->getParam('upload', '');
if(!empty($upload)) {
	if($_FILES['upload_file']['name'])
			{
				
				
					$docfile_1 = $_FILES['upload_file']['name'];
					$file_type = $_FILES['upload_file']['type'];				
					
					$datetime = trim(date('d_m_Y_H_i_'),'0');
					$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
					$src = $_FILES['upload_file']['tmp_name'];
					
					upload_2024($docfile_1, $src);
					
					$detailup['td_file_name'] = $docfile_1;
					$detailup['td_user'] = $_SESSION['user']['user_name'];
					$detailup['td_date'] = date('d-m-Y');
					chmod($destination, 0664);	
					
					$tableUp->setWhere("td_id = 1");
	 
	  				$this_id = $tableUp->updateRow($detailup);
					
					
									
//					$destination = BASE_DIR.'files/uploads_2024/'.$docfile_1;
//					
//						if(!move_uploaded_file($src, $destination))
//								{
//									//echo "Possible file upload attack";
//								}
//						else
//								{
//									$detailup['td_file_name'] = $docfile_1;
//									$detailup['td_user'] = $_SESSION['user']['user_name'];
//									$detailup['td_date'] = date('d-m-Y');
//									chmod($destination, 0664);
//									
//									$tableUp->setWhere("td_id = 1");
//	 
//	  								$this_id = $tableUp->updateRow($detailup);
//								}						
			}

}
$where = " WHERE td_hide = 0";

$hidden = $fwRequest->getParam('hidden', '');
if(!empty($hidden)) {
	$where = " WHERE 1 = 1";	
}

$show_pc_pa = $fwRequest->getParam('show_pc_pa', '');
if(!empty($show_pc_pa)) {
	$where = " WHERE td_hide = 0 Or td_invoice_type = 'Project Commencement' or td_invoice_type = 'Planning Approvals'";	
}


$last_audited = $fwRequest->getParam('last_audited', '');
if($last_audited) {
	
	  $detail['la_date'] = date('d-m-Y');
	  $detail['la_who']  = $_SESSION['user']['user_name'];
	  
	  $tablela->setWhere("la_id = 1");
	 
	  $this_id = $tablela->updateRow($detail);	
}


$hide = $fwRequest->getParam('hide', '');
if($hide)
{
	 $keys_2 = array_keys($hide);
	 $ky_2 = $keys_2[0];
	 $val_2 = $hide[$ky_2];
	
	  $detail['td_hide'] = $val_2;
	  $table->setWhere("td_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}

$dmp = $fwRequest->getParam('dmp', '');
if($dmp)
{
	 $keys_3 = array_keys($dmp);
	 $ky_3 = $keys_3[0];
	 $val_3 = $dmp[$ky_3];
	
	  $detailDmp['td_dmp'] = $val_3;
	  $detailDmp['td_dmp_date'] = date('d-m-Y');
	  $detailDmp['td_dmp_user'] = $_SESSION['user']['user_name']; 
	  $table->setWhere("td_id = ".$ky_3);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detailDmp);
	  }	  	
}

$ws = $fwRequest->getParam('ws', '');
if($ws)
{
	 $keys_4 = array_keys($ws);
	 $ky_4 = $keys_4[0];
	 $val_4 = $ws[$ky_4];
	
	  $detailWs['td_weekly_statement'] = $val_4;
	  $detailWs['td_ws_date'] = date('d-m-Y');
	  $detailWs['td_ws_user'] = $_SESSION['user']['user_name']; 
	  $table->setWhere("td_id = ".$ky_4);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detailWs);
	  }	  	
}


$red = $fwRequest->getParam('red', '');
if(!empty($red))
{
	$where .= " And td_traffic_light = 3";
}

$green = $fwRequest->getParam('green', '');
if(!empty($green))
{
	$where .= " And td_traffic_light = 1";
}

$amber = $fwRequest->getParam('amber', '');
if(!empty($amber))
{
	$where .= " And td_traffic_light = 2";
}

$clear_search = $fwRequest->getParam('clear_search', '');
if(!empty($clear_search)) {
	unset($_SESSION['keyword']);
	unset($keyword);
	$fwViewData['keyword']='';	
}

$keyword = $fwRequest->getParam('keyword', '');
if($keyword):
		$where .= " AND  30_days_rec_report.td_project_name LIKE '%".$keyword."%'";
            	
	    $_SESSION['keyword'] = $keyword;
	    //$fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword']):

		$where .= " AND 30_days_rec_report.td_project_name LIKE '%".$_SESSION['keyword']."%' ";	
       // $fwViewData['keyword']=$_SESSION['keyword'];
endif;
 

$ord =  " ORDER BY if(  30_days_rec_report.td_due_date = ' '
         OR 30_days_rec_report.td_due_date IS NULL , 1, 0 ) , STR_TO_DATE( 30_days_rec_report.td_due_date, '%d-%m-%Y' ) ASC";	


$sort_date = $fwRequest->getParam('sort_date', '');
if(!empty($sort_date)) {
$ord =  " ORDER BY if(  30_days_rec_report.td_due_date = ' '
         OR 30_days_rec_report.td_due_date IS NULL , 1, 0 ) , STR_TO_DATE( 30_days_rec_report.td_due_date, '%d-%m-%Y' ) ASC";	
}
  
  
$sort_value = $fwRequest->getParam('sort_value', '');
if(!empty($sort_value)) {
	$ord =  " ORDER BY CAST(REPLACE(REPLACE(td_value,'$',''),',','') AS DECIMAL(10,2)) DESC";	
}  
 
$matsql = "SELECT * from 30_days_rec_report " .$where. ' '. $ord  ;	

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
	
	 $setdata2 = $listsnew;
  }
}

if(!empty($setdata2))
{
foreach($setdata2 as $k => $v2)
{


  $sq12= "SELECT  business_sellers.bs_business_id, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_moble
	 from business_sellers 		
	 Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	 Inner Join business ON business_sellers.bs_business_id = business.bsn_id where business.bsn_name = '".$v2['td_project_name']."'";  
	
	 $data = $fwDb->queryOne($sq12);
	
			$Statusdate = changedate_y_m_d($v2['td_due_date']);
				
				if(!empty($Statusdate))
				{
					$curdate_y_m_d = date('Y-m-d');
					$dayscount = daysDifference($curdate_y_m_d , $Statusdate);
				}
	
	 $link = BASE_URL."business.detail/bsn_id/".$data['bs_business_id'];
	 
	 
	$sql173 = "Select document_check_list.doc_file_name from document_check_list
			          where document_check_list.doc_bsn_id = ". $data['bs_business_id'] . " And document_check_list.doc_name_id = 173";
					  
	$data173 = $fwDb->queryOne($sql173);
	
	
	
	$sqlwa = "select count(*) as tot_log from warranty_log where wa_project like '%".$v2['td_project_name']."%' and wa_status = 'Open'";
	
	$wadata = $fwDb->queryOne($sqlwa);
	
	
	 
	 $setdata2[$k]['customer'] = $data['bcust_fname']. " ".$data['bcust_lname'];
     $setdata2[$k]['link'] = $link;
	 $setdata2[$k]['dayscount'] = $dayscount;
	 $setdata2[$k]['td_reason_date'] = changedate_d_m_y($v2['td_reason_date']);
	 $setdata2[$k]['checklist173'] = $data173['doc_file_name'];
	 $setdata2[$k]['total_log'] = $wadata['tot_log'];
}
}
$fwViewData['list'] = $setdata2;
$fwViewData['title'] = $MODULE_PLURAL;


$sqltot = "select td_value from 30_days_rec_report ".$where;
$totdata = $fwDb->query($sqltot);


$total = 0;
foreach($totdata as $kt=>$vt)
{
	$value=0;
	
	$value = $vt['td_value'];
	$value = str_replace('$','',$value);
	$value = str_replace(',','',$value);
	
	$total = $total + $value;	
}


$fwViewData['total'] = number_format($total, 2, '.', ',');


$printreport = $fwRequest->getParam('print', '');
if(!empty($printreport)) {
	$heading = "30 Days Plus Accounts Receivable Report";
	$fname='hello';
	
	$sqlp= "select * from 30_days_rec_report where td_hide = 0 ";
	$data = $fwDb->query($sqlp);
		
	$html = '<html><body>';
	
	$html .='<table border="1"  cellpadding="5" width="100%">';
	$html .='<tr><th style="width:5%;">Rec No</th><th style="width:20%;">Project</th><th style="width:11%;">Contact Info</th>
	<th>Value $</th><th>Due Date</th><th style="width:5%;">Days</th>
	<th>Invoice Type</th><th style="width:8%;">Invoice Number</th><th>Last Emailed Date</th><th>Last Spoken Date</th>
	</tr>';
	foreach($setdata2 as $k => $v)
	{
		
	$html .= '<tr nobr="true">';
	$html .= '<td>'.$v['td_id'].'</td>';
	$html .= '<td>'.$v['td_project_name'].'</td>';
	$html .= '<td>'.$v['customer'].'</td>';
	$html .= '<td>'.$v['td_value'].'</td>';
	$html .= '<td>'.$v['td_due_date'].'</td>';
	$html .= '<td>'.$v['dayscount'].'</td>';
	$html .= '<td>'.$v['td_invoice_type'].'</td>';
	$html .= '<td>'.$v['td_invoice_number'].'</td>';
	
	$html .= '<td>'.$v['td_last_email_date'].'</td>';
	$html .= '<td>'.$v['td_last_spoken_date'].'</td>';
	
	$html .= '</tr>';	
	}
	
	$html .= '</table>';
	$html .= '</body><html>';
	

	
	create_30_days_pdf($heading, $html, $fname);
}


$sql_1 = "select * from 30_days_last_audited where la_id = 1";
$fwViewData['ladata'] = $fwDb->queryOne($sql_1);

$sql_2 = "select * from 30_days_file where td_id = 1";
$fwViewData['updata'] = $fwDb->queryOne($sql_2);