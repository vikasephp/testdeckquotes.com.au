<?php
$fwMainView = 'file:' . getcwd() . '/view_type.tpl';
//$thisTable = new Fw_Db_Table("missing_plans_database_type");

$thisTable = new Fw_Db_Table("planning_project_checklist_admin");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

$ppcdocsql = "select * from planning_project_checklist_admin order by `ppc_order`";
$ppcdocdetail = $fwDb->query($ppcdocsql);
$fwViewData['ppcdocdetail'] = $ppcdocdetail;

$fwViewData['page_title'] = $MODULE_PLURAL;
//$fwViewData['primary_id'] = 'mpd_id';
$fwViewData['primary_id'] = 'ppc_id';