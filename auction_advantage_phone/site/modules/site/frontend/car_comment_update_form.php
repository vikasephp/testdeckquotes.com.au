<?php
 
$table = new Fw_Db_Table("construction_alert_report");
$submit = $fwRequest->getParam('subAddDetail', '');
$car_id = $fwRequest->getParam('car_id', 0);

$matsql = "SELECT * from construction_alert_report where car_id = ".$car_id;
	   
$fwViewData['detail'] = $fwDb->queryOne($matsql);

if(!empty($submit))
{
	
    	$cardetail = $fwRequest->getParam('car', array());
	$this_id = (int)$cardetail['car_id'];

	unset($cardetail['car_id']);
	
        if($this_id > 0)
    	{
       		 $table->setWhere("car_id = $this_id");
	     	 $fwViewData['opr'] = $table->updateRow($cardetail);
     	}
		
		
		//Location(BASE_URL . $XFA['home']);
}
