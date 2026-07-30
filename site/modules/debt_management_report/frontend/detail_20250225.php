<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail[$ID];

	unset($detail[$ID]);
	
	
	if($_FILES['invoice']['name'])
		{
				$docfile_1 = $_FILES['invoice']['name'];
				$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$temp_name_1 = $_FILES['invoice']['tmp_name'];
				$detail['dm_invoice'] = $docfile_1;
				upload($docfile_1, $temp_name_1);
		}
		
		
	if($_FILES['corresp']['name'])
		{
				$docfile_2 = $_FILES['corresp']['name'];
				$docfile_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
				$temp_name_2 = $_FILES['corresp']['tmp_name'];
				$detail['dm_corresspondace'] = $docfile_2;
				upload($docfile_2, $temp_name_2);
		}
		
	if($_FILES['support_doc']['name'])
		{
				$docfile_3 = $_FILES['support_doc']['name'];
				$docfile_3 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_3);
				$temp_name_3 = $_FILES['support_doc']['tmp_name'];
				$detail['dm_support_doc'] = $docfile_3;
				upload($docfile_3, $temp_name_3);
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

	
$sql = "SELECT  bsn_id, bsn_name, bsn_address from business where bsn_sub_status = 'Open'";
$fwViewData['projdetail'] = $fwDb->query($sql);	