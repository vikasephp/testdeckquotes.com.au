<?php

$tabletemplate_docs = new Fw_Db_Table('template_docs');
$dh_id = $fwRequest->getparamget('dh_id','');


$sql = "Select template_docs.dh_thisversion, template_docs.dh_alltime from template_docs where dh_id = ".$dh_id;
$version = $fwDb->queryOne($sql);


$counterData['dh_thisversion'] =  $version['dh_thisversion'] + 1;
$counterData['dh_alltime'] =  $version['dh_alltime'] + 1;


$tabletemplate_docs->setWhere("dh_id = ".$dh_id);

	if($tabletemplate_docs->rowExists())
	{
			
		$tabletemplate_docs->updateRow($counterData);
	}


exit;