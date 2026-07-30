<?php

$fwMainView = 'file:' . getcwd() . '/view_qa.tpl';
$tableqa = new Fw_Db_Table('report_rule');
$rr_id = (int)$fwRequest->getParam('rr_id', 0);
$sql = "Select * from report_rule where rr_id = ".$rr_id;
$listsnew = $fwDb->queryOne($sql);
$fwViewData['detail'] = $listsnew;


	$sqlimg = "select ri_image from report_rule_images where ri_rr_id = ".$rr_id;

	$dataimg = $fwDb->query($sqlimg);
	$fwViewData['imgdata'] = $dataimg;	
	