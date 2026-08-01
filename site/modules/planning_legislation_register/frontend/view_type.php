<?php
$fwMainView = 'file:' . getcwd() . '/view_type.tpl';


//$thisTable = new Fw_Db_Table("planning_legislation_doctype");
//$fwViewData['typedata'] = $thisTable->getAllRows();

$sql = 'SELECT * FROM planning_legislation_doctype ORDER BY
    CASE
        WHEN pd_hierarchy = 0 THEN 1
        ELSE 0
    END,
    pd_hierarchy ASC,
	pd_doc_type ASC';
		
$data = $fwDb->query($sql);		
		
$fwViewData['typedata'] = $data; 