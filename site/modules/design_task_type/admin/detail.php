<?php
$table = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');
	
if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
    $table_id = (int)$detail[$ID];
    
   
    
    unset($detail[$ID]);

	if(!empty($table_id)){$table->setWhere($ID." = ".$table_id);
	$table->updateRow($detail);}
	else{
		$table->insertRow($detail);
		}

    Location(BASE_URL . $XFA['list']);
}	

$table_id = (int)$fwRequest->getParam($ID, 0);


if ($table_id > 0)
{
	$table->setWhere("$ID = $table_id");
	$detail = $table->getRow();
	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}