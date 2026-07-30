<?php

$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Facts Sheets";

$sql = "Select fact_sheet_doc.* from fact_sheet_doc ";	
$fwViewData['documents'] = $fwDb->query($sql);

$export = $fwRequest->getParam('export', 0);


if($export > 0)
	{
		
	$fwViewData['doc_download'] = $export;
	$sqlpredoc = "Select fact_sheet_doc.* from fact_sheet_doc where fact_sheet_doc.doc_id  = ". $export;	
	$file = $fwDb->queryOne($sqlpredoc);
	
	$docfilename = $file['doc_file_name'];
	

	$docfile = BASE_DIR.'files/fact_sheets_doc/'.$docfilename;
	
	$sql = "Select  qa_question, qa_answer, qa_id, qa_image from question_answer where qa_fact_sheets like '%|".$export."|%'";
	$data = $fwDb->query($sql);
	
	
	
	$html ='';

	foreach($data as $k => $v)
	{
	
		$html .= '<strong><p><b>' .$v["qa_question"] .'</b></p></strong>';
		$html .= $v['qa_answer'];
		$html .= $v['qa_id'];
		if($v['qa_image']) {
			
			$source = "https://deckquote.s3.amazonaws.com/files/question_answer_doc/".$v['qa_image'];
			$destination = BASE_DIR."files/question_answer_doc/".$v['qa_image'];
			copy($source, $destination);
			
			$html .= '<img src = "'. BASE_URL.'files/question_answer_doc/'.$v['qa_image'].'">';
		}
	}
	
	
	require_once BASE_DIR.'/vsword/VsWord.php'; 
	VsWord::autoLoad();
	
	$doc = new VsWord();  
	$body = $doc->getDocument()->getBody();
	$parser = new HtmlParser($doc);
	$parser->parse($html);
	
	//echo '<pre>'.($doc->getDocument()->getBody()->look()).'</pre>';
	
	$doc->saveAs(BASE_DIR.'factdoc.docx');
		
	include_once(BASE_DIR.'/tbszip/tbszip.php');

	$zip = new clsTbsZip();
	
	// Open the first document
	
	$zip->Open(BASE_DIR.'factdoc.docx');
	
	$content1 = $zip->FileRead('word/document.xml');
	$zip->Close();
	
	// Extract the content of the first document
	$p = strpos($content1, '<w:body');
	if ($p===false) exit("Tag <w:body> not found in document 1.");
	$p = strpos($content1, '>', $p);
	$content1 = substr($content1, $p+1);
	$p = strpos($content1, '</w:body>');
	if ($p===false) exit("Tag </w:body> not found in document 1.");
	$content1 = substr($content1, 0, $p);
	
	// Insert into the second document
	$zip->Open($docfile);
	$content2 = $zip->FileRead('word/document.xml');
	$p = strpos($content2, '</w:body>');
	if ($p===false) exit("Tag </w:body> not found in document 2.");
	$content2 = substr_replace($content2, $content1, $p, 0);
	$zip->FileReplace('word/document.xml', $content2, TBSZIP_STRING);
	
	// Save the merge into a third file
	$zip->Flush(TBSZIP_FILE, BASE_DIR.'files/fact_sheets_doc/merge.docx');
	
	$fwViewData['fn'] = 'merge.docx';
  
	}


$export2 = $fwRequest->getParam('export2', 0);

if($export2 > 0)
	{
		
	$fwViewData['doc_download'] = $export;
	$sqlpredoc = "Select fact_sheet_doc.* from fact_sheet_doc where fact_sheet_doc.doc_id  = ". $export2;	
	$content = $fwDb->queryOne($sqlpredoc);
	

	
	$sql = "Select  qa_question, qa_answer,  qa_id, qa_image from question_answer where qa_fact_sheets like '%|".$export2."|%'";
	$data = $fwDb->query($sql);
	
	$html2 ='';

	//$html2 .= '<img src = "'. BASE_URL.'files/fact_sheets_doc/leterhead.png"><br><br>';
	
	$folder_path_lh = "files/fact_sheets_doc/"; 
	$object_name_lh = "leterhead.png";
	$lh_path = get_file_raw_data($folder_path_lh,$object_name_lh);
	$html2 .= '<img src = "'.$lh_path.'" >';
	
		
	$html2 .= $content['doc_content'];
	
	if(!empty( $content['doc_image']))
	{
		//$html2 .= '<img src = "'. BASE_URL.'files/fact_sheets_doc/'.$content['doc_image'].'">';
		
		$folder_path_img = "files/fact_sheets_doc/"; 
		$object_name_img = $content['doc_image'];
	    $image_path = get_file_raw_data($folder_path_img,$object_name_img);
		$html2 .= '<img src = "'.$image_path.'" >';
	}
	
	foreach($data as $k2 => $v2)
	{
	    if($v2['qa_image'])
	    {
	      $folder_path = "files/question_answer_doc/"; $object_name = $v2['qa_image'];
	      $file_path = get_file_raw_data($folder_path,$object_name);
	    }
		$html2 .= '<strong><p><b>' .$v2["qa_question"] .'</b></p></strong>';
		$html2 .= $v2['qa_answer'];
		$html2 .= "QAID: ".$v2['qa_id']. "<br>";
		if($v2['qa_image']) {
			
		
			  $html2 .= '<img src = "'.$file_path.'" >';
			}
	}
	
		
	  header("Content-type: application/vnd.ms-word.doc");
	  header("Content-Disposition: attachment;Filename=fact_sheet.doc");    
	  echo "<html>";
	  echo "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=Windows-1252\">";
	  echo "<body>";
	  echo "<div style='font-family:calibri;'>";
	  echo $html2;
	  echo "</div>";
	  echo "</body>";
	  echo "</html>";
	  exit;
  
	}