<?php
$pagenum = $fwRequest->getparam('pagenum','');
$search = $fwRequest->getParam('search', '');
$table = new Fw_Db_Table('business');
$busseller = new Fw_Db_Table('business_sellers');
$table_bc = new Fw_Db_Table('bus_customers');
$searchaddr = $fwRequest->getParam('searchaddr', '');


$varified = $fwRequest->getParam('varified', '');
if($varified)
{
	 
	 $dt = date('d-m-Y');
	 $keys_1 = array_keys($varified);
	 $ky_1 = $keys_1[0];
	 $val_1 = $varified[$ky_1];
	
	  $detail['bcust_lg_varified'] = $val_1;
	  $detail['bcust_lg_varified_date'] = $dt;
	  $table_bc->setWhere("bcust_id = ".$ky_1);
	  if($table_bc->rowExists())
	  {
		 $this_id = $table_bc->updateRow($detail);
	  }
}


$phone_survey = $fwRequest->getParam('phone_survey', '');
if($phone_survey)
{
	 
	 $dt = date('d-m-Y');
	 $keys_2 = array_keys($phone_survey);
	 $ky_2 = $keys_2[0];
	 $val_2 = $phone_survey[$ky_2];
	
	  $detailPs['bs_lgr_phone_ser'] = $val_2;
	  $detailPs['bs_lgr_phone_date'] = $dt;
	  $detailPs['bs_lgr_phone_user'] = $_SESSION['user']['user_name'];
	  
	  
	  
	  $busseller->setWhere("bs_business_id = ".$ky_2);
	  if($busseller->rowExists())
	  {
		 $this_id = $busseller->updateRow($detailPs);
		 
	  }
	  
}


if(!empty($search)) {
	$keyword = $fwRequest->getParam('keyword', '');
	//$_SESSION['keyword'] = $keyword;
}

if(!empty($searchaddr)) {
	$searchkey = $fwRequest->getParam('searchkey', '');
}


$clear = $fwRequest->getParam('clear', '');

if($clear)
{
	unset($_SESSION['keyword']);
	unset($_SESSION['searchkey']);
	unset($_SESSION['st_date']);
	unset($_SESSION['proj_enquiry']);
}


$where = "WHERE 1 = 1";

	
if($keyword):

$where .= "AND business.bsn_sub_status LIKE '%".$keyword."%'";
	
	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword'] && $pagenum > 0):

	$where .= "AND business.bsn_sub_status LIKE '%".$_SESSION['keyword']."%'";
	
	$fwViewData['keyword']=$_SESSION['keyword'];
endif;
   
if($searchkey):
$where .= " AND business.bsn_address LIKE '%".$searchkey."%'";
	
	$_SESSION['searchkey'] = $searchkey;
	$fwViewData['searchkey']=$_SESSION['searchkey'];

elseif($_SESSION['searchkey'] && $pagenum > 0):

	$where .= " AND business.bsn_address LIKE '%".$_SESSION['searchkey']."%'";
	
	$fwViewData['searchkey']=$_SESSION['searchkey'];
endif;
   
   
$st_date = $fwRequest->getParam('st_date', '');

if(!empty($st_date)) :
	$where .= " AND STR_TO_DATE(business.bsn_status_sys_date , '%Y-%m-%d' ) > CURDATE( ) - INTERVAL " .$st_date. " DAY ";
	$_SESSION['st_date'] = $st_date;
	
elseif($_SESSION['st_date']):
	
	$where .= " AND STR_TO_DATE(business.bsn_status_sys_date , '%Y-%m-%d' ) > CURDATE( ) - INTERVAL " .$_SESSION['st_date']. " DAY ";	
endif;


$proj_enquiry = $fwRequest->getParam('proj_enquiry', '');

if(!empty($proj_enquiry)) :
	$where .= " AND business.bsn_cd_enquiry_source = ".$proj_enquiry;
	$_SESSION['proj_enquiry'] = $proj_enquiry;
	
