<?php
$fwMainView = 'file:' . getcwd() . '/view_checklist.tpl';

//$thisTable = new Fw_Db_Table("warranty_checklist_admin");

$sql = "select * from warranty_checklist_admin order by wc_order ";

$fwViewData['taskdata'] = $fwDb->query($sql); 

 