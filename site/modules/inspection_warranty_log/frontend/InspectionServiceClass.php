<?php

require_once(LIB_DIR . 'Fw/Db.php');

class InspectionServiceClass
{
    public function createStatusHistoryTable($warrantyLog)
    {
        $html = '
            <tr>
                <th>Status</th>
                <th>Date</th>
            </tr>';
        $dateFormat = 'd-M-Y';
        // $dateFormat = 'd-M-Y h:i:s a';
        if ($warrantyLog['wa_is_inspection_fee_required_at']) {
            $wa_is_inspection_fee_required_date = date($dateFormat, strtotime($warrantyLog['wa_is_inspection_fee_required_at']));
            $html .= '
                <tr>
                    <td>Inspection Requested</td>
                    <td style="white-space: nowrap;">' . $wa_is_inspection_fee_required_date . '</td>
                </tr>';
            $html .= '<tr>
                <td>Inspection Record</td>
                <td style="white-space: nowrap;">' . $wa_is_inspection_fee_required_date . '</td>
            </tr>';
            $html .= '<tr>
                <td>Customer Action Created</td>
                <td style="white-space: nowrap;">' . $wa_is_inspection_fee_required_date . '</td>
            </tr>';
            $html .= '<tr>
                <td>Email/SMS Sent</td>
                <td style="white-space: nowrap;">' . $wa_is_inspection_fee_required_date . '</td>
            </tr>';
        }
        if ($warrantyLog['wa_is_inspection_fee_required_accepted']) {
            $wa_is_inspection_fee_required_accepted_date = date($dateFormat, strtotime($warrantyLog['wa_is_inspection_fee_required_accepted_at']));
            $html .= '<tr>
                <td>Customer Approved</td>
                <td style="white-space: nowrap;">' . $wa_is_inspection_fee_required_accepted_date . '</td>
            </tr>';
            $html .= '<tr>
                <td>Invitation Auto-Created</td>
                <td style="white-space: nowrap;">' . $wa_is_inspection_fee_required_accepted_date . '</td>
            </tr>';
        }
        if ($warrantyLog['wa_is_inspection_fee_required_cancelled']) {
            $wa_is_inspection_fee_required_cancelled_date = date($dateFormat, strtotime($warrantyLog['wa_is_inspection_fee_required_cancelled_at']));
        }
        if ($warrantyLog['wa_is_inspection_fee_required_scheduled']) {
            $wa_is_inspection_fee_required_scheduled_at = date($dateFormat, strtotime($warrantyLog['wa_is_inspection_fee_required_scheduled_at']));
            $html .= '<tr>
                <td>Customer Selected Window</td>
                <td style="white-space: nowrap;">' . $wa_is_inspection_fee_required_scheduled_at . '</td>
            </tr>';
            $html .= '<tr>
                <td>Inspection Scheduled</td>
                <td style="white-space: nowrap;">' . $wa_is_inspection_fee_required_scheduled_at . '</td>
            </tr>';
            $html .= '<tr>
                <td>Final Pop-up Completed</td>
                <td style="white-space: nowrap;">' . $wa_is_inspection_fee_required_scheduled_at . '</td>
            </tr>';
            $html .= '<tr>
                <td>Calendar Entry Created</td>
                <td style="white-space: nowrap;">' . $wa_is_inspection_fee_required_scheduled_at . '</td>
            </tr>';
        }
        if ($warrantyLog['wa_is_inspection_fee_required_inspection_completed']) {
            $wa_is_inspection_fee_required_inspection_completed_at = date($dateFormat, strtotime($warrantyLog['wa_is_inspection_fee_required_inspection_completed_at']));
            $html .= '<tr>
                <td>' . $warrantyLog['inspection_status'] . '</td>
                <td style="white-space: nowrap;">' . $wa_is_inspection_fee_required_inspection_completed_at . '</td>
            </tr>';
        }

        return $html;
    }

    public function getCompletedInspectionQuery()
    {
        return 'SELECT wa_id, wa_problem, wa_project, wa_inspection_proposed_fees, wa_is_inspection_fee_required_inspection_completed_at, wa_is_inspection_fee_required_inspection_completed, wa_status FROM warranty_log WHERE wa_is_inspection_fee_required_inspection_completed = 1 ORDER BY wa_is_inspection_fee_required_inspection_completed_at DESC';
    }

    public function getInspectionStatusLogsQuery($wa_id, $order = 'desc')
    {
        return 'SELECT *, (SELECT wlis_option FROM warranty_log_inspection_status WHERE wlis_id = wlisl_wlis_id LIMIT 1) AS status_name FROM `warranty_log_inspection_status_log` WHERE wlisl_wa_id = ' . $wa_id . ' HAVING status_name IS NOT NULL ORDER BY wlisl_created_at ' . $order . ';';
    }
}
