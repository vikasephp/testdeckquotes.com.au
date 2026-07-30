<?php

$fwViewData['show_productpage'] = true;
//$project_item_query = 'SELECT PI.*, IL.il_name FROM project_item AS PI LEFT JOIN item_list AS IL ON IL.il_id = PI.pi_il_id WHERE PI.pi_bsn_id = ' . $bsn_id . ' AND PI.pi_is_visible = 1;';

$room_type = $fwRequest->getParam('room_type', '');
if (!empty($room_type)):
	$room_filter = ' And PI.pi_room_id = '.$room_type ;
	$_SESSION['room_type'] = $room_type;
	$fwViewData['room_type'] = $_SESSION['room_type'];
elseif ($_SESSION['room_type']):
	$room_filter = ' And PI.pi_room_id = '.$room_type ;
	$fwViewData['room_type'] = $_SESSION['room_type'];
else :
	$room_filter = " " ;
endif;

/*Code for Show Open*/
$showall = $fwRequest->getParam('showall', '');
if($showall):
	$project_item_query = 'SELECT PI.*, IL.il_name FROM project_item AS PI LEFT JOIN item_list AS IL ON IL.il_id = PI.pi_il_id WHERE PI.pi_is_synced = 1 and PI.pi_bsn_id = ' . $bsn_id. ' '.$room_filter;
	$_SESSION['showall'] = $showall;
	$fwViewData['showall']=$_SESSION['showall'];

elseif($_SESSION['showall'] && $pagenum > 0):
	$project_item_query = 'SELECT PI.*, IL.il_name FROM project_item AS PI LEFT JOIN item_list AS IL ON IL.il_id = PI.pi_il_id WHERE PI.pi_is_synced = 1 and PI.pi_bsn_id = ' . $bsn_id. ' '.$room_filter;
	$fwViewData['showall']=$_SESSION['showall'];
else: 
	$project_item_query = 'SELECT PI.*, IL.il_name FROM project_item AS PI LEFT JOIN item_list AS IL ON IL.il_id = PI.pi_il_id WHERE PI.pi_is_synced = 1 and PI.pi_bsn_id = ' . $bsn_id . ' AND PI.pi_is_visible = 1 ' .$room_filter;;
endif;

$clear = $fwRequest->getParam('clear', '');
if ($clear) {
	$fwViewData['showall'] = '';
	unset($_SESSION['showall']);
	$fwViewData['room_type'] = '';
	unset($_SESSION['room_type']);
	$project_item_query = 'SELECT PI.*, IL.il_name FROM project_item AS PI LEFT JOIN item_list AS IL ON IL.il_id = PI.pi_il_id WHERE PI.pi_bsn_id = ' . $bsn_id . ' AND PI.pi_is_visible = 1 AND PI.pi_is_synced = 1';
}

//echo $project_item_query;
$result = $fwDb->query($project_item_query);

$sql_project_item = 'SELECT PI.*, IL.il_name FROM project_item AS PI LEFT JOIN item_list AS IL ON IL.il_id = PI.pi_il_id WHERE PI.pi_bsn_id = ' . $bsn_id . ';';
$data_project_item = $fwDb->query($sql_project_item);
$project_item = [];
foreach ($data_project_item as $row) {
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
	
	$sql_update = "UPDATE project_item SET pi_is_synced = 1 WHERE pi_bsn_id = ".$bsn_id;
	$data_update = $fwDb->queryOne($sql_update);
}

$unsync_items = $fwRequest->getParam('unsync_items', '');
if (!empty($unsync_items)) {
	$sql_unsync = "UPDATE project_item SET pi_is_synced = 0 WHERE pi_bsn_id =".$bsn_id;
    $data_unsync = $fwDb->queryOne($sql_unsync);
}

$project_item = $fwDb->query($project_item_query);

// Attach multiple document links from project_item_documents (max 6 per item).
$docsByPiId = array();
$piIds = array();
if (is_array($project_item)) {
	foreach ($project_item as $row) {
		if (!empty($row['pi_id'])) {
			$piIds[] = (int)$row['pi_id'];
		}
	}
}
if (!empty($piIds)) {
	$docs_table = new Fw_Db_Table('project_item_documents');
	$docs_table->setWhere('pid_pi_id IN (' . implode(',', $piIds) . ')');
	$docs_table->setOrderBy('pid_pi_id ASC, pid_sort ASC, pid_id ASC');
	$docsRows = $docs_table->getRows();
	if (is_array($docsRows)) {
		foreach ($docsRows as $docRow) {
			$docPiId = (int)$docRow['pid_pi_id'];
			if (!isset($docsByPiId[$docPiId])) {
				$docsByPiId[$docPiId] = array();
			}
			if (count($docsByPiId[$docPiId]) >= 6) {
				continue;
			}
			$docsByPiId[$docPiId][] = $docRow;
		}
	}
}

foreach ($project_item as $idx => $row) {
	$piId = (int)$row['pi_id'];
	$docs = isset($docsByPiId[$piId]) ? $docsByPiId[$piId] : array();
	// Migrated to project_item_documents — old column fallback no longer needed.
	// if (empty($docs) && (!empty($row['pi_document_name']) || !empty($row['pi_document_link']))) {
	// 	$docs = array(array(
	// 		'pid_name' => $row['pi_document_name'],
	// 		'pid_link' => $row['pi_document_link'],
	// 	));
	// }
	$project_item[$idx]['documents'] = $docs;
}

$fwViewData['project_item_list'] = $project_item;

$query = 'SELECT bsn_name FROM business WHERE bsn_id = ' . $bsn_id . ';';
$business = $fwDb->queryOne($query);

$sql_room = "SELECT * FROM pm_room";
$data_room = $fwDb->query($sql_room);
$fwViewData['data_room'] = $data_room;

$fwViewData['title'] = (isset($business['bsn_name']) ? ($business['bsn_name'] . ' - ') : '') . 'Product and Manufacturers';
