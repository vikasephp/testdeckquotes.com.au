<?php

header("Expires: Tue, 01 Jan 2000 00:00:00 GMT");
header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache");
$tabledi = new Fw_Db_Table('design_interface_2');
clearstatcache();


$table_toplink = new Fw_Db_Table('top_links');

$update_link = $fwRequest->getParam('update_link', '');
if(!empty($update_link)){
	$proc = $fwRequest->getParam('proc', '');
    $tlDetail['tl_link'] = $proc;
	$table_toplink->setWhere("tl_slug = 'design_interface_2'");
	
	$check_slug = $table_toplink->getRow();
	if ($check_slug) {
        $table_toplink->updateRow([
            'tl_link' => $proc
        ]);
    } else {
        $table_toplink->insertRow([
		'tl_slug' => "design_interface_2",
		'tl_link' => $proc,
		]);
    }
	//$table_toplink->updateRow($tlDetail);
}

$table_toplink->setWhere("tl_slug = 'design_interface_2'");
$fwViewData['proc_detail'] = $table_toplink->getRow();

$pagenum = $fwRequest->getparamget('pagenum',0);
$submit = $fwRequest->getParam('print', '');
$listdata = $fwRequest->getParam($TABLE, array());
$submitactive = $fwRequest->getParam('active_in', '');

$dateadded = $fwRequest->getParam('date_added', '');
if(!empty($dateadded)) {
	$dateadded = $fwRequest->getParam('date_added', '');
	 $keys_3 = array_keys($dateadded);
	 $ky_3 =   $keys_3[0];
	 $val_3 = $dateadded[$ky_3];
	
	  $detail2['di_date_added'] = $val_3;
	  $detail2['di_date_added_user'] = $_SESSION['user']['user_name'];
	  $detail2['di_date_added_date'] = date('d-m-Y');
	  $tabledi->setWhere("di_id = ".$ky_3);
	  
	  if($tabledi->rowExists())
	  {
		 $this_id = $tabledi->updateRow($detail2);
	  }	
	
}

$booklet = $fwRequest->getParam('booklet', '');
if(!empty($booklet)) {
	  $di_in_booklet = $fwRequest->getParam('booklet', '');
	  $keys_4 = array_keys($booklet);
	  $ky_4 =   $keys_4[0];
	  $val_4 = $booklet[$ky_4];
	
	  $detail4['di_in_booklet'] = $val_4;
	  $detail4['di_in_booklet_user'] = $_SESSION['user']['user_name'];
	  $detail4['di_in_booklet_date'] = date('d-m-Y');
	  $tabledi->setWhere("di_id = ".$ky_4);
	  
	  if($tabledi->rowExists())
	  {
		 $this_id = $tabledi->updateRow($detail4);
	  }		
}


$active = $fwRequest->getParam('active', '');
if(!empty($active)) {
	  $active = $fwRequest->getParam('active', '');
	  $keys_5 = array_keys($active);
	  $ky_5 =   $keys_5[0];
	  $val_5 = $active[$ky_5];
	
	  $detail5['di_active'] = $val_5;

	  $tabledi->setWhere("di_id = ".$ky_5);
	  
	  if($tabledi->rowExists())
	  {
		 $this_id = $tabledi->updateRow($detail5);
	  }		
}

$online = $fwRequest->getParam('online', '');
if($online)
{
	 $online = $fwRequest->getParam('online', '');
	 $keys_2 = array_keys($online);
	 $ky_2 = $keys_2[0];
	 $val_2 = $online[$ky_2];
	
	  $detail['di_online'] = $val_2;
	  $detail['di_online_user'] = $_SESSION['user']['user_name'];
	  $detail['di_online_date'] = date('d-m-Y');
	  $tabledi->setWhere("di_id = ".$ky_2);
	  if($tabledi->rowExists())
	  {
		 $this_id = $tabledi->updateRow($detail);
	  }	  	
}





$clear = $fwRequest->getParam('clear', '');
if(!empty($clear)) {
	unset($ser_dn);
	unset($_SESSION['ser_dn']);
	unset($_SESSION['ser_checklist']);
	unset($_SESSION['bsn_id']);
	unset($keyword);
	unset($_SESSION['keyword']);
}




$keyword = $listdata['keyword'];
$where = " where di_active = 'Yes'";

