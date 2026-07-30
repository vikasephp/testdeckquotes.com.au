<?php
$ssp_id = $fwRequest->getParamget('ssp_id', '');
if ($ssp_id > 0) {

	$thisTable = new Fw_Db_Table('short_stays_payables_tracker');
	$thisTable->setWhere("ssp_id = $ssp_id");
	$docData = $thisTable->getRow();

	if ($docData) {
		$data = '<table id="doc_list-table"><tr>';

		if (!empty($docData['ssp_purchase_order_doc'])) {
			$delid = $ssp_id;

			$ssp_purchase_order_doc = $docData['ssp_purchase_order_doc'];
			$shor_name = PHPTruncate($ssp_purchase_order_doc, 10);
			$iconpath = get_icon_path($v['dhd_type'], $v['dhd_name'], 'template_documents_hub');
			$data .= '<td width="50"><div align="center"><a href="#" title="' . $ssp_purchase_order_doc . '"><img src="' . $iconpath . '" width="40"></a><br><a href="#" title="' . $ssp_purchase_order_doc . '">' . $shor_name . '</a>
		<a href="javascript:delete_docfile(' . $delid . ',1);" title="Delete" ><img src="' . BASE_URL . 'images/DeleteRed_new.gif"></a></div></td>';
		}

		if (!empty($docData['ssp_invoice_doc'])) {
			$delid = $ssp_id;

			$ssp_invoice_doc = $docData['ssp_invoice_doc'];
			$shor_name = PHPTruncate($ssp_invoice_doc, 10);
			$iconpath = get_icon_path($v['dhd_type'], $v['dhd_name'], 'template_documents_hub');
			$data .= '<td width="50"><div align="center"><a href="#" title="' . $ssp_invoice_doc . '"><img src="' . $iconpath . '" width="40"></a><br><a href="#" title="' . $ssp_invoice_doc . '">' . $shor_name . '</a>
		<a href="javascript:delete_docfile(' . $delid . ',2);" title="Delete" ><img src="' . BASE_URL . 'images/DeleteRed_new.gif"></a></div></td>';
		}

		$data .= '</tr></table>';
	}
}
if (empty($data)) {
	$data = '<table id="doc_list-table" width="100%"><tr><td><div align="center" style="color:#FF0000;">Document not found.</div></td></tr></table>';
}
echo $data;
exit;
