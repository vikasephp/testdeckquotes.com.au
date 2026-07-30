<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('companies');

$active = $fwRequest->getParam('active', '');

if($active)
{
	 foreach($active as $k=>$v)
	 {
		  $id = $k; 
	 }
	 
	  $detail['co_active'] = $v;
	  $table->setWhere('co_id = '.$id);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }
}


$listdata = $fwRequest->getParam($TABLE, array());

$keyword = $listdata['keyword'];

$where = " WHERE co_active = 1 ";

$submit = $fwRequest->getParam('showinactive', '');
if(!empty($submit)) {
$where = "WHERE 1=1";	
}

if($keyword) {
$_SESSION['keyword'] = $keyword;
$fwViewData['keyword']=$_SESSION['keyword'];
}
else { unset($_SESSION['keyword']); }

	
if($keyword):
$where .= "AND companies.co_categry LIKE '%".$keyword."%' OR companies.co_company_name LIKE '%".$keyword."%' OR 
               companies.co_rating LIKE '%".$keyword."%' OR companies.co_address  LIKE '%".$keyword."%' OR
	       companies.co_resp_status LIKE '%".$keyword."%' ";
	
	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword'] && $pagenum > 0):

	$where .= "AND companies.co_categry LIKE '%".$_SESSION['keyword']."%' OR companies.co_company_name LIKE '%".$_SESSION['keyword']."%'
	           OR companies.co_rating LIKE '%".$_SESSION['keyword']."%' OR companies.co_address LIKE '%".$_SESSION['keyword']."%' 
	           OR companies.co_resp_status LIKE '%".$_SESSION['keyword']."%' ";	
	
	$fwViewData['keyword']=$_SESSION['keyword'];
endif;
   
$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where." ORDER BY ".$TABLE.".".$ID." ASC";	

if($matsql){$userData = $fwDb->query($matsql);}


if(!empty($userData))
{
if (!(isset($pagenum))){ $pagenum = 1; } 
    $rows = count($userData);
    $page_rows = 500;
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

$sql_rd = "SELECT  * from type_master where tm_type like '%Responsible Department%'";
$rd_id = $fwDb->queryOne($sql_rd);		

$sql_rd2 = "SELECT  * from type_options where to_type_id  =  ".$rd_id['tm_id'];
$rddata = $fwDb->query($sql_rd2);
$fwViewData['rddata'] = $rddata ;




// Export to Excel

$export = $fwRequest->getParam('export', 0);

if($export > 0)
	{

	$sqlexport = "Select companies.* from companies";
        if($sqlexport){$exportData = $fwDb->query($sqlexport);}
		
require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";
//require BASE_DIR . "PHPExcel/Classes/PHPExcel/Writer/Excel2007.php";

$objPHPExcel = new PHPExcel();

$objPHPExcel->getProperties()->setCreator("Deckquotes")
							 ->setLastModifiedBy("Nick C")
							 ->setTitle("Office 2007 XLSX Test Document")
							 ->setSubject("Office 2007 XLSX Test Document")
							 ->setDescription("Companies exported to Office 2007 XLSX.")
							 ->setKeywords("office 2007 openxml php")
							 ->setCategory("Companies");

//$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth(50);
$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);
	
// Add some data
$objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A1', 'Category')
            ->setCellValue('B1', 'Company Name')
	    ->setCellValue('C1', 'Rating')
	    ->setCellValue('D1', 'Address')
	    ->setCellValue('E1', 'Website')
	    ->setCellValue('F1', 'Responsible Status')
	  ;

$from = "A1"; // or any value
$to = "F1"; // or any value
$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold( true );

$row=2;
$sr=1;
foreach($exportData as $k=>$v)
{

	$objPHPExcel->getActiveSheet()
		    ->setCellValue('A'.$row, $v['co_categry'])
		    ->setCellValue('B'.$row, $v['co_company_name'])
		    ->setCellValue('C'.$row, $v['co_rating'])
		    ->setCellValue('D'.$row, $v['co_address'])
		    ->setCellValue('E'.$row, $v['co_website'])
		    ->setCellValue('F'.$row, $v['co_resp_status'])
                                ;	
	$row= $row+1;			
	$sr=$sr+1;
}

$objPHPExcel->getActiveSheet()->setTitle('Companies');


$objPHPExcel->setActiveSheetIndex(0);

header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="companies.xls"');
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
	
	
//$sql_bs = "SELECT  * from busness_status ";
//$fwViewData['bsdata'] = $fwDb->query($sql_bs);


