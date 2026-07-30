<?php
$fwMainView = 'file:' . getcwd() . '/onsite.tpl';

$sql = 'SELECT business.bsn_id, business.bsn_name, business.bsn_incl_cc_date FROM business WHERE business.bsn_status LIKE "%|5|%" ORDER BY business.bsn_status_sys_date DESC';
$result = $fwDb->query($sql);

$fwViewData['final_list'] = $result;
