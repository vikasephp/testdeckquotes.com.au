<?php  
$tableCalculatorHandrail = new Fw_Db_Table($TABLEHR);
$chr_id = $fwRequest->getParam('chr_id', '');
$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
	
    $detail = $fwRequest->getParam($TABLEHR, array());

			if($detail['chr_id']>0)
			{
				$tableCalculatorHandrail->setWhere("chr_id = ".$detail['chr_id']);
				$tableCalculatorHandrail->updateRow($detail);
				Location(BASE_URL . $XFA['list_handrail']);
			}
			else
			{
				$tableCalculatorHandrail->setWhere("chr_id = ".$detail['chr_id']);
				if(!$tableCalculatorHandrail->rowExists())
				{

					$chr_id = $tableCalculatorHandrail->insertRow($detail);             
				}

				else
				{	
					$fwViewData['msg'] = "This Listing Already Present";
				}
			}					

			if(!$fwViewData['msg'])
			{
				Location(BASE_URL . $XFA['list_handrail']);
			}
}	

if ($chr_id > 0)
{
	$sql = "Select * from calculator_handrail where chr_id = ". $chr_id;

    $detail = $fwDb->queryOne($sql);			 
	
	$fwViewData['detail'] = $detail;

	$fwViewData['title'] = 'Edit Handrail Options';
}

else
{
    $fwViewData['title'] = 'Add Handrail Options';
}