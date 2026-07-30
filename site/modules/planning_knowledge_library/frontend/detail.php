<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table($TABLE);

$user_id = $_SESSION['user']['user_id'];

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail[$ID];
	unset($detail[$ID]);
	
	if (!empty($_FILES['planning_knowledge_library']['name']['pkl_doc'])) {		
		$file = $_FILES['planning_knowledge_library'];
		$docfile_1 = $file['name']['pkl_doc'];
		$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);

		$temp_name_1 = $file['tmp_name']['pkl_doc'];

		$fileUploaded = upload($docfile_1, $temp_name_1);
		$detail['pkl_doc'] = $docfile_1;
	}

    if($this_id > 0)
	{
		$tableqa->setWhere("$ID = $this_id");
		$opr = $tableqa->updateRow($detail);   
	}
	else
	{
		$detail['dolr_enquiry_date'] = date('d-m-Y');
		$opr = $tableqa->insertRow($detail); 
	}    	
	$fwViewData['opr'] = $opr;
}

$this_id = (int)$fwRequest->getParam($ID, 0);
if ($this_id > 0)
{
	$tableqa = new Fw_Db_Table($TABLE);
	$tableqa->setWhere("$ID = $this_id");
	$detail = $tableqa->getRow();
    
	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}
