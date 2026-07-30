<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('home_warranty_database');
$tablela = new Fw_Db_Table('home_war_report_last_audit');
$audit_whole = $fwRequest->getParam('audit_whole', '');

if(!empty($audit_whole))
{
	$keyla = array_keys($audit_whole);
	$kyla = $keyla[0];
	$lahDetail['la_last_audit'] = $audit_whole[$kyla];
	$lahDetail['la_last_audit_date'] = date('d-m-Y');
	$lahDetail['la_last_audit_user'] = $_SESSION['user']['user_name'];
        $tablela->setWhere('la_id = 1');
	$detail_lah = $tablela->updateRow($lahDetail);
}
$sqlwla = "select * from home_war_report_last_audit ";
$fwViewData['wlaData'] = $fwDb->queryOne($sqlwla);


$status = $fwRequest->getParam('status', '');
if($status)
{
	 $keys_2 = array_keys($status);
	 $ky_2 = $keys_2[0];
	 $val_2 = $status[$ky_2];
	
	  $detail['hw_status'] = $val_2;
	  $table->setWhere("hw_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}

$public_status = $fwRequest->getParam('public_status', '');
if (!empty($public_status)) {
	$dt = date('d-m-Y');
	$user = $_SESSION['user']['user_name'];
	$key = array_keys($public_status);
	$ky = $key[0];

	$psDetail['hw_public_status'] = $public_status[$ky];
	$psDetail['hw_public_status_user'] = $user;
	$psDetail['hw_public_status_date'] = $dt;

	$table->setWhere('hw_id = ' . $ky);
	if ($table->rowExists()) {
		$detail = $table->updateRow($psDetail);
	}
	$redirectUrl = $_SERVER['REQUEST_URI'];
    header("Location: $redirectUrl");
    exit;
}



$where = "WHERE hw_status = 1 ";

$show_closed = $fwRequest->getParam('show', '');
if(!empty($show_closed)) {
	$where = "WHERE 1=1";	
	$_SESSION['show_closed'] = $show_closed;
	$fwViewData['show_closed'] = $_SESSION['show_closed'];
	unset($_SESSION['show_opened']);
	$fwViewData['show_opened'] = '';
}
elseif ($_SESSION['show_closed'] ){
	$where = "WHERE 1=1";
	$fwViewData['show_closed'] = $_SESSION['show_closed'];
	unset($_SESSION['show_opened']);
	$fwViewData['show_opened'] = '';
}

$show_opened = $fwRequest->getParam('showop', '');
if(!empty($show_opened)) {
	unset($_SESSION['show_closed']);
	$fwViewData['show_closed'] = '';
	header('Location: ' . $_SERVER['REQUEST_URI']);
	exit;
}
elseif ($_SESSION['show_opened'] ){
	unset($_SESSION['show_closed']);
	$fwViewData['show_closed'] = '';
	header('Location: ' . $_SERVER['REQUEST_URI']);
	exit;
}

$sqltot = "select hw_value from home_warranty_database where hw_status = 1";
$totdata = $fwDb->query($sqltot);


$total = 0;
foreach($totdata as $kt=>$vt)
{
	$value=0;
	
	$value = $vt['hw_value'];
	if (!empty($vt['hw_value'])) {
		$value = str_replace('$','',$value);
		$value = str_replace(',','',$value);
		
		$total = $total + $value;	
	}
}
$fwViewData['total'] = number_format($total, 2, '.', ',');
//$sort_date = $fwRequest->getParam('sort_date', '');
//if(!empty($sort_date)) {
//$ord =  " ORDER BY if(  warranty_log.wa_date = ' '
//         OR warranty_log.wa_date IS NULL , 1, 0 ) , STR_TO_DATE( warranty_log.wa_date, '%d-%m-%Y' ) DESC";	
//}
//  
//  
//$sort_proj = $fwRequest->getParam('sort_proj', '');
//if(!empty($sort_proj)) {
//$ord =  " ORDER BY  warranty_log.wa_project ";	
//}
//    
  
  
$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where;

if($matsql){$userData = $fwDb->query($matsql);}

$total2 = sizeof($userData);
$fwViewData['active'] =  $total2;

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

		$setdata2[] = $list;
	endforeach;
	
	//$fwViewData['list'] = $listsnew;
  }
}


foreach($setdata2 as $k => $v2)
{

  	  $sq12= "SELECT bsn_id from business where bsn_name = '".$v2['hw_project_address']."'";  
	
	  $data = $fwDb->queryOne($sq12);
 	  $link = BASE_URL."business.detail/bsn_id/".$data['bsn_id'];
	 
	  $setdata2[$k]['link'] = $link;
	  
	  $sqldoc = "select doc_file_name from document_check_list
	             where doc_name_id =  121 and doc_bsn_id = ".$data['bsn_id'];
	  $doc121 = $fwDb->queryOne($sqldoc);
	  
	  $sql173 = "select doc_file_name from document_check_list
	             where doc_name_id =  173 and doc_bsn_id = ".$data['bsn_id'];
	  $doc173 = $fwDb->queryOne($sql173);
	  
	  $setdata2[$k]['document121'] = $doc121['doc_file_name'];
	  $setdata2[$k]['document173'] = $doc173['doc_file_name'];

}

