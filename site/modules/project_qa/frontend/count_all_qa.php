<?php
$fwMainView = 'file:' . getcwd() . '/count_all_qa.tpl';

/*$sql_count = "SELECT b.bsn_id, b.bsn_name  AS project_address, COALESCE(pre.pre_onstart_qa, 0) AS pre_onstart_qa, COALESCE(post.post_onsite_qa, 0) AS post_onsite_qa FROM business b LEFT JOIN ( SELECT bqa_bsn_id, COUNT(*) AS pre_onstart_qa FROM business_qa GROUP BY bqa_bsn_id ) pre ON b.bsn_id = pre.bqa_bsn_id LEFT JOIN ( SELECT project_id, COUNT(*) AS post_onsite_qa FROM construction_calendar_enquiries GROUP BY project_id ) post ON b.bsn_id = post.project_id WHERE pre.bqa_bsn_id IS NOT NULL OR post.project_id IS NOT NULL ORDER BY b.bsn_name";*/

$sql_count = "SELECT c.project_id, b.bsn_name AS project_address, COALESCE(pre.pre_onstart_qa, 0) AS pre_onstart_qa, c.post_onsite_qa FROM ( SELECT project_id, COUNT(*) AS post_onsite_qa FROM construction_calendar_enquiries GROUP BY project_id ) c LEFT JOIN business b ON b.bsn_id = c.project_id LEFT JOIN ( SELECT bqa_bsn_id, COUNT(*) AS pre_onstart_qa FROM business_qa GROUP BY bqa_bsn_id ) pre ON pre.bqa_bsn_id = c.project_id ORDER BY b.bsn_name";

$data_count = $fwDb->query($sql_count);

$fwViewData['countData'] = $data_count;