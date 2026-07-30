<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('development_log_ephp');
$tableDollar = new Fw_Db_Table('development_log_dollar');

$tableVideo = new Fw_Db_Table('dev_log_ephp_video');

$where  =  " Where 1 = 1 "; 
$where1 = " AND  de_type <> 'Server Task'";
$where2 = " AND  de_type = 'Server Task'";


$dd_dollar_value = $fwRequest->getParam('dd_dollar_value', '');
if($dd_dollar_value) 
{ 
	  $detail['dd_dollar_value'] = $dd_dollar_value;
	  $tableDollar->setWhere("dd_id = 1");
	  if($tableDollar->rowExists())
	  {
		 $this_id = $tableDollar->updateRow($detail);
	  }		
}


$save_video = $fwRequest->getParam('save_video', '');
if($save_video) 
{ 
			
		if($_FILES['video_file']['name'])
		{
			$de_id = $fwRequest->getParam('de_id', '');
			
			$doc1 = $_FILES['video_file']['name'];
			$file_type = $_FILES['video_file']['type'];	
							
			$datetime = trim(date('d_m_Y_H_i_'),'0');
			$doc1 = preg_replace('/[^A-Z0-9._]/i', '_', $doc1);
			$src =  $_FILES['video_file']['tmp_name']; 
			
			$docData['dv_video'] = $doc1;
			$docData['dv_dev_log_id'] = $de_id;
			
			upload($doc1, $src);
				
			$detail2 = $tableVideo->insertRow($docData);	
						
		}	
}


