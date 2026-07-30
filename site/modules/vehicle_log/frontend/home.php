<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table($TABLE);
$listdata = $fwRequest->getParam($TABLE, array());

$where = "WHERE 1=1 ";
 
$upload = $fwRequest->getParam('upload', '');
if(!empty($upload))
{
 		if($_FILES['proof']['name'])
		{
			
			$ve_id = $fwRequest->getParam('ve_id', '');
			$docfile_1 = $_FILES['proof']['name'];
			$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
			$temp_name_1 = $_FILES['proof']['tmp_name'];
			$detail['ve_pur_proof'] = $docfile_1;
			upload($docfile_1, $temp_name_1);
			$table->setWhere("ve_id = $ve_id");
	     		$opr = $table->updateRow($detail); 
			
		}
 
}
   
   
   $searchkey = $fwRequest->getParam('searchkey', '');

  if($searchkey):

       $where .= " AND vehicle_log.ve_make_model  LIKE '%".$searchkey."%' OR 
                       vehicle_log.ve_reg_number    LIKE '%".$searchkey."%' ";
	
	$_SESSION['searchkey'] = $searchkey;
	$fwViewData['searchkey']=$_SESSION['searchkey'];

       elseif($_SESSION['searchkey'] && $pagenum > 0):
		
       $where .= " AND vehicle_log.ve_make_model LIKE  '%".$_SESSION['searchkey']."%' OR
                       vehicle_log.ve_reg_number   LIKE  '%".$_SESSION['searchkey']."%' ";
			
         $fwViewData['searchkey']=$_SESSION['searchkey'];

       elseif(isset($_SESSION['searchkey'])) :
    		
	$where .= " AND vehicle_log.ve_make_model LIKE  '%".$_SESSION['searchkey']."%' OR
                        vehicle_log.ve_reg_number   LIKE  '%".$_SESSION['searchkey']."%' ";	
  endif;
 
 
 
 $daycnt = $fwRequest->getParam('daycnt', '');
 $fwViewData['daycnt'] = $daycnt;
  
      $clear = $fwRequest->getParam('clear', '');
       if(!empty($clear)) {
	$where = "WHERE 1=1 ";  
	unset($fwViewData['daycnt']);
	unset($_SESSION['searchkey']);
	unset($daycnt);	
  }

  
$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where;	



if($matsql){$userData = $fwDb->query($matsql);}

