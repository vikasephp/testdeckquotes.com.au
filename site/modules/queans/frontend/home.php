<?php
$pagenum = $fwRequest->getparamget('pagenum',0);

$fwViewData['ran'] =  rand(100000,999999);

$submit = $fwRequest->getParam('print', '');
if(!empty($submit))
{
	$heading = "Questions ans Answer";

	$qasql = "SELECT question_answer.qa_id, question_answer.qa_question, question_answer.qa_answer, 
	          question_answer.qa_last_updated, question_answer.qa_qed from question_answer order by qa_id ASC ";	

        if($qasql){$qaData = $fwDb->query($qasql);}
	
	
	
	$html = '';	
	foreach($qaData as $m)
	{
		if($m['qa_qed'] == 1 ) {	
			$html .=  "<b>" .clean_data_special($m['qa_question']). "  QAID ". $m['qa_id']."   QED - ".$m['qa_last_updated']."</b>";
			$html .= clean_data_special($m['qa_answer']) ."<br>";
		}
		
		else {
			
			$html .=  "<b>" .clean_data_special($m['qa_question']). "  QAID ". $m['qa_id']."</b>";
			$html .= clean_data_special($m['qa_answer']) ."<br>";
		}
	}
	
	db($html);
	create_open_PDF($heading,$html,$fname);
}

$listdata = $fwRequest->getParam($TABLE, array());

$keyword = $listdata['keyword'];
$where = "WHERE 1=1 ";

if($keyword) {
	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword']=$_SESSION['keyword'];
}
//else { unset($_SESSION['keyword']); }
//db($_SESSION['keyword']);

	
if($keyword OR $_SESSION['keyword']):
	$where .= " AND ".$TABLE.".qa_question LIKE '%".$_SESSION['keyword']."%' OR 
	".$TABLE.".qa_answer LIKE '%".$_SESSION['keyword']."%'";
	
	if($keyword) {
		$_SESSION['keyword'] = $keyword;
	}
	$fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword'] && $pagenum > 0):

	$where .= " AND ".$TABLE.".qa_question LIKE '%".$_SESSION['keyword']."%' OR
	 ".$TABLE.".qa_answer LIKE '%".$_SESSION['keyword']."%'";
	$fwViewData['keyword']=$_SESSION['keyword'];
endif;

//
 
 $keywordfs = $listdata['fs'];
 
 if($keywordfs) {

		$_SESSION['keywordfs'] = $keywordfs;
		$fwViewData['keywordfs']=$_SESSION['keywordfs'];
	}
//else { unset($_SESSION['keywordfs']); }

if($keywordfs  OR $_SESSION['keywordfs']):

	unset($_SESSION['keywordqaid']);
	$fwViewData['keywordqaid']='';
	
	$where .= " AND ".$TABLE.".qa_fact_sheets LIKE '%|".$_SESSION['keywordfs']."|%'";
	
	if($keywordfs) {
		$_SESSION['keywordfs'] = $keywordfs;
	}
	
	$fwViewData['keywordfs']=$_SESSION['keywordfs'];

elseif($_SESSION['keywordfs'] && $pagenum > 0):

	$where .= " AND ".$TABLE.".qa_fact_sheets LIKE '%|".$_SESSION['keywordfs']."|%' ";
	$fwViewData['keywordfs']=$_SESSION['keywordfs'];
endif;

 // 
  
 //
 
 $keywordqaid = $listdata['qaid'];
 
 if($keywordqaid) {

	$_SESSION['keywordqaid'] = $keywordqaid;
	$fwViewData['keywordqaid']=$_SESSION['keywordqaid'];
  }
//else { unset($_SESSION['keywordfs']); }

if($keywordqaid  OR $_SESSION['keywordqaid']):
	$where .= " AND ".$TABLE.".qa_id = ".$_SESSION['keywordqaid'];
	
	if($keywordqaid) {
		$_SESSION['keywordqaid'] = $keywordqaid;
	}
	$fwViewData['keywordqaid']=$_SESSION['keywordqaid'];

