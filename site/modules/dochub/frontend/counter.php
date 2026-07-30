<?php

$tabledocument_hub = new Fw_Db_Table('document_hub');
$dh_id = $fwRequest->getparamget('dh_id','');

$sql = "Select document_hub.dh_thisversion, document_hub.dh_alltime from document_hub where dh_id = ".$dh_id;
$version = $fwDb->queryOne($sql);

$counterData['dh_thisversion'] =  $version['dh_thisversion'] + 1;
$counterData['dh_alltime'] =  $version['dh_alltime'] + 1;

$tabledocument_hub ->setWhere("dh_id = ".$dh_id);

	if($tabledocument_hub ->rowExists())
	{
		$tabledocument_hub ->updateRow($counterData);
	}

exit;