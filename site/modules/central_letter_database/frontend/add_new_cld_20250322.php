<?php
$fwMainView = 'file:' . getcwd() . '/add_new_cld.tpl';

$fwViewData['page_title'] = $MODULE_PLURAL;
$fwViewData['primary_id'] = $primary_id = 'cld_id';
$tableTask = new Fw_Db_Table("central_letter_database");

$lettersql = "SELECT * FROM `central_letter_database_letter_type`";
$letterdetail = $fwDb->query($lettersql);
$fwViewData['letterdetail'] = $letterdetail;

$statussql = "SELECT * FROM `central_letter_database_status`";
$statusdetail = $fwDb->query($statussql);
$fwViewData['statusdetail'] = $statusdetail;

$projectsql = "SELECT `bsn_id`, `bsn_name` FROM `business`";
$projectdetail = $fwDb->query($projectsql);
$fwViewData['projectdetail'] = $projectdetail;

$user_id = $_SESSION['user']['user_id'];
$fwViewData['user_id'] = $user_id;

$user_name = $_SESSION['user']['user_name'];
$fwViewData['user_name'] = $user_name;

$submit = $fwRequest->getParam('subAddDetail', '');
if (!empty($submit)) {
	$detail = $fwRequest->getParam('task', array());
	$this_id = (int)$detail[$primary_id];
	unset($detail[$primary_id]);
	
	$project_name = $detail['cld_project_name'];
	$findBSN = "SELECT bsn_id FROM `business` WHERE `bsn_name` LIKE '%$project_name%'";
	$projectbsn = $fwDb->query($findBSN);
    $fwViewData['projectbsn'] = $projectbsn;
    $detail['cld_bsn_id'] = $projectbsn[0]['bsn_id'];
  
    //echo "<pre>"; print_r($projectbsn); exit();
	if ($_FILES['cld_file_name']['name']) {
    	$docfile_1 = $_FILES['cld_file_name']['name'];
    	$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
    	$temp_name_1 = $_FILES['cld_file_name']['tmp_name'];
    	$detailfile['cld_file_name'] = $docfile_1;
    	$fileUploaded = upload($docfile_1, $temp_name_1);
    	$detail['cld_file_name'] = $docfile_1;
    } else {
        $detail['cld_file_name'] = '';
    }
    
	//echo "<pre>"; print_r($detail);exit();
	
	if ($this_id > 0) {
		unset($detail[$primary_id]);
		$tableTask->setWhere("$primary_id = $this_id");
		$opr = $tableTask->updateRow($detail);
	} else {
		$opr = $tableTask->insertRow($detail);
	}
	
	$fwViewData['opr'] = $opr;
}

$this_id = (int)$fwRequest->getParam($primary_id, 0);
if ($this_id > 0) {
	$tableTask = new Fw_Db_Table("central_letter_database");
	$tableTask->setWhere("$primary_id = $this_id");
	$detail = $tableTask->getRow();
	$fwViewData['detail'] = $detail;
	$fwViewData['title'] = 'Edit ' . $MODULE_PLURAL;
} else {
	$fwViewData['title'] = 'Add ' . $MODULE_PLURAL;
}