$fwViewData['list'] = $setdata2;
$fwViewData['title'] = $MODULE_PLURAL;

// Print Pdf Starts Here

 $submit = $fwRequest->getParam('print', '');
if(!empty($submit))
{
	$heading = "Home Warranty Database";
	
	$html = '';	
	$html .= '<table border="1" width="100%" cellpadding="5">';
	$html .= '<tr style="text-align:center">';
	$html .= '<th>Project Address</th><th>Multiple Projects</th><th>Ref</th><th>Policy Number</th><th>Value</th>
	          <th>Open Date</th><th>Close Date</th>';
	$html .= "</tr>";
		  
	foreach($setdata2 as $k => $m)
	{
		$html .= "<tr>";
		$html .= '<td>'.$m['hw_project_address'].'</td>';
		$html .= '<td>'.$m['hw_multiple_proj'].'</td>';
		$html .= '<td>'.$m['hw_ref'].'</td>';
		$html .= '<td>'.$m['hw_policy_num'].'</td>';
		$html .= '<td>'.$m['hw_value'].'</td>';
		$html .= '<td>'.$m['hw_open_date'].'</td>';
		$html .= '<td>'.$m['hw_close_date'].'</td>';
		$html .= "</tr>";	
	}
	$html .= '</table>';	
	
	create_warranty_PDF($heading,$html);
	
}




// Export to Excel

$export = $fwRequest->getParam('export', 0);

if($export > 0)
{
	
	
	require BASE_DIR . "PHPExcel/SimpleXLSXGen/SimpleXLSXGen.php"; $my_excel_data = [];
    $title =  ['Project Address', 'Multiple Projects', 'Status', 'Reference', 'Policy Number',  'Value', 'Open Date', 'Close Datee'];
    array_push($my_excel_data,$title);
	
	
	foreach($setdata2 as $k=>$v)
	
    {
    	
		
		
    $values=	[
        $v['hw_project_address'],
        $v['hw_multiple_proj'],
        'Open',
        $v['hw_ref'],
        $v['hw_policy_num'],
        $v['hw_value'],
        $v['hw_open_date'],
        $v['hw_close_date']
       
  
        ];
        array_push($my_excel_data,$values);
    }
  $xlsx = Shuchkin\SimpleXLSXGen::fromArray( $my_excel_data )->downloadAs('home_wd_file.xlsx');;
   // echo "<pre>"; print_r($my_excel_data);
    exit();
	
	
require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";
$objPHPExcel = new PHPExcel();

// Set document properties
$objPHPExcel->getProperties()->setCreator("Deckquotes")
							 ->setLastModifiedBy("Nick C")
							 ->setTitle("Office 2007 XLSX Test Document")
							 ->setSubject("Office 2007 XLSX Test Document")
							 ->setDescription("Home Warranty Database exported to Office 2007 XLSX.")
							 ->setKeywords("office 2007 openxml php")
							 ->setCategory("Design Report file");


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
          	->setCellValue('B1', 'Multiple Projects')
		->setCellValue('C1', 'Status')
		->setCellValue('D1', 'Reference')
		->setCellValue('E1', 'Policy Number')
		->setCellValue('F1', 'Value')
		->setCellValue('G1', 'Open Date')
		->setCellValue('H1', 'Close Date')

		;

$from = "A1"; // or any value
$to = "AL1"; // or any value
$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold( true );


$row=2;
$sr=1;
foreach($setdata2 as $k=>$v)
{
	
	
		$days='';
		
		if($v['checklist54']) {
			$Statusdate2 = changedate_y_m_d($v['checklist54']);
			
			if(!empty($Statusdate2))
			{
				$curdate_y_m_d = date('Y-m-d');
				$days = daysDifference($curdate_y_m_d, $Statusdate2);
			}
		}
	
	$objPHPExcel->getActiveSheet()
			->setCellValue('A'.$row, $v['hw_project_address'])
			->setCellValue('B'.$row, $v['hw_multiple_proj'])
			->setCellValue('C'.$row, 'Open')
			->setCellValue('D'.$row, $v['hw_ref'])
			->setCellValue('E'.$row, $v['hw_policy_num'])
			->setCellValue('F'.$row, $v['hw_value'])
			->setCellValue('G'.$row, $v['hw_open_date'])
			->setCellValue('H'.$row, $v['hw_close_date'])

			;	
	$row= $row+1;			
	$sr=$sr+1;
}

// Rename worksheet
$objPHPExcel->getActiveSheet()->setTitle('Design Report');

// Set active sheet index to the first sheet, so Excel opens this as the first sheet
$objPHPExcel->setActiveSheetIndex(0);

header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="design_report.xls"');
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
