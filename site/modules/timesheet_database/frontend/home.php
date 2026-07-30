<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('timesheet_database');
$where = " WHERE 1 = 1";


//$ord =  " ORDER BY if(  30_days_rec_report.td_due_date = ' '
      //   OR 30_days_rec_report.td_due_date IS NULL , 1, 0 ) , STR_TO_DATE( 30_days_rec_report.td_due_date, '%d-%m-%Y' ) ASC";

$sqlLast = "select distinct td_open_date from timesheet_database where td_archive = 0";
$dataLast = $fwDb->queryOne($sqlLast);
$fwViewData['dataLast'] =  $dataLast;


$archive = $fwRequest->getParam('archive', '');
if(!empty($archive)){
	$od = $fwRequest->getParam('od', '');
	$sql = "update timesheet_database set td_archive = 1 where td_open_date = '".$od."'";
	$id = $fwDb->queryOne($sql);
}

$upload_discre = $fwRequest->getParam('upload_discre', '');

if(!empty($upload_discre))
{
		$td_id = $fwRequest->getParam('td_id', '');
		$fwViewData['show'] = $fwRequest->getParam('show', '');
		
		
		if($_FILES['discre']['name'])
		{
				$docfile_1 = $_FILES['discre']['name'];
				$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$temp_name_1 = $_FILES['discre']['tmp_name'];
				$detail['td_pdf_timesheet'] = $docfile_1;
				upload($docfile_1, $temp_name_1);
				
				$table->setWhere("td_id = ".$td_id);
				if($table->rowExists())
	    		{
		    		$data = $table->updateRow($detail);
	    		}	
		}

		$run_report_2 = true;
}
		
$upload_slip = $fwRequest->getParam('upload_slip', '');

if(!empty($upload_slip))
{
		$td_id = $fwRequest->getParam('td_id', '');
		$fwViewData['show'] = $fwRequest->getParam('show', '');
		
		
		if($_FILES['payslip']['name'])
		{
				$docfile_2 = $_FILES['payslip']['name'];
				$docfile_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
				$temp_name_2 = $_FILES['payslip']['tmp_name'];
				$detail['td_pay_slip'] = $docfile_2;
				upload($docfile_2, $temp_name_2);
				
				$table->setWhere("td_id = ".$td_id);
				if($table->rowExists())
	    		{
		    		$data = $table->updateRow($detail);
	    		}	
		}

		$run_report_2 = true;
}

if(!empty($dataLast))
{

	$open_date = $dataLast['td_open_date'];
	$fwViewData['show'] = 1;
	$close_date = date('d-m-Y', strtotime($open_date. ' + 7 days'));
		
	$fwViewData['open_date'] = $open_date;
	$fwViewData['close_date'] = $close_date; 	
	$fwViewData['opr'] = "Close";	
	
	
	$sql = "SELECT * from users where user_pm_active = 1 and user_pm_type = 1" ;
	$data = $fwDb->query($sql);
	
	foreach($data as $k=>$v)
	{
		
		$detail['td_open_date'] = $open_date;
		$detail['td_close_date'] = $close_date;
		$detail['td_employee_name'] = $v['user_name'];
		$detail['td_user'] = $_SESSION['user']['user_name'];
	
		$table->setWhere("td_open_date = '".$open_date."' and td_employee_name = '".$v['user_name']."'");
		if(!$table->rowExists())
	    {
		    $data = $table->insertRow($detail);
	    }	
	}
	
}



$run_report = $fwRequest->getParam('run_report', '');
if($run_report || $run_report_2)
{
	$open_date = $fwRequest->getParam('open_date', '');
	$fwViewData['show'] = $fwRequest->getParam('show', '');
	$close_date = date('d-m-Y', strtotime($open_date. ' + 7 days'));
		
	$fwViewData['open_date'] = $open_date;
	$fwViewData['close_date'] = $close_date; 	
	$fwViewData['opr'] = "Close";	
	
	
	$sql = "SELECT * from users where user_pm_active = 1 and user_pm_type = 1" ;
	$data = $fwDb->query($sql);
	
	foreach($data as $k=>$v)
	{
		
		$detail['td_open_date'] = $open_date;
		$detail['td_close_date'] = $close_date;
		$detail['td_employee_name'] = $v['user_name'];
		$detail['td_user'] = $_SESSION['user']['user_name'];
	
		$table->setWhere("td_open_date = '".$open_date."' and td_employee_name = '".$v['user_name']."'");
		if(!$table->rowExists())
	    {
		    $data = $table->insertRow($detail);
	    }	
	}
}
 



$hidden = $fwRequest->getParam('hidden', '');
	if(!empty($hidden)) {
	$where = " WHERE 1 = 1";	
}


$clear = $fwRequest->getParam('clear', '');
if($clear) {
	 $fwViewData['due_date']='';
}


  
$matsql = "SELECT * from timesheet_database where td_open_date = '".$open_date."' and td_archive = 0" ;	

if($matsql){$userData = $fwDb->query($matsql);}

if(empty($userData)) {
	$fwViewData['msg'] = $open_date . " - is already archived";
}

$fwViewData['total'] = sizeof($userData);

if(!empty($userData))
{
if (!(isset($pagenum))){ $pagenum = 1; } 
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

$sqlT = "Select * from timesheet_reimbursements ";
$fwViewData['reiData'] = $fwDb->query($sqlT);

$sqlS = "Select * from timesheet_leave ";
$fwViewData['leaveData'] = $fwDb->query($sqlS);