if(!empty($userData))
{
if (!(isset($pagenum))){ $pagenum = 1; } 
    $rows = count($userData);
    $page_rows = 50;
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
	
	$setdata = $listsnew;
  }
  
  	foreach($setdata as $k => $v)
	{
		
		if(!empty($v['ve_reg_exp_date'])){
			$ccdate = $v['ve_reg_exp_date'];
			$Statusdate = changedate_y_m_d($ccdate);
			$curdate_y_m_d = date('Y-m-d');
			$dayscount = daysDifference($Statusdate, $curdate_y_m_d);
		} else { 
			$dayscount='';
		}
		
		
		if($daycnt) {
			
			if($daycnt >= $dayscount ) {
		
			$setdata2[$k]['ve_id'] = $v['ve_id'];
			$setdata2[$k]['ve_make_model'] = $v['ve_make_model'];	
			$setdata2[$k]['ve_photo'] = $v['ve_photo'];
			$setdata2[$k]['ve_photo2'] = $v['ve_photo2'];
			$setdata2[$k]['ve_photo3'] = $v['ve_photo3'];
			
			$setdata2[$k]['ve_reg_number'] = $v['ve_reg_number'];
			$setdata2[$k]['ve_reg_exp_date'] = $v['ve_reg_exp_date'];
			$setdata2[$k]['dayscount'] = $dayscount;
			$setdata2[$k]['ve_3rd_party_insurer'] = $v['ve_3rd_party_insurer'];
			$setdata2[$k]['ve_ctp_insurance'] = $v['ve_ctp_insurance'];
			$setdata2[$k]['ve_insu_policy_number'] = $v['ve_insu_policy_number'];
			$setdata2[$k]['ve_ctp_insu_expire_date'] = $v['ve_ctp_insu_expire_date'];
			$setdata2[$k]['ve_maint_comp'] = $v['ve_maint_comp'];

			$setdata2[$k]['ve_copy_reg_doc'] = $v['ve_copy_reg_doc'];	
			$setdata2[$k]['ve_person_responsible'] = $v['ve_person_responsible'];
			$setdata2[$k]['ve_pur_proof'] = $v['ve_pur_proof'];
			$setdata2[$k]['ve_last_maint_date'] = $v['ve_last_maint_date'];
			$setdata2[$k]['ve_copy_insu_doc'] = $v['ve_copy_insu_doc'];
			}
		}
		else {
			
			$setdata2[$k]['ve_id'] = $v['ve_id'];
			$setdata2[$k]['ve_make_model'] = $v['ve_make_model'];	
			$setdata2[$k]['ve_photo'] = $v['ve_photo'];
			$setdata2[$k]['ve_photo2'] = $v['ve_photo2'];
			$setdata2[$k]['ve_photo3'] = $v['ve_photo3'];
			
			$setdata2[$k]['ve_reg_number'] = $v['ve_reg_number'];
			$setdata2[$k]['ve_reg_exp_date'] = $v['ve_reg_exp_date'];
			$setdata2[$k]['dayscount'] = $dayscount;
			$setdata2[$k]['ve_3rd_party_insurer'] = $v['ve_3rd_party_insurer'];
			$setdata2[$k]['ve_ctp_insurance'] = $v['ve_ctp_insurance'];
			$setdata2[$k]['ve_insu_policy_number'] = $v['ve_insu_policy_number'];
			$setdata2[$k]['ve_ctp_insu_expire_date'] = $v['ve_ctp_insu_expire_date'];
			$setdata2[$k]['ve_maint_comp'] = $v['ve_maint_comp'];
			
			$setdata2[$k]['ve_copy_reg_doc'] = $v['ve_copy_reg_doc'];
			$setdata2[$k]['ve_copy_insu_doc'] = $v['ve_copy_insu_doc'];
			$setdata2[$k]['ve_pur_proof'] = $v['ve_pur_proof'];
			$setdata2[$k]['ve_last_maint_date'] = $v['ve_last_maint_date'];
		}
		
	}
  $fwViewData['list'] =  $setdata2;
  
}

$fwViewData['title'] = $MODULE_PLURAL;


