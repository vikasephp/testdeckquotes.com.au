<?php
$fwMainView = 'file:' . getcwd() . '/view_changed_per.tpl';

$this_id = (int)$fwRequest->getParam('bsn_id', 0);
if ($this_id > 0) {
    $table = new Fw_Db_Table('tracker_choices_changed_log');
    $table->setWhere("tccl_bsn_id = $this_id");
    $table->setOrderBy('tccl_id DESC');
    $records = $table->getRows(2);

    $result = [];
    if (!empty($records)) {
        $result['last_updated_date'] = date('d-M-Y', strtotime($records[0]['tccl_changed_at']));
        $last_week_per = '';
        $this_week_per = $records[0]['tccl_changed_per'];
        $difference_per = '';
        if(isset($records[1])) {
            $last_week_per = $records[1]['tccl_changed_per'];
            $difference_per = $this_week_per - $last_week_per;
        }
        $result['last_week_per'] = $last_week_per != '' ? ($last_week_per . '%') : '-';
        $result['this_week_per'] = $this_week_per . '%';
        $result['difference_per'] = $difference_per != '' ? ($difference_per . '%') : '-';
    }
    $fwViewData['result'] = $result;
}
