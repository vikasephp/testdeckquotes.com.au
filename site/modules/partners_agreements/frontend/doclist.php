<?php
$id= $fwRequest->getParamget('pm_id', '');
if($id > 0)
{
	
$thisTable = new Fw_Db_Table('position_matrix');
$thisTable->setWhere("pm_id = $id");
$docData = $thisTable->getRow();
	

if($docData)
{
	$data = '<table id="doc_list-table"><tr>';
	$count = 0;

	$pm_id = $docData['pm_id'];
	
	if(!empty($docData['pm_recruitment_text'])) 
	{
	
	$delid = $id ;
		
	$pm_recruitment_text = $docData['pm_recruitment_text'];
	$shor_name = PHPTruncate($pm_recruitment_text, 10);
	$iconpath = get_icon_path($v['dhd_type'], $v['dhd_name'], 'template_documents_hub');
	$data.='<td width="50"><div align="center"><a href="#" title="'.$pm_recruitment_text.'"><img src="'.$iconpath.'" width="40"></a><br><a href="#" title="'.$pm_recruitment_text.'">'.$shor_name.'</a>
	<a href="javascript:delete_docfile('.$delid.',1);" title="Delete" ><img src="'.BASE_URL.'images/DeleteRed_new.gif"></a></div></td>';
	}
	
	if(!empty($docData['pm_key_result_stm'])) 
	{
		$delid = $id ;	
			
		$pm_key_result_stm = $docData['pm_key_result_stm'];
		$shor_name = PHPTruncate($pm_key_result_stm, 10);
		$iconpath = get_icon_path($v['dhd_type'], $v['dhd_name'], 'template_documents_hub');
		$data.='<td width="50"><div align="center"><a href="#" title="'.$pm_key_result_stm.'"><img src="'.$iconpath.'" width="40"></a><br><a href="#" title="'.$pm_key_result_stm.'">'.$shor_name.'</a>
		<a href="javascript:delete_docfile('.$delid.',2);" title="Delete" ><img src="'.BASE_URL.'images/DeleteRed_new.gif"></a></div></td>';
	}
	
	if(!empty($docData['pm_pos_agreement'])) 
	{
		$delid = $id ;	
			
		$pm_pos_agreement = $docData['pm_pos_agreement'];
		$shor_name = PHPTruncate($pm_pos_agreement, 10);
		$iconpath = get_icon_path($v['dhd_type'], $v['dhd_name'], 'template_documents_hub');
		$data.='<td width="50"><div align="center"><a href="#" title="'.$pm_pos_agreement.'"><img src="'.$iconpath.'" width="40"></a><br><a href="#" title="'.$pm_pos_agreement.'">'.$shor_name.'</a>
		<a href="javascript:delete_docfile('.$delid.',3);" title="Delete" ><img src="'.BASE_URL.'images/DeleteRed_new.gif"></a></div></td>';
	}
	
	if(!empty($docData['pm_letter_of_offer'])) 
	{
		$delid = $id ;	
			
		$pm_letter_of_offer = $docData['pm_letter_of_offer'];
		$shor_name = PHPTruncate($pm_letter_of_offer, 10);
		$iconpath = get_icon_path($v['dhd_type'], $v['dhd_name'], 'template_documents_hub');
		$data.='<td width="50"><div align="center"><a href="#" title="'.$pm_letter_of_offer.'"><img src="'.$iconpath.'" width="40"></a><br><a href="#" title="'.$pm_letter_of_offer.'">'.$shor_name.'</a>
		<a href="javascript:delete_docfile('.$delid.',4);" title="Delete" ><img src="'.BASE_URL.'images/DeleteRed_new.gif"></a></div></td>';
	}

	if(!empty($docData['pm_training_plan'])) 
	{
		$delid = $id ;	
			
		$pm_training_plan = $docData['pm_training_plan'];
		$shor_name = PHPTruncate($pm_training_plan, 10);
		$iconpath = get_icon_path($v['dhd_type'], $v['dhd_name'], 'template_documents_hub');
		$data.='<td width="50"><div align="center"><a href="#" title="'.$pm_training_plan.'"><img src="'.$iconpath.'" width="40"></a><br><a href="#" title="'.$pm_training_plan.'">'.$shor_name.'</a>
		<a href="javascript:delete_docfile('.$delid.',5);" title="Delete" ><img src="'.BASE_URL.'images/DeleteRed_new.gif"></a></div></td>';
	}

	
		
}
		$data.='</tr></table>';	
			

}
if(empty($data)){$data = '<table id="doc_list-table" width="100%"><tr><td><div align="center" style="color:#FF0000;">Document not found.</div></td></tr></table>';}
echo $data;
exit;