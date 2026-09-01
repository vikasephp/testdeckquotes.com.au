<?php
$fwMainView = 'file:' . getcwd() . '/add_doc.tpl';
require_once dirname(__FILE__) . '/cse_extra_docs.php';

$bsn_id = $fwRequest->getParam('bsn_id', '');
$cse_id = $fwRequest->getParam('cse_id', '');
$insp_type = preg_replace('/[^a-z0-9_]/i', '', $fwRequest->getParam('insp_type', 'se_presheet'));
$return = cse_allowed_return($fwRequest->getParam('return', 'view_doc'));

$fwViewData['bsn_id'] = $bsn_id;
$fwViewData['cse_id'] = $cse_id;
$fwViewData['insp_type'] = $insp_type;
$fwViewData['return'] = $return;
$fwViewData['return_url'] = BASE_URL . 'certifier_structural_engineer.' . $return . '/cse_id/' . $cse_id . '/bsn_id/' . $bsn_id;

cse_ensure_insp_type_column($fwDb);

$fwViewData['opr'] =  false;

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail2 = $fwRequest->getParam('type', array());
	$rawDoc = isset($detail2['ss_document']) ? $detail2['ss_document'] : '';
	$pipePos = strrpos($rawDoc, '|');
	if ($pipePos === false) {
		$ss_document = $rawDoc;
		$ss_doc_id = 0;
	} else {
		$ss_document = substr($rawDoc, 0, $pipePos);
		$ss_doc_id = (int)substr($rawDoc, $pipePos + 1);
	}
	if ($ss_doc_id <= 0 && $ss_document !== '') {
		$lookup = $fwDb->queryOne("SELECT admin_doc_id FROM admin_document_check_list WHERE admin_doc_name = '" . addslashes($ss_document) . "'");
		$ss_doc_id = (int)cse_row_val($lookup, 'admin_doc_id');
	}

	$this_id = (int)$detail2['ss_id'];
	$ss_document_sql = addslashes($ss_document);
	$insp_sql = addslashes($insp_type);

	if ($this_id > 0) {
		$fwDb->execute("UPDATE ss_required_doc SET ss_document = '".$ss_document_sql."', ss_doc_id = ".$ss_doc_id.", ss_insp_type = '".$insp_sql."' WHERE ss_id = ".$this_id);
	} else {
		$fwDb->execute("INSERT INTO ss_required_doc (ss_document, ss_doc_id, ss_insp_type) VALUES ('".$ss_document_sql."', ".$ss_doc_id.", '".$insp_sql."')");
	}

	$fwViewData['opr'] = true;
}

$detail['ss_id']='';
$detail['ime_email_template']='';

$fwViewData['detail'] = $detail;

$this_id = (int)$fwRequest->getParam('ss_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('ss_required_doc');
	$tableTask->setWhere("ss_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add New '.$MODULE_SINGULAR;
}	

$sql_doc = "SELECT admin_doc_id, admin_doc_name FROM admin_document_check_list ";
$fwViewData['docData'] = $fwDb->query($sql_doc);
