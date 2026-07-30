<?php
$re_id= $fwRequest->getParamget('mid', '');
if($re_id > 0)
{
	
$thisTable = new Fw_Db_Table('recruitment_list');
$thisTable->setWhere("re_id = $re_id");
$docData = $thisTable->getRow();
	

if($docData)
{
	$data = '<table id="doc_list-table"><tr>';
	$count = 0;

	$mid = $docData['mid'];
	
	if(!empty($docData['re_survey_link'])) 
	{
	
	$delid = $re_id ;
		
	$re_survey_link = $docData['re_survey_link'];
	$shor_name = PHPTruncate($re_survey_link, 10);
	$iconpath = get_icon_path($v['dhd_type'], $v['dhd_name'], 'template_documents_hub');
	$data.='<td width="50"><div align="center"><a href="#" title="'.$re_survey_link.'"><img src="'.$iconpath.'" width="40"></a><br><a href="#" title="'.$re_survey_link.'">'.$shor_name.'</a>
	<a href="javascript:delete_docfile('.$delid.',1);" title="Delete" ><img src="'.BASE_URL.'images/DeleteRed_new.gif"></a></div></td>';
	}
	
	if(!empty($docData['re_doc2'])) 
	{
		$delid = $re_id ;	
			
		$re_doc2 = $docData['re_doc2'];
		$shor_name = PHPTruncate($re_doc2, 10);
		$iconpath = get_icon_path($v['dhd_type'], $v['dhd_name'], 'template_documents_hub');
		$data.='<td width="50"><div align="center"><a href="#" title="'.$re_doc2.'"><img src="'.$iconpath.'" width="40"></a><br><a href="#" title="'.$re_doc2.'">'.$shor_name.'</a>
		<a href="javascript:delete_docfile('.$delid.',2);" title="Delete" ><img src="'.BASE_URL.'images/DeleteRed_new.gif"></a></div></td>';
	}
	
	if(!empty($docData['re_doc3'])) 
	{
		$delid = $re_id ;	
			
		$re_doc3 = $docData['re_doc3'];
		$shor_name = PHPTruncate($re_doc3, 10);
		$iconpath = get_icon_path($v['dhd_type'], $v['dhd_name'], 'template_documents_hub');
		$data.='<td width="50"><div align="center"><a href="#" title="'.$re_doc3.'"><img src="'.$iconpath.'" width="40"></a><br><a href="#" title="'.$re_doc3.'">'.$shor_name.'</a>
		<a href="javascript:delete_docfile('.$delid.',3);" title="Delete" ><img src="'.BASE_URL.'images/DeleteRed_new.gif"></a></div></td>';
	}
		
}
		$data.='</tr></table>';	
			

}
if(empty($data)){$data = '<table id="doc_list-table" width="100%"><tr><td><div align="center" style="color:#FF0000;">Document not found.</div></td></tr></table>';}
echo $data;
exit;