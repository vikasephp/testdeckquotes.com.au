<?php
$fwMainView = 'file:' . getcwd() . '/view_wl_whynotrespexpl_history.tpl';

//Query to Show Data Order by Date
$query = "SELECT wa_id, wa_project, wa_why_not_resp_expl, wa_why_not_resp_expl_user, wa_why_not_resp_expl_date FROM `warranty_log` WHERE wa_why_not_resp_expl IS NOT NULL AND wa_why_not_resp_expl <> '' order by STR_TO_DATE(wa_why_not_resp_expl_date, '%d-%m-%Y') desc";

$result = $fwDb->query($query);
$fwViewData['data'] = $result;

$fwViewData['title'] = "Warranty Log Why Not Responsible Explained History";