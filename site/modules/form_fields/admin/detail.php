<?php
$submit = $fwRequest->getParam('subAddDetail', '');
$tableFormfields = new Fw_Db_Table($TABLE);
$this_id = (int)$fwRequest->getParam($ID, 0);

if(!empty($submit))
{
		$detail = $fwRequest->getParam($TABLE, array());
		$this_id = (int)$detail[$ID];
		unset($detail[$ID]);
	   
		if($this_id > 0)
			{
			$tableFormfields->setWhere("$ID = $this_id");
			$tableFormfields->updateRow($detail);
			}
		else
			{
			$tableFormfields->insertRow($detail);
			}
	 
		Location(BASE_URL . $XFA['list']);
}	

if($this_id > 0)
	{
	$tableFormfields->setWhere($ID." = $this_id");
	$detail = $tableFormfields->getRow();
	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit Field';
	}
else
	{
    $fwViewData['title'] = 'Add New Field';
	}

$tableProjectType = new Fw_Db_Table('project_type');
$fwViewData['project_type'] = $tableProjectType->getAllRows();