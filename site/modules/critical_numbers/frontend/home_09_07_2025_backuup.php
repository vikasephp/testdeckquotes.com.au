<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('critical_numbers');

$listdata = $fwRequest->getParam($TABLE, array());

$submit= $fwRequest->getParam('savecn', '');
if(!empty($submit))
{
	$data= $fwRequest->getParam('measurment', '');
	
	foreach($data as $k => $v)
	{
		$cnDetail['cn_measurment'] = $v;
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