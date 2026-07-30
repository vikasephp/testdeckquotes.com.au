<?php 

$tableCalculatorWrapping = new Fw_Db_Table($TABLEWR);
$cw_id = $fwRequest->getParam('cw_id', '');
$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLEWR, array());

	//$detail['sl_link'] = addslashes($detail['sl_link']);

			if($detail['cw_id']>0)
			{
				$tableCalculatorWrapping->setWhere("cw_id = ".$detail['cw_id']);
				$tableCalculatorWrapping->updateRow($detail);
				Location(BASE_URL . $XFA['list_wrapping']);
			}
			else
			{
				$tableCalculatorWrapping->setWhere("cw_id = ".$detail['cw_id']);
				if(!$tableCalculatorWrapping->rowExists())
				{

					$cw_id = $tableCalculatorWrapping->insertRow($detail);             
				}

				else
				{	
					$fwViewData['msg'] = "This Listing Already Present";
				}
			}					

			if(!$fwViewData['msg'])
			{
				Location(BASE_URL . $XFA['list_wrapping']);
			}
}	

if ($cw_id > 0)
{
	$sql = "Select * from calculator_wrapping where cw_id = ". $cw_id;

    $detail = $fwDb->queryOne($sql);			 
	
	$fwViewData['detail'] = $detail;

	$fwViewData['title'] = 'Edit Wrapping Options';
}

else
{
    $fwViewData['title'] = 'Add Wrapping Options';
}