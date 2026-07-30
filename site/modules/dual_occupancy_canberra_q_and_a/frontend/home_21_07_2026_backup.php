<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$fwViewData['ran'] =  rand(100000,999999);

$hide = $fwRequest->getParam('hide', '');
if ($hide) {
    $keys_2 = array_keys($hide);
    $ky_2 = $keys_2[0];
    $val_2 = $hide[$ky_2];
    $detail['docqa_hide'] = $val_2;
	$detail['docqa_hide_updated_by'] = $_SESSION['user']['user_name'];
	$detail['docqa_hide_updated_at'] = date('d-m-Y');
	$table = new Fw_Db_Table($TABLE);
    $table->setWhere("docqa_id = " . $ky_2);
    if ($table->rowExists()) {
        $this_id = $table->updateRow($detail);
    }
	$redirectUrl = $_SERVER['REQUEST_URI'];
	header("Location: $redirectUrl");
	exit;
}

$approved = $fwRequest->getParam('approved', '');
if ($approved) {
    $keys_3 = array_keys($approved);
    $ky_3 = $keys_3[0];
    $val_3 = $approved[$ky_3];
    $detail['docqa_approved'] = $val_3;
	$detail['docqa_approved_by'] = $_SESSION['user']['user_name'];
	$detail['docqa_approved_at'] = date('d-m-Y');
	$table = new Fw_Db_Table($TABLE);
    $table->setWhere("docqa_id = " . $ky_3);
    if ($table->rowExists()) {
        $this_id = $table->updateRow($detail);
		
		//Code for Webhook that will trigger when the Question is approved/unapproved
		$sqlwh = "SELECT docqa_id, docqa_slug, TRIM( REPLACE( REPLACE( REPLACE( REGEXP_REPLACE(docqa_question, '<[^>]*>', ''), '&nbsp;', ' ' ), CHAR(13), '' ), CHAR(10), '' ) ) AS docqa_question, TRIM( REPLACE( REPLACE( REPLACE( REGEXP_REPLACE(docqa_answer, '<[^>]*>', ''), '&nbsp;', ' ' ), CHAR(13), '' ), CHAR(10), '' ) ) AS docqa_answer, docqa_approved FROM dual_occupancy_canberra_qanda WHERE docqa_id = " . intval($ky_3);

		$qawh = $fwDb->queryOne($sqlwh);

		if (!empty($qawh)) {

			$payload = array(
				"docqa_id"       => $qawh['docqa_id'],
				"docqa_slug"     => $qawh['docqa_slug'],
				"docqa_question" => $qawh['docqa_question'],
				"docqa_answer"   => $qawh['docqa_answer'],
				"docqa_reviewed_at" => date("Y-m-d H:i:s"),
				"docqa_status" 	 => ($qawh['docqa_approved'] == 1) ? "approved" : "unapproved"
			);

			$jsonPayload = json_encode($payload);

			if ($jsonPayload === false) {
				error_log('Webhook JSON Error: ' . json_last_error_msg());
			} else {

				$ch = curl_init();

				curl_setopt_array($ch, array(
					CURLOPT_URL => "https://dualoccupancycanberra.com.au/wp-json/doc_questions/v1/webhook",
					CURLOPT_POST => true,
					CURLOPT_RETURNTRANSFER => true,
					CURLOPT_TIMEOUT => 10,
					CURLOPT_HTTPHEADER => array(
						"Content-Type: application/json",
						"Accept: application/json"
					),
					CURLOPT_POSTFIELDS => $jsonPayload
				));

				$response = curl_exec($ch);
				$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);

				if (curl_errno($ch)) {
					error_log('Webhook cURL Error: ' . curl_error($ch));
				} else {
					error_log("Webhook HTTP {$httpCode}: " . $response);
				}

				curl_close($ch);
			}
		}		
    }
	$redirectUrl = $_SERVER['REQUEST_URI'];
	header("Location: $redirectUrl");
	exit;
}

