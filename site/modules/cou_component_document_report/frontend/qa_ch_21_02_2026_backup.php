<?php
$fwMainView = 'file:' . getcwd() . '/qa_ch.tpl';
$table = new Fw_Db_Table("document_check_list");
$bsn_id = $fwRequest->getParam('bsn_id', '');

$sql_1 = "select cs_project from  construction_scheduler_report where cs_id = " . $cs_id;
$proj = $fwDb->queryOne($sql_1);
$fwViewData['proj_name'] = $proj['cs_project'];

$savedrop = $fwRequest->getParam('savedrop', '');

$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

if (!empty($savedrop)) {


	$detail_1 = $fwRequest->getParam('ba_stamp', '');
	//$detail['cs_ch_user'] = $user; 
	//$detail['cs_ch_date'] = $dt; 

	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 231");
	$opr  = $table->updateRow($detail_1);
	$fwViewData['opr'] =  $opr;

	$detail_2 = $fwRequest->getParam('lmp', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 491");
	$opr  = $table->updateRow($detail_2);
	$fwViewData['opr'] =  $opr;

	$detail_3 = $fwRequest->getParam('cuwal', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 172");
	$opr  = $table->updateRow($detail_3);
	$fwViewData['opr'] =  $opr;


	$detail_4 = $fwRequest->getParam('fbcir', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 169");
	$opr  = $table->updateRow($detail_4);
	$fwViewData['opr'] =  $opr;

	$detail_5 = $fwRequest->getParam('bcpsir', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 152");
	$opr  = $table->updateRow($detail_5);
	$fwViewData['opr'] =  $opr;


	$detail_6 = $fwRequest->getParam('siddoc', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 261");
	$opr  = $table->updateRow($detail_6);
	$fwViewData['opr'] =  $opr;


	$detail_7 = $fwRequest->getParam('tpc_pene', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 155");
	$opr  = $table->updateRow($detail_7);
	$fwViewData['opr'] =  $opr;


	$detail_8 = $fwRequest->getParam('tpc_peri', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 295");
	$opr  = $table->updateRow($detail_8);
	$fwViewData['opr'] =  $opr;

	$detail_9 = $fwRequest->getParam('gc_ss', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 413");
	$opr  = $table->updateRow($detail_9);
	$fwViewData['opr'] =  $opr;

	$detail_10 = $fwRequest->getParam('gc_win', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 156");
	$opr  = $table->updateRow($detail_10);
	$fwViewData['opr'] =  $opr;


	$detail_11 = $fwRequest->getParam('wwfdp', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 289");
	$opr  = $table->updateRow($detail_11);
	$fwViewData['opr'] =  $opr;

	$detail_12 = $fwRequest->getParam('inccer', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 162");
	$opr  = $table->updateRow($detail_12);
	$fwViewData['opr'] =  $opr;

	$detail_13 = $fwRequest->getParam('watcer', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 163");
	$opr  = $table->updateRow($detail_13);
	$fwViewData['opr'] =  $opr;


	$detail_14 = $fwRequest->getParam('sacer', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 296");
	$opr  = $table->updateRow($detail_14);
	$fwViewData['opr'] =  $opr;

	$detail_15 = $fwRequest->getParam('coese', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 294");
	$opr  = $table->updateRow($detail_15);
	$fwViewData['opr'] =  $opr;

	$detail_16 = $fwRequest->getParam('coesac', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 167");
	$opr  = $table->updateRow($detail_16);
	$fwViewData['opr'] =  $opr;


	$detail_17 = $fwRequest->getParam('aocoosbc', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 274");
	$opr  = $table->updateRow($detail_17);
	$fwViewData['opr'] =  $opr;


	$detail_18 = $fwRequest->getParam('boxgutter', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 626");
	$opr  = $table->updateRow($detail_18);
	$fwViewData['opr'] =  $opr;

	$detail_19 = $fwRequest->getParam('plumbing', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 749");
	$opr  = $table->updateRow($detail_19);
	$fwViewData['opr'] =  $opr;

	$cou_component_document_report_qa_log_table = new Fw_Db_Table("cou_component_document_report_qa_log");
	$res = $cou_component_document_report_qa_log_table->insertRow([
		'ccdrql_bsn_id' => $bsn_id,
		'ccdrql_created_by' => $_SESSION['user']['user_id'],
	]);
	// db($res); exit;
}


$sql231 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 231";
$data231 = $fwDb->queryOne($sql231);
$fwViewData['detail231'] = $data231;

$sql491 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 491";
$data491 = $fwDb->queryOne($sql491);
$fwViewData['detail491'] = $data491;

$sql172 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 172";
$data172 = $fwDb->queryOne($sql172);
$fwViewData['detail172'] = $data172;

$sql169 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 169";
$data169 = $fwDb->queryOne($sql169);
$fwViewData['detail169'] = $data169;

$sql152 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 152";
$data152 = $fwDb->queryOne($sql152);
$fwViewData['detail152'] = $data152;


$sql261 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 261";
$data261 = $fwDb->queryOne($sql261);
$fwViewData['detail261'] = $data261;


$sql155 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 155";
$data155 = $fwDb->queryOne($sql155);
$fwViewData['detail155'] = $data155;

$sql295 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 295";
$data295 = $fwDb->queryOne($sql295);
$fwViewData['detail295'] = $data295;

$sql413 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 413";
$data413 = $fwDb->queryOne($sql413);
$fwViewData['detail413'] = $data413;

$sql156 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 156";
$data156 = $fwDb->queryOne($sql156);
$fwViewData['detail156'] = $data156;

$sql289 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 289";
$data289 = $fwDb->queryOne($sql289);
$fwViewData['detail289'] = $data289;

$sql162 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 162";
$data162 = $fwDb->queryOne($sql162);
$fwViewData['detail162'] = $data162;

$sql163 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 163";
$data163 = $fwDb->queryOne($sql163);
$fwViewData['detail163'] = $data163;

$sql296 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 296";
$data296 = $fwDb->queryOne($sql296);
$fwViewData['detail296'] = $data296;

$sql294 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 294";
$data294 = $fwDb->queryOne($sql294);
$fwViewData['detail294'] = $data294;

$sql167 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 167";
$data167 = $fwDb->queryOne($sql167);
$fwViewData['detail167'] = $data167;

$sql274 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 274";
$data274 = $fwDb->queryOne($sql274);

$fwViewData['detail274'] = $data274;

$sql626 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 626";
$data626 = $fwDb->queryOne($sql626);

$fwViewData['detail626'] = $data626;



$sql749 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 749";
$data749 = $fwDb->queryOne($sql749);

$fwViewData['detail749'] = $data749;
