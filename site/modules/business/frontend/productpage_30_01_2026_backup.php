<?php

$fwViewData['show_productpage'] = true;
$project_item_query = 'SELECT PI.*, IL.il_name FROM project_item AS PI LEFT JOIN item_list AS IL ON IL.il_id = PI.pi_il_id WHERE PI.pi_bsn_id = ' . $bsn_id . ';';
$result = $fwDb->query($project_item_query);
$project_item = [];
foreach ($result as $row) {
    $project_item[$row['pi_il_id']] = $row;
}

$sync_items = $fwRequest->getParam('sync_items', '');
if (!empty($sync_items)) {
    $query = 'SELECT * FROM item_list;';
    $result = $fwDb->query($query);
    foreach ($result as $row) {
        if (!isset($project_item[$row['il_id']])) {
            $query = 'INSERT INTO project_item(pi_bsn_id, pi_il_id) VALUES(' . $bsn_id . ', ' . $row['il_id'] . ');';
            $fwDb->queryOne($query);
        }
    }
}

$project_item = $fwDb->query($project_item_query);
$fwViewData['project_item_list'] = $project_item;

$query = 'SELECT bsn_name FROM business WHERE bsn_id = ' . $bsn_id . ';';
$business = $fwDb->queryOne($query);

$fwViewData['title'] = (isset($business['bsn_name']) ? ($business['bsn_name'] . ' - ') : '') . 'Product and Manufacturers';