$submit = $fwRequest->getParam('print', '');
if(!empty($submit))
{
	$heading = "Questions ans Answer";

	$qasql = "SELECT dual_occupancy_canberra_qanda.docqa_id, dual_occupancy_canberra_qanda.docqa_question, dual_occupancy_canberra_qanda.docqa_answer, dual_occupancy_canberra_qanda.docqa_last_updated, dual_occupancy_canberra_qanda.docqa_qed from dual_occupancy_canberra_qanda order by docqa_id ASC ";	
    if($qasql){$qaData = $fwDb->query($qasql);}
	
	$html = '';	
	foreach($qaData as $m)
	{
		if($m['docqa_qed'] == 1 ) {	
			$html .=  "<b>" .clean_data_special($m['docqa_question']). "  QAID ". $m['docqa_id']."   QED - ".$m['docqa_last_updated']."</b>";
			$html .= clean_data_special($m['docqa_answer']) ."<br>";
		}
		
		else {
			
			$html .=  "<b>" .clean_data_special($m['docqa_question']). "  QAID ". $m['docqa_id']."</b>";
			$html .= clean_data_special($m['docqa_answer']) ."<br>";
		}
	}
	
	//db($html);
	create_open_PDF($heading,$html,$fname);
}

$listdata = $fwRequest->getParam($TABLE, array());

$keyword = $listdata['keyword'];
$where = "WHERE docqa_hide = 0 ";

$fwViewData['hidden'] = '';
$hidden = $fwRequest->getParam('hidden', '');
if ($hidden):
    $where = " WHERE docqa_hide = 1 ";
    $_SESSION['hidden'] =  $hidden;
	$fwViewData['hidden'] = $_SESSION['hidden'];
elseif ($_SESSION['hidden']):
    $where = " WHERE docqa_hide = 1 ";
    $fwViewData['hidden'] = $_SESSION['hidden'];
endif; 

if($keyword) {
	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword']=$_SESSION['keyword'];
}
//else { unset($_SESSION['keyword']); }
//db($_SESSION['keyword']);

	
if($keyword OR $_SESSION['keyword']):
	$where .= " AND (".$TABLE.".docqa_question LIKE '%".$_SESSION['keyword']."%' OR 
	".$TABLE.".docqa_answer LIKE '%".$_SESSION['keyword']."%')";
	
	if($keyword) {
		$_SESSION['keyword'] = $keyword;
	}
	$fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword'] && $pagenum > 0):

	$where .= " AND (".$TABLE.".docqa_question LIKE '%".$_SESSION['keyword']."%' OR
	 ".$TABLE.".docqa_answer LIKE '%".$_SESSION['keyword']."%')";
	$fwViewData['keyword']=$_SESSION['keyword'];
endif;


$keywordfs = $listdata['fs']; 
if($keywordfs) {
	$_SESSION['keywordfs'] = $keywordfs;
	$fwViewData['keywordfs']=$_SESSION['keywordfs'];
}
//else { unset($_SESSION['keywordfs']); }

if($keywordfs  OR $_SESSION['keywordfs']):

	unset($_SESSION['keywordqaid']);
	$fwViewData['keywordqaid']='';
	
	$where .= " AND ".$TABLE.".docqa_fact_sheets LIKE '%|".$_SESSION['keywordfs']."|%'";
	
	if($keywordfs) {
		$_SESSION['keywordfs'] = $keywordfs;
	}
	
	$fwViewData['keywordfs']=$_SESSION['keywordfs'];

elseif($_SESSION['keywordfs'] && $pagenum > 0):

	$where .= " AND ".$TABLE.".docqa_fact_sheets LIKE '%|".$_SESSION['keywordfs']."|%' ";
	$fwViewData['keywordfs']=$_SESSION['keywordfs'];
endif;

$keywordqaid = $listdata['qaid'];
 
 if($keywordqaid) {

	$_SESSION['keywordqaid'] = $keywordqaid;
	$fwViewData['keywordqaid']=$_SESSION['keywordqaid'];
  }
//else { unset($_SESSION['keywordfs']); }

if($keywordqaid  OR $_SESSION['keywordqaid']):
	$where .= " AND ".$TABLE.".docqa_id = ".$_SESSION['keywordqaid'];
	
	if($keywordqaid) {
		$_SESSION['keywordqaid'] = $keywordqaid;
	}
	$fwViewData['keywordqaid']=$_SESSION['keywordqaid'];

