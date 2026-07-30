<?php  
$tableCalculatorStairs = new Fw_Db_Table($TABLEST);
$cst_id = $fwRequest->getParam('cst_id', '');
$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
	$detail = $fwRequest->getParam($TABLEST, array());

			if($detail['cst_id']>0)
			{
				$tableCalculatorStairs->setWhere("cst_id = ".$detail['cst_id']);
				$tableCalculatorStairs->updateRow($detail);
				Location(BASE_URL . $XFA['list_stairs']);
			}
			else
			{
				$tableCalculatorStairs->setWhere("cst_id = ".$detail['cst_id']);
				if(!$tableCalculatorStairs->rowExists())
				{
					$cst_id = $tableCalculatorStairs->insertRow($detail);             
				}

				else
				{	
					$fwViewData['msg'] = "This Listing Already Present";
				}
			}					

			if(!$fwViewData['msg'])
			{
				Location(BASE_URL . $XFA['list_stairs']);
			}
}	

if ($cst_id > 0)
{
	$sql = "Select * from calculator_stairs where cst_id = ". $cst_id;

    $detail = $fwDb->queryOne($sql);			 
	
	$fwViewData['detail'] = $detail;

	$fwViewData['title'] = 'Edit Stairs Options';
}

else
{
    $fwViewData['title'] = 'Add Stairs Options';
}