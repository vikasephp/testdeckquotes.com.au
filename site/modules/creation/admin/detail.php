<?php
$tablecats = new Fw_Db_Table($TABLE);
$tableOpt= new Fw_Db_Table('inquiry_options');
$submit = $fwRequest->getParam('subAddDetail', '');
$submitopt = $fwRequest->getParam('subAddoptDetail', '');

if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
    $this_id = (int)$detail[$ID];
    unset($detail[$ID]);
	
    if ($this_id > 0)
    	{
        $tablecats->setWhere("$ID = $this_id");
        $tablecats->updateRow($detail);   
    	}
    else
    	{
        $tablecats->insertRow($detail);
    	}    
    Location(BASE_URL . $XFA['list']);
}	

if(!empty($submitopt))
	{
	 $detail = $fwRequest->getParam($TABLE, array());	
	 
	 $optthis_id = (int)$detail['io_id'];
    unset($detail['io_id']);
	 $detail['iog_id'] =  $detail['iqao_id'];	
	 if(!empty($detail['io_name']))
	 	{		
	if($optthis_id > 0)			
			{
			$tableOpt->setWhere("io_id = ".$optthis_id);
			$tableOpt->updateRow($detail);			
			}else{$tableOpt->insertRow($detail);}			
 		}else{
		$fwViewData['error'] = "Please specify option title.";
		}
	}



$this_id = (int)$fwRequest->getParam($ID, 0);
$io_id = (int)$fwRequest->getParam("io_id", 0);


if($io_id > 0)
	{
	$tableOpt->setWhere("io_id = ".$io_id);
	$fwViewData['optiondetail'] = $tableOpt->getRow();
	$fwViewData['button'] = "Edit";
	}else{
	$fwViewData['button'] = "Add";
	}

if ($this_id > 0)
{
	$tablecats->setWhere("$ID = $this_id");
	$detail = $tablecats->getRow();
	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
	$tableOpt->setWhere("iog_id = ".$this_id);
	$fwViewData['optiontems'] = $tableOpt->getRows();
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}