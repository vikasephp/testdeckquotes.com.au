<?php
$fwMainView = 'file:' . getcwd() . '/export_status.tpl';
$tableqa = new Fw_Db_Table('designer_tracker');

$sql_status_export = "Select DISTINCT tdt_status from task_designer_tracker";
$fwViewData['exportStatus'] = $data_status_export = $fwDb->query($sql_status_export);

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
	$detail = $fwRequest->getParam($TABLE, array());
	$item_status = $detail['item_status'] ?? '';
	//echo $item_status;
	
	//echo "<pre>"; print_r($detail); exit('Checking');
	$sql_export = 'Select tdt.tdt_id, tdt.tdt_task_desc, tdt.tdt_task_assignee, tdt.tdt_task_assigner, tdt.tdt_submitted_date, tdt.tdt_due_date, tdt.tdt_status, tdt.tdt_task_type, dtp.pr_priority, task_comment.tc_comment_date, task_comment.tc_user, task_comment.tc_comment from task_designer_tracker tdt Left JOIN design_tracker_priority dtp on tdt.tdt_priority = dtp.pr_id Left JOIN task_comment on tdt.tdt_id = task_comment.tc_task_id where tdt_status = "'.$item_status.'" ';
	//echo $sql_export; exit('checking query');
	$data_export = $fwDb->query($sql_export);
	//echo "<pre>"; print_r($data_export); exit('Checking');
	
	require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";

	$objPHPExcel = new PHPExcel();
	$objPHPExcel->getProperties()->setCreator("Deckquotes")
		->setLastModifiedBy("Nick C")
		->setTitle("Office 2007 XLSX Design Tracker")
		->setSubject("Office 2007 XLSX Design Tracker")
		->setDescription("Design Tracker exported to Office 2007 XLSX.")
		->setKeywords("office 2007 openxml php")
		->setCategory("Design Tracker");


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
	$objPHPExcel->getActiveSheet()->getColumnDimension('J')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('L')->setAutoSize(true);


	// Add some data
	$objPHPExcel->setActiveSheetIndex(0)
		->setCellValue('A1', 'Task ID')
		->setCellValue('B1', 'Task Description')
		->setCellValue('C1', "Assignee")
		->setCellValue('D1', "Assigner")
		->setCellValue('E1', "Submitted Date")
		->setCellValue('F1', "Due Date")
		->setCellValue('G1', "Priority")
		->setCellValue('H1', "Status")
		->setCellValue('I1', "Task Type")
		->setCellValue('J1', "Comment Date")
		->setCellValue('K1', "User")
		->setCellValue('L1', "Comment");

	$from = "A1"; // or any value
	$to = "AL1"; // or any value
	$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold(true);

	$row = 2;
	$sr = 1;
	foreach ($data_export as $k => $v) {
		$objPHPExcel->getActiveSheet()
			->setCellValue('A' . $row, $v['tdt_id'])
			->setCellValue('B' . $row, $v['tdt_task_desc'])
			->setCellValue('C' . $row, $v['tdt_task_assignee'])
			->setCellValue('D' . $row, $v['tdt_task_assigner'])
			->setCellValue('E' . $row, $v['tdt_submitted_date'])
			->setCellValue('F' . $row, $v['tdt_due_date'])
			->setCellValue('G' . $row, $v['pr_priority'])
			->setCellValue('H' . $row, $v['tdt_status'])
			->setCellValue('I' . $row, $v['tdt_task_type'])
			->setCellValue('J' . $row, $v['tc_comment_date'])
			->setCellValue('K' . $row, $v['tc_user'])
			->setCellValue('L' . $row, $v['tc_comment']);
		$row = $row + 1;
	}

	// Rename worksheet
	$objPHPExcel->getActiveSheet()->setTitle('Designer Tracker Report');

	$objPHPExcel->setActiveSheetIndex(0);
	header('Content-Type: application/vnd.ms-excel');
	header('Content-Disposition: attachment;filename=designer_tracker_report.xls');
	header('Cache-Control: max-age=0');
	header('Cache-Control: max-age=1');
	header('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
	header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT'); // always modified
	header('Cache-Control: cache, must-revalidate'); // HTTP/1.1
	header('Pragma: public'); // HTTP/1.0

	$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
	$objWriter->save('php://output');
	exit;

}

//get the current limit
$memlimit = ini_get('memory_limit');
//set it to something else
ini_set("memory_limit", "1024M");
ini_set('max_execution_time', 0);