<?php

/**
 * If the client does not confirm the rescheduled inspection within 12 hours of the reschedule. System automatically:
 * Cancels the inspection visit
 * Updates linked log(s) to: Approved – Ready for Scheduling 
 * Client must rebook via Customer Action Required 
 * Capacity slot is released 
 */

$warranty_log_inspection_reschedules_table = new Fw_Db_Table('warranty_log_inspection_reschedules');
$warranty_log_inspection_reschedules_table->setWhere('wlir_status = 0 AND wlir_created_at < NOW() - INTERVAL 12 HOUR');
if ($warranty_log_inspection_reschedules_table->rowExists()) {
    $records = $warranty_log_inspection_reschedules_table->getRows();
        
    // update the reschedule status to cancelled
    $warranty_log_inspection_reschedules_table->updateRow([
        'wlir_status' => 2,
    ]);

    $wa_id_array = [];
    foreach ($records as $row) {
        $wa_id_array[] = $row['wlir_wa_id'];
    }

    $warranty_log_table = new Fw_Db_Table('warranty_log');
    $warranty_log_table->setWhere('wa_id IN (' . implode(',', $wa_id_array) . ')');
    if ($warranty_log_table->rowExists()) {
        // change the status to Approved – Ready for Scheduling and release the booking slot
        $wa_wlis_id = 5;
        $warranty_log_table->updateRow([
            'wa_is_inspection_fee_required_accepted' => true,
            'wa_is_inspection_fee_required_accepted_at' => date('Y-m-d H:i:s'),
            'wa_is_inspection_fee_required_scheduled' => 0,
            'wa_is_inspection_fee_required_scheduled_date' => null,
            'wa_is_inspection_fee_required_scheduled_day' => null,
            'wa_is_inspection_fee_required_scheduled_start_time' => null,
            'wa_is_inspection_fee_required_scheduled_end_time' => null,
            'wa_is_inspection_fee_required_scheduled_at' => null,
            'wa_is_inspection_fee_required_scheduled_actual_start_time' => null,
            'wa_is_inspection_fee_required_scheduled_actual_end_time' => null,
            'wa_wlis_id' => $wa_wlis_id,
        ]);

        foreach($warranty_log_table->getRows() as $row) {
            echo $row['wa_id'] . ' - ' . $row['wa_project'] . ' - ' . $row['wa_problem'] . '<br><br>';
            // log the status change for each warranty log
            $warranty_log_inspection_status_log_table = new Fw_Db_Table('warranty_log_inspection_status_log');
            $warranty_log_inspection_status_log_table->insertRow([
                'wlisl_wa_id' => $row['wa_id'],
                'wlisl_wlis_id' => $wa_wlis_id,
                'wlisl_created_by' => 0,
                'wlisl_created_table' => 'cron',
            ]);
        }
    }
}
else {
    echo 'No logs to cancel';
}

exit;