<?php 
$fwMainView = 'file:' . getcwd() . '/show_meetingrecording_detail.tpl';
$recorded_meeting = new Fw_Db_Table('recorded_meeting');
$submit = $fwRequest->getParam('subAddDetail', '');

$rm_id = $fwRequest->getParam('rm_id', '');
$recorded_meeting->setWhere("rm_id=".$rm_id);
$fwViewData['detailData'] = $recorded_meeting->getRow();