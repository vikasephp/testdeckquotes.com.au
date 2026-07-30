<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('warranty');
$where = " WHERE 1 = 1  ";

$hidden = $fwRequest->getParam('hidden', '');

if(!empty($hidden)) {
	$where = " WHERE 1 = 1  ";
} else {
	$where = " WHERE wa_closed = 0";
}


$closed = $fwRequest->getParam('closed', '');
if($closed)
{
	 $keys_2 = array_keys($closed);
	 $ky_2 = $keys_2[0];
	 $val_2 = $closed[$ky_2];
	
	  $detail['wa_closed'] = $val_2;
	  $table->setWhere("wa_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}

$filter = $fwRequest->getParam('filter', '');
if($filter)
{
	
	$date1 = $fwRequest->getParam('date1', '');
	$date2 = $fwRequest->getParam('date2', '');
	
	if($date1 && $date2) {
		
		$fwViewData['date1'] = $date1;
		$fwViewData['date2'] = $date2;
		
	        $d1 = $date1;
		$d2 = $date2;
		$d1 = "'".$d1."'";
		$d2 = "'".$d2."'";
		$where .= " And  STR_TO_DATE(construction_alert_report.car_new_date, '%d-%m-%Y') BETWEEN STR_TO_DATE( $d1 ,'%d-%m-%Y' ) AND STR_TO_DATE($d2, '%d-%m-%Y') ";
         }
	 
	
}

  $search_project = $fwRequest->getParam('project_name', '');
  $search_contact = $fwRequest->getParam('contact', '');
  $search_type = $fwRequest->getParam('type', '');
  $search_win = $fwRequest->getParam('win', '');
  $date1 = $fwRequest->getParam('date1', '');
  $date2 = $fwRequest->getParam('date2', '');

  if($search_project):
	
       $where .= " AND wa_project  LIKE '%".$search_project."%'  ";
       $_SESSION['search_project'] = $search_project;
       $fwViewData['search_project']=$_SESSION['search_project'];

  elseif($_SESSION['search_project'] && $pagenum > 0):
		
       $where .= " AND wa_project LIKE  '%".$_SESSION['search_project']."%' ";
       $fwViewData['search_project']=$_SESSION['search_project'];
	
  endif;

  if($search_contact):
	
       $where .= " AND wa_contact_info  LIKE '%".$search_contact."%'  ";
       $_SESSION['search_contact'] = $search_contact;
       $fwViewData['search_contact']=$_SESSION['search_contact'];

  elseif($_SESSION['search_contact'] && $pagenum > 0):
		
       $where .= " AND wa_contact_info LIKE  '%".$_SESSION['search_contact']."%' ";
       $fwViewData['search_contact']=$_SESSION['search_contact'];
       
  endif;	
  
 
if($search_type):
	
       $where .= " AND wa_type  LIKE '%".$search_type."%'  ";
       $_SESSION['search_type'] = $search_type;
       $fwViewData['search_type']=$_SESSION['search_type'];

  elseif($_SESSION['search_type'] && $pagenum > 0):
		
       $where .= " AND wa_type LIKE  '%".$_SESSION['search_type']."%' ";
       $fwViewData['search_type']=$_SESSION['search_type'];
       
  endif;	

if($search_win):
	
       $where .= " AND wi_warrany_issue_num  = ".$search_win;
       $_SESSION['search_win'] = $search_win;
       $fwViewData['search_win']=$_SESSION['search_win'];

  elseif($_SESSION['search_win'] && $pagenum > 0):
		
       $where .= " AND wi_warrany_issue_num = ".$_SESSION['search_win'];
       $fwViewData['search_win']=$_SESSION['search_win'];
       
  endif;



if($date1 && $date2) {
		
		$fwViewData['date1'] = $date1;
		$fwViewData['date2'] = $date2;
		
	        $d1 = $date1;
		$d2 = $date2;
		$d1 = "'".$d1."'";
		$d2 = "'".$d2."'";
		$where .= " And  STR_TO_DATE(warranty.wa_date, '%d-%m-%Y') BETWEEN STR_TO_DATE( $d1 ,'%d-%m-%Y' ) AND STR_TO_DATE($d2, '%d-%m-%Y') ";
         }


$clear = $fwRequest->getParam('clear', '');
if($clear) {
	 $fwViewData['date']='';
	 unset($_SESSION['search_project']);
	 unset($_SESSION['search_contact']);
	 unset($_SESSION['search_type']);
	 
	 $fwViewData['search_project'] = '';
	 $fwViewData['search_contact'] = '';
	 $fwViewData['search_type'] = '';
	 $where = " WHERE 1 = 1 ";
}
     
//$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where ;	
$matsql = "SELECT * from warranty 
           Left Join warranty_issue On warranty.wa_id = warranty_issue.wi_wa_id ".$where . " Group by warranty.wa_id ";


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


$export = $fwRequest->getParam('export', 0);

if($export > 0)
	{

	$warrantysql = "SELECT warranty.*, warranty_issue.* FROM warranty
	               Inner Join warranty_issue on warranty.wa_id = wi_wa_id
		       order by wa_project";	

        if($warrantysql){$warrantyData = $fwDb->query($warrantysql);}
		

//db($warrantyData);
//exit;	
	
require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";
//require BASE_DIR . "PHPExcel/Classes/PHPExcel/Writer/Excel2007.php";
// Create new PHPExcel object
$objPHPExcel = new PHPExcel();

// Set document properties
$objPHPExcel->getProperties()->setCreator("Deckquotes")
							 ->setLastModifiedBy("Nick C")
							 ->setTitle("Office 2007 XLSX Test Document")
							 ->setSubject("Office 2007 XLSX Test Document")
							 ->setDescription("Contact list exported to Office 2007 XLSX.")
							 ->setKeywords("office 2007 openxml php")
							 ->setCategory("New Warranty Log");


$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth(50);

$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth(320);
$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth(320);
$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth(30);
$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('G')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('H')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('I')->setWidth(340);
$objPHPExcel->getActiveSheet()->getColumnDimension('J')->setWidth(310);
$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('L')->setWidth(30);

$objPHPExcel->getDefaultStyle()->getAlignment()->setWrapText(true);	

// Add some data
$objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A1', 'SrNo')
            ->setCellValue('B1', 'Project Name')
            ->setCellValue('C1', 'Contact Info')
            ->setCellValue('D1', 'Quality inspector contacted client')
   	    ->setCellValue('E1', 'Date Lodged')
	    ->setCellValue('F1', 'Closed')
	    ->setCellValue('G1', 'Warranty Issue Number')
	    ->setCellValue('H1', 'Type')
	    ->setCellValue('I1', 'Problems Description')
	    ->setCellValue('J1', 'Notes and Comments')
	    ->setCellValue('K1', 'CGFB Person')
	    ->setCellValue('L1', 'Date of the Issue')
			;

$from = "A1"; // or any value
$to = "L1"; // or any value
$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold( true );

// Miscellaneous glyphs, UTF-8
//$objPHPExcel->setActiveSheetIndex(0)
//            ->setCellValue('A4', 'Miscellaneous glyphs')
//            ->setCellValue('A5', 'éàèùâêîôûëïüÿäöüç');
$row=2;
$sr=1;
foreach($warrantyData as $k=>$v)
{
	
	$qi = '';
	$cl = '';
	if($v['wa_qualiy_inspecter_con'] == 1) { $qi = 'Yes' ; } else { $qi = 'No' ; }
	if($v['wa_closed'] == 1) { $cl = 'Yes' ; } else { $cl = 'No' ; }
	
	$objPHPExcel->getActiveSheet()
				->setCellValue('A'.$row, $sr)
				->setCellValue('B'.$row, $v['wa_project'])
				->setCellValue('C'.$row, $v['wa_contact_info'])
				->setCellValue('D'.$row, $qi)
				->setCellValue('E'.$row, $v['wa_date_lodged'])
				->setCellValue('F'.$row, $cl)
				->setCellValue('G'.$row, $v['wi_warrany_issue_num'])
				->setCellValue('H'.$row, $v['wi_type'])
				->setCellValue('I'.$row, $v['wi_prob_desc'])
				->setCellValue('J'.$row, $v['wi_notes'])
				->setCellValue('K'.$row, $v['wi_cgfb_person'])
				->setCellValue('L'.$row, $v['wa_date_inspected'])
				;	
	$row= $row+1;			
	$sr=$sr+1;
}

// Rename worksheet
$objPHPExcel->getActiveSheet()->setTitle('Warranty Log');

$objPHPExcel->setActiveSheetIndex(0);
header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="warranty_log.xls"');
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


