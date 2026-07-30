<?php 

$tableCalculatorDecking = new Fw_Db_Table($TABLE);
$cd_id = $fwRequest->getParam('cd_id', '');
$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());

	$detail['sl_link'] = addslashes($detail['sl_link']);

			if($detail['cd_id']>0)
			{
				$tableCalculatorDecking->setWhere("cd_id = ".$detail['cd_id']);
				$tableCalculatorDecking->updateRow($detail);
				Location(BASE_URL . $XFA['list']);
			}
			else
			{
				$tableCalculatorDecking->setWhere("cd_id = ".$detail['cd_id']);
				if(!$tableCalculatorDecking->rowExists())
				{

					$cd_id = $tableCalculatorDecking->insertRow($detail);             
				}

				else
				{	
					$fwViewData['msg'] = "This Listing Already Present";
				}
			}					

			if(!$fwViewData['msg'])
			{
				Location(BASE_URL . $XFA['list']);
			}
}	

if ($cd_id > 0)
{
	$sql = "Select * from calculator_decking_new where cd_id = ". $cd_id;
    $detail = $fwDb->queryOne($sql);			 
	$fwViewData['detail'] = $detail;
	$fwViewData['title'] = 'Edit Decking Options';
}

else
{
    $fwViewData['title'] = 'Add Decking Options';
}