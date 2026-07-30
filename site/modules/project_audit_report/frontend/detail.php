<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table('business');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('myob', array());
    $this_id = (int)$detail['bsn_id'];
    $detail['bsn_par_myob_link_date'] = date('d-m-Y');
	
	
    if($this_id > 0)
    	{
       		 $tableqa->setWhere("bsn_id = $this_id");
	     	 $opr = $tableqa->updateRow($detail);   
    	}
		else
		{
			 $opr = $tableqa->insertRow($detail); 
		}    	
	    $fwViewData['opr'] = $opr;
		
		//Location(BASE_URL . $XFA['home']);
}

$this_id = (int)$fwRequest->getParam('bsn_id', 0);
if ($this_id > 0)
{
	$tableqa = new Fw_Db_Table('business');
	$tableqa->setWhere("bsn_id = $this_id");
	$detail = $tableqa->getRow();
	

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
	$fwViewData['this_id'] = $this_id;
}
else
{
        $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	

