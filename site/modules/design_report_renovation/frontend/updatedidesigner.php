<?php

$tableDesignInterface = new Fw_Db_Table('design_interface');
$di_id = $fwRequest->getparamget('di_id','');
$value = $fwRequest->getparamget('value','');


//$title = "Show sale condition link on Edossier";

//$custwwwData['doc_id'] = $doc_id;
//$custwwwData['doc_bsn_id']  = $bsn_id;

$designerData['di_designer']  = $value;

$tableDesignInterface->setWhere("di_id = ".$di_id);

	if($tableDesignInterface->rowExists())
	{
			
		$tableDesignInterface->updateRow($designerData);
	}


exit;