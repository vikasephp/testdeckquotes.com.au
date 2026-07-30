<?php

require_once(LIB_DIR . 'Fw/Db.php');

class ServiceClass
{
    public $fwDb;
    public $common_condition;

    public function __construct()
    {
        $this->fwDb = new Fw_Db;
        $this->common_condition = 'WL.wa_is_inspection_fee_required = 1';
    }

    public function getAllRecordsQuery()
    {
        return 'SELECT B.bsn_name, B.bsn_id, BC.bcust_fname, BC.bcust_lname, BC.bcust_misc_email1, BC.bcust_misc_moble FROM business AS B INNER JOIN business_sellers AS BS ON BS.bs_business_id = B.bsn_id INNER JOIN bus_customers AS BC ON BC.bcust_id = BS.bs_customers_id LEFT JOIN warranty_log AS WL ON B.bsn_name = WL.wa_project WHERE ' . $this->common_condition . ' GROUP BY B.bsn_name';
    }

    public function getLogsByBsnIdQuery($bsn_id)
    {
        return 'SELECT WL.wa_id, WL.wa_problem, WL.wa_wlis_id, WL.wa_inspection_proposed_fees, WL.wa_inspection_acknowledgement_statement, (SELECT wlis_option FROM warranty_log_inspection_status WHERE wlis_id = WL.wa_wlis_id) AS inspection_status, WL.wa_is_inspection_fee_required_by, WL.wa_is_inspection_fee_required_at, WL.wa_is_inspection_fee_required_accepted, WL.wa_is_inspection_fee_required_accepted_at, WL.wa_is_inspection_fee_required_cancelled, WL.wa_is_inspection_fee_required_cancelled_at, (SELECT bs_warranty_last_login_date FROM business_sellers WHERE bs_business_id = B.bsn_id LIMIT 1) AS bs_warranty_last_login_date, (SELECT wlisd_option FROM warranty_log_inspection_schedule_datetime WHERE wlisd_id = WL.wa_is_inspection_fee_required_scheduled) AS wa_is_inspection_fee_required_scheduled, WL.wa_is_inspection_fee_required_scheduled_date, WL.wa_is_inspection_fee_required_scheduled_day, WL.wa_is_inspection_fee_required_scheduled_start_time, WL.wa_is_inspection_fee_required_scheduled_end_time, WL.wa_is_inspection_fee_required_scheduled_at, WL.wa_is_inspection_fee_required_scheduled_actual_start_time, WL.wa_is_inspection_fee_required_scheduled_actual_end_time, WL.wa_is_inspection_fee_required_status_update_at FROM warranty_log AS WL LEFT JOIN business AS B ON B.bsn_name = WL.wa_project WHERE B.bsn_id = ' . $bsn_id . ' AND ' . $this->common_condition . ' ORDER BY wa_id ASC;';
    }

    public function getInspectionFeeNotAcceptedRecords()
    {
        return 'SELECT WL.wa_id, WL.wa_project, WL.wa_problem, WL.wa_is_inspection_fee_required, WL.wa_is_inspection_fee_required_accepted, B.bsn_name, B.bsn_id, BC.bcust_fname, BC.bcust_lname, BC.bcust_misc_email1, BC.bcust_misc_moble FROM warranty_log AS WL LEFT JOIN business AS B ON B.bsn_name = WL.wa_project INNER JOIN business_sellers AS BS ON BS.bs_business_id = B.bsn_id INNER JOIN bus_customers AS BC ON BC.bcust_id = BS.bs_customers_id WHERE ' . $this->common_condition . ';';
    }

