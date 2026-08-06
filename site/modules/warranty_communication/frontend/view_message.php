<?php
$fwMainView = 'file:' . getcwd() . '/view_message.tpl';

$id = $fwRequest->getParam('id', 0);
$type = $fwRequest->getParam('type', '');

if($id > 0) {
    $this_table = new Fw_Db_Table('email_log_new');
    if($type == 'sms') {
        $this_table = new Fw_Db_Table('sms_log');
    }
    $this_table->setWhere("id = $id");
    $data = $this_table->getRow();
    // db($data);
    $fwViewData['message'] = $data['email_message'];
}
$fwViewData['title'] = 'View Message';