elseif($_SESSION['keywordqaid'] && $pagenum > 0):

	$where .= " AND ".$TABLE.".docqa_id = ".$_SESSION['keywordqaid'];
	$fwViewData['keywordqaid']=$_SESSION['keywordqaid'];
endif;
  
$showall = $fwRequest->getParam('showall', '');
if($showall)
{
	$where = "WHERE docqa_hide = 0 ";
	unset($_SESSION['keyword']);
	unset($_SESSION['keywordfs']);
	unset($_SESSION['keywordqaid']);
	$fwViewData['keyword']='';
	$fwViewData['keywordfs']='';
	$fwViewData['keywordqaid']='';
	unset($_SESSION['hidden']);
    $fwViewData['hidden'] = '';
	
	$redirectUrl = $_SERVER['REQUEST_URI'];
	header("Location: $redirectUrl");
	exit;
}
   
$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where." ORDER BY ".$TABLE.".".$ID." DESC";

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
    if($sql2){
		$lists = $fwDb->query($sql2);
		$listsnew = [];
		foreach($lists as $k => $v ):
		
			$sql_note_date = "SELECT doc_created_at FROM dual_occupancy_notes where doc_docqa_id = ".$v['docqa_id']." order by doc_id desc limit 1";
			$data_note_date = $fwDb->queryOne($sql_note_date);
			$v['note_date'] = $data_note_date['doc_created_at'];
			
			$listsnew[] = $v;
		endforeach;
		
		//echo "<pre>"; print_r($listsnew); exit();
		
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

$sql_topic = "SELECT * FROM dual_occupancy_canberra_qa_topic";
$fwViewData['data_topic'] = $data_topic = $fwDb->query($sql_topic);

$sql_aw = "SELECT * FROM dual_occupancy_canberra_qa_approval_flow";
$fwViewData['data_aw'] = $data_aw = $fwDb->query($sql_aw);

//Excel Generation
$export = $fwRequest->getParam('export', 0);
if ($export > 0) {

	require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";
	$objPHPExcel = new PHPExcel();

	$objPHPExcel->getProperties()->setCreator("Deckquotes")
		->setLastModifiedBy("Frank Walmsley")
		->setTitle("Dual Occupancy Q & A")
		->setSubject("Dual Occupancy Q & A")
		->setDescription("Dual Occupancy Q & A exported to Office 2007 XLSX")
		->setKeywords("dual occupancy q a openxml php")
		->setCategory("Dual Occupancy Q & A file");

	$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth(60);
	$objPHPExcel->getActiveSheet()->getStyle('B:B')->getAlignment()->setWrapText(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);

	$objPHPExcel->setActiveSheetIndex(0)
		->setCellValue('A1', 'QAIDDO')
		->setCellValue('B1', 'Question')
		->setCellValue('C1', 'Public Rank')
		->setCellValue('D1', 'New Public Rank')
	;

	$from = "A1"; // or any value
	$to = "D1"; // or any value
	$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold(true);

	$row = 2;
	$sr = 1;
	
	if ($matsql) {
		$excelData = $fwDb->query($matsql);
	}
	//echo "<pre>"; print_r($excelData); exit("Checking");
	foreach ($excelData as $k => $v) {
	
		$question = html_entity_decode(strip_tags($v['docqa_question']), ENT_QUOTES, 'UTF-8');
		$question = preg_replace('/\s+/', ' ', $question);
	
		$objPHPExcel->getActiveSheet()
			->setCellValue('A' . $row, "QAIDDO".$v['docqa_id'])
			->setCellValue('B' . $row, trim($question))
			->setCellValue('C' . $row, ($v['docqa_public_rank'] > 0) ? $v['docqa_public_rank'] : '')
			->setCellValue('D' . $row, $v[''])
		;

		$row = $row + 1;
		$sr = $sr + 1;
	}

	$objPHPExcel->getActiveSheet()->setTitle('Dual Occupancy Q & A');
	$objPHPExcel->setActiveSheetIndex(0);

	// Redirect output to a client’s web browser (Excel5)
	header('Content-Type: application/vnd.ms-excel');
	header('Content-Disposition: attachment;filename="dual_occupancy_qa.xls"');
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
