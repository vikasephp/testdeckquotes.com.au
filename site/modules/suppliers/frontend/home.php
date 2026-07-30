<?php
$tablePages = new Fw_Db_Table($TABLE);
//$list = $tablePages->getAllRows();
$fwViewData['title'] = $MODULE_PLURAL;
//$fwViewData['list'] = $list;

$tableindustry = new Fw_Db_Table('suppliers_industry');
$fwViewData['inddata'] = $tableindustry->getRows();

$sqlState = "select distinct sp_state from suppliers ";
$fwViewData['state'] = $fwDb->query($sqlState);


$where = "WHERE 1 = 1";

$search = $fwRequest->getParam('search', '');
if(!empty($search)) {
	$keyword_1 = $fwRequest->getParam('keyword_1', '');
	//$_SESSION['keyword'] = $keyword;
}	
if($keyword_1):

$where .= " AND suppliers.sp_industry LIKE '%".$keyword_1."%'";
	
	$_SESSION['keyword_1'] = $keyword_1;
	$fwViewData['keyword_1']=$_SESSION['keyword_1'];

elseif($_SESSION['keyword_1'] && $pagenum > 0):

	$where .= "AND suppliers.sp_industry LIKE '%".$_SESSION['keyword_1']."%'";
	$fwViewData['keyword_1']=$_SESSION['keyword_1'];
endif;

$search2 = $fwRequest->getParam('search2', '');
if(!empty($search2)) {
	$keyword_2 = $fwRequest->getParam('keyword_2', '');
	//$_SESSION['keyword'] = $keyword;
}	
if($keyword_2):

$where .= " AND suppliers.sp_state LIKE '%".$keyword_2."%'";
	
	$_SESSION['keyword_2'] = $keyword_2;
	$fwViewData['keyword_2']=$_SESSION['keyword_2'];

elseif($_SESSION['keyword_2'] && $pagenum > 0):

	$where .= "AND suppliers.sp_state LIKE '%".$_SESSION['keyword_2']."%'";
	$fwViewData['keyword_2']=$_SESSION['keyword_2'];
endif;


$sql = "select * from suppliers ".$where;
$list = $fwDb->query($sql);
$fwViewData['list'] = $list;
// Export to Excel

$export = $fwRequest->getParam('export', 0);

if($export > 0)
{
	
require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";

$objPHPExcel = new PHPExcel();

// Set document properties
$objPHPExcel->getProperties()->setCreator("Deckquotes")
							 ->setLastModifiedBy("Nick C")
							 ->setTitle("Office 2007 XLSX Test Document")
							 ->setSubject("Office 2007 XLSX Test Document")
							 ->setDescription("Supplier List to Office 2007 XLSX.")
							 ->setKeywords("office 2007 openxml php")
							 ->setCategory("Supplier List");


//$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth(50);
$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth(25);
$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth(35);
$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth(25);
$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setWidth(25);
$objPHPExcel->getActiveSheet()->getColumnDimension('G')->setWidth(20);
$objPHPExcel->getActiveSheet()->getColumnDimension('H')->setWidth(20);
$objPHPExcel->getActiveSheet()->getColumnDimension('I')->setWidth(20);
$objPHPExcel->getActiveSheet()->getColumnDimension('J')->setWidth(20);
	
$objPHPExcel->getActiveSheet()->getStyle('A1:J1')->getAlignment()->setWrapText(true);
// Add some data
$objPHPExcel->setActiveSheetIndex(0)
           	->setCellValue('A1', 'Industry')
          	->setCellValue('B1', 'Business Name')
		->setCellValue('C1', 'Website')
		->setCellValue('D1', 'Address')
		->setCellValue('E1', 'State')
		->setCellValue('F1', 'Phone')
		->setCellValue('G1', 'Email')
		->setCellValue('H1', 'When Updated')
		
		;

$from = "A1"; // or any value
$to = "AH1"; // or any value
$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold( true );


$row=2;
$sr=1;
foreach($list as $k=>$v)
{
	

	
	$objPHPExcel->getActiveSheet()
			->setCellValue('A'.$row, $v['sp_industry'])
			->setCellValue('B'.$row, $v['sp_business_name'])
			->setCellValue('C'.$row, $v['sp_website'])
			->setCellValue('D'.$row, $v['sp_address'])
			->setCellValue('E'.$row, $v['sp_state'])
			->setCellValue('F'.$row, $v['sp_phone'])
			->setCellValue('G'.$row, $v['sp_email'])
			->setCellValue('H'.$row, changedate_d_m_y($v['sp_when_updated']))
	


			;	
	$row= $row+1;			
	$sr=$sr+1;
}

// Rename worksheet
$objPHPExcel->getActiveSheet()->setTitle('Supplier List');

// Set active sheet index to the first sheet, so Excel opens this as the first sheet
$objPHPExcel->setActiveSheetIndex(0);

// Redirect output to a client’s web browser (Excel2007)
//header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');

// Redirect output to a client’s web browser (Excel5)
header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="cpr_report.xls"');
header('Cache-Control: max-age=0');
// If you're serving to IE 9, then the following may be needed
header('Cache-Control: max-age=1');

// If you're serving to IE over SSL, then the following may be needed
header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
header ('Pragma: public'); // HTTP/1.0

$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
$objWriter->save('php://output');
exit;

	}
