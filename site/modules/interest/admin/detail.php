<?php
$table = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');
	
if(!empty($submit))
{
    $data = $fwRequest->getParam('data', array());
	
	foreach($data as $k_d => $v_d)
	{
		$detail[$k_d] = trim($v_d);
	}

	
    $st_id = (int)$detail[$ID];
    unset($detail[$ID]);


	if(empty($detail['bi_status']))
	{
		$detail['bi_status'] = 0;
	}

	$_SESSION['bi_parent'] = $detail['bi_parent'];
	
	$detail['bi_date_modified'] = date('Y-m-d');
	if(!empty($st_id)){$table->setWhere($ID." = ".$st_id);$table->updateRow($detail);}else{ $detail['bi_date_created'] = date('Y-m-d');  $table->insertRow($detail);}

    Location(BASE_URL . $XFA['list']);
}	



$table -> setWhere("bi_parent = 0");
$main_interest = $table -> getRows();
$fwViewData['main_interest'] = $main_interest;


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
	if($_SESSION['bi_parent'])
	{
		$detail['bi_parent'] =  $_SESSION['bi_parent'];
		$fwViewData['detail'] = $detail;
	}
}

