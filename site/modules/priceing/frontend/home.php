<?php
$tablePages = new Fw_Db_Table($TABLE);
$tableTable = new Fw_Db_Table('job_priceing_options');
$form = $fwRequest->getParam($TABLE, array());

if($form['jp_type'] && $form['jp_subtype'])
{
/*$sql = "Select $TABLE.*, types.jbo_title as type_name, subtypes.jbo_title as subtype_name  from $TABLE
	         Left join job_priceing_options AS types on types.jbo_id = $TABLE.jp_type
			 Left join job_priceing_options AS subtypes on subtypes.jbo_id = $TABLE.jp_subtype ORDER BY $TABLE.jp_subtype";*/
			 $fwViewData['forms'] = $form;
$tableTable->setWhere("jbo_parent = {$form['jp_type']} && jbo_subparent = {$form['jp_subtype']}");			 
$fwViewData['options'] = $tableTable->getRows();	


$sql = "Select job_priceing_data.*, $TABLE.*,types.jbo_title as type_name, subtypes.jbo_title as subtype_name,options.jbo_title as option_name  from job_priceing_data
			 LEFT JOIN $TABLE ON $TABLE.jp_id = job_priceing_data.jp_id
	         LEFT JOIN job_priceing_options AS types on types.jbo_id = $TABLE.jp_type
			 LEFT JOIN job_priceing_options AS subtypes on subtypes.jbo_id = $TABLE.jp_subtype
			 LEFT JOIN job_priceing_options AS options on options.jbo_id = job_priceing_data.jpd_opt_id WHERE $TABLE.jp_type = {$form['jp_type']} && $TABLE.jp_subtype = {$form['jp_subtype']} GROUP BY $TABLE.jp_id ORDER BY $TABLE.jp_subtype";

$fwViewData['lists']= $fwDb->query($sql);

$sql = "Select job_priceing_data.*, types.jbo_title as type_name, subtypes.jbo_title as subtype_name,options.jbo_title as option_name  from job_priceing_data
			 LEFT JOIN $TABLE ON $TABLE.jp_id = job_priceing_data.jp_id
	         LEFT JOIN job_priceing_options AS types on types.jbo_id = $TABLE.jp_type
			 LEFT JOIN job_priceing_options AS subtypes on subtypes.jbo_id = $TABLE.jp_subtype
			 LEFT JOIN job_priceing_options AS options on options.jbo_id = job_priceing_data.jpd_opt_id WHERE $TABLE.jp_type = {$form['jp_type']} && $TABLE.jp_subtype = {$form['jp_subtype']} ORDER BY $TABLE.jp_subtype";
$fwViewData['list']= $fwDb->query($sql);
}












$tableTable->setWhere("jbo_parent = 0");
$fwViewData['parents'] = $tableTable->getRows();

if($form){$fwViewData['detail']['jp_type'] = $form['jp_type']; $fwViewData['detail']['jp_subtype'] = $form['jp_subtype'];}
if($fwViewData['detail']['jp_type'] > 0)
{
$tableTable->setWhere("jbo_parent = {$fwViewData['detail']['jp_type']} && jbo_subparent = 0 && jbo_status = 'Active'");
$fwViewData['subparents'] = $tableTable->getRows();
}

if($fwViewData['detail']['jp_subtype'] > 0)
{
$tableTable->setWhere("jbo_parent = {$fwViewData['detail']['jp_type']} && jbo_subparent = {$fwViewData['detail']['jp_subtype']} && jbo_status = 'Active'");
$fwViewData['options'] = $tableTable->getRows();
}

$fwViewData['title'] = $MODULE_PLURAL;