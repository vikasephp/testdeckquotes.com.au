<?php
$tableDocCheck = new Fw_Db_Table($TABLE);

$data = $fwRequest -> getParam('data','');

 if($data['mr_id'] > 0): 
	
	$bid = $data['mr_id'];
	$fwViewData['bid'] = $bid;
	
	$fwViewData['button'] = 'admin_button_'.$bid;
	
 endif;

$save_cpi = $fwRequest -> getParam('save_cpi','');

if(!empty($save_cpi))
{
	
	$doc2 = $fwRequest -> getParam('doc2','');
	$but = $fwRequest -> getParam('bid','');
	
	foreach($doc2 as $k => $v)
	{
		
		if($v == 'on') { $value = 1 ; } else { $value = 0 ; }
		
		$buttonset = 'admin_button_'.$but;
		$tableDocCheck->setWhere("admin_doc_id = ".$k);
		$detail2['admin_doc_id'] = $k;
		$detail2[$buttonset] = $value;
		$tableDocCheck->updateRow($detail2);
		
		//db($detail2);
	}
	
	
}

	    	
	$sql = "SELECT ".$TABLE.".* from ".$TABLE." Order By admin_doc_id ASC";		
		
		
	$datadoc = $fwDb->query($sql);
	
	$fwViewData['doc'] = $datadoc;	
	
	


$fwViewData['msg'] = $msg;
$fwViewData['title'] = $MODULE_PLURAL;

$tablebuttons = new Fw_Db_Table('merge_report_buttons');
$fwViewData['buttons'] = $tablebuttons->getRows();