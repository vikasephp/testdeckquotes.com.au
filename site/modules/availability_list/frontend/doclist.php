<?php
$al_id= $fwRequest->getParamget('mid', '');
if($al_id > 0)
{
	
$thisTable = new Fw_Db_Table('availability_list');
$thisTable->setWhere("al_id = $al_id");
$docData = $thisTable->getRow();
	

if($docData)
{
	$data = '<table id="doc_list-table"><tr>';
	$count = 0;

	$al_id = $docData['al_id'];
	
	if(!empty($docData['al_doc_pdf'])) 
	{
	
	$delid = $al_id ;
		
	$al_doc_pdf = $docData['al_doc_pdf'];
	$shor_name = PHPTruncate($al_doc_pdf, 10);
	$iconpath = get_icon_path($v['dhd_type'], $v['dhd_name'], 'template_documents_hub');
	$data.='<td width="50"><div align="center"><a href="#" title="'.$al_doc_pdf.'"><img src="'.$iconpath.'" width="40"></a><br><a href="#" title="'.$al_doc_pdf.'">'.$shor_name.'</a>
	<a href="javascript:delete_docfile('.$delid.',1);" title="Delete" ><img src="'.BASE_URL.'images/DeleteRed_new.gif"></a></div></td>';
	}
	
	if(!empty($docData['al_doc_word'])) 
	{
	$delid = $al_id ;	
		
	$al_doc_word = $docData['al_doc_word'];
	$shor_name = PHPTruncate($al_doc_word, 10);
	$iconpath = get_icon_path($v['dhd_type'], $v['dhd_name'], 'template_documents_hub');
	$data.='<td width="50"><div align="center"><a href="#" title="'.$al_doc_word.'"><img src="'.$iconpath.'" width="40"></a><br><a href="#" title="'.$al_doc_pdf.'">'.$shor_name.'</a>
	<a href="javascript:delete_docfile('.$delid.',2);" title="Delete" ><img src="'.BASE_URL.'images/DeleteRed_new.gif"></a></div></td>';
	}
		
}
		$data.='</tr></table>';	
			

}
if(empty($data)){$data = '<table id="doc_list-table" width="100%"><tr><td><div align="center" style="color:#FF0000;">Document not found.</div></td></tr></table>';}
echo $data;
exit;