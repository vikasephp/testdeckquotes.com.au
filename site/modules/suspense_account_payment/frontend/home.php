<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('suspense_account_payment');

//$where = " WHERE  (er_response_status = 1 Or er_response_status = 3) AND er_hide = 0";
//
//$hidden = $fwRequest->getParam('hidden', '');
//	if(!empty($hidden)) {
//	$where = " WHERE 1 = 1";	
//}


//$ord =  " ORDER BY if( er_last_email_date = ' '
//         OR er_last_email_date IS NULL , 1, 0 ) , STR_TO_DATE( er_last_email_date, '%d-%m-%Y' ) DESC";

$res_status = $fwRequest->getParam('res_status', '');
if($res_status)
{
	 $keys_2 = array_keys($res_status);
	 $ky_2 = $keys_2[0];
	 $val_2 = $res_status[$ky_2];
	 
	  $detail['er_response_status'] = $val_2;
	  $detail['er_resp_status_date'] = date('d-m-Y');
	  $detail['er_resp_status_user'] = $_SESSION['user']['user_name'];

	  $table->setWhere("er_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}

$hide = $fwRequest->getParam('hide', '');
if($hide)
{
	 $keys_2 = array_keys($hide);
	 $ky_2 = $keys_2[0];
	 $val_2 = $hide[$ky_2];
	 
	  $detail['sa_hide'] = $val_2;

	  $table->setWhere("sa_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}


//$clear_search = $fwRequest->getParam('clear_search', '');
//if($clear_search) {
//	 $fwViewData['clear_search']='';
//	 unset($_SESSION['keyword']);
//}


//$keyword = $fwRequest->getParam('keyword', '');
//if($keyword):
//		$where .= " AND ( email_response_tracker.er_customer_name LIKE '%".$keyword."%'
//		            OR  email_response_tracker.er_customer_email  LIKE '%".$keyword."%'
//					OR  email_response_tracker.er_email_subject LIKE '%".$keyword."%' )";
//		
//        $_SESSION['keyword'] = $keyword;
//elseif($_SESSION['keyword']):
//		$where .= " AND email_response_tracker.er_customer_name LIKE '%".$_SESSION['keyword']."%'
//		            OR  email_response_tracker.er_customer_email  LIKE '%".$_SESSION['keyword']."%'
//					OR  email_response_tracker.er_email_subject LIKE '%".$_SESSION['keyword']."%' )";	      
//endif;
  
$matsql = "SELECT * from suspense_account_payment ".$where .' '. $ord;	


if($matsql){$userData = $fwDb->query($matsql);}

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
	
	//$fwViewData['list'] = $listsnew;
  }
}

$fwViewData['list'] = $listsnew;
$fwViewData['title'] = $MODULE_PLURAL;

$sql = "SELECT  * from suspense_account_method";
$fwViewData['methoddetail'] = $fwDb->query($sql);

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
							 ->setDescription("Suspense account exported to Office 2007 XLSX.")
							 ->setKeywords("office 2007 openxml php")
							 ->setCategory("Suspense Account Report");

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
       		->setCellValue('A1', 'Record')
           	->setCellValue('B1', "Payment Date")
			->setCellValue('C1', "Amount")
			->setCellValue('D1', "Description")
			->setCellValue('E1', "User Created")
			->setCellValue('F1', "Created Date")
			->setCellValue('G1', "Method")
			->setCellValue('H1', "Card Id")
			->setCellValue('I1', "What")
			->setCellValue('J1', "COA")
	
;

$from = "A1"; // or any value
$to = "AZ1"; // or any value
$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold( true );


$row=2;
$sr=1;
foreach($listsnew as $k=>$v)
{
	
	$sql = "select sm_option from suspense_account_method where sm_id = ".$v['sa_method'];
	$data = $fwDb->queryOne($sql);
	
	$objPHPExcel->getActiveSheet()
				->setCellValue('A'.$row, $v['sa_id'])
				->setCellValue('B'.$row, $v['sa_payment_date'])
				->setCellValue('C'.$row, $v['sa_amount'])
				->setCellValue('D'.$row, $v['sa_description'])
				->setCellValue('E'.$row, $v['sa_created_user'])
				->setCellValue('F'.$row, $v['sa_created_date'])
				->setCellValue('G'.$row, $data['sm_option'])
				->setCellValue('H'.$row, $v['sa_card_id'])
				->setCellValue('I'.$row, $v['sa_what'])
				->setCellValue('J'.$row, $v['sa_coa'])
			   ;
					
	$row= $row+1;			
}

// Rename worksheet
$objPHPExcel->getActiveSheet()->setTitle('Suspense Account Payment Report');

$objPHPExcel->setActiveSheetIndex(0);
header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="suspense_account_report.xls"');
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

