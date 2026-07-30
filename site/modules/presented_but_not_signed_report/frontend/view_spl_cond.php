<?php
$fwMainView = 'file:' . getcwd() . '/view_spl_cond.tpl';

$bsn_id = $fwRequest->getParam('bsn_id', 0);

$sql = "SELECT * from bus_special_condition where sp_bsn_id = ".$bsn_id." ORDER BY sp_id DESC";
					
$fwViewData['special_data'] = $fwDb->query($sql);

$fwViewData['title'] = 'Special Conditions';
