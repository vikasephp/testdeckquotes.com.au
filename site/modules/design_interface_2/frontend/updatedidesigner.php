<?php

$tableDesignInterface = new Fw_Db_Table('design_interface_2');
$di_id = $fwRequest->getparamget('di_id','');
$value = $fwRequest->getparamget('value','');


$designerData['di_designer']  = $value;

$tableDesignInterface->setWhere("di_id = ".$di_id);

	if($tableDesignInterface->rowExists())
	{
			
		$tableDesignInterface->updateRow($designerData);
	}


exit;