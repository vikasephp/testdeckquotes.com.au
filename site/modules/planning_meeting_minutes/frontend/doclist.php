<?php
$mm_uminid= $fwRequest->getParamget('mid', '');
if($mm_uminid > 0)
{
	
$thisTable = new Fw_Db_Table('planning_meeting_minutes');
$thisTable->setWhere("mm_uminid = $mm_uminid");
$docData = $thisTable->getRow();
	

if($docData)
{
	$data = '<table id="doc_list-table"><tr>';
	$count = 0;

	$mm_uminid = $docData['mm_uminid'];
	
	if(!empty($docData['mm_doc_pdf'])) 
	{
	
	$delid = $mm_uminid ;
	
	
	$mm_doc_pdf = $docData['mm_doc_pdf'];
	$shor_name = PHPTruncate($mm_doc_pdf, 10);
	$iconpath = get_icon_path($v['dhd_type'], $v['dhd_name'], 'template_documents_hub');
	$data.='<td width="50"><div align="center"><a href="#" title="'.$mm_doc_pdf.'"><img src="'.$iconpath.'" width="40"></a><br><a href="#" title="'.$mm_doc_pdf.'">'.$shor_name.'</a><a href="javascript:delete_docfile('.$delid.',1);" title="Delete" ><img src="'.BASE_URL.'images/DeleteRed_new.gif"></a></div></td>';
	}
	
	if(!empty($docData['mm_doc_word'])) 
	{
	$delid = $mm_uminid ;	
		
	$mm_doc_word = $docData['mm_doc_word'];
	$shor_name = PHPTruncate($mm_doc_word, 10);
	$iconpath = get_icon_path($v['dhd_type'], $v['dhd_name'], 'template_documents_hub');
	$data.='<td width="50"><div align="center"><a href="#" title="'.$mm_doc_word.'"><img src="'.$iconpath.'" width="40"></a><br><a href="#" title="'.$mm_doc_pdf.'">'.$shor_name.'</a><a href="javascript:delete_docfile('.$delid.',2);" title="Delete" ><img src="'.BASE_URL.'images/DeleteRed_new.gif"></a></div></td>';
	}
		
}
		$data.='</tr></table>';	
			

}
if(empty($data)){$data = '<table id="doc_list-table" width="100%"><tr><td><div align="center" style="color:#FF0000;">Document not found.</div></td></tr></table>';}
echo $data;
exit;