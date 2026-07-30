<?php
//get the current limit
$memlimit = ini_get('memory_limit');
//set it to something else
//ini_set("memory_limit", "512M");
//ini_set('max_execution_time', 0);

$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail[$ID];
  //db($detail);
	unset($detail[$ID]);
	
		if($_FILES['doc']['name'])
		{
				$docfile_1 = $_FILES['doc']['name'];
				$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$temp_name_1 = $_FILES['doc']['tmp_name'];
				$detail['td_document'] = $docfile_1;
				upload($docfile_1, $temp_name_1);
		}
		
		if($_FILES['corr']['name'])
		{
				$docfile_2 = $_FILES['corr']['name'];
				$docfile_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
				$temp_name_2 = $_FILES['corr']['tmp_name'];
				$detail['td_correspondance'] = $docfile_2;
				upload($docfile_2, $temp_name_2);
		}
	
	if($detail['td_invoice_type'] == 'Project Commencement' || $detail['td_invoice_type'] == 'Planning Approvals') {
		$detail['td_hide'] = 1;
	}
	
    if($this_id > 0)
    	{
       		 $tableqa->setWhere("$ID = $this_id");
	     	 $opr = $tableqa->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableqa->insertRow($detail); 
	}    	
	         $fwViewData['opr'] = $opr;
		
		//Location(BASE_URL . $XFA['home']);
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

$sql = "SELECT  business.* from business";
$fwViewData['projdetail'] = $fwDb->query($sql);


$sql_2 = "SELECT  * from invoice_types";
$fwViewData['typeoptions'] = $fwDb->query($sql_2);

