<?php
$eml_id = (int)$fwRequest->getparam('eml_id', 0);
if ($eml_id > 0)
{
	$tableEmailLibrary = new Fw_Db_Table('emaillibrary');
	$tableEmailLibrary->setWhere("eml_id = ". $eml_id);
	$fwViewData['emailcontent'] = $tableEmailLibrary->getRow();
    
  
}


