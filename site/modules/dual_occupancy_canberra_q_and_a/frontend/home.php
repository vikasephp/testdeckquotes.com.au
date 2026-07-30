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
		$sqlwh = "SELECT docqa_id, docqa_slug, docqa_public_rank, TRIM( REPLACE( REPLACE( REPLACE( REGEXP_REPLACE(docqa_question, '<[^>]*>', ''), '&nbsp;', ' ' ), CHAR(13), '' ), CHAR(10), '' ) ) AS docqa_question, TRIM( REPLACE( REPLACE( REPLACE( REGEXP_REPLACE(docqa_answer, '<[^>]*>', ''), '&nbsp;', ' ' ), CHAR(13), '' ), CHAR(10), '' ) ) AS docqa_answer, docqa_approved, docqa_short_answer, docqa_key_points, docqa_detail_explanation, docqa_graphic FROM dual_occupancy_canberra_qanda WHERE docqa_id = " . intval($ky_3);

		$qawh = $fwDb->queryOne($sqlwh);

		if (!empty($qawh)) {
			
			if (!empty($qawh['docqa_graphic'])){
				$graphic_media = $qawh['docqa_graphic'];
				$graphic_folder_path = 'files/dual_occupancy_qa_graphic/';
				//$graphic = '<img src="'.get_file_raw_data($graphic_folder_path, $graphic_media) .'" >';
				//$graphic = get_file_raw_data($graphic_folder_path, $graphic_media);
				//$graphic = '<a href="' . showUrl($graphic_folder_path, $graphic_media) . '">media</a>';
				$graphic = showUrl($graphic_folder_path, $graphic_media);
			} else {
				$graphic = '';
			}

			$payload = array(
				"docqa_id" => 'QAIDDO'.$qawh['docqa_id'],
				"docqa_slug" => $qawh['docqa_slug'],
				"docqa_public_rank" => $qawh['docqa_public_rank'],
				"docqa_question" => $qawh['docqa_question'],
				"docqa_answer"   => $qawh['docqa_answer'],
				"docqa_reviewed_at" => date("Y-m-d H:i:s"),
				"docqa_short_answer" => $qawh['docqa_short_answer'],
				"docqa_key_points" => $qawh['docqa_key_points'],
				"docqa_detail_explanation" => $qawh['docqa_detail_explanation'],
				"docqa_graphic" => $graphic,
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

$docqa_public_rank = $fwRequest->getParam('docqa_public_rank', '');
if ($docqa_public_rank) {

    $keys = array_keys($docqa_public_rank);
    $docqaId = (int)$keys[0];

    $rank = (int)$docqa_public_rank[$docqaId];

    $detail = array(
        'docqa_public_rank' => $rank
    );

    $table = new Fw_Db_Table($TABLE);
    $table->setWhere("docqa_id = ".$docqaId);

    if ($table->rowExists()) {
        $table->updateRow($detail);
		
		//Code for Webhook that will trigger when the Public Rank is updated
		$sqlwh = "SELECT docqa_id, docqa_slug, docqa_public_rank, TRIM( REPLACE( REPLACE( REPLACE( REGEXP_REPLACE(docqa_question, '<[^>]*>', ''), '&nbsp;', ' ' ), CHAR(13), '' ), CHAR(10), '' ) ) AS docqa_question, TRIM( REPLACE( REPLACE( REPLACE( REGEXP_REPLACE(docqa_answer, '<[^>]*>', ''), '&nbsp;', ' ' ), CHAR(13), '' ), CHAR(10), '' ) ) AS docqa_answer, docqa_approved, docqa_short_answer, docqa_key_points, docqa_detail_explanation, docqa_graphic FROM dual_occupancy_canberra_qanda WHERE docqa_approved = 1 and docqa_id = " . intval($docqaId);

		$qawh = $fwDb->queryOne($sqlwh);

		if (!empty($qawh)) {
			
			if (!empty($qawh['docqa_graphic'])){
				$graphic_media = $qawh['docqa_graphic'];
				$graphic_folder_path = 'files/dual_occupancy_qa_graphic/';
				$graphic = showUrl($graphic_folder_path, $graphic_media);
			} else {
				$graphic = '';
			}

			$payload = array(
				"docqa_id" => 'QAIDDO'.$qawh['docqa_id'],
				"docqa_slug" => $qawh['docqa_slug'],
				"docqa_public_rank" => $qawh['docqa_public_rank'],
				"docqa_question" => $qawh['docqa_question'],
				"docqa_answer"   => $qawh['docqa_answer'],
				"docqa_reviewed_at" => date("Y-m-d H:i:s"),
				"docqa_short_answer" => $qawh['docqa_short_answer'],
				"docqa_key_points" => $qawh['docqa_key_points'],
				"docqa_detail_explanation" => $qawh['docqa_detail_explanation'],
				"docqa_graphic" => $graphic,
				"docqa_status" 	 => "approved",
				"docqa_action"   => "public_rank_updated"
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

	$qasql = "SELECT dual_occupancy_canberra_qanda.docqa_id, dual_occupancy_canberra_qanda.docqa_question, dual_occupancy_canberra_qanda.docqa_answer, dual_occupancy_canberra_qanda.docqa_last_updated, dual_occupancy_canberra_qanda.docqa_qed from dual_occupancy_canberra_qanda ORDER BY CASE WHEN dual_occupancy_canberra_qanda.docqa_public_rank = 0 THEN 1 ELSE 0 END, dual_occupancy_canberra_qanda.docqa_public_rank ASC, dual_occupancy_canberra_qanda.docqa_id DESC";	
    if($qasql){$qaData = $fwDb->query($qasql);}
	
	$html = '';	
	foreach($qaData as $m)
	{
		if($m['docqa_qed'] == 1 ) {	
			$html .=  "<b>" .clean_data_special($m['docqa_question']). "  QAIDDO". $m['docqa_id']."   QED - ".$m['docqa_last_updated']."</b>";
			$html .= clean_data_special($m['docqa_answer']) ."<br>";
		}
		
		else {
			
			$html .=  "<b>" .clean_data_special($m['docqa_question']). "  QAIDDO". $m['docqa_id']."</b>";
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
    //$_SESSION['hidden'] =  $hidden;
	//$fwViewData['hidden'] = $_SESSION['hidden'];
elseif ($_SESSION['hidden']):
    $where = " WHERE docqa_hide = 1 ";
    //$fwViewData['hidden'] = $_SESSION['hidden'];
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

$where2 = " ";

if ($fwRequest->getParam('all', '')) {
    $_SESSION['quick_filter'] = 'all';
	$fwViewData['all'] = 1;
}

if ($fwRequest->getParam('public', '')) {
    $_SESSION['quick_filter'] = 'public';
	$fwViewData['public'] = 1;
}

if ($fwRequest->getParam('internal', '')) {
    $_SESSION['quick_filter'] = 'internal';
	$fwViewData['internal'] = 1;
}

if ($fwRequest->getParam('synced', '')) {
    $_SESSION['quick_filter'] = 'synced';
	$fwViewData['synced'] = 1;
}

if ($fwRequest->getParam('not_synced', '')) {
    $_SESSION['quick_filter'] = 'not_synced';
	$fwViewData['not_synced'] = 1;
}

if ($fwRequest->getParam('hidden', '')) {
    $_SESSION['quick_filter'] = 'hidden';
	$fwViewData['hidden'] = 1;
}

if ($fwRequest->getParam('ranked', '')) {
    $_SESSION['quick_filter'] = 'ranked';
	$fwViewData['ranked'] = 1;
}

if ($fwRequest->getParam('unranked', '')) {
    $_SESSION['quick_filter'] = 'unranked';
	$fwViewData['unranked'] = 1;
}

if ($fwRequest->getParam('incomplete', '')) {
    $_SESSION['quick_filter'] = 'incomplete';
	$fwViewData['incomplete'] = 1;
}

switch ($_SESSION['quick_filter']) {

    case 'public':
        $where2 = " AND docqa_audience = 'Public'";
        break;

    case 'internal':
        $where2 = " AND docqa_audience = 'Internal'";
        break;

    case 'synced':
        $where2 = " AND docqa_approved = 1";
        break;
		
	case 'not_synced':
        $where2 = " AND docqa_approved = 0";
        break;
	
	/*case 'hidden':
        $where2 = " AND docqa_hide = 1";
        break;*/
		
	case 'ranked':
        $where2 = " AND docqa_public_rank > 0";
        break;
		
	case 'unranked':
        $where2 = " AND docqa_public_rank = 0";
        break;
		
	case 'incomplete':
        $where2 = " AND (docqa_question != '' or docqa_answer != '' or docqa_short_answer != '' or docqa_key_points != '' or docqa_detail_explanation != '' )";
        break;

    case 'all':
		$where2 = " OR docqa_hide = 1";
        break;
		
    default:
        $where2 = " ";
        break;
}
  
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
	
	unset($_SESSION['quick_filter']);
	$fwViewData['all'] = '';
	$fwViewData['public'] = '';
	$fwViewData['internal'] = '';
	$fwViewData['synced'] = '';
	$fwViewData['not_synced'] = '';
	$fwViewData['ranked'] = '';
	$fwViewData['unranked'] = '';
	$fwViewData['incomplete'] = '';
	$fwViewData['hidden'] = '';
	
	$redirectUrl = $_SERVER['REQUEST_URI'];
	header("Location: $redirectUrl");
	exit;
}

//count the records 
$sql_count = "SELECT COUNT(*) AS total, SUM(docqa_audience = 'Public') AS public_count, SUM(docqa_audience = 'Internal') AS internal_count, SUM(docqa_approved = 1) AS synced_count, SUM(docqa_approved = 0) AS not_synced_count, SUM(docqa_public_rank > 0) AS ranked_count, SUM(docqa_public_rank = 0) AS unranked_count, SUM( docqa_question = '' OR docqa_answer = '' OR docqa_short_answer = '' OR docqa_key_points = '' OR docqa_detail_explanation = '' ) AS incomplete_count FROM ".$TABLE." WHERE docqa_hide = 0" ;
$data_count = $fwDb->queryOne($sql_count);
$fwViewData['filter_counts'] = $data_count;

$sql_hidden_count = "SELECT count(*) AS hidden_count FROM ".$TABLE." WHERE docqa_hide = 1";
$data_hidden_count = $fwDb->queryOne($sql_hidden_count);
$fwViewData['filter_hidden_count'] = $data_hidden_count['hidden_count'];

$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where." ".$where2." ORDER BY CASE WHEN ".$TABLE.".docqa_public_rank = 0 THEN 1 ELSE 0 END, ".$TABLE.".docqa_public_rank ASC, ".$TABLE.".".$ID." DESC"; 

//echo $matsql;

//echo "<pre>";print_r($_REQUEST);exit;

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

$previewPublicRankData = array();
$uploadPRFile = $fwRequest->getParam('uploadPRFile', 0);
if ($uploadPRFile && !empty($_FILES['pr_excel_file']['name'])) {
    require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";

    $objPHPExcel = PHPExcel_IOFactory::load($_FILES['pr_excel_file']['tmp_name']);

    $sheet = $objPHPExcel->getActiveSheet();

    $highestRow = $sheet->getHighestRow();

    for($row=2; $row<=$highestRow; $row++)
    {
        $previewPublicRankData[] = array(
            'docqa_id' => trim($sheet->getCell('A'.$row)->getValue()),
            'docqa_question' => trim($sheet->getCell('B'.$row)->getValue()),
            'public_rank' => trim($sheet->getCell('C'.$row)->getValue()),
			'new_public_rank' => trim($sheet->getCell('D'.$row)->getValue())
        );
    }

	$fwViewData['previewPublicRankData']= $previewPublicRankData;
	$_SESSION['previewPublicRankData'] = $previewPublicRankData;
	$fwViewData['showPopup'] = 1;
}