//Excel Generation
$export = $fwRequest->getParam('export', 0);
if ($export > 0) {

	require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";
	$objPHPExcel = new PHPExcel();

	$objPHPExcel->getProperties()->setCreator("Deckquotes")
		->setLastModifiedBy("Nick C")
		->setTitle("Vehicle Log")
		->setSubject("Vehicle Log")
		->setDescription("Vehicle Log exported to Office 2007 XLSX.")
		->setKeywords("vehicle log openxml php")
		->setCategory("Vehicle Log file");

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

	$objPHPExcel->setActiveSheetIndex(0)
		->setCellValue('A1', 'Sr No')
		->setCellValue('B1', 'Vehicle Make & Model')
		->setCellValue('C1', 'Registration Number')
		->setCellValue('D1', 'Registration Expire Date')
		->setCellValue('E1', 'Date Count')
		->setCellValue('F1', '3rd Party Insurer')
		->setCellValue('G1', 'CTP Insurance')
		->setCellValue('H1', 'Insurance Policy Number')
		->setCellValue('I1', 'CTP Insurance Expire Date')
		->setCellValue('J1', 'Maintenance Company')
		->setCellValue('K1', 'Last Maintenance Date')
	;

	$from = "A1"; // or any value
	$to = "K1"; // or any value
	$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold(true);

	$row = 2;
	$sr = 1;
	
	if ($matsql) {
		$excelData = $fwDb->query($matsql);
	}
	//echo "<pre>"; print_r($excelData); exit("Checking");
	foreach ($excelData as $k => $v) {
		
		if(!empty($v['ve_reg_exp_date'])){
			$ccdate = $v['ve_reg_exp_date'];
			$Statusdate = changedate_y_m_d($ccdate);
			$curdate_y_m_d = date('Y-m-d');
			$dayscount = daysDifference($Statusdate, $curdate_y_m_d);
		} else { 
			$dayscount='';
		}
	
		$objPHPExcel->getActiveSheet()
			->setCellValue('A' . $row, $sr)
			->setCellValue('B' . $row, $v['ve_make_model'])
			->setCellValue('C' . $row, $v['ve_reg_number'])
			->setCellValue('D' . $row, changedate_d_m_y($v['ve_reg_exp_date']))
			->setCellValue('E' . $row, $dayscount)
			->setCellValue('F' . $row, $v['ve_3rd_party_insurer'])
			->setCellValue('G' . $row, $v['ve_ctp_insurance'])
			->setCellValue('H' . $row, $v['ve_insu_policy_number'])
			->setCellValue('I' . $row, changedate_d_m_y($v['ve_ctp_insu_expire_date']))
			->setCellValue('J' . $row, $v['ve_maint_comp'])
			->setCellValue('K' . $row, changedate_d_m_y($v['ve_last_maint_date']))
		;
		
		$cellReg = 'D' . $row;
		$bgColorReg = '';
		$fontColorReg = '000000';

		if (!empty($v['ve_reg_exp_date'])) {
			$expDate = changedate_d_m_y($v['ve_reg_exp_date']);
			if ($expDate) {
				$exp = changedate_Y_m_d($expDate);
				$today = date('Y-m-d');
				$plus10 = date('Y-m-d', strtotime('+10 days'));
				$plus30 = date('Y-m-d', strtotime('+30 days'));

				if ($exp < $today) {
					$bgColorReg = 'FFFF00';
				} elseif ($exp <= $plus10) {
					$bgColorReg = 'FF0000';
					$fontColorReg = 'FFFFFF';
				} elseif ($exp <= $plus30) {
					$bgColorReg = '800080';
					$fontColorReg = 'FFFFFF';
				}
			}
		}

		if ($bgColorReg) {
			$objPHPExcel->getActiveSheet()->getStyle($cellReg)->applyFromArray([
				'fill' => ['type' => PHPExcel_Style_Fill::FILL_SOLID, 'color' => ['rgb' => $bgColorReg]],
				'font' => ['color' => ['rgb' => $fontColorReg]]
			]);
		}

		$cellCTP = 'I' . $row;
		$bgColorCTP = '';
		$fontColorCTP = '000000';

		if (!empty($v['ve_ctp_insu_expire_date'])) {
			$expDateCTP = changedate_d_m_y($v['ve_ctp_insu_expire_date']);
			if ($expDateCTP) {
				$exp = changedate_Y_m_d($expDateCTP);
				$today = date('Y-m-d');
				$plus10 = date('Y-m-d', strtotime('+10 days'));
				$plus30 = date('Y-m-d', strtotime('+30 days'));

				if ($exp < $today) {
					$bgColorCTP = 'FFFF00';
				} elseif ($exp <= $plus10) {
					$bgColorCTP = 'FF0000';
					$fontColorCTP = 'FFFFFF';
				} elseif ($exp <= $plus30) {
					$bgColorCTP = '800080';
					$fontColorCTP = 'FFFFFF';
				}
			}
		}

		if ($bgColorCTP) {
			$objPHPExcel->getActiveSheet()->getStyle($cellCTP)->applyFromArray([
				'fill' => ['type' => PHPExcel_Style_Fill::FILL_SOLID, 'color' => ['rgb' => $bgColorCTP]],
				'font' => ['color' => ['rgb' => $fontColorCTP]]
			]);
		}

		$row = $row + 1;
		$sr = $sr + 1;
	}

	$objPHPExcel->getActiveSheet()->setTitle('Vehicle Log');
	$objPHPExcel->setActiveSheetIndex(0);

	// Redirect output to a client’s web browser (Excel5)
	header('Content-Type: application/vnd.ms-excel');
	header('Content-Disposition: attachment;filename="vehicle_log.xls"');
	header('Cache-Control: max-age=0');
	// If you're serving to IE 9, then the following may be needed
	header('Cache-Control: max-age=1');

	// If you're serving to IE over SSL, then the following may be needed
	header('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
	header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT'); // always modified
	header('Cache-Control: cache, must-revalidate'); // HTTP/1.1
	header('Pragma: public'); // HTTP/1.0

	$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
	$objWriter->save('php://output');
	exit;
}