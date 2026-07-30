<?php
$pagenum = $fwRequest->getparam('pagenum','');
$search_st = $fwRequest->getParam('search_st', '');
$search_dc = $fwRequest->getParam('search_dc', '');

$fwViewData['ran'] =  rand(100000,999999);

$sql_st = "SELECT  st_id, st_status from delivery_schedule_status";
$fwViewData['stdetail'] = $fwDb->query($sql_st);

$where = " where ds_status <> 5  AND ds_status <> 0 ";
	
if($search_st):
	$status_search = $fwRequest->getParam('status_search', '');
	$where = " where delivery_schedule_report.ds_status = ".$status_search;
	
 	$_SESSION['status_search'] = $status_search;
        $fwViewData['status_search']=$_SESSION['status_search'];

elseif($_SESSION['status_search'] && $pagenum > 0):

	$where = "  where delivery_schedule_report.ds_status = ".$_SESSION['status_search'] ;	
	$fwViewData['status_search']=$_SESSION['status_search'];
endif;


if($search_dc):
	$dc_search = $fwRequest->getParam('dc_search', '');
	$where = " where delivery_schedule_report.ds_delivery_event = ".$dc_search;
	
 	$_SESSION['dc_search'] = $dc_search;
        $fwViewData['dc_search']=$_SESSION['dc_search'];

elseif($_SESSION['dc_search'] && $pagenum > 0):

	$where = "  where delivery_schedule_report.ds_delivery_event = ".$_SESSION['dc_search'] ;	
	$fwViewData['dc_search']=$_SESSION['dc_search'];
endif;

$show_hidden = $fwRequest->getParam('show_hidden', '');
if(!empty($show_hidden)) {
	$where = " where 1 = 1  AND ds_status <> 0 ";
}


$show_hidden = $fwRequest->getParam('show_hidden', '');
if(!empty($show_hidden)) {
	$where = " where 1 = 1 AND ds_status <> 0 ";
}


$keyword = $fwRequest->getParam('keyword', '');
if($keyword):

	$where .= " AND delivery_schedule_report.ds_uidd = '".$keyword."' OR 
		    delivery_schedule_report.ds_project  LIKE '%".$keyword."%' OR 
                    delivery_schedule_report.ds_supplier LIKE '%".$keyword."%' ";
		    
	
	$_SESSION['keyword'] = $keyword;
	//$fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword'] && $pagenum > 0):

	$where .= " AND delivery_schedule_report.ds_uidd  = ".$_SESSION['keyword']." OR 
		    delivery_schedule_report.ds_project  LIKE '%".$_SESSION['keyword']."%' OR
	            delivery_schedule_report.ds_supplier LIKE '%".$_SESSION['keyword']."%' ";	
endif;

  $clear = $fwRequest->getParam('clear', '');
 if(!empty($clear)) {
	unset($status_search);
	unset($_SESSION['status_search']);
	unset($_SESSION['keyword']);
	unset($keyword);
	unset($fwViewData['keyword']);
 }

 
if(empty($pagenum))
	{
	unset($_SESSION['last_tdsql']);
	}


$ord =  " ORDER BY if(  ds_date_of_delivery = ' '
         OR ds_date_of_delivery IS NULL , 1, 0 ) , STR_TO_DATE( ds_date_of_delivery, '%d-%m-%Y' ) ";
		
$sql = "SELECT  SQL_CALC_FOUND_ROWS null as row_name, delivery_schedule_report.* from delivery_schedule_report " . $where . $ord;


if ($sql) {
    
    	if (!(isset($pagenum))) {
		$pagenum = 1;
	}elseif ($pagenum <= 1) {
		$pagenum = 1;
	}

    //$rows = count($userData);
    
    $page_rows = 100;
    
$max = 'limit ' .($pagenum - 1) * $page_rows .',' .$page_rows;
   $sql2 =  $sql." ".$max;


  
 $setdata = $fwDb->query($sql2);

//$k2 = count($userData);
$total_rows = $fwDb->query('SELECT FOUND_ROWS() as rows');
	$total_rows = $total_rows[0]['rows'];
	//$rows = count($userData);
	$rows = $total_rows;
}

if(!empty($setdata))
{

    $last = ceil($rows/$page_rows); 

   if ($pagenum > $last)
    {
        $pagenum = $last;
    }
	$numstartvounter =  $page_rows * ($pagenum-1) + 1;
	$fwViewData['numstartvounter'] = $numstartvounter;
		
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
	
    
    
    
 
 }
 		

