<?php
$fwMainView = 'file:' . getcwd() . '/show-contacts.tpl';

$submit = $fwRequest->getParam('subAddDetail', '');
$co_id = $fwRequest->getParam('co_id', 0);
$qb_id = $fwRequest->getParam('qb_id', 0);
$fwViewData['co_id'] = $co_id;
$fwViewData['qb_id'] = $qb_id;
$contsave = $fwRequest->getParam('contsave', 0);
if(!empty($contsave)){
	$contact = $fwRequest->getParam('contact', '');
	$qb_id = $fwRequest->getParam('qb_id', '');
	if($contact) {
		$cdata = "|".implode("|",$contact)."|";
	} else {
		$cdata='';	
	}
	
	$sql = "Update quote_builder set qb_supplier_email = '".$cdata. "' where qb_id = ".$qb_id;
	$fwDb->queryOne($sql);
}

	$table = new Fw_Db_Table('quote_builder');
	$table->setWhere("qb_id= $qb_id");
	$data = $table->getRow();

	$sm = trim($data['qb_supplier_email'],"|");
	$fwViewData['qbemail'] = $sm;
	
	$supemail = explode("|",$sm);
	
	$inst='';
	foreach($supemail as $k=>$v)
	{
	$inst .= "'".$v."',";	
	}
	$inst = substr($inst , 0, -1);
	
	
	$matsql = "SELECT contacts.* , companies.co_company_name, type_options.to_option  from contacts 
          	 Inner join companies ON contacts.cs_company = companies.co_id
	  	 Left join type_options on contacts.cs_position = type_options.to_id
	 	 where companies.co_id = ".$co_id ." and length(contacts.cs_primary_email) > 0 order by contacts.cs_is_primary desc ";
	   
	   
	//$matsql = "SELECT contacts.* , companies.co_company_name, type_options.to_option  from contacts 
//           	  Inner join companies ON contacts.cs_company = companies.co_id
//	 	  Left join type_options on contacts.cs_position = type_options.to_id
//	 	  where contacts.cs_primary_email IN ( ".$inst ." ) ";   
	   
	$fwViewData['list'] = $fwDb->query($matsql);
	