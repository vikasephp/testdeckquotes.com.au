<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$listdata = $fwRequest->getParam($TABLE, array());

$tablestage = new Fw_Db_Table('wip_stage_options');
$fwViewData['stagedata'] = $tablestage->getRows();


$last_audited = $fwRequest->getParam('last_audited', '');

if(!empty($last_audited))
{
  $table_la = new Fw_Db_Table('wip_last_audited');
  $ladetail['wp_date'] = date('d-m-Y');
  $ladetail['wp_user'] =  $_SESSION['user']['user_name'];	
  
  $table_la->setWhere("wp_id = 1");
	  if($table_la->rowExists())
	  {
		 $this_id = $table_la->updateRow($ladetail);
	  }	  	
}
$sqlla = "select * from wip_last_audited where wp_id = 1";
$ladata = $fwDb->queryOne($sqlla);

$fwViewData['last_audited'] = $ladata['wp_date'] ."  ".$ladata['wp_user'];

$where = " WHERE 1=1";	


$ord = " Order by STR_TO_DATE(timeline_center.tc_letter_email, '%d-%m-%Y' ) DESC ";

$ord ='';
  
$matsql = "SELECT * from work_in_progress_report ". $where . $ord;

if($matsql){$userData = $fwDb->query($matsql);}
$fwViewData['total'] = sizeof($userData);
if(!empty($userData))
{
if (!(isset($pagenum))){ $pagenum = 1; } 
    $rows = count($userData);
    $page_rows = 500;
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

$tot_val_computed = 0;
$tot_wip_cog;
foreach($listsnew as $k1=>$v1)
{
	$sql = "select bsn_id, bsn_status from business where bsn_name like '%".$v1['wp_project']. "%'";
	$busdata = $fwDb->queryOne($sql);
    $link = BASE_URL."business.detail/bsn_id/".$busdata['bsn_id'];
	
		$status_string = "'".$busdata['bsn_status']."'";
		$status='';
		
		if(strpos($status_string, '|1|') > 0) { $status .= "Convert<br>" ; }
		if(strpos($status_string, '|2|') > 0) { $status .= "Planning Approvals<br>" ; }
		if(strpos($status_string, '|3|') > 0) { $status .= "Construction<br>" ; }
		if(strpos($status_string, '|4|') > 0) { $status .= "Complete<br>" ; }
		if(strpos($status_string, '|5|') > 0) { $status .= "Inclusions<br>" ; }
		if(strpos($status_string, '|6|') > 0) { $status .= "Pre Construction<br>" ; }
		if(strpos($status_string, '|12|') > 0) { $status .= "Design Phase<br>" ; }
	
	
	$inv1 = str_replace("$",'',$v1['wp_invoice_value']);
	$inv2 = str_replace(",",'',$inv1);
	$listsnew[$k1]['status'] = $status;
	$listsnew[$k1]['link'] = $link;
	$listsnew[$k1]['inv2'] = $inv2;
	$listsnew[$k1]['val_computed'] = $inv2 * $v1['wp_per_completed'] / 100;
	$listsnew[$k1]['wip_cog'] = $inv2 * $v1['wp_per_completed'] / 100 * $v1['wp_cog_percented'] / 100;
	
	$tot_val_computed = $tot_val_computed + $listsnew[$k1]['val_computed'];
	$tot_wip_cog = $tot_wip_cog + $listsnew[$k1]['wip_cog'];
		
}
$fwViewData['tot_val_computed'] = $tot_val_computed;
$fwViewData['tot_wip_cog'] = $tot_wip_cog;

//db($listsnew);
$fwViewData['list'] = $listsnew;

$fwViewData['title'] = $MODULE_PLURAL;


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
							 ->setDescription("Design q/a report exported to Office 2007 XLSX.")
							 ->setKeywords("office 2007 openxml php")
							 ->setCategory("Work In Progress Report");


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


// Add some data
$objPHPExcel->setActiveSheetIndex(0)
       		->setCellValue('A1', 'Project Address')
           	->setCellValue('B1', "Project Status")
			->setCellValue('C1', "Invoice Stage")
			->setCellValue('D1', "Invoice Value")
			->setCellValue('E1', "% Completed")
			->setCellValue('F1', "Value Completed")
			->setCellValue('G1', "COG %")
			->setCellValue('H1', "WIP COG")
			->setCellValue('I1', "Reason")
	
;

$from = "A1"; // or any value
$to = "AZ1"; // or any value
$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold( true );


$row=2;
$sr=1;
foreach($listsnew as $k=>$v)
{
	
	$sql = "select so_name from wip_stage_options where so_id =  ".$v['wp_invoice_stage'];
	$stdata = $fwDb->queryOne($sql);
	
	$objPHPExcel->getActiveSheet()
				->setCellValue('A'.$row, $v['wp_project'])
				->setCellValue('B'.$row, str_replace("<br>",", ",$v['status']))
				->setCellValue('C'.$row, $stdata['so_name'])
				->setCellValue('D'.$row, $v['wp_invoice_value'])
				->setCellValue('E'.$row, $v['wp_per_completed'])
				
				->setCellValue('F'.$row, $v['val_computed'])
				->setCellValue('G'.$row, $v['wp_cog_percented'])
				->setCellValue('H'.$row, $v['wip_cog'])
				->setCellValue('I'.$row, $v['wp_reason'])
						;
					
	$row= $row+1;			
	
}

// Rename worksheet
$objPHPExcel->getActiveSheet()->setTitle('Work In Progress Report');

$objPHPExcel->setActiveSheetIndex(0);
header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="work_in_progress.xls"');
header('Cache-Control: max-age=0');
header('Cache-Control: max-age=1');
header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
header ('Pragma: public'); // HTTP/1.0

$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
$objWriter->save('php://output');
exit;

}

