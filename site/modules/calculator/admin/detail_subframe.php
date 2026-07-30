<?php  

$tableCalculatorWrapping = new Fw_Db_Table($TABLESF);
$csf_id = $fwRequest->getParam('csf_id', '');
$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLESF, array());

	//$detail['sl_link'] = addslashes($detail['sl_link']);

			if($detail['csf_id']>0)
			{
				$tableCalculatorWrapping->setWhere("csf_id = ".$detail['csf_id']);
				$tableCalculatorWrapping->updateRow($detail);
				Location(BASE_URL . $XFA['list_subframe']);
			}
			else
			{
				$tableCalculatorWrapping->setWhere("csf_id = ".$detail['csf_id']);
				if(!$tableCalculatorWrapping->rowExists())
				{

					$csf_id = $tableCalculatorWrapping->insertRow($detail);             
				}

				else
				{	
					$fwViewData['msg'] = "This Listing Already Present";
				}
			}					

			if(!$fwViewData['msg'])
			{
				Location(BASE_URL . $XFA['list_subframe']);
			}
}	

if ($csf_id > 0)
{
	$sql = "Select * from calculator_subframe where csf_id = ". $csf_id;

    $detail = $fwDb->queryOne($sql);			 
	
	$fwViewData['detail'] = $detail;

	$fwViewData['title'] = 'Edit Subframe Options';
}

else
{
    $fwViewData['title'] = 'Add Subframe Options';
}