elseif($_SESSION['proj_enquiry']):
	
	$where .= " AND business.bsn_cd_enquiry_source = ".$_SESSION['proj_enquiry'];	
endif;
   
if(empty($pagenum))
	{
	unset($_SESSION['last_tdsql']);
	}

$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_id, bus_customers.bcust_fname, 
	    bus_customers.bcust_lname, bus_customers.bcust_lg_varified, bus_customers.bcust_lg_varified_date, bus_customers.bcust_misc_email1,
        bus_customers.bcust_misc_email2,bus_customers.bcust_misc_moble,bus_customers.bcust_misc_business, bus_customers.bcust_misc_home,
	    business.bsn_advert_text,  business.bsn_id, business.bsn_name, business.bsn_type, business.bsn_sub_status,
	    business.bsn_status_sys_date, business.bsn_address , business.bsn_cd_enquiry_source, business_sellers.bs_lgr_enq_method,
	    business_sellers.bs_lgr_pl_ass, business_sellers.bs_lgr_phone_ser, business_sellers.bs_lgr_phone_user, business_sellers.bs_lgr_phone_date,
		business_sellers.bs_lgr_post_planning, business_sellers.bs_lgr_budget
	    from business_sellers 		
	    Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	    Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where. " Order By business.bsn_status_sys_date DESC";

if($sql){$userData = $fwDb->query($sql);}

$total = sizeof($userData);

if($pagenum >= 2) {
	$total = $total - ($pagenum - 1 ) * 300;
}

$fwViewData['total'] = $total;

$total2 = sizeof($userData);
 

if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

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
	
    $max = 'limit ' .($pagenum - 1) * $page_rows .',' .$page_rows;
    
    $sql2 =  $sql." ".$max;

if($sql2)
{  

 $setdata2 = $fwDb->query($sql2);
 
foreach($setdata2 as $k => $v)
{
		
		$link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$v['bsn_id'];	
		
		$ccdate = $v['bsn_status_sys_date'];
		$Statusdate = changedate_y_m_d($ccdate);
		$curdate_y_m_d = date('Y-m-d');
		$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
					
		$sqles = "Select soe_name  from enquirysource where soe_id = ".$v[''];
		$dataes = $fwDb->queryOne($sqles);
		
		
		//$setdata2[$k]['bs_business_id'] = $v['bs_business_id'];
		$setdata2[$k]['bsn_status_sys_date'] = changedate_d_m_y($v['bsn_status_sys_date']);

		$setdata2[$k]['hia_sign_date'] = changedate_d_m_y($ccdate);
		$setdata2[$k]['link'] = $link;
		$setdata2[$k]['bsn_sub_status'] = $v['bsn_sub_status'];
		$setdata2[$k]['dayscount'] = $dayscount;
		$setdata2[$k]['soe_name'] = $dataes['soe_name'];
		
		
		$sql2 = "Select document_check_list.doc_file_name from document_check_list
				where document_check_list.doc_bsn_id = ". $v['bs_business_id'] . " And document_check_list.doc_name_id = 2";
		$data2 = $fwDb->queryOne($sql2);
		$setdata2[$k]['checklist2'] = $data2['doc_file_name'];			
		
}
 
 	$fwViewData['list'] =  $setdata2;
	
 }
}

/******* Begin enquirysourceel ******/
$tableEnquirysource = new Fw_Db_Table('enquirysource');
$allenquirysource = $tableEnquirysource -> getRows();
$fwViewData['allenquirysource'] = $allenquirysource;
/******* End enquirysource ******/


$export = $fwRequest->getParam('export', 0);

