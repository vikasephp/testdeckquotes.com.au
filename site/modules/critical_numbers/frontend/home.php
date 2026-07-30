<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('critical_numbers');

$listdata = $fwRequest->getParam($TABLE, array());

$submit= $fwRequest->getParam('savecn', '');
if(!empty($submit))
{
	$data = $fwRequest->getParam('measurment', '');
	
	foreach($data as $k => $v)
	{		
		$weekly = isset($v['weekly']) ? $v['weekly'] : '';
		$ytd = isset($v['ytd']) ? $v['ytd'] : ''; 
		//$type = isset($v['cn_type']) ? $v['cn_type'] : '';
		//$datacome = isset($v['datacome']) ? $v['datacome'] : ''; 
		
		$cnDetail['cn_weekly'] = $weekly;
		$cnDetail['cn_ytd'] = $ytd;
		//$cnDetail['cn_type'] = $type;
		//$cnDetail['cn_datacome'] = $datacome;
		
		$table->setWhere('cn_id = '.$k); 
    
		$this_id = $table->updateRow($cnDetail);
	}
}
	
//$keyword = $listdata['keyword'];
$where = "WHERE 1=1 ";
  
$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where." ORDER BY ".$TABLE.".".$ID." ASC";	

if($matsql){$userData = $fwDb->query($matsql);}

