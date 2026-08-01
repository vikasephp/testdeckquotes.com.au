<?php
$fwMainView = 'file:' . getcwd() . '/add_detail.tpl';
$tableTask = new Fw_Db_Table('planning_legislation_register');

$fwViewData['opr'] =  false;

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
	
	$val = explode("|",$detail['plr_doc_type']);


	$detail['plr_doc_type']  = $val[0];
	$detail['plr_hierarchy'] = $val[1];

	$this_id = (int)$detail['plr_id'];
	unset($detail['plr_id']);
	
	if (!empty($_FILES[$TABLE]['name']['plr_int_html_url'])) {		
		$file = $_FILES[$TABLE];
		$docfile_1 = $file['name']['plr_int_html_url'];
		$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);

		$temp_name_1 = $file['tmp_name']['plr_int_html_url'];

		$fileUploaded = upload($docfile_1, $temp_name_1);
		$detail['plr_int_html_url'] = $docfile_1;
	}
	
    if($this_id > 0){
		unset($detail['plr_id']);
		$tableTask->setWhere("plr_id = $this_id");
		
		if($detail['plr_original_source'] != $detail['source']) {
			$detail['plr_osource_date'] = date('d-m-Y');	
		}
		
		if($detail['plr_original_pdf'] != $detail['pdf']) {
			$detail['plr_opdf_date'] = date('d-m-Y');	
		}
		
		if($detail['plr_int_html_url'] != $detail['internalhtml']) {
			$detail['plr_int_html_url_date'] = date('d-m-Y');	
		}
		
		$opr = $tableTask->updateRow($detail);   
	}
	else
	{
		if(!empty($detail['plr_original_source'])) {
			$detail['plr_osource_date'] = date('d-m-Y');	
		}
		
		if(!empty($detail['plr_original_pdf'])) {
			$detail['plr_opdf_date'] = date('d-m-Y');	
		}
		
		if(!empty($detail['plr_int_html_url'])) {
			$detail['plr_int_html_url_date'] = date('d-m-Y');	
		}
		
		$opr = $tableTask->insertRow($detail); 
	}    	
	
	$fwViewData['opr'] = true;
}

$detail['plr_id'] = '';
$fwViewData['detail'] = $detail;

$this_id = (int)$fwRequest->getParam('plr_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('planning_legislation_register');
	$tableTask->setWhere("plr_id = $this_id");
	$detail = $tableTask->getRow();
	$fwViewData['detail'] = $detail;

    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add New '.$MODULE_SINGULAR;
}	

$sqlT = "select * from  planning_legislation_doctype where pd_active = 1";
$fwViewData['typedata'] = $fwDb->query($sqlT);

