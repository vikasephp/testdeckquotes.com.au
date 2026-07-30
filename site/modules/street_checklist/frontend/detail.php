<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tablecats = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');

  $group = array_keys($_SESSION['user']['::groups::']);
  $fwViewData['group'] = $group[0];

if(!empty($submit))
{
    $detail = $fwRequest->getParam('street', array());

    $this_id = (int)$detail[$ID];
    unset($detail[$ID]);



      if($this_id > 0)
    	{
			$tablecats->setWhere("$ID = $this_id");
					
	        $opr = $tablecats->updateRow($detail);   
    	}
    else
    	{
	        $opr = $tablecats->insertRow($detail);
			} 
		//Location(BASE_URL. $XFA['home']);
		$fwViewData['opr'] = $opr;
	
}

$this_id = (int)$fwRequest->getParam($ID, 0);
if ($this_id > 0)
{
	$tablecats = new Fw_Db_Table($TABLE);
	$tablecats->setWhere("$ID = $this_id");
	$fwViewData['detail'] = $tablecats->getRow();
	
	$fwViewData['templ'] = explode("|", $fwViewData['detail']['eml_temp_docs']);
		
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Create '.$MODULE_SINGULAR;
}

$thisTable = new Fw_Db_Table("positions");
$thisTable -> setOrderBy('p_name ASC');
$fwViewData['positions'] = $thisTable->getAllRows(); 

