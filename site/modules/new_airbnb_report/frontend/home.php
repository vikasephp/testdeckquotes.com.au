<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$listdata = $fwRequest->getParam($TABLE, array());

$table = new Fw_Db_Table('airbnb_report');

$hide = $fwRequest->getParam('hide', '');


if($hide)
{
	 $keys_2 = array_keys($hide);
	 $ky_2 = $keys_2[0];
	 $val_2 = $hide[$ky_2];
	
	  $detail['ab_hide'] = $val_2;
	  $table->setWhere("ab_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }
	
}


$keyword = $listdata['keyword'];
$where = " WHERE ab_hide = 0 ";

$showall = $fwRequest->getParam('showall', '');
if(!empty($showall)) {
	$where = " WHERE 1 = 1";	
} else {
	$where = " WHERE ab_hide = 0 ";
}


	
//if($keyword):
//$where .= "AND ".$TABLE.".pl_address LIKE '%".$keyword."%' OR ".$TABLE.".pl_subrub LIKE '%".$keyword."%' OR 
//               ".$TABLE.".pl_owner_name LIKE '%".$keyword."%' OR ".$TABLE.".pl_email_address LIKE '%".$keyword."%'  ";
//	
//	$_SESSION['keyword'] = $keyword;
//	$fwViewData['keyword']=$_SESSION['keyword'];
//
//elseif($_SESSION['keyword'] && $pagenum > 0):
//
//$where .= "AND ".$TABLE.".pl_address LIKE '%".$_SESSION['keyword']."%' OR ".$TABLE.".pl_subrub LIKE '%".$_SESSION['keyword']."%' OR 
//               ".$TABLE.".pl_owner_name LIKE '%".$_SESSION['keyword']."%' OR ".$TABLE.".pl_email_address LIKE '%".$_SESSION['keyword']."%'  ";	
//	
//	$fwViewData['keyword']=$_SESSION['keyword'];
//endif;
   
$matsql = "SELECT * from airbnb_report ".$where;	

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

$fwViewData['title'] = $MODULE_PLURAL;

$export = $fwRequest->getParam('export', 0);

if($export > 0)
	{

	$contactsql = "SELECT * FROM contact_list";	

    if($contactsql){$contactData = $fwDb->query($contactsql);}
	
	
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
							 ->setCategory("Contact list file");


$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth(50);

$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('G')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('H')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('I')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('J')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('L')->setAutoSize(true);
	

// Add some data
$objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A1', 'SrNo')
            ->setCellValue('B1', 'What')
            ->setCellValue('C1', 'Company Name')
            ->setCellValue('D1', 'Contact Name')
			->setCellValue('E1', 'Position')
			->setCellValue('F1', 'Address')
			->setCellValue('G1', 'Phone')
			->setCellValue('H1', 'Mobile')
			->setCellValue('I1', 'Email')
			->setCellValue('J1', 'Website')
			->setCellValue('K1', 'Notes')
			->setCellValue('L1', 'Calendar Reference')
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
foreach($contactData as $k=>$v)
{
	$objPHPExcel->getActiveSheet()
				->setCellValue('A'.$row, $sr)
				->setCellValue('B'.$row, $v['cl_what'])
				->setCellValue('C'.$row, $v['cl_company_name'])
				->setCellValue('D'.$row, $v['cl_contact_name'])
				->setCellValue('E'.$row, $v['cl_position'])
				->setCellValue('F'.$row, $v['cl_address'])
				->setCellValue('G'.$row, $v['cl_phone'])
				->setCellValue('H'.$row, $v['cl_mobile'])
				->setCellValue('I'.$row, $v['cl_email'])
				->setCellValue('J'.$row, $v['cl_website'])
				->setCellValue('K'.$row, strip_tags($v['cl_notes']))
				->setCellValue('L'.$row, $v['cl_calendar_ref'])
				;	
	$row= $row+1;			
	$sr=$sr+1;
}

// Rename worksheet
$objPHPExcel->getActiveSheet()->setTitle('Contact List');


// Set active sheet index to the first sheet, so Excel opens this as the first sheet
$objPHPExcel->setActiveSheetIndex(0);


// Redirect output to a client’s web browser (Excel2007)
//header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');

// Redirect output to a client’s web browser (Excel5)
header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="contact_list.xls"');
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