if($export > 0)
	{
					
require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";
//require BASE_DIR . "PHPExcel/Classes/PHPExcel/Writer/Excel2007.php";

// Create new PHPExcel object
$objPHPExcel = new PHPExcel();

// Set document properties
$objPHPExcel->getProperties()->setCreator("Deckquotes")
							 ->setLastModifiedBy("Nick C")
							 ->setTitle("Office 2007 XLSX Test Document")
							 ->setSubject("Office 2007 XLSX Test Document")
							 ->setDescription("Poincc 2 exported to Office 2007 XLSX.")
							 ->setKeywords("office 2007 openxml php")
							 ->setCategory("Lead Generation Report");


//$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth(50);
$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setWidth(25);

$objPHPExcel->getActiveSheet()->getStyle('F1')->getAlignment()->setWrapText(true);
	
// Add some data
$objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A1', 'SrNo')
            ->setCellValue('B1', 'Created Date')
			->setCellValue('C1', 'Address')
            ->setCellValue('D1', 'Status')
            ->setCellValue('E1', 'Project Enquiry')
			->setCellValue('F1', 'Planning Assessment Report Meeting Completed')
			
			;

$from = "A1"; // or any value
$to = "T1"; // or any value
$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold( true );

$row=2;
$sr=1;
foreach($setdata2 as $k=>$v)
{
	$sql_1 = "select soe_name from enquirysource where soe_id = ".$v['bsn_cd_enquiry_source'];
	$data_1 = $fwDb->queryOne($sql_1);
	
	if($v['bs_lgr_pl_ass'] == 1) { $yn = 'Yes' ; } else { $yn = 'No' ; }
			
	$sqlis = "select is_option from poincc2_invoice_stage where is_id = ".$v['po_invoice_stage'];
	$isdata = $fwDb->queryOne($sqlis);
	
	$is =$isdata['is_option'];
	
	$objPHPExcel->getActiveSheet()
				->setCellValue('A'.$row, $row-1)
				->setCellValue('B'.$row, $v['bsn_status_sys_date'])
				->setCellValue('C'.$row, $v['bsn_address'])
				->setCellValue('D'.$row, $v['status'])
				->setCellValue('E'.$row, $data_1['soe_name'])
				->setCellValue('F'.$row, $yn)

				;	
				
	$row= $row+1;			
	$sr=$sr+1;
}

$objPHPExcel->setActiveSheetIndex(0);

// Redirect output to a client’s web browser (Excel5)
header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="poincc2.xls"');
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


$export2 = $fwRequest->getParam('export2', 0);

if($export2 > 0)
	{

require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";
//require BASE_DIR . "PHPExcel/Classes/PHPExcel/Writer/Excel2007.php";

// Create new PHPExcel object
$objPHPExcel = new PHPExcel();

        // if you are using plain php use instead,
        //$excel = new PHPExcel();
 
       // $excel = $this->get('phpexcel')->createPHPExcelObject();
		$excel = new PHPExcel();
        $excel->createSheet();
        $excel->setActiveSheetIndex(0);
        $excel->getActiveSheet()->setTitle('Grafico');

		$excel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
        $objWorksheet = $excel->getActiveSheet();
		 $objWorksheet2 = $excel->getActiveSheet();

      $excel->setActiveSheetIndex(0)
            ->setCellValue('A1', 'Enquiry Source')
            ->setCellValue('B1', 'Total')
			;

      $where ='';
      if(isset($_SESSION['st_date'])) {
		  $where = " AND STR_TO_DATE(business.bsn_status_sys_date , '%Y-%m-%d' ) > CURDATE( ) - INTERVAL " .$_SESSION['st_date']. " DAY ";	
	  }

    $sql = "SELECT soe_name , bsn_cd_enquiry_source, count(bsn_cd_enquiry_source) as total  FROM `business` 
	        left join enquirysource on business.bsn_cd_enquiry_source = enquirysource.soe_id 
			where business.bsn_cd_enquiry_source > 0 and enquirysource.soe_name is NOT NULL ".$where . "
			GROUP BY enquirysource.soe_name ";
	
	 $data = $fwDb->query($sql);
	 
	 
    $sql2 = "SELECT soe_name , avg( CAST(REPLACE(REPLACE(business_sellers.bs_lgr_budget, ',', ''), '$', '') AS decimal(15,0)) ) AS number FROM `business`           inner join business_sellers on business.bsn_id = business_sellers.bs_business_id 
           left join enquirysource on business.bsn_cd_enquiry_source = enquirysource.soe_id where business.bsn_cd_enquiry_source > 0 and 
		   enquirysource.soe_name is NOT NULL GROUP BY enquirysource.soe_name"; 
	
	$data2 = $fwDb->query($sql2);
		
	$row=2;
	

foreach($data as $k=>$v)
{
	$excel->getActiveSheet()
				->setCellValue('A'.$row, $v['soe_name'])
				->setCellValue('B'.$row, $v['total'])
				;	
				
	$row= $row+1;				
}
$srrow = $row-1;
$crow = $row+4;

$row = $row+10;
$sec_row = $row;
 $excel->setActiveSheetIndex(0)
            ->setCellValue('A'.$row, 'Enquiry Source')
            ->setCellValue('B'.$row, 'Average Budget')
			;	
$row = $row+1;
foreach($data2 as $k2=>$v2)
{
	$excel->getActiveSheet()
				->setCellValue('A'.$row, $v2['soe_name'])
				->setCellValue('B'.$row, round($v2['number'],0))
				;	
				
	$row= $row+1;				
}
$ch2_row = $row;
$srrow2 = $row-1;
        $dataseriesLabels1 = array(
            new \PHPExcel_Chart_DataSeriesValues('String', 'Grafico!$B$1', NULL, 1), //  Rainfall
        );


	    $xAxisTickValues = array(
            new \PHPExcel_Chart_DataSeriesValues('String', 'Grafico!$A$2:$A$'.$srrow, NULL, 12), //  Jan to Dec
        );

  		
		  $dataSeriesValues1 = array(
            new \PHPExcel_Chart_DataSeriesValues('Number', 'Grafico!$B$2:$B$'.$srrow, NULL, 12),
        );

        //  Build the dataseries
        $series1 = new \PHPExcel_Chart_DataSeries(
                \PHPExcel_Chart_DataSeries::TYPE_BARCHART, // plotType
                \PHPExcel_Chart_DataSeries::GROUPING_CLUSTERED, // plotGrouping
                range(0, count($dataSeriesValues1) - 1), // plotOrder
                $dataseriesLabels1, // plotLabel
                $xAxisTickValues, // plotCategory
                $dataSeriesValues1                              // plotValues
        );
      
        //      Make it a vertical column rather than a horizontal bar graph
        //$series1->setPlotDirection(\PHPExcel_Chart_DataSeries::DIRECTION_COL);
		$series1->setPlotDirection(\PHPExcel_Chart_DataSeries::DIRECTION_BAR);
		$layout = new PHPExcel_Chart_Layout();
		$layout->setShowVal(true);
		
		$plotarea = new \PHPExcel_Chart_PlotArea($layout, array($series1));
        //  Set the chart legend
        $legend = new \PHPExcel_Chart_Legend(\PHPExcel_Chart_Legend::POSITION_RIGHT, NULL, false);

        $title = new \PHPExcel_Chart_Title('Lead Generation');
		$titleX = new \PHPExcel_Chart_Title('Enquiry Source');
		$titleY = new \PHPExcel_Chart_Title('Total Enquiries');
 
        //  Create the chart
        $chart = new \PHPExcel_Chart(
                'chart1', // name
                $title, // title
                $legend, // legend
                $plotarea, // plotArea
                true, // plotVisibleOnly
                0, // displayBlanksAs
                $titleX, // xAxisLabel
                $titleY            // yAxisLabel
        );

        $rightpos = $srrow + 7;
        //  Set the position where the chart should appear in the worksheet
        $chart->setTopLeftPosition('F2');
        $chart->setBottomRightPosition('R'.$rightpos);

        //  Add the chart to the worksheet
        $objWorksheet->addChart($chart);
        
	  // Start second chart
	  
	 
	  
	   $dataseriesLabels12 = array(
            new \PHPExcel_Chart_DataSeriesValues('String', 'Grafico!$B$'.$sec_row, NULL, 1), //  Rainfall
        );


	    $xAxisTickValues2 = array(
            new \PHPExcel_Chart_DataSeriesValues('String', 'Grafico!$A$2:$A$'.$ch2_row, NULL, 12), //  Jan to Dec
        );

  		
		  $dataSeriesValues2 = array(
            new \PHPExcel_Chart_DataSeriesValues('Number', 'Grafico!$B$2:$B$'.$ch2_row, NULL, 12),
        );

      
        $series2 = new \PHPExcel_Chart_DataSeries(
                \PHPExcel_Chart_DataSeries::TYPE_BARCHART, // plotType
                \PHPExcel_Chart_DataSeries::GROUPING_CLUSTERED, // plotGrouping
                range(0, count($dataSeriesValues2) - 1), // plotOrder
                $dataseriesLabels2, // plotLabel
                $xAxisTickValues2, // plotCategory
                $dataSeriesValues2                              // plotValues
        );
	  

	
	    $series2->setPlotDirection(\PHPExcel_Chart_DataSeries::DIRECTION_BAR);
		$layout2 = new PHPExcel_Chart_Layout();
		$layout2->setShowVal(true);
		
		$plotarea2 = new \PHPExcel_Chart_PlotArea($layout2, array($series2));
    
        $legend2 = new \PHPExcel_Chart_Legend(\PHPExcel_Chart_Legend::POSITION_RIGHT, NULL, false);

        $title2 = new \PHPExcel_Chart_Title('Lead Generation');
		$titleX2 = new \PHPExcel_Chart_Title('Enquiry Source');
		$titleY2 = new \PHPExcel_Chart_Title('Total Enquiries');
	
	    $chart2 = new \PHPExcel_Chart(
                'chart2', // name
                $title2, // title
                $legend2, // legend
                $plotarea2, // plotArea
                true, // plotVisibleOnly
                0, // displayBlanksAs
                $titleX2, // xAxisLabel
                $titleY2            // yAxisLabel
        );

        $rightpos2 = $srrow2 + 7;
      
        $chart2->setTopLeftPosition('F2');
        $chart2->setBottomRightPosition('R'.$rightpos2);

      
        $objWorksheet2->addChart($chart2);
	
		  // End Second Chart
		$excel->setActiveSheetIndex(0);

// Redirect output to a client’s web browser (Excel5)
header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="chart.xlsx"');
header('Cache-Control: max-age=0');
// If you're serving to IE 9, then the following may be needed
header('Cache-Control: max-age=1');

// If you're serving to IE over SSL, then the following may be needed
header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
header ('Pragma: public'); // HTTP/1.0

$objWriter = PHPExcel_IOFactory::createWriter($excel, 'Excel2007');
$objWriter->setIncludeCharts(TRUE);
$objWriter->save('php://output');
exit;

// ends
		
		
		
        // then your file will be not corrupted anymore

        // Do not use streamed responses with excel files that include charts ! otherwise it will get corrupted
        /**
          $response = $this->get('phpexcel')->createStreamedResponse($writer);
          // adding headers
          $dispositionHeader = $response->headers->makeDisposition(
          ResponseHeaderBag::DISPOSITION_ATTACHMENT,
          'stream-file.xlsx'
          );
          $response->headers->set('Content-Type', 'text/vnd.ms-excel; charset=utf-8');
          $response->headers->set('Pragma', 'public');
          $response->headers->set('Cache-Control', 'maxage=1');
          $response->headers->set('Content-Disposition', $dispositionHeader);
        **/

        // YOU NEED TO GIVE YOUR OWN RESPONSE, OTHERWISE THIS WILL THROW ERROR
        return 'Create your own response';
}


//https://ourcodeworld.com/articles/read/95/generated-excel-file-with-charts-using-phpexcel-get-corrupted-with-a-streamed-response-in-symfony-php