if(!empty($submitactive))
{
	$where = "WHERE 1=1 ";	
}


if($keyword):
	$where .= "AND ".$TABLE.".di_design_type  LIKE '%".$keyword."%'";
	$_SESSION['keyword'] = $keyword;
	//$fwViewData['keyword']=$_SESSION['keyword'];
elseif($_SESSION['keyword']):
	$where .= "AND ".$TABLE.".di_design_type LIKE '%".$_SESSION['keyword']."%'";
	//$fwViewData['keyword']=$_SESSION['keyword'];
endif;

$ser_dn = $fwRequest->getParam('ser_dn', '');

if($ser_dn):
	$where .= "AND ".$TABLE.".di_design_number  LIke '%".$ser_dn."'";
	$_SESSION['ser_dn'] = $ser_dn;
	$fwViewData['ser_dn']=$_SESSION['ser_dn'];
elseif($_SESSION['ser_dn']):
	$where .= "AND ".$TABLE.".di_design_number LIke '%".$_SESSION['ser_dn']."'";
	$fwViewData['ser_dn']=$_SESSION['ser_dn'];
endif;

$ser_checklist = $fwRequest->getParam('ser_checklist', '');

if($ser_checklist):
	$where .= "AND ".$TABLE.".di_checklist_number  = '".$ser_checklist."'";
	$_SESSION['ser_checklist'] = $ser_checklist;
	$fwViewData['ser_checklist']=$_SESSION['ser_checklist'];
elseif($_SESSION['ser_checklist']):
	$where .= "AND ".$TABLE.".di_checklist_number  = '".$_SESSION['ser_checklist']."'";
	$fwViewData['ser_checklist']=$_SESSION['ser_checklist'];
endif;

$ser_project = $fwRequest->getParam('ser_project', '');

if($ser_project):
   
    $sqlp = "select bsn_id from business where bsn_name like '%".$ser_project."%'";
	$bdata  = $fwDb->queryOne($sqlp);
	
	$bsn_id = $bdata['bsn_id'];
	
	$where .= "AND ".$TABLE.".di_project_link  like '%".$bsn_id."%'";
	$_SESSION['bsn_id'] = $bsn_id;
	$fwViewData['bsn_id']=$_SESSION['bsn_id'];
elseif($_SESSION['bsn_id']):
	$where .= "AND ".$TABLE.".di_project_link  like '%".$_SESSION['bsn_id']."%'";
	$fwViewData['bsn_id']=$_SESSION['bsn_id'];
endif;
	   

$matsql = "Select design_interface_2.*, design_interface_edropbox_2.didb_filepath from design_interface_2 
		   Left join design_interface_edropbox_2 on design_interface_2.di_id = design_interface_edropbox_2.didb_di_id
		   AND  design_interface_edropbox_2.didb_foldername like '%Team%'
		   ".$where. " ORDER BY  design_interface_2.di_design_number  ASC";

if($matsql){$userData = $fwDb->query($matsql);}


