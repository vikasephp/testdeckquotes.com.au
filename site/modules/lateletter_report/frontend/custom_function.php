<?php

function getLateLetterReportQuery($where = '', $having = '')
{
    // return 'SELECT PPD.*, B.bsn_id, B.bsn_name, B.bsn_status, DATEDIFF(CURRENT_DATE(), STR_TO_DATE(PPD.ppd_inv_due_date, "%d-%m-%Y")) AS days_late FROM progress_payment_detail AS PPD INNER JOIN business AS B ON PPD.ppd_bsn_id =  B.bsn_id WHERE LENGTH(PPD.ppd_inv_due_date) > 0 AND LENGTH(PPD.ppd_when_payrec) <= 0 AND (B.bsn_status LIKE "%|2|%" OR B.bsn_status LIKE "%|3|%" OR B.bsn_status LIKE "%|4|%" OR B.bsn_status LIKE "%|6|%")';
    return 
    'SELECT
        CAST(IF(PPD.ppd_value IS NULL OR PPD.ppd_value = "", 0, REPLACE(REPLACE(PPD.ppd_value, "$", ""), ",", "")) AS DECIMAL(10,2)) AS paid_value,
        CAST(IF(PPD.ppd_hia_value IS NULL OR PPD.ppd_hia_value = "", 0, REPLACE(REPLACE(PPD.ppd_hia_value, "$", ""), ",", "")) AS DECIMAL(10,2)) AS hia_value,
        DATEDIFF(CURRENT_DATE(), STR_TO_DATE(PPD.ppd_inv_due_date, "%d-%m-%Y")) AS days_late,
        PPD.*, B.bsn_id, B.bsn_name, B.bsn_status FROM progress_payment_detail AS PPD INNER JOIN business AS B ON PPD.ppd_bsn_id =  B.bsn_id
    WHERE
        LENGTH(PPD.ppd_inv_due_date) > 0 AND
        (B.bsn_status LIKE "%|5|%" OR B.bsn_status LIKE "%|3|%" OR B.bsn_status LIKE "%|4|%" OR B.bsn_status LIKE "%|6|%") AND
        PPD.ppd_stage IN ("Floor Systems Complete", "Wall and Roof Frames Complete", "Close Up Complete", "Fixing Complete", "Painting Complete", "Project Completion")' .
        $where . '
    HAVING
        hia_value > paid_value' . $having;

    //  AND PPD.ppd_stage IN ("Floor Systems Complete", "Wall and Roof Frames Complete", "Close Up Complete", "Fixing Complete", "Painting Complete", "Project Completion")
}