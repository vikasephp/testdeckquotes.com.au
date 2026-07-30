<?php
$mri_id= $fwRequest->getParamget('mri_id', '');
if($mri_id > 0)
{
	
$thisTable = new Fw_Db_Table('meeting_recording_internal');
$thisTable->setWhere("mri_id = $mri_id");
$docData = $thisTable->getRow();

if($docData)
{
	$data = '<table id="doc_list-table"><tr>';
	$count = 0;

	$mri_id = $docData['mri_id'];
	
	if(!empty($docData['mri_audio_files'])) 
	{
	$delid = $mri_id ;
	
	$mri_audio_files = $docData['mri_audio_files'];
	$shor_name = PHPTruncate($mri_audio_files, 10);
	$iconpath = get_icon_path($v['dhd_type'], $v['dhd_name'], 'template_documents_hub');
	$data.='<td width="50"><div align="center"><a href="#" title="'.$mri_audio_files.'"><img src="'.$iconpath.'" width="40"></a><br><a href="#" title="'.$mri_audio_files.'">'.$shor_name.'</a><a href="javascript:delete_docfile('.$delid.',1);" title="Delete" ><img src="'.BASE_URL.'images/DeleteRed_new.gif"></a></div></td>';
	}
	
	if(!empty($docData['mri_transcript_file'])) 
	{
	$delid = $mri_id ;	
		
	$mri_transcript_file  = $docData['mri_transcript_file'];
	$shor_name = PHPTruncate($mri_transcript_file , 10);
	$iconpath = get_icon_path($v['dhd_type'], $v['dhd_name'], 'template_documents_hub');
	$data.='<td width="50"><div align="center"><a href="#" title="'.$mri_transcript_file .'"><img src="'.$iconpath.'" width="40"></a><br><a href="#" title="'.$mri_transcript_file.'">'.$shor_name.'</a><a href="javascript:delete_docfile('.$delid.',2);" title="Delete" ><img src="'.BASE_URL.'images/DeleteRed_new.gif"></a></div></td>';
	}
		
}
	$data.='</tr></table>';	
			

}
if(empty($data)){$data = '<table id="doc_list-table" width="100%"><tr><td><div align="center" style="color:#FF0000;">Document not found.</div></td></tr></table>';}
echo $data;
exit;