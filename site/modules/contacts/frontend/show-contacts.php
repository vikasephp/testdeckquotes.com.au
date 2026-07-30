<?php
$fwMainView = 'file:' . getcwd() . '/show-contacts.tpl';

$submit = $fwRequest->getParam('subAddDetail', '');
$co_id = $fwRequest->getParam('co_id', 0);

//	$table = new Fw_Db_Table('contacts');
//	$table->setWhere("cs_company = $co_id");
//	$fwViewData['list'] = $table->getRows();
//        $fwViewData['title'] = 'Contacts';
//	
	//db($fwViewData['list']);
	
	$matsql = "SELECT contacts.* , companies.co_company_name, type_options.to_option  from contacts 
           Inner join companies ON contacts.cs_company = companies.co_id
	   Left join type_options on contacts.cs_position = type_options.to_id
	   where companies.co_id = ".$co_id;
	   
	$fwViewData['list'] = $fwDb->query($matsql);