elseif($_SESSION['keywordqaid'] && $pagenum > 0):

	$where .= " AND ".$TABLE.".qa_id = ".$_SESSION['keywordqaid'];
	$fwViewData['keywordqaid']=$_SESSION['keywordqaid'];
endif;

 // 
  
$showall = $fwRequest->getParam('showall', '');
if($showall)
{
	$where = "WHERE 1=1 ";
	unset($_SESSION['keyword']);
	unset($_SESSION['keywordfs']);
	unset($_SESSION['keywordqaid']);
	$fwViewData['keyword']='';
	$fwViewData['keywordfs']='';
	$fwViewData['keywordqaid']='';
}

   
$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where." ORDER BY ".$TABLE.".".$ID." ASC";	


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
$tablePages = new Fw_Db_Table("style_formula_types");
$tablePages->setWhere("sft_statues = 'Active'");
$tablePages->setOrderBy('sft_title ASC');
$fwViewData['formulatypes']=$tablePages->getRows();
$fwViewData['title'] = $MODULE_PLURAL;


	$tabledoc = new Fw_Db_Table('fact_sheet_doc');
	$tabledoc->setOrderBy('doc_id'.' ASC');
        $fwViewData['document_list']=$tabledoc->getAllRows();


// Export to Excel

$export = $fwRequest->getParam('export', 0);
if($export > 0)
{
require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";

$objPHPExcel = new PHPExcel();
$objPHPExcel->getProperties()->setCreator("CCBSs")
							 ->setLastModifiedBy("fRANK")
							 ->setTitle("Office 2007 XLSX Test Document")
							 ->setSubject("Office 2007 XLSX Test Document")
							 ->setDescription("Question Answer  to Office 2007 XLSX.")
							 ->setKeywords("office 2007 openxml php")
							 ->setCategory("Question Answer 24-25");

//$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth(50);
$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth(60);
$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth(120);
$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);


$objPHPExcel->getActiveSheet()->getStyle('B1:B9999')->getAlignment()->setWrapText(true);	
$objPHPExcel->getActiveSheet()->getStyle('C1:C9999')->getAlignment()->setWrapText(true);	
$objPHPExcel->getActiveSheet()->getStyle('A1:I1')->getAlignment()->setWrapText(true);
$objPHPExcel->getActiveSheet()
    ->getStyle('D1:D9999')
    ->getAlignment()
    ->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
// Add some data
$objPHPExcel->setActiveSheetIndex(0)
           	->setCellValue('A1', 'QAID')
          	->setCellValue('B1', 'Question')
			->setCellValue('C1', 'Answer')
			->setCellValue('D1', 'Attachment')
		

		;

$from = "A1"; // or any value
$to = "AH1"; // or any value
$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold( true );


$row=2;
$sr=1;
foreach($listsnew as $k=>$v)
{

	$attachmentUrl = "https://www.deckquotes.com.au/queans.download_content?file_name=" . urlencode($v['qa_attachment']) . "&module_name=queans.home";
	
	$objPHPExcel->getActiveSheet()
			->setCellValue('A'.$row, $v['qa_id'])
		    ->setCellValue('B'.$row, strip_tags(html_entity_decode($v['qa_question'], ENT_QUOTES, 'UTF-8')))
		   ->setCellValue('C'.$row, strip_tags(html_entity_decode($v['qa_answer'], ENT_QUOTES, 'UTF-8')))
           ->setCellValue('D'.$row, $v['qa_attachment'])
			;	
			
			$objPHPExcel->getActiveSheet()
			->getCell('D'.$row)
			->getHyperlink()
			->setUrl($attachmentUrl);
			
			
			$objPHPExcel->getActiveSheet()
			->getStyle('D'.$row)
			->getFont()
			->getColor()
			->setRGB('0000FF');
		
			$objPHPExcel->getActiveSheet()
			->getStyle('D'.$row)
			->getFont()
			->setUnderline(PHPExcel_Style_Font::UNDERLINE_SINGLE);
					
			
			$row= $row+1;			
			$sr=$sr+1;
}

// Rename worksheet
$objPHPExcel->getActiveSheet()->setTitle('Trust Account System 24 - 25');
$objPHPExcel->setActiveSheetIndex(0);

header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="quesion_answer.xls"');
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

