<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table('business');
$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
    $detail = $fwRequest->getParam('dair', array());
	$this_id = (int)$detail['bsn_id'];

	unset($detail['bsn_id']);
	
	
	if($_FILES['invoice']['name'])
		{
				$docfile_1 = $_FILES['invoice']['name'];
				$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$temp_name_1 = $_FILES['invoice']['tmp_name'];
				$detail['bsn_dair_invoice'] = $docfile_1;
				upload($docfile_1, $temp_name_1);
		}
	
	 if($this_id > 0)
    	{
		
       		 $tableqa->setWhere("bsn_id = $this_id");
	     	 $opr = $tableqa->updateRow($detail);
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
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}

	