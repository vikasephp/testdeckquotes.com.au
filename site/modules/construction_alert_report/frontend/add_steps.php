<?php
$fwMainView = 'file:' . getcwd() . '/add_steps.tpl';
$table = new Fw_Db_Table('action_plan_step_detail');
$car_id = $fwRequest->getParam('car_id', 0);
$fwViewData['car_id'] =  $car_id;
$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('desc', array());
	$this_id = (int)$detail['apd_id'];
	unset($detail['apd_id']);
	
	//db($detail);
	//exit;
	
    if($this_id > 0)
    	{
       		 $table->setWhere("apd_id = $this_id");
	     	 $opr = $table->updateRow($detail);   
		 $fwViewData['car_id'] =  $detail['apd_car_id'];
    	}
		else
		{
			 $opr = $table->insertRow($detail); 
			 $fwViewData['car_id'] =  $detail['apd_car_id'];
		}    	
	    $fwViewData['opr'] = $opr;
		
		//Location(BASE_URL . $XFA['home']);
}

$this_id = (int)$fwRequest->getParam('apd_id', 0);
if ($this_id > 0)
{
	$table = new Fw_Db_Table('action_plan_step_detail');
	$table->setWhere("apd_id = $this_id");
	$detail = $table->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	

