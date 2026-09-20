<?php

$tablebar = new Fw_Db_Table('bus_automated_reports');
$bus_bsn_id = $fwRequest->getparamget('bsn_id','');
$ar_id = $fwRequest->getparamget('ar_id','');
$value = $fwRequest->getparamget('value','');
$yesnoData['bar_report_yesno'] = $value;

$tablebar->setWhere("bar_bsn_id = ".$bus_bsn_id. " And bar_ar_id = ".$ar_id );
$tablebar->updateRow($yesnoData);


//$offerData['bo_best_offer'] = 0;

//$tableBusinessOffer->setWhere("bo_business_id = ".$bus_bsn_id. " And bo_id != ".$bo_id);
//$tableBusinessOffer->updateRow($offerData);

//$sql = "Update business set business.bsn_rank = ".$bus_bsn_rank." where business.bsn_id = ".$bus_bsn_id;

//$data = $fwDb->query($sql);

//$message =  $bus_bsn_id ."-".$bus_bsn_rank;
//send_email('Manoj Soni', 'manojsoniephp@gmail.com', 'Capitalcommercial', 'sales@capitalcommercial.com.au', 'Status Report Apprasing Business', $message, $attachment='');

exit;