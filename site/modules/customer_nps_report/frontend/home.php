<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$listdata = $fwRequest->getParam($TABLE, array());

$Table = new Fw_Db_Table('customer_nps_report');

/*Merge and Download Code Start*/
if (isset($_POST['download_all_surveys'])) {
    require_once $_SERVER['DOCUMENT_ROOT'].'/site/modules/customer_nps_report/frontend/merge_all_survey_pdfs.php';
    exit;
}
/*Merge and Download Code End*/

$responded = $fwRequest->getParam('responded', '');
if($responded)
{
	 $keys_1 = array_keys($responded);
	 $ky_1 = $keys_1[0];
	 $val_1 = $responded[$ky_1];
	
	  $detail['cn_responded'] = $val_1;
	  $Table->setWhere("cn_id = ".$ky_1);
	  if($Table->rowExists())
	  {
		 $this_id = $Table->updateRow($detail);
	  }	  	
}


$response = $fwRequest->getParam('response', '');
if($response)
{
	 $keys_3 = array_keys($response);
	 $ky_3 = $keys_3[0];
	 $val_3 = $response[$ky_3];
	
	  $detail['cn_response'] = $val_3;
	  $Table->setWhere("cn_id = ".$ky_3);
	  if($Table->rowExists())
	  {
		 $this_id = $Table->updateRow($detail);
	  }	  	
}

$hide = $fwRequest->getParam('hide', '');
if($hide)
{
	 $keys_2 = array_keys($hide);
	 $ky_2 = $keys_2[0];
	 $val_2 = $hide[$ky_2];
	
	  $detail['cn_openclose'] = $val_2;
	  $Table->setWhere("cn_id = ".$ky_2);
	  if($Table->rowExists())
	  {
		 $this_id = $Table->updateRow($detail);
	  }	  	
}





$where = " WHERE cn_openclose = 0";
$submit = $fwRequest->getParam('showall', '');
if(!empty($submit)) {
	$where = "WHERE 1=1";
	$_SESSION['openclose'] = 0;
	//$_SESSION['where'] =  $where;	
}
$ord =  " ORDER BY if(  cn_date = ' '
        OR cn_date IS  NULL , 0, 1 ) , STR_TO_DATE( cn_date, '%d-%m-%Y' ) DESC ";

  //
  
 $search_s = $fwRequest->getParam('search_supplier', '');
if(!empty($search_s))
{
  $supplier_name = $fwRequest->getParam('supplier_name', '');
  
  if($supplier_name):
  	
       $where .= " AND qb_supplier  LIKE '%".$supplier_name."%'  ";
       $_SESSION['supplier_name'] = $supplier_name;
       $fwViewData['supplier_name']=$_SESSION['supplier_name'];

  elseif($_SESSION['supplier_name'] && $pagenum > 0):
		
       $where .= " AND qb_supplier LIKE  '%".$_SESSION['supplier_name']."%' ";
       $fwViewData['supplier_name']=$_SESSION['supplier_name'];
	
  endif;
  
    $_SESSION['where'] = $where; 
} 
  
   
$clear = $fwRequest->getParam('clear', '');
if($clear) {
	
	unset($_SESSION['search_project']);
	$fwViewData['search_project'] = '';
	$where = " WHERE qb_approval <> 2 ";
	
	unset($_SESSION['where']);
}
 
  
  if($pagenum > 1) {
	if(isset($_SESSION['ord'])) { $ord = $_SESSION['ord']; }
	if(isset($_SESSION['where'])) { $where = $_SESSION['where']; }
  }
 
 //if(isset($_SESSION['where'])) { $where = $_SESSION['where']; }
  
 
$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where .' ' .$ord;

$sql_survey_pdf = "SELECT ".$TABLE.".cn_survey_pdf FROM ".$TABLE." ".$where .' ' .$ord;
//echo $sql_survey_pdf;
	
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

		$setdata2[] = $list;
	endforeach;
	
	$fwViewData['list'] = $listsnew;
  }
}

foreach($setdata2 as $k1=>$v1)
{
	
	 $sql_nt = "Select max(STR_TO_DATE(cnn_date, '%d-%m-%Y' )) as notes_date from customer_nps_notes where cnn_cn_id = ".$v1['cn_id']; 
     $ntdata = $fwDb->queryOne($sql_nt);
	
	 $setdata2[$k1]['notes_date']  = changedate_d_m_y($ntdata['notes_date']);
}


$fwViewData['list'] = $setdata2;
$fwViewData['title'] = $MODULE_PLURAL;
 		
$sqlpr = "Select * from busness_status";
$fwViewData['stdetail'] = $fwDb->query($sqlpr); 

$sqlst = "Select * from customer_nps_status_admin";
$fwViewData['statusdata'] = $fwDb->query($sqlst); 

$sqlspo = "Select * from customer_nps_spoke_cust";
$fwViewData['spoketodata'] = $fwDb->query($sqlspo); 

$sqlrs = "Select * from customer_nps_response_sent";
$fwViewData['rsdata'] = $fwDb->query($sqlrs);

//Weekly and YTD Data
/* $surveys_weekly = "SELECT COUNT(*) AS weekly_total FROM `customer_nps_report` WHERE STR_TO_DATE(cn_date, '%d-%m-%Y') >= CURDATE() - INTERVAL 6 DAY "; */
$surveys_weekly = "SELECT COUNT(*) AS weekly_total, TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM FORMAT(SUM(cn_rating) * 1.0 / NULLIF(COUNT(*), 0), 2))) AS net_rating FROM `customer_nps_report` WHERE STR_TO_DATE(cn_date, '%d-%m-%Y') >= CURDATE() - INTERVAL 6 DAY ";
$surveys_data_weekly = $fwDb->queryOne($surveys_weekly);
$fwViewData['surveys_data_weekly'] = $surveys_data_weekly;

/* $surveys_ytd = "SELECT COUNT(*) AS ytd_total FROM customer_nps_report WHERE STR_TO_DATE(cn_date, '%d-%m-%Y') >= IF( MONTH(CURDATE()) >= 7, STR_TO_DATE(CONCAT(YEAR(CURDATE()), '-07-01'), '%Y-%m-%d'), STR_TO_DATE(CONCAT(YEAR(CURDATE()) - 1, '-07-01'), '%Y-%m-%d') ) "; */
$surveys_ytd = "SELECT COUNT(*) AS ytd_total, TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM FORMAT(SUM(cn_rating) * 1.0 / NULLIF(COUNT(*), 0), 2))) AS net_rating FROM customer_nps_report WHERE STR_TO_DATE(cn_date, '%d-%m-%Y') >= IF( MONTH(CURDATE()) >= 7, STR_TO_DATE(CONCAT(YEAR(CURDATE()), '-07-01'), '%Y-%m-%d'), STR_TO_DATE(CONCAT(YEAR(CURDATE()) - 1, '-07-01'), '%Y-%m-%d') ) ";
$surveys_data_ytd = $fwDb->queryOne($surveys_ytd);
$fwViewData['surveys_data_ytd'] = $surveys_data_ytd;
