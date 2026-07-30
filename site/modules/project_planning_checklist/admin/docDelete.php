<?php
$this_id = (int)$fwRequest->getparam($ID, 0);

if ($this_id > 0)
{
  $sql = "UPDATE $TABLE
			SET admin_doc_manual = ''
			WHERE $ID = $this_id";
			
	mysql_query($sql);
}

Location(BASE_URL . $XFA['detail']."/$ID/$this_id");