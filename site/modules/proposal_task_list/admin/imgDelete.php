<?php
$this_id = (int)$fwRequest->getparam($ID, 0);

if ($this_id > 0)
{
  $sql = "UPDATE busness_status_task
			SET bst_document = ''
			WHERE bst_id = $this_id";
			
	mysql_query($sql);
}

Location(BASE_URL . $XFA['detail']."/$ID/$this_id");