    function generateCalendar($month, $year)
    {
        $startDate = date($year . '-' . $month . '-01');
        $endDate = date($year . '-' . $month . '-31');
        $query = 'SELECT wa_id, wa_project, wa_is_inspection_fee_required_scheduled_date, wa_is_inspection_fee_required_scheduled_actual_start_time, wa_is_inspection_fee_required_scheduled_actual_end_time FROM warranty_log WHERE wa_is_inspection_fee_required_scheduled_date BETWEEN "' . $startDate . '" AND "' . $endDate . '" AND wa_is_inspection_fee_required_scheduled_actual_start_time IS NOT NULL AND wa_is_inspection_fee_required_scheduled_actual_end_time IS NOT NULL ORDER BY wa_is_inspection_fee_required_scheduled_date ASC, wa_is_inspection_fee_required_scheduled_actual_start_time ASC';
        $result = $this->fwDb->query($query);
        foreach ($result as $row) {
        }
        // db($sql);

        // First day of the month
        $firstDayOfMonth = mktime(0, 0, 0, $month, 1, $year);
        // Number of days in the month
        $numberDays = date('t', $firstDayOfMonth);
        // Day of the week for the first day (0 for Sunday, 6 for Saturday)
        $dateComponents = getdate($firstDayOfMonth);
        $dayOfWeek = $dateComponents['wday'];

        // Create the calendar table
        $calendar = '<table border="1" class="table-calendar">';
        $calendar .= '<tr><th colspan="7" class="month-cell">' . date('F Y', $firstDayOfMonth) . '</th></tr>';
        $calendar .= '<tr><th>Sun</th><th>Mon</th><th>Tue</th><th>Wed</th><th>Thu</th><th>Fri</th><th>Sat</th></tr>';

        $currentDay = 1;
        $calendar .= '<tr>';

        // Fill in leading empty cells
        if ($dayOfWeek > 0) {
            for ($k = 0; $k < $dayOfWeek; $k++) {
                $calendar .= '<td class="empty-cell"></td>';
            }
        }

        // Fill in the days of the month
        while ($currentDay <= $numberDays) {
            if ($dayOfWeek == 7) {
                $dayOfWeek = 0;
                $calendar .= "</tr><tr>";
            }
            $calendar .= '<td class="day-cell">';
            $calendar .= '<span class="day">' . $currentDay . '</span>';
            $calendar .= '</td>';
            $currentDay++;
            $dayOfWeek++;
        }

        // Fill in trailing empty cells
        if ($dayOfWeek != 7) {
            $remainingDays = 7 - $dayOfWeek;
            for ($k = 0; $k < $remainingDays; $k++) {
                $calendar .= '<td class="empty-cell"></td>';
            }
        }

        $calendar .= '</tr>';
        $calendar .= '</table>';

        return $calendar;
    }

    // Example usage: Display the calendar for December 2025
    // $month = 12; // December
    // $year = 2025;
    // echo generateCalendar($month, $year);
    // public function getRecord(array $data)
    // {
    //     $inspection_warranty_log = [];
    //     if (isset($data['bsn_id']) && isset($data['bcust_id'])) {
    //         $this->primary_table->setWhere('iwl_bsn_id = ' . $data['bsn_id'] . ' AND iwl_bcust_id = ' . $data['bcust_id']);
    //         $inspection_warranty_log = $this->primary_table->getRow();
    //     }

    //     return $inspection_warranty_log;
    // }

    // private function createRecord(array $data)
    // {
    //     return $this->primary_table->insertRow($data);
    // }

    // public function findOrCreateRecord(array $data)
    // {
    //     $inspection_warranty_log = $this->getRecord($data);

    //     if (empty($inspection_warranty_log)) {
    //         $inspection_warranty_log = [
    //             'iwl_bsn_id' => $data['bsn_id'],
    //             'iwl_bcust_id' => $data['bcust_id'],
    //         ];
    //         $iwl_id = $this->createRecord($inspection_warranty_log);
    //         $inspection_warranty_log['iwl_id'] = $iwl_id;
    //     }

    //     return $inspection_warranty_log;
    // }

    // public function getInspectionRecord(array $data, $query = false)
    // {
    //     $inspection_warranty_log_records = [];
    //     if (isset($data['iwl_id']) && isset($data['wa_id'])) {
    //         $this->inspection_warranty_log_records_table->setWhere('iwlr_iwl_id = ' . $data['iwl_id'] . ' AND iwlr_wa_id = ' . $data['wa_id']);
    //         if($query) {
    //             return $this->inspection_warranty_log_records_table;
    //         }
    //         $inspection_warranty_log_records = $this->inspection_warranty_log_records_table->getRow();
    //     }
    //     return $inspection_warranty_log_records;
    // }

    // public function createInspectionRecord(array $data)
    // {
    //     return $this->inspection_warranty_log_records_table->insertRow($data);
    // }

    // public function findOrCreateInspectionRecord(array $data)
    // {
    //     $inspection_warranty_log = $this->findOrCreateRecord($data);

    //     $inspection_warranty_log_records = $this->getInspectionRecord([
    //         'iwl_id' => $inspection_warranty_log['iwl_id'],
    //         'wa_id' => $data['wa_id'],
    //     ]);

    //     if (empty($inspection_warranty_log_records)) {
    //         $inspection_warranty_log_records = [
    //             'iwlr_iwl_id' => $inspection_warranty_log['iwl_id'],
    //             'iwlr_wa_id' => $data['wa_id'],
    //         ];
    //         $iwlr_id = $this->createInspectionRecord($inspection_warranty_log_records);
    //         $inspection_warranty_log_records['iwlr_id'] = $iwlr_id;
    //     }

    //     return $inspection_warranty_log_records;
    // }

    // public function deleteInspectionRecord(array $data)
    // {
    //     if(isset($data['wa_id'])) {
    //         $this->inspection_warranty_log_records_table->setWhere('iwlr_wa_id = ' . $data['wa_id']);
    //         $this->inspection_warranty_log_records_table->deleteRow();
    //     }
    // }
}