$de_full_tested = $fwRequest->getParam('de_full_tested', '');
if($de_full_tested)
{
	 $keys_2 = array_keys($de_full_tested);
	 $ky_2 = $keys_2[0];
	 $val_2 = $de_full_tested[$ky_2];
	
	  $detail['de_full_tested'] = $val_2;
	  $detail['de_full_tested_user'] = $_SESSION['user']['user_name'];
	  $table->setWhere("de_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}


$de_re_tested = $fwRequest->getParam('de_re_tested', '');
if($de_re_tested)
{
	 $keys_2 = array_keys($de_re_tested);
	 $ky_2 = $keys_2[0];
	 $val_2 = $de_re_tested[$ky_2];
	
	  $detail['de_re_tested'] = $val_2;
	  $detail['de_re_tested_user'] = $_SESSION['user']['user_name'];
	  $table->setWhere("de_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}


$approved = $fwRequest->getParam('approved', '');
if($approved)
{
	 $keys_2 = array_keys($approved);
	 $ky_2 = $keys_2[0];
	 $val_2 = $approved[$ky_2];
	
	  $detail['de_approved'] = $val_2;
	  $detail['de_approved_user'] = $_SESSION['user']['user_name'];
	  $table->setWhere("de_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}

$clearall = $fwRequest->getParam('clearall', '');
	if ($clearall):
		$where = " WHERE 1=1 ";
		unset($_SESSION['dt1']);
		unset($_SESSION['dt2']);
		unset($_SESSION['datet1']);
		unset($_SESSION['datet2']);
	
		$fwViewData['due_dt1_ss'] = "";
		$fwViewData['due_dt2_ss'] = "";
		$fwViewData['dt_1'] = "";
		$fwViewData['dt_2'] = "";
		$fwViewData['month'] = "";
		$fwViewData['year'] = "";


	endif;



	// date search starts
	if (!$clearall) {
		$dt1 = $fwRequest->getParam('dt_date1', '');
		$dt2 = $fwRequest->getParam('dt_date2', '');
	}

	if (strtotime($dt1) and strtotime($dt2)) {
		$where .= " AND STR_TO_DATE(de_date, '%d-%m-%Y') BETWEEN STR_TO_DATE('$dt1','%d-%m-%Y') AND STR_TO_DATE('$dt2','%d-%m-%Y') ";
	
		$_SESSION['dt1'] = $fwViewData['dt_date1_ss'] = $dt1;
		$_SESSION['dt2'] = $fwViewData['dt_date2_ss'] = $dt2;
	} else if (strtotime($_SESSION['dt1']) and strtotime($_SESSION['dt2'])) {

		$where .= " AND STR_TO_DATE(de_date, '%d-%m-%Y') BETWEEN
		            STR_TO_DATE('" . $_SESSION['dt1'] . "','%d-%m-%Y') AND STR_TO_DATE('" . $_SESSION['dt2'] . "','%d-%m-%Y') ";
					
	}


   	// date search starts
	if (!$clearall) {
		$month = $fwRequest->getParam('month', '');
		$year = $fwRequest->getParam('year', '');
	}
	
	if(!empty($month) and !empty($year)) 
	{
		$fwViewData['month'] = $month;
		$fwViewData['year'] = $year;
		if($month == '01' OR $month == '03' OR$month == '05' OR $month == '07' OR $month == '08' OR $month == '10' OR $month == '12')
		{
			$d2 = '31';
		}
		elseif ($month == '02') {
			$d2 = '28';
				
		} else {
			$d2 = '30';
		}
		
		$date1 = '01-'.$month.'-'.$year;
		$date2 = $d2.'-'.$month.'-'.$year;
		
		if (strtotime($date1) and strtotime($date2)) {
			$where .= " AND STR_TO_DATE(de_date, '%d-%m-%Y') BETWEEN STR_TO_DATE('$date1','%d-%m-%Y') AND STR_TO_DATE('$date2','%d-%m-%Y') ";
			$_SESSION['date1'] = $fwViewData['dt_1'] = $date1;
			$_SESSION['date1'] = $fwViewData['dt_2'] = $date2;
		} else if (strtotime($_SESSION['date2']) and strtotime($_SESSION['date2'])) {

			$where .= " AND STR_TO_DATE(de_date, '%d-%m-%Y') BETWEEN
		                STR_TO_DATE('" . $_SESSION['date1'] . "','%d-%m-%Y') AND STR_TO_DATE('" . $_SESSION['date2'] . "','%d-%m-%Y') ";
		}
		
		
			
	}

$ord = " Order by STR_TO_DATE( de_date, '%d-%m-%Y' ) DESC ";

$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE . $where . $ord ;	

if($matsql){$userData = $fwDb->query($matsql);}


$sql1 = "SELECT sum(de_total_hours) as dtot FROM ".$TABLE . $where .$where1 . $ord ;	
$data1 = $fwDb->queryOne($sql1);

$sql2 = "SELECT sum(de_testing_hours) as ttot FROM ".$TABLE . $where . $where1. $ord ;	
$data2 = $fwDb->queryOne($sql2);

$fwViewData['dev_tot'] = $data1['dtot'];
$fwViewData['test_tot'] = $data2['ttot'];
$fwViewData['total_hours'] = $data1['dtot'] + $data2['ttot'];


$sql3 = "SELECT sum(de_total_hours) as ser_hour FROM ".$TABLE . $where . $where2 . $ord ;	
$data3 = $fwDb->queryOne($sql3);

$fwViewData['ser_hour'] = $data3['ser_hour'];

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

foreach($listsnew as $k => $v)
{
	
	$sql_1 = "select * from dev_log_ephp_video where dv_dev_log_id = ".$v['de_id']; 
	$data1 = $fwDb->query($sql_1);
	
	$sql_2 = "select * from development_log_dollar where dd_id = 1";
	$dollar_value =  $fwDb->queryOne($sql_2);
	
	$cost = $dollar_value['dd_dollar_value'] * $v['de_total_hours'];
	
	$listsnew[$k]['video_data'] = $data1;
	$listsnew[$k]['cost'] = $cost;	
}


$fwViewData['list'] = $listsnew;

$fwViewData['title'] = $MODULE_PLURAL;

$sql = "select * from develop_log_ephp_subtype";
$fwViewData['subtypedata'] =  $fwDb->query($sql);

$sqldd = "select * from development_log_dollar where dd_id = 1";
$fwViewData['dollar_value'] =  $fwDb->queryOne($sqldd);

