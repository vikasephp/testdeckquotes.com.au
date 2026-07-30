<?php
$pagenum = $fwRequest->getparam('pagenum','');
$sqlstu = "Select * from busness_status";
$fwViewData['statusdetail'] = $fwDb->query($sqlstu);

$search_status = $fwRequest->getParam('search_status', '');
if(!empty($search_status))
{
	
	$status = $fwRequest->getParam('status', '');
	
	$datast='';
	foreach($status as $k => $v)
	{
		$datast .= $v. ",";
		$data7 .= $v .",";
	}
	$datast .= "0";
	
	$sd="business.bsn_status Like '%|0|%'" ;
		
		foreach($status as $bs)
		{
			$sd .= " OR business.bsn_status Like  '%|" .$bs . "|%'";
		}
	
	$where = " Where ".$sd;
	
 
$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        bus_customers.bcust_misc_email1,bus_customers.bcust_misc_email2,bus_customers.bcust_misc_moble,bus_customers.bcust_misc_business,
	bus_customers.bcust_misc_home,  business.bsn_id, business.bsn_name, business.bsn_address 
  	from business_sellers 		
	Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where;

$userData = $fwDb->query($sql);
//db($userData);
	
require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";

$objPHPExcel = new PHPExcel();
$objPHPExcel->getProperties()->setCreator("Deckquotes")
							 ->setLastModifiedBy("Nick C")
							 ->setTitle("Office 2007 XLSX Test Document")
							 ->setSubject("Office 2007 XLSX Test Document")
							 ->setDescription("Email List Builder exported to Office 2007 XLSX.")
							 ->setKeywords("office 2007 openxml php")
							 ->setCategory("Email List Builder");


//$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth(50);
$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);


// Add some data
$objPHPExcel->setActiveSheetIndex(0)
       			 ->setCellValue('A1', 'Project Name')
           		 ->setCellValue('B1', 'Customer Name')
			 ->setCellValue('C1', 'Customer Email')
			 ->setCellValue('D1', 'Customer Mobile')
			 
;

$from = "A1"; // or any value
$to = "AZ1"; // or any value
$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold( true );


$row=2;
$sr=1;
foreach($userData as $k=>$v)
{
	
	    $objPHPExcel->getActiveSheet()
			->setCellValue('A'.$row, $v['bsn_name'])
			->setCellValue('B'.$row, $v['bcust_fname'] . ' ' .$v['bcust_lname'])
			->setCellValue('C'.$row, $v['bcust_misc_email1'])
			->setCellValue('D'.$row, $v['bcust_misc_moble'])
		
			;
	$row= $row+1;				
}

// Rename worksheet
$objPHPExcel->getActiveSheet()->setTitle('Email List Builder');

$objPHPExcel->setActiveSheetIndex(0);
header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="email_list_buildder.xls"');
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


$fwViewData['list'] = $setdata2;
$fwViewData['title'] = "Email List Builder";

