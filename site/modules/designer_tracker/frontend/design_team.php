<?php
$fwMainView = 'file:' . getcwd() . '/design_team.tpl';
$tableqa = new Fw_Db_Table('design_team');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('design_team', array());
	$this_id = (int)$detail['de_id'];
	unset($detail['de_id']);
	
	
    if($this_id > 0)
    	{
       		 $tableqa->setWhere("de_id = $this_id");
	     	 $opr = $tableqa->updateRow($detail);   
    	}
		else
		{
			 $opr = $tableqa->insertRow($detail); 
		}    	
	    $fwViewData['opr'] = $opr;
		
		//Location(BASE_URL . $XFA['home']);
}

$this_id = (int)$fwRequest->getParam('de_id', 0);
if ($this_id > 0)
{
	$tableqa = new Fw_Db_Table('design_team');
	$tableqa->setWhere("de_id = $this_id");
	$detail = $tableqa->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	

//$sql = "SELECT  business.* from business";
//$fwViewData['projdetail'] = $fwDb->query($sql);