if(!empty($userData))
{
if (!(isset($pagenum))){ $pagenum = 1; } 
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

$fwViewData['title'] = $MODULE_PLURAL;

//Weekly and YTD Data
//Leads
$lead_weekly = "SELECT COUNT(*) AS weekly_total FROM business WHERE bsn_status_sys_date >= CURDATE() - INTERVAL 6 DAY";
$lead_data_weekly = $fwDb->queryOne($lead_weekly);
$fwViewData['lead_data_weekly'] = $lead_data_weekly;

$lead_ytd = "SELECT COUNT(*) AS ytd_total FROM business WHERE bsn_status_sys_date >= IF( MONTH(CURDATE()) >= 7, DATE_FORMAT(CURDATE(), '%Y-07-01'), DATE_FORMAT(CURDATE() - INTERVAL 1 YEAR, '%Y-07-01') )";
$lead_data_ytd = $fwDb->queryOne($lead_ytd);
$fwViewData['lead_data_ytd'] = $lead_data_ytd;

//Follow Up Booked
$followup_weekly = "SELECT COUNT(*) AS weekly_total FROM business WHERE bsn_wlr_sunbook = 1 AND STR_TO_DATE(bsn_wlr_sunbook_user, '%d-%m-%Y') >= CURDATE() - INTERVAL 6 DAY";
$followup_data_weekly = $fwDb->queryOne($followup_weekly);
$fwViewData['followup_data_weekly'] = $followup_data_weekly;

$followup_ytd = "SELECT COUNT(*) AS ytd_total FROM business WHERE bsn_wlr_sunbook = 1 AND STR_TO_DATE(bsn_wlr_sunbook_user, '%d-%m-%Y') >= IF(MONTH(CURDATE()) >= 7, DATE_FORMAT(CURDATE(), '%Y-07-01'), DATE_FORMAT(CURDATE() - INTERVAL 1 YEAR, '%Y-07-01'))";
$followup_data_ytd = $fwDb->queryOne($followup_ytd);
$fwViewData['followup_data_ytd'] = $followup_data_ytd;

//Design Agreements Signed
$designagreement_weekly = "SELECT COUNT(*) AS weekly_total FROM document_check_list WHERE doc_name_id = 45 AND doc_date_uploaded >= CURDATE() - INTERVAL 6 DAY ";
$designagreement_data_weekly = $fwDb->queryOne($designagreement_weekly);
$fwViewData['designagreement_data_weekly'] = $designagreement_data_weekly;

/* $designagreement_ytd = "SELECT COUNT(*) AS ytd_total FROM document_check_list WHERE doc_name_id = 45 AND doc_date_uploaded >= IF( MONTH(CURDATE()) >= 7, DATE_FORMAT(CURDATE(), '%Y-07-01'), DATE_FORMAT(CURDATE() - INTERVAL 1 YEAR, '%Y-07-01') ) "; */
$designagreement_ytd = "SELECT COUNT(DISTINCT bt.bt_bsn_id) AS ytd_total FROM business_tasks AS bt INNER JOIN busness_status AS bs ON bt.bt_task_status_id = bs.st_id INNER JOIN busness_status_task AS bst ON bt.bt_task_id = bst.bst_task_id AND bt.bt_task_types_id = 0 LEFT JOIN business_status_task_orders AS bsto ON bt.bt_task_id = bsto.business_status_task_orders_tasks_id LEFT JOIN users AS u ON bt.bt_completed_by = u.user_id LEFT JOIN email_template AS et ON bt.bt_task_id = et.et_task AND et.et_status = 1 LEFT JOIN positions AS pos ON bst.bst_posid = pos.p_id WHERE (bst.bst_task_id = 205 OR bst.bst_id = 205) AND bt.bt_completed_date IS NOT NULL AND bt.bt_completed_date >= IF( MONTH(CURDATE()) >= 7, DATE_FORMAT(CURDATE(), '%Y-07-01'), DATE_FORMAT(CURDATE() - INTERVAL 1 YEAR, '%Y-07-01') )";
$designagreement_data_ytd = $fwDb->queryOne($designagreement_ytd);
$fwViewData['designagreement_data_ytd'] = $designagreement_data_ytd;

//PAR Booked
/* $parbooked_weekly = "SELECT COUNT(*) FROM business_tasks as bt 
INNER JOIN busness_status_task as bst ON bt.bt_task_id = bst.bst_task_id
WHERE (bst.bst_task_id = 661 or bst.bst_id = 661) AND bt.bt_completed_date IS NOT NULL AND bt.bt_completed_date >= CURDATE() - INTERVAL 6 DAY"; */
$parbooked_weekly = "SELECT COUNT(DISTINCT bt.bt_bsn_id) as weekly_total FROM business_tasks as bt INNER JOIN busness_status as bs ON bt.bt_task_status_id = bs.st_id INNER JOIN busness_status_task as bst ON bt.bt_task_id = bst.bst_task_id AND bt.bt_task_types_id = 0 LEFT JOIN business_status_task_orders as bsto ON bt.bt_task_id = bsto.business_status_task_orders_tasks_id LEFT JOIN users as u ON bt.bt_completed_by = u.user_id LEFT JOIN email_template as et ON bt.bt_task_id = et.et_task AND et.et_status = 1 LEFT JOIN positions as pos ON bst.bst_posid = pos.p_id WHERE (bst.bst_task_id = 661 or bst.bst_id = 661) AND bt.bt_completed_date IS NOT NULL AND bt.bt_completed_date >= CURDATE() - INTERVAL 6 DAY "; 
$parbooked_data_weekly = $fwDb->queryOne($parbooked_weekly);
$fwViewData['parbooked_data_weekly'] = $parbooked_data_weekly;

/* $parbooked_ytd = "SELECT COUNT(*) FROM business_tasks as bt INNER JOIN busness_status_task as bst ON bt.bt_task_id = bst.bst_task_id WHERE (bst.bst_task_id = 661 or bst.bst_id = 661) AND bt.bt_completed_date IS NOT NULL AND bt.bt_completed_date >= IF( MONTH(CURDATE()) >= 7, DATE_FORMAT(CURDATE(), '%Y-07-01'), DATE_FORMAT(CURDATE() - INTERVAL 1 YEAR, '%Y-07-01') ) "; */
$parbooked_ytd = "SELECT COUNT(DISTINCT bt.bt_bsn_id) AS ytd_total FROM business_tasks AS bt INNER JOIN busness_status AS bs ON bt.bt_task_status_id = bs.st_id INNER JOIN busness_status_task AS bst ON bt.bt_task_id = bst.bst_task_id AND bt.bt_task_types_id = 0 LEFT JOIN business_status_task_orders AS bsto ON bt.bt_task_id = bsto.business_status_task_orders_tasks_id LEFT JOIN users AS u ON bt.bt_completed_by = u.user_id LEFT JOIN email_template AS et ON bt.bt_task_id = et.et_task AND et.et_status = 1 LEFT JOIN positions AS pos ON bst.bst_posid = pos.p_id WHERE (bst.bst_task_id = 661 OR bst.bst_id = 661) AND bt.bt_completed_date IS NOT NULL AND bt.bt_completed_date >= IF( MONTH(CURDATE()) >= 7, DATE_FORMAT(CURDATE(), '%Y-07-01'), DATE_FORMAT(CURDATE() - INTERVAL 1 YEAR, '%Y-07-01') )";
$parbooked_data_ytd = $fwDb->queryOne($parbooked_ytd);
$fwViewData['parbooked_data_ytd'] = $parbooked_data_ytd;

//Customer Satisfaction
/* $surveys_weekly = "SELECT COUNT(*) AS weekly_total FROM `customer_nps_report` WHERE STR_TO_DATE(cn_date, '%d-%m-%Y') >= CURDATE() - INTERVAL 6 DAY "; */
$surveys_weekly = "SELECT COUNT(*) AS weekly_total, SUM(cn_rating) AS weekly_rating_sum, TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM FORMAT(SUM(cn_rating) * 1.0 / NULLIF(COUNT(*), 0), 2))) AS net_rating FROM `customer_nps_report` WHERE STR_TO_DATE(cn_date, '%d-%m-%Y') >= CURDATE() - INTERVAL 6 DAY ";
$surveys_data_weekly = $fwDb->queryOne($surveys_weekly);
$fwViewData['surveys_data_weekly'] = $surveys_data_weekly;

/* $surveys_ytd = "SELECT COUNT(*) AS ytd_total FROM customer_nps_report WHERE STR_TO_DATE(cn_date, '%d-%m-%Y') >= IF( MONTH(CURDATE()) >= 7, STR_TO_DATE(CONCAT(YEAR(CURDATE()), '-07-01'), '%Y-%m-%d'), STR_TO_DATE(CONCAT(YEAR(CURDATE()) - 1, '-07-01'), '%Y-%m-%d') ) "; */
$surveys_ytd = "SELECT COUNT(*) AS ytd_total, SUM(cn_rating) AS weekly_rating_sum, TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM FORMAT(SUM(cn_rating) * 1.0 / NULLIF(COUNT(*), 0), 2))) AS net_rating FROM customer_nps_report WHERE STR_TO_DATE(cn_date, '%d-%m-%Y') >= IF( MONTH(CURDATE()) >= 7, STR_TO_DATE(CONCAT(YEAR(CURDATE()), '-07-01'), '%Y-%m-%d'), STR_TO_DATE(CONCAT(YEAR(CURDATE()) - 1, '-07-01'), '%Y-%m-%d') ) ";
$surveys_data_ytd = $fwDb->queryOne($surveys_ytd);
$fwViewData['surveys_data_ytd'] = $surveys_data_ytd;

//Design Numbers
$design_numbers_weekly = "SELECT COUNT(*) AS weekly_total FROM design_interface WHERE STR_TO_DATE(di_online_date, '%d-%m-%Y') >= CURDATE() - INTERVAL 6 DAY";
$designnumbers_data_weekly = $fwDb->queryOne($design_numbers_weekly);
$fwViewData['designnumbers_data_weekly'] = $designnumbers_data_weekly;

$design_numbers_ytd = "SELECT COUNT(*) AS ytd_total FROM design_interface WHERE STR_TO_DATE(di_online_date, '%d-%m-%Y') >= IF( MONTH(CURDATE()) >= 7, STR_TO_DATE(CONCAT(YEAR(CURDATE()), '-07-01'), '%Y-%m-%d'), STR_TO_DATE(CONCAT(YEAR(CURDATE()) - 1, '-07-01'), '%Y-%m-%d') ) ";
$designnumbers_data_ytd = $fwDb->queryOne($design_numbers_ytd);
$fwViewData['designnumbers_data_ytd'] = $designnumbers_data_ytd;

$design_numbers_online = "SELECT count(di_online) as design_online_total FROM design_interface WHERE di_online = 1";
$dno_data = $fwDb->queryOne($design_numbers_online);
$fwViewData['dno_data'] = $dno_data;

//Sales Proposal Delivered
$proposaldelivered_weekly = "SELECT COUNT(*) AS weekly_total FROM proposal_tasks where bt_task_id = 8 AND bt_completed_date >= CURDATE() - INTERVAL 6 DAY";
$proposaldelivered_data_weekly = $fwDb->queryOne($proposaldelivered_weekly);
$fwViewData['proposaldelivered_data_weekly'] = $proposaldelivered_data_weekly;

$proposaldelivered_ytd = "SELECT COUNT(*) AS ytd_total FROM proposal_tasks WHERE bt_task_id = 8 AND bt_completed_date >= IF( MONTH(CURDATE()) >= 7, DATE_FORMAT(CURDATE(), '%Y-07-01'), DATE_FORMAT(CURDATE() - INTERVAL 1 YEAR, '%Y-07-01') ) ";
$proposaldelivered_data_ytd = $fwDb->queryOne($proposaldelivered_ytd);
$fwViewData['proposaldelivered_data_ytd'] = $proposaldelivered_data_ytd;

//HIA Signed
$hiaSigned_weekly = "SELECT COUNT(DISTINCT bt.bt_bsn_id) as weekly_total FROM business_tasks as bt INNER JOIN busness_status as bs ON bt.bt_task_status_id = bs.st_id INNER JOIN busness_status_task as bst ON bt.bt_task_id = bst.bst_task_id AND bt.bt_task_types_id = 0 LEFT JOIN business_status_task_orders as bsto ON bt.bt_task_id = bsto.business_status_task_orders_tasks_id LEFT JOIN users as u ON bt.bt_completed_by = u.user_id LEFT JOIN email_template as et ON bt.bt_task_id = et.et_task AND et.et_status = 1 LEFT JOIN positions as pos ON bst.bst_posid = pos.p_id WHERE (bst.bst_task_id = 493 or bst.bst_id = 493) AND bt.bt_completed_date IS NOT NULL AND bt.bt_completed_date >= CURDATE() - INTERVAL 6 DAY ";
$hiaSigned_data_weekly = $fwDb->queryOne($hiaSigned_weekly);
$fwViewData['hiaSigned_data_weekly'] = $hiaSigned_data_weekly;

$hiaSigned_ytd = "SELECT COUNT(DISTINCT bt.bt_bsn_id) AS ytd_total FROM business_tasks AS bt INNER JOIN busness_status AS bs ON bt.bt_task_status_id = bs.st_id INNER JOIN busness_status_task AS bst ON bt.bt_task_id = bst.bst_task_id AND bt.bt_task_types_id = 0 LEFT JOIN business_status_task_orders AS bsto ON bt.bt_task_id = bsto.business_status_task_orders_tasks_id LEFT JOIN users AS u ON bt.bt_completed_by = u.user_id LEFT JOIN email_template AS et ON bt.bt_task_id = et.et_task AND et.et_status = 1 LEFT JOIN positions AS pos ON bst.bst_posid = pos.p_id WHERE (bst.bst_task_id = 493 OR bst.bst_id = 493) AND bt.bt_completed_date IS NOT NULL AND bt.bt_completed_date >= IF( MONTH(CURDATE()) >= 7, DATE_FORMAT(CURDATE(), '%Y-07-01'), DATE_FORMAT(CURDATE() - INTERVAL 1 YEAR, '%Y-07-01') ) ";
$hiaSigned_data_ytd = $fwDb->queryOne($hiaSigned_ytd);
$fwViewData['hiaSigned_data_ytd'] = $hiaSigned_data_ytd;

//Active Designs
/* $activeDesigns_weekly = "SELECT COUNT(DISTINCT bt.bt_bsn_id) AS weekly_total FROM proposal_tasks AS bt INNER JOIN proposal_task_list AS bst ON bt.bt_task_id = bst.bst_id AND bt.bt_task_types_id = 0 LEFT JOIN proposal_task_list_orders AS bsto ON bt.bt_task_id = bsto.business_status_task_orders_tasks_id AND bsto.business_status_task_orders_type_id = 15 LEFT JOIN users AS u ON bt.bt_completed_by = u.user_id LEFT JOIN email_template AS et ON bt.bt_task_id = et.et_task AND et.et_status = 1 WHERE bt.bt_task_list_number = 1 AND (bst.bst_task_id = 26 OR bst.bst_id = 26) AND bt.bt_completed_date >= CURDATE() - INTERVAL 6 DAY "; */
$activeDesigns_weekly = "SELECT COUNT(*) AS weekly_total FROM document_check_list WHERE doc_name_id = 45 AND doc_date_uploaded >= CURDATE() - INTERVAL 6 DAY";
$activeDesigns_data_weekly = $fwDb->queryOne($activeDesigns_weekly);
$fwViewData['activeDesigns_data_weekly'] = $activeDesigns_data_weekly;

$activeDesigns_total = "SELECT COUNT(*) AS activeDesigns_total FROM document_proposal_name WHERE dpn_dr_hide = 0 AND (dpn_dr_type_new = 1 OR dpn_dr_type_new = 2) ";
$activeDesigns_total_data = $fwDb->queryOne($activeDesigns_total);
$fwViewData['activeDesigns_total_data'] = $activeDesigns_total_data;

/* $activeDesigns_ytd = "SELECT COUNT(DISTINCT bt.bt_bsn_id) AS ytd_total FROM business_tasks AS bt INNER JOIN busness_status AS bs ON bt.bt_task_status_id = bs.st_id INNER JOIN busness_status_task AS bst ON bt.bt_task_id = bst.bst_task_id AND bt.bt_task_types_id = 0 LEFT JOIN business_status_task_orders AS bsto ON bt.bt_task_id = bsto.business_status_task_orders_tasks_id LEFT JOIN users AS u ON bt.bt_completed_by = u.user_id LEFT JOIN email_template AS et ON bt.bt_task_id = et.et_task AND et.et_status = 1 LEFT JOIN positions AS pos ON bst.bst_posid = pos.p_id WHERE (bst.bst_task_id = 205 OR bst.bst_id = 205) AND bt.bt_completed_date IS NOT NULL AND bt.bt_completed_date >= IF( MONTH(CURDATE()) >= 7, DATE_FORMAT(CURDATE(), '%Y-07-01'), DATE_FORMAT(CURDATE() - INTERVAL 1 YEAR, '%Y-07-01') ) "; */
$activeDesigns_ytd = "SELECT COUNT(*) AS ytd_total FROM document_check_list WHERE doc_name_id = 45 AND DATE(doc_date_uploaded) >= IF( MONTH(CURDATE()) >= 7, DATE_FORMAT(CURDATE(), '%Y-07-01'), DATE_FORMAT(CURDATE() - INTERVAL 1 YEAR, '%Y-07-01') )";
$activeDesigns_data_ytd = $fwDb->queryOne($activeDesigns_ytd);
$fwViewData['activeDesigns_data_ytd'] = $activeDesigns_data_ytd;

//Designs Signed Off
$designsSignedOff_weekly ="SELECT COUNT(DISTINCT bt.bt_bsn_id) as weekly_total FROM proposal_tasks as bt INNER JOIN proposal_task_list as bst ON bt.bt_task_id = bst.bst_id AND bt.bt_task_types_id = 0 LEFT JOIN proposal_task_list_orders as bsto ON bt.bt_task_id = bsto.business_status_task_orders_tasks_id AND bsto.business_status_task_orders_type_id = 15 LEFT JOIN users as u ON bt.bt_completed_by = u.user_id LEFT JOIN email_template as et ON bt.bt_task_id = et.et_task AND et.et_status = 1 WHERE bt.bt_task_list_number = 1 AND (bst.bst_task_id = 26 or bst.bst_id = 26) AND bt.bt_completed_date >= CURDATE() - INTERVAL 6 DAY";
$designsSignedOff_data_weekly = $fwDb->queryOne($designsSignedOff_weekly);
$fwViewData['designsSignedOff_data_weekly'] = $designsSignedOff_data_weekly;

$designsSignedOff_ytd ="SELECT COUNT(DISTINCT bt.bt_bsn_id) as ytd_total FROM proposal_tasks as bt INNER JOIN proposal_task_list as bst ON bt.bt_task_id = bst.bst_id AND bt.bt_task_types_id = 0 LEFT JOIN proposal_task_list_orders as bsto ON bt.bt_task_id = bsto.business_status_task_orders_tasks_id AND bsto.business_status_task_orders_type_id = 15 LEFT JOIN users as u ON bt.bt_completed_by = u.user_id LEFT JOIN email_template as et ON bt.bt_task_id = et.et_task AND et.et_status = 1 WHERE bt.bt_task_list_number = 1 AND (bst.bst_task_id = 26 or bst.bst_id = 26) AND bt.bt_completed_date >= IF( MONTH(CURDATE()) >= 7, DATE_FORMAT(CURDATE(), '%Y-07-01'), DATE_FORMAT(CURDATE() - INTERVAL 1 YEAR, '%Y-07-01') ) ";
$designsSignedOff_data_ytd = $fwDb->queryOne($designsSignedOff_ytd);
$fwViewData['designsSignedOff_data_ytd'] = $designsSignedOff_data_ytd;

//Net Sales
$netsales_weekly = "SELECT COALESCE(CAST(REPLACE((SELECT cn_weekly FROM critical_numbers WHERE cn_id = 39), ',', '') AS DECIMAL(15,2)), 0) - COALESCE(CAST(REPLACE((SELECT cn_weekly FROM critical_numbers WHERE cn_id = 40), ',', '') AS DECIMAL(15,2)), 0) - COALESCE(CAST(REPLACE((SELECT cn_weekly FROM critical_numbers WHERE cn_id = 41), ',', '') AS DECIMAL(15,2)), 0) AS netsales_weekly";
$netsales_data_weekly = $fwDb->queryOne($netsales_weekly);
$fwViewData['netsales_data_weekly'] = $netsales_data_weekly;

$netsales_ytd = "SELECT COALESCE(CAST(REPLACE((SELECT cn_ytd FROM critical_numbers WHERE cn_id = 39), ',', '') AS DECIMAL(15,2)), 0) - COALESCE(CAST(REPLACE((SELECT cn_ytd FROM critical_numbers WHERE cn_id = 40), ',', '') AS DECIMAL(15,2)), 0) - COALESCE(CAST(REPLACE((SELECT cn_ytd FROM critical_numbers WHERE cn_id = 41), ',', '') AS DECIMAL(15,2)), 0) AS netsales_ytd";
$netsales_data_ytd = $fwDb->queryOne($netsales_ytd);
$fwViewData['netsales_data_ytd'] = $netsales_data_ytd;

//Open Positions
$open_positions = "SELECT count(pm_open_position) as open_position FROM `position_matrix` where pm_open_position = 1";
$open_positions_data = $fwDb->queryOne($open_positions);
$fwViewData['open_positions_data'] = $open_positions_data;


$dt = date('Y-m-d', strtotime(' -7 day'));
$sql7 = "select count(*) as tot from business where bsn_status_sys_date >= '".$dt."'";
$data = $fwDb->queryOne($sql7);

$sqlyear = "select count(*) as tot2 from business where bsn_status_sys_date >= '2021-01-01'";
$year = $fwDb->queryOne($sqlyear);

$sqlpl7 = "select count(*) as tot3 from document_check_list where doc_name_id = 45 and doc_date_uploaded >= '".$dt."'";
$pl_seven = $fwDb->queryOne($sqlpl7);


$sqlplyear = "select count(*) as tot4 from document_check_list where doc_name_id = 45 and doc_date_uploaded >= '2021-01-01'";
$planningyear = $fwDb->queryOne($sqlplyear);

$sqlhia = "select count(*) as tot5 from document_check_list where doc_name_id = 64 and doc_date_uploaded >= '2021-01-01'";
$hiadata = $fwDb->queryOne($sqlhia);

$sqlpl = "select count(*) as tot6 from business where bsn_status like '%|2|%' ";
$planning = $fwDb->queryOne($sqlpl);


$sqlavg = "select bsn_status_date from business where bsn_status like '%|2|%' ";
$planning_avg = $fwDb->query($sqlavg);

$tot_days=0;
foreach($planning_avg as $k => $v)
{

		$ccdate = $v['bsn_status_date'];
		$Statusdate = changedate_y_m_d($ccdate);
		$curdate_y_m_d = date('Y-m-d');
		$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
		$tot_days = $tot_days + $dayscount;
			
}

$sqldesign = 'SELECT count(*) as tot7 FROM business_sellers
	      INNER JOIN business ON business_sellers.bs_business_id = business.bsn_id
	      INNER JOIN document_check_list ON business_sellers.bs_business_id = document_check_list.doc_bsn_id
	      AND document_check_list.doc_name_id =45
	      WHERE document_check_list.doc_date_uploaded != "0000-00-00 00:00:00"
	      AND bsn_dr_hide = 0';

$design = $fwDb->queryOne($sqldesign);


$sql_inclusion = "select count(*) as tot8 from business where bsn_status like '%|5|%' ";
$inclusion = $fwDb->queryOne($sql_inclusion);


$sqlincavg = "select bsn_status_date from business where bsn_status like '%|5|%' ";
$inclusion_avg = $fwDb->query($sqlincavg);

$tot_days_inclusion=0;
foreach($inclusion_avg as $k1 => $v1)
{

		$ccdate_2 = $v1['bsn_status_date'];
		$statusdate_2 = changedate_y_m_d($ccdate_2);
		$curdate_y_m_d_2 = date('Y-m-d');
		$dayscount_2 = daysDifference($curdate_y_m_d_2, $statusdate_2);
		$tot_days_inclusion = $tot_days_inclusion + $dayscount_2;
			
}

$sql_construction = "select count(*) as tot9 from business where bsn_status like '%|3|%' ";
$construction = $fwDb->queryOne($sql_construction);


$sqlconavg = "select bsn_status_date from business where bsn_status like '%|3|%' ";
$construction_avg = $fwDb->query($sqlconavg);

$tot_days_construction=0;
foreach($construction_avg as $k2 => $v2)
{

		$ccdate_3 = $v2['bsn_status_date'];
		$statusdate_3 = changedate_y_m_d($ccdate_3);
		$curdate_y_m_d_3 = date('Y-m-d');
		$dayscount_3= daysDifference($curdate_y_m_d_3, $statusdate_3);
		$tot_days_construction = $tot_days_construction + $dayscount_3;
			
}

$sql_war = "select count(*) as tot10 from warranty_log where wa_status = 'Open'";
$warranty = $fwDb->queryOne($sql_war);


$fwViewData['7dayleads'] =  $data['tot'];
$fwViewData['year'] =  $year['tot2'];
$fwViewData['planning7'] =  $pl_seven['tot3'];
$fwViewData['planningyear'] =  $planningyear['tot4'];
$fwViewData['hia'] =  $hiadata['tot5'];
$fwViewData['planning1'] =  $planning['tot6'];
$fwViewData['avg_days_pl'] = round($tot_days/$planning['tot6']);
$fwViewData['design_tot'] =  $design['tot7'];
$fwViewData['inclusion_tot'] =  $inclusion['tot8'];
$fwViewData['inc_avg_days'] = round($tot_days_inclusion/$inclusion['tot8']);
$fwViewData['construction_tot'] =  $construction['tot9'];
$fwViewData['const_avg_days'] = round($tot_days_construction/$construction['tot9']);
$fwViewData['warranty_open'] = $warranty['tot10'];


//Start Calculate Number of Weeks for Financial year from July 1 to June 30
$today = new DateTime();
$get_year = (int)$today->format('Y');
$get_month = (int)$today->format('n');

//Start of current financial year
if ($get_month < 7) {
    $financialYearStart = new DateTime(($get_year - 1) . '-07-01');
} else {
    $financialYearStart = new DateTime($get_year . '-07-01');
}

$interval = $financialYearStart->diff($today);
$days = $interval->days;
//$weeks = floor($days / 7);
$weeks = round($days / 7, 2);

$fwViewData['weeks_since_financial_year'] = $weeks;
//End Calculate Number of Weeks for Financial year from July 1 to June 30