<?php
$fwMainView = 'file:' . getcwd() . '/notes.tpl';
$tableBusiness = new Fw_Db_Table($TABLE);
$tablenotes = new Fw_Db_Table('mbsl_notes');
$mlbs_id = $fwRequest->getParam($ID, '');
$submit = $fwRequest->getParam('subAddDetail', '');
	
if(!empty($submit))
{
    $detail = $fwRequest->getParam('seller_listing', array());
	$detail['mbsl_date']= date('Y-m-d');
	$detail['mbsl_notes'] = trim($detail['mbsl_notes']); 
	if($detail['mbsl_notes'])
		{
 	$tablenotes->insertRow($detail);             			
	$fwViewData['opr'] = " Data Successfully updated!";
		}	

				
}	



if ($mlbs_id > 0)
	{
		$sql1 = "Select ".$TABLE.".*, business.bsn_id, business.bsn_name, business.bsn_status from ".$TABLE."
				 Left Join business on ".$TABLE.".mlbs_business_id = business.bsn_id where ".$TABLE.".mlbs_id = ". $mlbs_id;
		$detail = $fwDb->queryOne($sql1);			 
		$fwViewData['detail'] = $detail;
	
		$fwViewData['title'] = 'Add Notes';
	}
else
	{
		$fwViewData['title'] = 'Add Notes';
	}

	
	