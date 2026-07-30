<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$listdata = $fwRequest->getParam($TABLE, array());
$table = new Fw_Db_Table('delivery_confirmation_report');

$where = " where dc_hide = 0";
$hidden = $fwRequest->getParam('hidden', '');
if(!empty($hidden)) {
	$where = " where 1 = 1";
		
}


$hide = $fwRequest->getParam('hide', '');
if($hide)
{
	 $keys_2 = array_keys($hide);
	 $ky_2 = $keys_2[0];
	 $val_2 = $hide[$ky_2];
	
	  $detail['dc_hide'] = $val_2;
	  $table->setWhere("dc_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}
    
$search = $fwRequest->getParam('search', '');
if(!empty($search))
{
  $search_project = $fwRequest->getParam('project_name', '');

  if($search_project):
 	
       $where .= " AND dc_project  LIKE '%".$search_project."%'  ";
       $_SESSION['search_project'] = $search_project;
       $fwViewData['search_project']=$_SESSION['search_project'];

  elseif($_SESSION['search_project'] && $pagenum > 0):
		
       $where .= " AND dc_project LIKE  '%".$_SESSION['search_project']."%' ";
       $fwViewData['search_project']=$_SESSION['search_project'];
	
  endif;
  
    $_SESSION['where'] = $where; 
}  
   
 $status_search = $fwRequest->getParam('status_search', '');
 if(!empty($status_search))
 {
 	 $search_status = $fwRequest->getParam('dc_status', '');
	 
   if($search_status):
 	
       $where .= " AND dc_status  = ".$search_status;
       $_SESSION['search_status'] = $search_status;
       $fwViewData['search_status']=$_SESSION['search_status'];

  elseif($_SESSION['search_status'] && $pagenum > 0):
		
       $where .= " AND dc_status = ".$_SESSION['search_status'];
       $fwViewData['search_status']=$_SESSION['search_status'];
	
  endif;
  
    $_SESSION['where'] = $where; 
	 
 }
   
   
$clear = $fwRequest->getParam('clear', '');
if($clear) {
	unset($_SESSION['search_project']);
	unset($_SESSION['search_status']);
	unset($_SESSION['where']);
	unset($search_status);
}

 if(isset($_SESSION['where'])) { $where = $_SESSION['where']; }
 
$ord =  " ORDER BY if( dc_date = ' '
        OR dc_date IS  NULL , 0, 1 ) , STR_TO_DATE( dc_date, '%d-%m-%Y' ) DESC "; 
	
	
$sql_7 = "SELECT count(*) as seven FROM delivery_confirmation_report 
	      WHERE STR_TO_DATE(dc_date , '%d-%m-%Y' ) > CURDATE( ) - INTERVAL 7 DAY ";
$fwViewData['tot_seven'] = $fwDb->queryOne($sql_7);	
    
$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where ." ".$ord ;	

if($matsql){$userData = $fwDb->query($matsql);}

if(!empty($userData))
{
if (!(isset($pagenum))){ $pagenum = 1; } 
    $rows = count($userData);
    $page_rows = 300;
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
	//$fwViewData['list'] = $listsnew;
  }
}
foreach($listsnew as $k1 => $v1)
{
	$sqld = "select * from  delivery_conf_status where st_id = ".$v1['dc_status'];
	$d = $fwDb->queryOne($sqld);
	$listsnew[$k1]['st_color'] = $d['st_color'];
	
	if($d['st_hide'] == 1) {
		unset($listsnew[$k1]);	
	}
		
}


$fwViewData['list'] = $listsnew;

$fwViewData['title'] = $MODULE_PLURAL;

 		
$sqlst = "Select * from delivery_conf_status";
$fwViewData['stdetail'] = $fwDb->query($sqlst); 

$sqlow = "Select * from delivery_conf_owner";
$fwViewData['owdetail'] = $fwDb->query($sqlow); 

$sqlev = "Select * from delivery_conf_event";
$fwViewData['evdetail'] = $fwDb->query($sqlev); 

$sqlwo = "Select * from delivery_conf_who";
$fwViewData['wodetail'] = $fwDb->query($sqlwo);


$sqlpo = "Select po_po_number  from purchase_order where length(po_po_number) > 0";
$fwViewData['podetail'] = $fwDb->query($sqlpo);



// Export to Excel

$export = $fwRequest->getParam('export', 0);

if($export > 0)
    {
    $sqlexport = "Select * from delivery_confirmation_report";

    if($sqlexport){$exportData = $fwDb->query($sqlexport);}
		
require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";

$objPHPExcel = new PHPExcel();

$objPHPExcel->getProperties()->setCreator("Deckquotes")
							 ->setLastModifiedBy("Nick C")
							 ->setTitle("Office 2007 XLSX Test Document")
							 ->setSubject("Office 2007 XLSX Test Document")
							 ->setDescription("Delivery Confirmation Report exported to Office 2007 XLSX.")
							 ->setKeywords("office 2007 openxml php")
							 ->setCategory("Scheduled Confirmation Report file");

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
            ->setCellValue('A1', 'URN')
            ->setCellValue('B1', 'Project Address')
	    ->setCellValue('C1', 'Status')
            ->setCellValue('D1', 'Supplier')
            ->setCellValue('E1', 'Purchase Order')
	    ->setCellValue('F1', 'Event')
	    ->setCellValue('G1', 'Delivery Date')
	    ->setCellValue('H1', 'Confirmation Date')
	    ->setCellValue('I1', 'Who')
		;

$from = "A1"; // or any value
$to = "L1"; // or any value
$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold( true );

$row=2;
$sr=1;
foreach($exportData as $k=>$v)
{

	$sql_st2 = "SELECT  st_status from delivery_conf_status where st_id = ".$v['dc_status'];
	$stdetail = $fwDb->queryOne($sql_st2);
	
	$sqlow = "Select ow_owner from delivery_conf_owner where ow_id =" .$v['dc_owner'];
	$owdetail = $fwDb->queryOne($sqlow); 
	
	$sqlev = "Select ev_event from delivery_conf_event where ev_id = ".$v['dc_event'];
	$evdetail = $fwDb->queryOne($sqlev); 
	
	$sqlwo = "Select wo_who from delivery_conf_who where wo_id = ".$v['dc_who'];
	$wodetail = $fwDb->queryOne($sqlwo);
	
	$objPHPExcel->getActiveSheet()
		
			->setCellValue('A'.$row, $v['dc_id'])
			->setCellValue('B'.$row, $v['dc_project'])
			->setCellValue('C'.$row, $stdetail['st_status'])
			->setCellValue('D'.$row, $owdetail['ow_owner'])
			->setCellValue('E'.$row, $v['dc_purchase_order'])
			->setCellValue('F'.$row, $evdetail['ev_event'])
			->setCellValue('G'.$row, $v['dc_date'])
			->setCellValue('H'.$row, $v['dc_confirmation_date'])
			->setCellValue('I'.$row, $wodetail['wo_who'])
			;	
	$row= $row+1;			
	$sr=$sr+1;
}

// Rename worksheet
$objPHPExcel->getActiveSheet()->setTitle('Delivery Confirmation Report');
$objPHPExcel->setActiveSheetIndex(0);

// Redirect output to a client’s web browser (Excel5)
header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="dcr.xls"');
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


