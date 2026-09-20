<?php

$tabledocumentchecklist = new Fw_Db_Table('document_check_list');
$doc_id = $fwRequest->getparamget('doc_id','');
$bsn_id = $fwRequest->getparamget('bsn_id','');
$value = $fwRequest->getparamget('value','');


//$title = "Show sale condition link on Edossier";

//$custwwwData['doc_id'] = $doc_id;
//$custwwwData['doc_bsn_id']  = $bsn_id;

$custwwwData['doc_cust_www']  = $value;

$tabledocumentchecklist->setWhere("doc_id = ".$doc_id. " And doc_bsn_id = ".$bsn_id);

	if($tabledocumentchecklist->rowExists())
	{
			
		$tabledocumentchecklist->updateRow($custwwwData);
	}


exit;