if(!empty($userData))
{
if (!(isset($pagenum))){ $pagenum = 1; } 
    $rows = count($userData);
    $page_rows = 400;
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


if(!empty($userData)) {
foreach($listsnew as $k => $v)
{
	$sql1 = "select design_interface_pricing_2.* from design_interface_pricing_2
	         where design_interface_pricing_2.di_id = " .$v['di_id']. " AND dip_component = 'Rounded Total Price Total'";
	$data1 = $fwDb->queryOne($sql1);

	$listsnew[$k]['total_price'] = $data1['dip_value_entered'];
	$listsnew[$k]['last_priced'] =  changedate_d_m_Y($data1['dip_date']);
	
	$sql2 = "select design_interface_pricing_2.* from design_interface_pricing_2
	         where design_interface_pricing_2.di_id = " .$v['di_id']. " AND dip_component = 'GP Value'";
	$data2 = $fwDb->queryOne($sql2);
	
	$listsnew[$k]['gp_value'] = $data2['dip_value_entered'];
	$listsnew[$k]['gp_date'] = changedate_d_m_Y($data2['dip_date']);
	
	$sql3 = "select design_interface_pricing_2.* from design_interface_pricing_2
	         where design_interface_pricing_2.di_id = " .$v['di_id']. " AND dip_component = 'Rounded Connector Value'";
	$data3 = $fwDb->queryOne($sql3);
	
	$listsnew[$k]['rounded_connector_value'] = $data3['dip_value_entered'];
	$listsnew[$k]['rouconvalue_date'] = changedate_d_m_Y($data3['dip_date']);
	
	
	$sql4 = "select design_interface_pricing_2.* from design_interface_pricing_2
	         where design_interface_pricing_2.di_id = " .$v['di_id']. " AND dip_component = 'Rounded Build Cost with GP'";
	$data4 = $fwDb->queryOne($sql4);
	
	$listsnew[$k]['build_price'] = $data4['dip_value_entered'];
	$listsnew[$k]['build_price_date'] =  changedate_d_m_Y($data4['dip_date']);
	
	$sql5 = "select design_interface_pricing_2.* from design_interface_pricing_2
	         where design_interface_pricing_2.di_id = " .$v['di_id']. " AND dip_component = 'Rounded Siteworks Price'";
	$data5 = $fwDb->queryOne($sql5);
	
	$listsnew[$k]['siteworks_price'] = $data5['dip_value_entered'];
	$listsnew[$k]['sitework_date'] = changedate_d_m_Y($data5['dip_date']);
	
	
	$sql6 = "select design_interface_pricing_2.* from design_interface_pricing_2
	         where design_interface_pricing_2.di_id = " .$v['di_id']. " AND dip_component = 'Rounded Planning Price'";
	$data6 = $fwDb->queryOne($sql6);
	
	$listsnew[$k]['planning_price'] = $data6['dip_value_entered'];
	$listsnew[$k]['planning_date'] = changedate_d_m_Y($data6['dip_date']);
	
}
}

$fwViewData['list'] = $listsnew;

$tablePages = new Fw_Db_Table("style_formula_types");
$tablePages->setWhere("sft_statues = 'Active'");
$tablePages->setOrderBy('sft_title ASC');
$fwViewData['formulatypes']=$tablePages->getRows();

$fwViewData['title'] = $MODULE_PLURAL;

// Export to Excel

$export = $fwRequest->getParam('export', 0);

if($export > 0)
	{

	$sqlexport = "Select design_interface_2.*, design_interface_edropbox_2.didb_filepath from design_interface_2 
		   Left join design_interface_edropbox_2 on design_interface_2.di_id = design_interface_edropbox_2.didb_di_id
		   AND  design_interface_edropbox_2.didb_foldername like '%Team%'
		   ".$where. " ORDER BY  design_interface_2.di_design_number  ASC";

    if($sqlexport){$exportData = $fwDb->query($sqlexport);}
	
	foreach($exportData as $k => $v)
    {
		$sql1 = "select design_interface_pricing_2.* from design_interface_pricing_2
				where design_interface_pricing_2.di_id = " .$v['di_id']. " AND dip_component = 'Rounded Total Price Total'";
		$data1 = $fwDb->queryOne($sql1);
	
		$exportData[$k]['total_price'] = $data1['dip_value_entered'];
		$exportData[$k]['last_priced'] =$data1['dip_date'];
		
		$sql2 = "select design_interface_pricing_2.* from design_interface_pricing_2
				where design_interface_pricing_2.di_id = " .$v['di_id']. " AND dip_component = 'GP Value'";
		$data2 = $fwDb->queryOne($sql2);
		
		$exportData[$k]['gp_value'] = $data2['dip_value_entered'];
	
	
	$sql4 = "select design_interface_pricing_2.* from design_interface_pricing_2
	         where design_interface_pricing_2.di_id = " .$v['di_id']. " AND dip_component = 'Rounded Build Cost with GP'";
	$data4 = $fwDb->queryOne($sql4);
	
	$exportData[$k]['build_price'] = $data4['dip_value_entered'];
	
	$sql5 = "select design_interface_pricing_2.* from design_interface_pricing_2
	         where design_interface_pricing_2.di_id = " .$v['di_id']. " AND dip_component = 'Rounded Siteworks Price'";
	$data5 = $fwDb->queryOne($sql5);
	
	$exportData[$k]['siteworks_price'] = $data5['dip_value_entered'];
	
	$sql6 = "select design_interface_pricing_2.* from design_interface_pricing_2
	         where design_interface_pricing_2.di_id = " .$v['di_id']. " AND dip_component = 'Rounded Planning Price'";
	$data6 = $fwDb->queryOne($sql6);
	
	$exportData[$k]['planning_price'] = $data6['dip_value_entered'];
	
	}
	
	
require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";
//require BASE_DIR . "PHPExcel/Classes/PHPExcel/Writer/Excel2007.php";


// Create new PHPExcel object
$objPHPExcel = new PHPExcel();

// Set document properties
$objPHPExcel->getProperties()->setCreator("Deckquotes")
							 ->setLastModifiedBy("Nick C")
							 ->setTitle("Office 2007 XLSX Test Document")
							 ->setSubject("Office 2007 XLSX Test Document")
							 ->setDescription("Design interface exported to Office 2007 XLSX.")
							 ->setKeywords("office 2007 openxml php")
							 ->setCategory("Design interface file");


//$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth(50);
$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth(30);
$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('G')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('H')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('I')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('J')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('L')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('M')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('N')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('O')->setAutoSize(true);

$objPHPExcel->getActiveSheet()->getColumnDimension('P')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('Q')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('R')->setAutoSize(true);

	

// Add some data
$objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A1', 'SrNo')
            ->setCellValue('B1', 'Design Number')
			->setCellValue('C1', 'Design Type')
            ->setCellValue('D1', 'Active')
            ->setCellValue('E1', 'Live WWW')
			->setCellValue('F1', 'Last Price')
			->setCellValue('G1', 'Total Price')
			->setCellValue('H1', 'Build Price')
			->setCellValue('I1', 'Sitework Price')
			->setCellValue('J1', 'Planning Price')
			->setCellValue('K1', 'Gp')
			->setCellValue('L1', 'Audited')
			->setCellValue('M1', 'Checklist Number')
			->setCellValue('N1', 'Master Calc')
			->setCellValue('O1', 'Proposal')
			->setCellValue('P1', 'Brochure')
			->setCellValue('Q1', 'Full Brochure')
			->setCellValue('R1', 'Operation Calculator')
	
			
			;

$from = "A1"; // or any value
$to = "T1"; // or any value
$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold( true );

// Miscellaneous glyphs, UTF-8
//$objPHPExcel->setActiveSheetIndex(0)
//            ->setCellValue('A4', 'Miscellaneous glyphs')
//            ->setCellValue('A5', 'éàèùâêîôûëïüÿäöüç');
$row=2;
$sr=1;
foreach($exportData as $k=>$v)
{
	$objPHPExcel->getActiveSheet()
				->setCellValue('A'.$row, $sr)
				->setCellValue('B'.$row, $v['di_design_number'])
				->setCellValue('C'.$row, $v['di_design_type'])
				->setCellValue('D'.$row, $v['di_active'])
				->setCellValue('E'.$row, $v['di_live_www'])
				->setCellValue('F'.$row, $v['last_priced'])
				->setCellValue('G'.$row, $v['total_price'])
				->setCellValue('H'.$row, $v['build_price'])
				->setCellValue('I'.$row, $v['siteworks_price'])
				->setCellValue('J'.$row, $v['planning_price'])
				->setCellValue('K'.$row, $v['gp_value'])
				->setCellValue('L'.$row, $v['di_audited'])
				->setCellValue('M'.$row, $v['di_checklist_number'])
				->setCellValue('N'.$row, 'http://www.deckquotes.com.au/files/design_interface_2/'. $v['di_master_project_calculator'])
				->setCellValue('O'.$row, 'http://www.deckquotes.com.au/files/design_interface_2/'. $v['di_proposal'])
				->setCellValue('P'.$row, 'http://www.deckquotes.com.au/files/design_interface_2/'. $v['di_brochure'])
				->setCellValue('Q'.$row, 'http://www.deckquotes.com.au/files/design_interface_2/'. $v['di_full_brochure'])
				->setCellValue('R'.$row, 'http://www.deckquotes.com.au/files/design_interface_2/'. $v['di_operations_calculator'])
			

				;	
	$row= $row+1;			
	$sr=$sr+1;
}

// Rename worksheet
$objPHPExcel->getActiveSheet()->setTitle('Design Interface Control Panel');

// Set active sheet index to the first sheet, so Excel opens this as the first sheet
$objPHPExcel->setActiveSheetIndex(0);

// Redirect output to a client’s web browser (Excel5)
header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="design_interface_control_panel.xls"');
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


$di_id = $fwRequest->getParam('print', 0);

if(!empty($di_id)) {
	
	$sqlp = "select * from design_interface_2 where di_id =".$di_id;
	$diData = $fwDb->queryOne($sqlp);	
	
	$sql1 = "select design_interface_pricing_2.* from design_interface_pricing_2
	         where design_interface_pricing_2.di_id = " .$di_id. " AND dip_component = 'Rounded Total Price Total'";
	$data1 = $fwDb->queryOne($sql1);
	
	$sql4 = "select design_interface_pricing_2.* from design_interface_pricing_2
	         where design_interface_pricing_2.di_id = " .$di_id. " AND dip_component = 'Rounded Build Cost with GP'";
	$data4 = $fwDb->queryOne($sql4);
	
	$sql5 = "select design_interface_pricing_2.* from design_interface_pricing_2
	         where design_interface_pricing_2.di_id = " .$di_id. " AND dip_component = 'Rounded Siteworks Price'";
	$data5 = $fwDb->queryOne($sql5);
	
	$sql6 = "select design_interface_pricing_2.* from design_interface_pricing_2
	         where design_interface_pricing_2.di_id = " .$di_id. " AND dip_component = 'Rounded Planning Price'";
	$data6 = $fwDb->queryOne($sql6);
	
	$sql3 = "select design_interface_pricing_2.* from design_interface_pricing_2
	         where design_interface_pricing_2.di_id = " .$di_id. " AND dip_component = 'Rounded Connector Value'";
	$data3 = $fwDb->queryOne($sql3);
	
	$sql2 = "select design_interface_pricing_2.* from design_interface_pricing_2
	         where design_interface_pricing_2.di_id = " .$di_id. " AND dip_component = 'GP Value'";
	$data2 = $fwDb->queryOne($sql2);
	
	$html = "<html><body>";
	$html .= '<h2>Design Interface Control Panel</h2>';
	$html .= '<table border="1" cellpadding="5" cellspacing="0" style="font-family:Calibri;">
		  <tr><th style="width:10%;"><strong>Design Number</strong></th>
		  <th style="width:10%;"><strong>Design Type</strong></th>
	          <th style="width:10%;"><strong>In Booklet</strong></th>
		  <th style="width:10%;"><strong>Date Added</strong></th>
		  <th style="width:10%;"><strong>Last Priced</strong></th>
		  <th style="width:10%;"><strong>Total Price</strong></th>
		  <th style="width:10%;"><strong>Build Price</strong></th>
		  <th style="width:10%;"><strong>Sitework Price</strong></th>
		  <th style="width:10%;"><strong>Planning Price</strong></th>
		  <th style="width:10%;"><strong>Connector Value</strong></th>
		  </tr>';
	
	
	$html .= "<tr>";	  
	$html .= "<td>".$diData['di_design_number']."</td>";
	$html .= "<td>".$diData['di_design_type']."</td>";
	$html .= "<td>".$diData['di_in_booklet']."</td>";
	$html .= "<td>".$diData['di_date_added']."</td>";
	$html .= "<td>".changedate_d_m_Y($data1['dip_date'])."</td>";
	$html .= "<td>".$data1['dip_value_entered']."</td>";
	$html .= "<td>".$data4['dip_value_entered']."</td>";
	$html .= "<td>".$data5['dip_value_entered']."</td>";
	$html .= "<td>".$data6['dip_value_entered']."</td>";
	$html .= "<td>".$data3['dip_value_entered']."</td>";
	
	$html .= "</tr></table><p></p><p></p><br>";	  
	$html .= '<table border="1" cellpadding="5" cellspacing="0" style="font-family:Calibri;"><tr><th style="width:10%;"><strong>GP Value</strong></th>';
	$html .='<th style="width:10%;"><strong>Audited</strong></th>';
	$html .='<th style="width:10%;"><strong>Checklist Number</strong></th>';
	$html .='<th style="width:10%;"><strong>Master Calculator</strong></th>';
	$html .='<th style="width:10%;"><strong>Proposal</strong></th>';
	$html .='<th style="width:10%;"><strong>Brochure</strong></th>';
	
	$html .='<th style="width:10%;"><strong>Full Brochure</strong></th>';
	$html .='<th style="width:10%;"><strong>Design Summary</strong></th>';
	
	$html .='<th style="width:10%;"><strong>Operation Calculator</strong></th>';
	$html .='<th style="width:10%;"><strong>Ms Team</strong></th>';
	
	$html .= "</tr><tr>";
	$html .= "<td>".$data2['dip_value_entered']."</td>";
	$html .= "<td>".$diData['di_audited']."</td>";
	$html .= "<td>".$diData['di_checklist_number']."</td>";
	
	if($diData['di_master_project_calculator']) {
		$mpc = $diData['di_master_project_calculator'];
		$html .= '<td><a href="https://deckquote.s3.amazonaws.com/files/design_interface_2/'.$mpc.'">Download</a></td>';
	} else {
		$html .= "<td></td>";	
	}
	
	if($diData['di_proposal']) {
		$pro = $diData['di_proposal'];
		$html .= '<td><a href="https://deckquote.s3.amazonaws.com/files/design_interface_2/'.$pro.'">Download</a></td>';
	} else {
		$html .= "<td></td>";	
	}
	
	if($diData['di_brochure']) {
		$broc = $diData['di_brochure'];
		$html .= '<td><a href="https://deckquote.s3.amazonaws.com/files/design_interface_2/'.$broc.'">Download</a></td>';
	} else {
		$html .= "<td></td>";	
	}
	
	if($diData['di_full_brochure']) {
		$fb = $diData['di_full_brochure'];
		$html .= '<td><a href="https://deckquote.s3.amazonaws.com/files/design_interface_2/'.$fb.'">Download</a></td>';
	} else {
		$html .= "<td></td>";	
	}
	
	if($diData['di_design_summary']) {
		$ds = $diData['di_operations_calculator'];
		$html .= '<td><a href="https://deckquote.s3.amazonaws.com/files/design_interface_2/'.$ds.'">Download</a></td>';
	} else {
		$html .= "<td></td>";	
	}
	
	if($diData['di_operations_calculator']) {
		$oc = $diData['di_operations_calculator'];
		$html .= '<td><a href="https://deckquote.s3.amazonaws.com/files/design_interface_2/'.$oc.'">Download</a></td>';
	} else {
		$html .= "<td></td>";	
	}
	
	if($diData['di_msteam_link']) {
		$team = $diData['di_msteam_link'];
		$html .= '<td><a href="https://deckquote.s3.amazonaws.com/files/design_interface_2/'.$team.'">Download</a></td>';
	} else {
		$html .= "<td></td>";	
	}
	
	$html .= "</tr>";
	
	$html .= "</table><p></p>";
	
	$tablefeature = new Fw_Db_Table('design_interface_features_2');
	$tablefeature->setWhere('dif_di_id ='.$di_id);
	$tablefeature->setOrderBy('dif_id'.' ASC');
	$di_features = $tablefeature->getRows();
	$html .= "<p></p><h2> Key Features </h2>";
	$html .= '<table border="1" cellpadding="5" cellspacing="0" style="font-family:Calibri;">';
	$html .= '<tr><th style="width:16%;"><strong>Key Feature</strong></th>';
	$html .= '<th style="width:10%;"><strong>Number</strong></th>';
	$html .= '<th style="width:14%;"><strong>Notes</strong></th>';
	$html .= '<th style="width:20%;"><strong>Icon</strong></th>';
	$html .= '<th style="width:40%;"><strong>Text</strong></th>';
	$html .= '</tr>';
	foreach($di_features as $kf=>$vf)
	{
		
	if($vf['dif_icon_file']) {		
			$icon = '<img src="https://www.deckquotes.com.au/files/asset_list/'.$vf['dif_icon_file'].'" width="70">';
		}else {
			$icon='';
		}
		
	$html .= '<tr nobr="true">';
	$html .= "<td>".$vf['dif_key_feature']."</td>";
	$html .= "<td>".$vf['dif_number']."</td>";
	$html .= "<td>".$vf['dif_notes']."</td>";
	$html .= "<td>".$icon."</td>";
	$html .= "<td>".$vf['dif_text']."</td>";

	$html .= '</tr>';	
		
	}
	
	$html .= '</table>';
	$html .= '<br pagebreak="true" />';
	$html .= "<h2>Design Images</h2>";
	
	
	
	$heading = "Design Interface";
	
	$tableDesignInterDesignes = new Fw_Db_Table('design_interface_designs_2');
	$tableDesignInterDesignes->setWhere("dd_di_id = ".$di_id);
	
	if($tableDesignInterDesignes->rowExists()) {
		$designDetail  = $tableDesignInterDesignes->getRows();
	
	$html .= '<table border="1" cellpadding="5" cellspacing="0" style="font-family:Calibri;"><tr>';
	$m=1;
	foreach($designDetail as $kd => $vd)
	{
	  if($vd['di_design_image']) {
		  $extension = pathinfo($vd['di_design_image'], PATHINFO_EXTENSION);
		  if($extension !== 'pdf') {
	    $img2 =  '<img src="https://deckquote.s3.amazonaws.com/files/design_interface_2/'.$vd['di_design_image'].'" width="225" height="225">';
	    $html .= '<td>'.$img2.'</td>';
	    $m++;
	    if($m == 4) {
		$html .= '</tr><tr>';
		$m=1;	   
	   }
	   
		  }
	  }
	}
	
	}
	
	$html .= "</html></body>";
	$fname="";
	//create_di_report($heading, $html, $fname);
	
	  header("Content-type: application/vnd.ms-word.doc");
	  header("Content-Disposition: attachment;Filename=design_interface_2.doc");    
	  echo "<html>";
	  echo "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=Windows-1252\">";
	  echo "<body>";
	  echo "<div style='font-family:calibri;'>";
	  echo $html;
	  echo "</div>";
	  echo "</body>";
	  echo "</html>";
	  exit;	
	
		
}

$merge_report = $fwRequest->getParam('merge_report', 0);

if(!empty($merge_report)) {
	
$sqlmr = "Select design_interface_2.di_design_number, design_interface_2.di_qr_code , design_interface_2.di_id
          from design_interface_2  where di_active = 'Yes' order by design_interface_2.di_design_number "; 
$mrData = $fwDb->query($sqlmr);

$html = '<html><body style="font-size:36px;">';
$a = 1;
foreach($mrData as $k=>$v)
{
	if(!empty($v["di_qr_code"])) {
			$img1 = '<img src="https://deckquote.s3.amazonaws.com/files/design_interface/'.$v["di_qr_code"].'" height="200" width="200">';
		} else {
		        $img1 = '';	
		}
	
	$tablelegend = new Fw_Db_Table('design_interface_bfpl_2');
	$tablelegend->setWhere('dib_di_id ='.$v['di_id']);
	$di_legend = $tablelegend->getRows();
	$rows = sizeof($di_legend);
	
	$html .= '<table cellpadding="5" border="1" width="100%" cellspacing="0" style="font-family:calibri;">';
	$html .= '<tr><th>Design Number</th><th>QR Code</th><th>Legend</th><th>Value</th></tr>';
	$html .= '<tr nobr="true">';
	$html .= '<td style="text-align:center;" rowspan="'.$rows.'">'.$v['di_design_number'].'</td>';
	$html .= '<td rowspan="'.$rows.'">'.$img1.'</td>';
	$i=0;
	
	foreach($di_legend as $k2=>$v2)
	{
		if($i>0) {$html .= '<tr nobr="true">'; }
		
		$html .='<td>'.$v2['dib_legend'].'</td>';
		$html .='<td>'.$v2['dib_value'].'</td>';
		$html .= '</tr>';
		
		$i++;
	}

	$html .= '</table>';

	if($a>=3) {
		$html .= '<br pagebreak="true"/>';
		$a=0;
	} else {
		$html .= '<br>';
	}
	$a++;
	
}

$html .= '</body></html>';
	//create_merge_report('Design Interface Merge Report', $html, $fname='');

      header("Content-type: application/vnd.ms-word.doc");
	  header("Content-Disposition: attachment;Filename=design_merge_2.doc");    
	  echo "<html>";
	  echo "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=Windows-1252\">";
	  echo "<body>";
	  echo "<div style='font-family:calibri;'>";
	  echo $html;
	  echo "</div>";
	  echo "</body>";
	  echo "</html>";
	  exit;		  
		
}


