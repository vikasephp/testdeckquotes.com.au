<?php
$tablePages = new Fw_Db_Table($TABLE);
$sql = "Select $TABLE.*, parents.jbo_title as parent_name, subparents.jbo_title as subparent_name  from $TABLE
	         Left join $TABLE AS parents on parents.$ID = $TABLE.jbo_parent
			 Left join $TABLE AS subparents on subparents.$ID = $TABLE.jbo_subparent ORDER BY $TABLE.jbo_id ASC";
$fwViewData['list']= $fwDb->query($sql);	
$fwViewData['title'] = $MODULE_PLURAL;