foreach($setdata as $k1 => $v1)
{
	$sqld = "select * from  delivery_schedule_status where st_id = ".$v1['ds_status'];
	$d = $fwDb->queryOne($sqld);
	$setdata[$k1]['st_color'] = $d['st_color'];
	
	if($d['st_hide'] == 1) {
		unset($setdata[$k1]);	
	}
		
}


$fwViewData['list'] = $setdata;
	
 $fwViewData['list'] =  $setdata;

$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Delivery Schedule Report";

$sql_as1 = "SELECT  * from type_master where tm_type like 'Approval Status%'";
$as_id = $fwDb->queryOne($sql_as1);		

$sql_as2 = "SELECT  * from type_options where to_type_id  =  ".$as_id['tm_id'] . " order by to_option desc";
$asdata = $fwDb->query($sql_as2);

$fwViewData['asdetail'] = $asdata ;

$sqlpr = "Select * from quote_builder_component";
$fwViewData['cdetail'] = $fwDb->query($sqlpr); 

$sql_sup = "SELECT  co_company_name from companies order by co_company_name";
$fwViewData['supdetail'] = $fwDb->query($sql_sup);


$sqlpo = "Select distinct po_po_number from purchase_order where length(po_po_number) > 0";
$fwViewData['podetail'] = $fwDb->query($sqlpo); 


// Export to Excel

$export = $fwRequest->getParam('export', 0);

if($export > 0)
    {
    $sqlexport = "Select * from delivery_schedule_report";

    if($sqlexport){$exportData = $fwDb->query($sqlexport);}
		
require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";

$objPHPExcel = new PHPExcel();

$objPHPExcel->getProperties()->setCreator("Deckquotes")
							 ->setLastModifiedBy("Nick C")
							 ->setTitle("Office 2007 XLSX Test Document")
							 ->setSubject("Office 2007 XLSX Test Document")
							 ->setDescription("Delivery Schedule Report exported to Office 2007 XLSX.")
							 ->setKeywords("office 2007 openxml php")
							 ->setCategory("Scheduled Delivery Report file");

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
            ->setCellValue('A1', 'UIDD')
            ->setCellValue('B1', 'Sub Number')
	    ->setCellValue('C1', 'Status')
            ->setCellValue('D1', 'Project Address')
            ->setCellValue('E1', 'Delivery Component')
	    ->setCellValue('F1', 'Purchase Order Number')
	    ->setCellValue('G1', 'Supplier')
	    ->setCellValue('H1', 'Supplier Date')
	    ->setCellValue('I1', 'Schedule Date')
		;

$from = "A1"; // or any value
$to = "L1"; // or any value
$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold( true );

$row=2;
$sr=1;
foreach($exportData as $k=>$v)
{

	$sql_st2 = "SELECT  st_status from delivery_schedule_status where st_id = ".$v['ds_status'];
	$stdetail = $fwDb->queryOne($sql_st2);
	
	$sqlpr = "Select qb_component from quote_builder_component where qb_id = ".$v['ds_delivery_event'];
	$cdetail = $fwDb->queryOne($sqlpr); 
	
	$objPHPExcel->getActiveSheet()
		
			->setCellValue('A'.$row, $v['ds_uidd'])
			->setCellValue('B'.$row, $v['ds_sub_number'])
			->setCellValue('C'.$row, $stdetail['st_status'])
			->setCellValue('D'.$row, $v['ds_project'])
			->setCellValue('E'.$row, $cdetail['qb_component'])
			->setCellValue('F'.$row, $v['ds_po_number'])
			->setCellValue('G'.$row, $v['ds_supplier'])
			->setCellValue('H'.$row, $v['ds_supplier_date'])
			->setCellValue('I'.$row, $v['ds_date_of_delivery'])
			;	
	$row= $row+1;			
	$sr=$sr+1;
}

// Rename worksheet
$objPHPExcel->getActiveSheet()->setTitle('Delivery Schedule Report');
$objPHPExcel->setActiveSheetIndex(0);

// Redirect output to a client’s web browser (Excel5)
header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="dsr.xls"');
header('Cache-Control: max-age=0');
// If you're serving to IE 9, then the following may be needed
header('Cache-Control: max-age=1');

header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
header ('Pragma: public'); // HTTP/1.0

$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
$objWriter->save('php://output');
exit;
}


