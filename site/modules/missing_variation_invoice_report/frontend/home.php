<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('missing_variation_invoice');

//$where = " WHERE  (er_response_status = 1 Or er_response_status = 3) AND er_hide = 0";
//
//$hidden = $fwRequest->getParam('hidden', '');
//	if(!empty($hidden)) {
//	$where = " WHERE 1 = 1";	
//}


//$ord =  " ORDER BY if( er_last_email_date = ' '
//         OR er_last_email_date IS NULL , 1, 0 ) , STR_TO_DATE( er_last_email_date, '%d-%m-%Y' ) DESC";

$where = " WHERE mv_hide = 0";
$show_hidden = $fwRequest->getParam('unhide_mvir', '');
if (!empty($show_hidden)) {
    $where  = " where (mv_hide = 1 or mv_hide = 0)";
    $_SESSION['unhide_mvir'] = '1';
    $fwViewData['unhide_mvir']=$_SESSION['unhide_mvir'];
}

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


$clear_search = $fwRequest->getParam('clear_search', '');
if($clear_search) {
	 $fwViewData['clear_search']='';
	 unset($_SESSION['keyword']);
	 unset($_SESSION['unhide_mvir']);
}


$search_project = $fwRequest->getParam('keyword', '');
 // $search_project = $fwRequest->getParam('project_name', '');

  if($search_project):
    
       $where .= " AND mv_project  LIKE '%".$search_project."%' OR
	    		  mv_invoice_num  LIKE '%".$search_project."%' ";
       $_SESSION['search_project'] = $search_project;
       $fwViewData['search_project']=$_SESSION['search_project'];

  elseif($_SESSION['search_project'] && $pagenum > 0):
		
       $where .= " AND mv_project LIKE  '%".$_SESSION['search_project']."%' OR
	   			   mv_invoice  LIKE '%".$search_project."%' ";
       $fwViewData['search_project']=$_SESSION['search_project'];
	
  endif;
  
$matsql = "SELECT * from missing_variation_invoice ".$where . " order by mv_id " ;	
//echo $matsql;
if($matsql){$userData = $fwDb->query($matsql);}

$fwViewData['total'] = sizeof($userData);

$sqlSend = "SELECT * from missing_variation_invoice where mv_status = 2 " ;	
$sendData = $fwDb->query($sqlSend);

$fwViewData['sendtotal'] = sizeof($sendData);


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

if(!empty($listsnew))
{
	foreach($listsnew as $k2 => $v2)
	{
		
		  $sqlbus = "select bsn_id from business where bsn_name like '%".$v2['mv_project']."%'";
		  $data_id = $fwDb->queryOne($sqlbus);
		  
		  $link = BASE_URL."business.detail/bsn_id/".$data_id['bsn_id'];		
			$Statusdate = changedate_y_m_d($v2['va_variation_date']);
				
				if(!empty($v2['va_variation_date']))
				{
					$curdate_y_m_d = date('Y-m-d');
					$dayscount = daysDifference($curdate_y_m_d , changedate_y_m_d($v2['va_variation_date']));
				}
	
		$sqlva = "select va_signed, va_variation_date from  bus_variations  where va_id = ".$v2['mv_variation_id'];
		$vaData = $fwDb->queryOne($sqlva);
		$listsnew[$k2]['va_signed'] = $vaData['va_signed'];
		$listsnew[$k2]['va_variation_date'] = $vaData['va_variation_date'];
		
						
				if(!empty($vaData['va_variation_date']))
				{
					$curdate_y_m_d = date('Y-m-d');
					$dayscount = daysDifference($curdate_y_m_d , changedate_y_m_d($vaData['va_variation_date']));
				}
		
		$sqlvpp = "select count(*) as 'vpp' from missing_variation_invoice where mv_project = '".$v2['mv_project']."'";
		$datavpp = $fwDb->queryone($sqlvpp);
		
		$listsnew[$k2]['dayscount'] = $dayscount;
		$listsnew[$k2]['link'] = $link;
		$listsnew[$k2]['vpp'] = $datavpp['vpp'] ;
	}
}



$fwViewData['list'] = $listsnew;
$fwViewData['title'] = $MODULE_PLURAL;

$sqlAct = "select * from missing_variations_action";
$fwViewData['actionData'] = $fwDb->query($sqlAct);

$sqlSt = "select * from missing_variations_status";
$fwViewData['statusData'] = $fwDb->query($sqlSt);

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
							 ->setCategory("Missing Variations Invoice");

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
       		->setCellValue('A1', 'SrNo')
           	->setCellValue('B1', "Project Name")
			->setCellValue('C1', "Variations Name")
			->setCellValue('D1', "Value Of Variations")
			->setCellValue('E1', "Invoice Number")
			->setCellValue('F1', "Invoice Upload Date")
			->setCellValue('G1', "Invoice Upload User")
			->setCellValue('H1', "Invoice Creation Date")
			->setCellValue('I1', "Invoice Sent Date")
			->setCellValue('J1', "Notes")
	
;

$from = "A1"; // or any value
$to = "AZ1"; // or any value
$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold( true );


$row=2;
$sr=1;
foreach($listsnew as $k=>$v)
{
		
	$objPHPExcel->getActiveSheet()
				->setCellValue('A'.$row, $v['mv_id'])
				->setCellValue('B'.$row, $v['mv_project'])
				->setCellValue('C'.$row, $v['mv_variation_name'])
				->setCellValue('D'.$row, $v['mv_variation_value'])
				->setCellValue('E'.$row, $v['mv_invoice_num'])
				->setCellValue('F'.$row, $v['mv_inv_upload_date'])
				->setCellValue('G'.$row, $v['mv_inv_upload_user'])
				->setCellValue('H'.$row, $v['mv_inv_create_date'])
				->setCellValue('I'.$row, $v['mv_inv_sent_date'])
				->setCellValue('J'.$row, $v['mv_notes'])
			   ;
					
	$row= $row+1;			
}

// Rename worksheet
$objPHPExcel->getActiveSheet()->setTitle('Missing Variations Invoice');

$objPHPExcel->setActiveSheetIndex(0);
header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="missing_variations_report.xls"');
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

