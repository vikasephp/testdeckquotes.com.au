<?php
$da_id= $fwRequest->getParamget('da_id', '');
if($da_id > 0)
{
	
$thisTable = new Fw_Db_Table('da_tracker');
$thisTable->setWhere("da_id = $da_id");
$docData = $thisTable->getRow();
	

if($docData)
{
	$data = '<table id="doc_list-table"><tr>';
	$count = 0;

	$mid = $docData['mid'];
	
	if(!empty($docData['da_merge_plans'])) 
	{
	
	$delid = $da_id ;
		
	$da_merge_plans = $docData['da_merge_plans'];
	$shor_name = PHPTruncate($da_merge_plans, 10);
	$iconpath = get_icon_path($v['dhd_type'], $v['dhd_name'], 'template_documents_hub');
	$data.='<td width="50"><div align="center"><a href="#" title="'.$re_survey_link.'"><img src="'.$iconpath.'" width="40"></a><br><a href="#" title="'.$da_merge_plans.'">'.$shor_name.'</a>
	<a href="javascript:delete_docfile('.$delid.',1);" title="Delete" ><img src="'.BASE_URL.'images/DeleteRed_new.gif"></a></div></td>';
	}

		
}
		$data.='</tr></table>';	
			

}
if(empty($data)){$data = '<table id="doc_list-table" width="100%"><tr><td><div align="center" style="color:#FF0000;">Document not found.</div></td></tr></table>';}
echo $data;
exit;