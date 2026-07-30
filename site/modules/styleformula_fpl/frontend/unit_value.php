<?php
$fwMainView = 'file:' . getcwd() . '/unit_value.tpl';
$TABLE = 'unit_value';

$tablecats = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
    $detail = $fwRequest->getParam('unit_value', array());
    $this_id = (int)$detail['uv_id'];
    unset($detail['uv_id']);
    
	
      if($this_id > 0)
    	{
        $tablecats->setWhere("uv_id = $this_id");
		
        $opr = $tablecats->updateRow($detail);   
    	}
    else
    	{
        $opr = $tablecats->insertRow($detail);
    	}    

	$fwViewData['opr'] = $opr;
}

$this_id = (int)$fwRequest->getParam('uv_id', 0);
if ($this_id > 0)
{
	$tablecats = new Fw_Db_Table($TABLE);
	$tablecats->setWhere("uv_id = $this_id");
	$fwViewData['detail'] = $tablecats->getRow();
    $fwViewData['title'] = 'Edit Unit Value';
}
else
{
    $fwViewData['title'] = 'Add Unit Value';
}

$tablePages = new Fw_Db_Table("style_formula_types");
$tablePages->setWhere("sft_statues = 'Active'");
$tablePages->setOrderBy('sft_title ASC');
$fwViewData['formulatypes']=$tablePages->getRows();
