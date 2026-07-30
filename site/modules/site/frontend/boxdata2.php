<?php

$sql = "SELECT count(*) as total FROM business_tasks WHERE bt_task_id = 302
AND bt_completed_date >= '2026-07-01'";

$data = $fwDb->query($sql);

db("Todal = " .$data[0]['total']);

exit;
	