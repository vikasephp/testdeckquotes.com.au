<?php
$fwMainView = 'file:' . getcwd() . '/qa_ch.tpl';
$table = new Fw_Db_Table("document_check_list");
$bsn_id = $fwRequest->getParam('bsn_id', '');

/* $sql_1 = "select cs_project from  construction_scheduler_report where cs_id = " . $cs_id;
$proj = $fwDb->queryOne($sql_1);
$fwViewData['proj_name'] = $proj['cs_project']; */

$sql_1 = "select bsn_name from business where bsn_id = ".$bsn_id;
$proj = $fwDb->queryOne($sql_1);
$fwViewData['proj_name'] = $proj['bsn_name'];

$savedrop = $fwRequest->getParam('savedrop', '');

$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

if (!empty($savedrop)) {

	$detail_ba_appro = $fwRequest->getParam('ba_appro', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 232");
	$opr  = $table->updateRow($detail_ba_appro);
	$fwViewData['opr'] =  $opr;
	
	$detail_com_notice = $fwRequest->getParam('com_notice', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 235");
	$opr  = $table->updateRow($detail_com_notice);
	$fwViewData['opr'] =  $opr;	
	
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
	
	$detail655 = $fwRequest->getParam('detail655', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 655");
	$opr  = $table->updateRow($detail655);
	$fwViewData['opr'] =  $opr;	


	$detail_3 = $fwRequest->getParam('cuwal', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 172");
	$opr  = $table->updateRow($detail_3);
	$fwViewData['opr'] =  $opr;


	/* $detail_4 = $fwRequest->getParam('fbcir', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 169");
	$opr  = $table->updateRow($detail_4);
	$fwViewData['opr'] =  $opr; */

	/* $detail_5 = $fwRequest->getParam('bcpsir', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 152");
	$opr  = $table->updateRow($detail_5);
	$fwViewData['opr'] =  $opr; */


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


	/* $detail_17 = $fwRequest->getParam('aocoosbc', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 274");
	$opr  = $table->updateRow($detail_17);
	$fwViewData['opr'] =  $opr; */


	$detail_18 = $fwRequest->getParam('boxgutter', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 626");
	$opr  = $table->updateRow($detail_18);
	$fwViewData['opr'] =  $opr;

	$detail_19 = $fwRequest->getParam('plumbing', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 749");
	$opr  = $table->updateRow($detail_19);
	$fwViewData['opr'] =  $opr;
	
	$detail169 = $fwRequest->getParam('detail169', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 169");
	$opr  = $table->updateRow($detail169);
	$fwViewData['opr'] =  $opr;
	
	$detail627 = $fwRequest->getParam('detail627', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 627");
	$opr  = $table->updateRow($detail627);
	$fwViewData['opr'] =  $opr;
	
	$detail382 = $fwRequest->getParam('detail382', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 382");
	$opr  = $table->updateRow($detail382);
	$fwViewData['opr'] =  $opr;	
	
	$detail272 = $fwRequest->getParam('detail272', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 272");
	$opr  = $table->updateRow($detail272);
	$fwViewData['opr'] =  $opr;	
	
	$detail653 = $fwRequest->getParam('detail653', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 653");
	$opr  = $table->updateRow($detail653);
	$fwViewData['opr'] =  $opr;	
	
	$detail735 = $fwRequest->getParam('detail735', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 735");
	$opr  = $table->updateRow($detail735);
	$fwViewData['opr'] =  $opr;	
	
	$detail736 = $fwRequest->getParam('detail736', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 736");
	$opr  = $table->updateRow($detail736);
	$fwViewData['opr'] =  $opr;	
	
	$detail737 = $fwRequest->getParam('detail737', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 737");
	$opr  = $table->updateRow($detail737);
	$fwViewData['opr'] =  $opr;	
	
	$detail738 = $fwRequest->getParam('detail738', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 738");
	$opr  = $table->updateRow($detail738);
	$fwViewData['opr'] =  $opr;	
	
	$detail678 = $fwRequest->getParam('detail678', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 678");
	$opr  = $table->updateRow($detail678);
	$fwViewData['opr'] =  $opr;	
	
	$detail679 = $fwRequest->getParam('detail679', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 679");
	$opr  = $table->updateRow($detail679);
	$fwViewData['opr'] =  $opr;	
	
	$detail713 = $fwRequest->getParam('detail713', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 713");
	$opr  = $table->updateRow($detail713);
	$fwViewData['opr'] =  $opr;	
	
	$detail714 = $fwRequest->getParam('detail714', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 714");
	$opr  = $table->updateRow($detail714);
	$fwViewData['opr'] =  $opr;	
	
	$detail739 = $fwRequest->getParam('detail739', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 739");
	$opr  = $table->updateRow($detail739);
	$fwViewData['opr'] =  $opr;	
	
	$detail777 = $fwRequest->getParam('detail777', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 777");
	$opr  = $table->updateRow($detail777);
	$fwViewData['opr'] =  $opr;
	
	$detail274 = $fwRequest->getParam('detail274', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 274");
	$opr  = $table->updateRow($detail274);
	$fwViewData['opr'] =  $opr;
	
	$detail318 = $fwRequest->getParam('detail318', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 318");
	$opr  = $table->updateRow($detail318);
	$fwViewData['opr'] =  $opr;	
	
	$detail691 = $fwRequest->getParam('detail691', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 691");
	$opr  = $table->updateRow($detail691);
	$fwViewData['opr'] =  $opr;	
	
	$detail783 = $fwRequest->getParam('detail783', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 783");
	$opr  = $table->updateRow($detail783);
	$fwViewData['opr'] =  $opr;	
	
	$detail657 = $fwRequest->getParam('detail657', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 657");
	$opr  = $table->updateRow($detail657);
	$fwViewData['opr'] =  $opr;
	
	$detail637 = $fwRequest->getParam('detail637', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 637");
	$opr  = $table->updateRow($detail637);
	$fwViewData['opr'] =  $opr;
	
	$detail149 = $fwRequest->getParam('detail149', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 149");
	$opr  = $table->updateRow($detail149);
	$fwViewData['opr'] =  $opr;
	
	$detail788 = $fwRequest->getParam('detail788', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 788");
	$opr  = $table->updateRow($detail788);
	$fwViewData['opr'] =  $opr;
	
	$detail795 = $fwRequest->getParam('detail795', '');
	$table->setWhere("doc_bsn_id = " . $bsn_id . " and doc_name_id = 795");
	$opr  = $table->updateRow($detail795);
	$fwViewData['opr'] =  $opr;

	$cou_component_document_report_qa_log_table = new Fw_Db_Table("cou_component_document_report_qa_log");
	$res = $cou_component_document_report_qa_log_table->insertRow([
		'ccdrql_bsn_id' => $bsn_id,
		'ccdrql_created_by' => $_SESSION['user']['user_id'],
	]);
	// db($res); exit;
}

$sql232 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 232";
$data232 = $fwDb->queryOne($sql232);
$fwViewData['detail232'] = $data232;

$sql235 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 235";
$data235 = $fwDb->queryOne($sql235);
$fwViewData['detail235'] = $data235;

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

$sql655 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 655";
$data655 = $fwDb->queryOne($sql655);
$fwViewData['detail655'] = $data655;

$sql169 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 169";
$data169 = $fwDb->queryOne($sql169);
$fwViewData['detail169'] = $data169;

$sql627 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 627";
$data627 = $fwDb->queryOne($sql627);
$fwViewData['detail627'] = $data627;

$sql382 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 382";
$data382 = $fwDb->queryOne($sql382);
$fwViewData['detail382'] = $data382;

$sql272 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 272";
$data272 = $fwDb->queryOne($sql272);
$fwViewData['detail272'] = $data272;

$sql653 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 653";
$data653 = $fwDb->queryOne($sql653);
$fwViewData['detail653'] = $data653;

$sql735 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 735";
$data735 = $fwDb->queryOne($sql735);
$fwViewData['detail735'] = $data735;

$sql736 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 736";
$data736 = $fwDb->queryOne($sql736);
$fwViewData['detail736'] = $data736;

$sql737 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 737";
$data737 = $fwDb->queryOne($sql737);
$fwViewData['detail737'] = $data737;

$sql738 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 738";
$data738 = $fwDb->queryOne($sql738);
$fwViewData['detail738'] = $data738;

$sql678 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 678";
$data678 = $fwDb->queryOne($sql678);
$fwViewData['detail678'] = $data678;

$sql679 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 679";
$data679 = $fwDb->queryOne($sql679);
$fwViewData['detail679'] = $data679;

$sql713 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 713";
$data713 = $fwDb->queryOne($sql713);
$fwViewData['detail713'] = $data713;

$sql714 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 714";
$data714 = $fwDb->queryOne($sql714);
$fwViewData['detail714'] = $data714;

$sql739 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 739";
$data739 = $fwDb->queryOne($sql739);
$fwViewData['detail739'] = $data739;

$sql777 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 777";
$data777 = $fwDb->queryOne($sql777);
$fwViewData['detail777'] = $data777;

$sql274 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 274";
$data274 = $fwDb->queryOne($sql274);
$fwViewData['detail274'] = $data274;

$sql318 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 318";
$data318 = $fwDb->queryOne($sql318);
$fwViewData['detail318'] = $data318;

$sql691 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 691";
$data691 = $fwDb->queryOne($sql691);
$fwViewData['detail691'] = $data691;

$sql783 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 783";
$data783 = $fwDb->queryOne($sql783);
$fwViewData['detail783'] = $data783;

$sql657 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 657";
$data657 = $fwDb->queryOne($sql657);
$fwViewData['detail657'] = $data657;

$sql637 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 637";
$data637 = $fwDb->queryOne($sql637);
$fwViewData['detail637'] = $data637;

$sql149 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 149";
$data149 = $fwDb->queryOne($sql149);
$fwViewData['detail149'] = $data149;

$sql788 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 788";
$data788 = $fwDb->queryOne($sql788);
$fwViewData['detail788'] = $data788;

$sql795 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			      where document_check_list.doc_bsn_id = " . $bsn_id . " And document_check_list.doc_name_id = 795";
$data795 = $fwDb->queryOne($sql795);
$fwViewData['detail795'] = $data795;
