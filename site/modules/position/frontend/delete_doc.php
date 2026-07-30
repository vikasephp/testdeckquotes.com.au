<?php

$this_id = (int)$fwRequest->getparam('p_id', 0);
$field = $fwRequest->getparam('field', '');


if ($this_id > 0)
{
    //$thisTable = new Fw_Db_Table('position');
    //$thisTable->setWhere("$ID = $this_id");
    //$thisTable->deleteRow();
	
			//$updateSql = "Update emaillibrary set eml_count = eml_count + 1 where eml_id =".$eml_id;
			//$id = $fwDb->queryOne($updateSql);
	
	$sql = "Update positions set " .$field ." = '' where p_id = ". $this_id; 
	$id = $fwDb->queryOne($sql);
    


}

Location(BASE_URL . $XFA['detail'] .'/p_id/' .$this_id);