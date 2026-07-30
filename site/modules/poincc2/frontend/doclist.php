<?php
$po_id= $fwRequest->getParamget('po_id', '');
if($po_id > 0)
{
	
$thisTable = new Fw_Db_Table('poincc2');
$thisTable->setWhere("po_id = $po_id");
$docData = $thisTable->getRow();
	

if($docData)
{
	$data = '<table id="doc_list-table"><tr>';
	$count = 0;

	$mid = $docData['mid'];
	
	if(!empty($docData['re_survey_link'])) 
	{
	
	$delid = $po_id ;
		
	$re_survey_link = $docData['re_survey_link'];
	$shor_name = PHPTruncate($re_survey_link, 10);
	$iconpath = get_icon_path($v['dhd_type'], $v['dhd_name'], 'template_documents_hub');
	$data.='<td width="50"><div align="center"><a href="#" title="'.$re_survey_link.'"><img src="'.$iconpath.'" width="40"></a><br><a href="#" title="'.$re_survey_link.'">'.$shor_name.'</a>
	<a href="javascript:delete_docfile('.$delid.',1);" title="Delete" ><img src="'.BASE_URL.'images/DeleteRed_new.gif"></a></div></td>';
	}
	
	if(!empty($docData['po_purchase_order_doc'])) 
	{
		$delid = $po_id ;	
			
		$po_purchase_order_doc = $docData['po_purchase_order_doc'];
		$shor_name = PHPTruncate($po_purchase_order_doc, 10);
		$iconpath = get_icon_path($v['dhd_type'], $v['dhd_name'], 'template_documents_hub');
		$data.='<td width="50"><div align="center"><a href="#" title="'.$po_purchase_order_doc.'"><img src="'.$iconpath.'" width="40"></a><br><a href="#" title="'.$po_purchase_order_doc.'">'.$shor_name.'</a>
		<a href="javascript:delete_docfile('.$delid.',1);" title="Delete" ><img src="'.BASE_URL.'images/DeleteRed_new.gif"></a></div></td>';
	}
	
	if(!empty($docData['po_invoice_doc'])) 
	{
		$delid = $po_id ;	
			
		$po_invoice_doc = $docData['po_invoice_doc'];
		$shor_name = PHPTruncate($po_invoice_doc, 10);
		$iconpath = get_icon_path($v['dhd_type'], $v['dhd_name'], 'template_documents_hub');
		$data.='<td width="50"><div align="center"><a href="#" title="'.$po_invoice_doc.'"><img src="'.$iconpath.'" width="40"></a><br><a href="#" title="'.$po_invoice_doc.'">'.$shor_name.'</a>
		<a href="javascript:delete_docfile('.$delid.',2);" title="Delete" ><img src="'.BASE_URL.'images/DeleteRed_new.gif"></a></div></td>';
	}
		
}
		$data.='</tr></table>';	
			

}
if(empty($data)){$data = '<table id="doc_list-table" width="100%"><tr><td><div align="center" style="color:#FF0000;">Document not found.</div></td></tr></table>';}
echo $data;
exit;