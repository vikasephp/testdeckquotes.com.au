<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table('designer_tracker');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam($TABLE, array());
		
	$cn = explode("|",$detail['dt_checklist_no']);

	$detail['dt_checklist_no'] = $cn[0];

	
	$cnkno = $detail['dt_checklist_no'];
	
	$tableqa->setWhere("dt_checklist_no = $cnkno");
	$cncheck = $tableqa->getRow();
	
	$this_id = (int)$detail[$ID];
	
	if(empty($cncheck)   OR $this_id > 0) 
	{
		$sql_chk = "select *  from document_proposal_name where dpn_unique_id = '".$cnkno."'";
		$datacn = $fwDb->queryOne($sql_chk);
		
		$sql_chk2 = "select *  from document_renovation_name where dpn_unique_id = '".$cnkno."'";
		$datacn2 = $fwDb->queryOne($sql_chk2);
		
		if(!empty($datacn) || !empty($datacn2))
		{
	
			$this_id = (int)$detail[$ID];
		
		
			unset($detail[$ID]);
			
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
		} else {
			
			$fwViewData['error'] = "No Matching Checklist ID Found";
			$fwViewData['detail'] = $detail;
		}
	} else {
		$fwViewData['msg'] = 'Checklist Number Alrady Exists In The Tracker';
		$fwViewData['detail'] = $detail;
	}
		
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

//get the current limit
$memlimit = ini_get('memory_limit');
//set it to something else
ini_set("memory_limit", "1024M");
ini_set('max_execution_time', 0);

$sql = "SELECT  business.* from business";
$fwViewData['projdetail'] = $fwDb->query($sql);

$sqldt = "Select * from design_team";
$fwViewData['teamData'] = $fwDb->query($sqldt);

$sql_cb = "SELECT business.bsn_id, business.bsn_name, document_proposal_name.dpn_unique_id from business		
	   Inner Join document_proposal_name ON business.bsn_id = document_proposal_name.dpn_bsn_id"; 

$fwViewData['chk_bsn'] = $fwDb->query($sql_cb);