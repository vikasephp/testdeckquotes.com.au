<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$table = new Fw_Db_Table('bus_customers');
$fwViewData['wa_id'] = (int)$fwRequest->getParam('wa_id', 0);
$submit = $fwRequest->getParam('subAddDetail', '');
$user_name = $_SESSION['user']['user_name'];
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('data', array());
	$this_id = (int)$detail['bcust_id'];
	$detail['bcust_vr_who'] = $user_name;


    if($this_id > 0)
    	{
       		 $table->setWhere("bcust_id = $this_id");
	     	 $opr = $table->updateRow($detail);   
    	}
		
	    $fwViewData['opr'] = $opr;		
	
}

$this_id = (int)$fwRequest->getParam($ID, 0);
if ($this_id > 0)
{
	$tableqa = new Fw_Db_Table($TABLE);
	$tableqa->setWhere("$ID = $this_id");
	$detail = $tableqa->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
	
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	


$bcust_id = (int)$fwRequest->getParam('bcust_id', 0);

if(!empty($bcust_id)) {
        $sql = "SELECT  business.bsn_name, business.bsn_address , bus_customers.bcust_id ,  bus_customers.bcust_vr_comp_date,
	bus_customers.bcust_br_budget, bus_customers.bcust_br_gp from business_sellers 		
	Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	Inner Join business ON business_sellers.bs_business_id = business.bsn_id where bus_customers.bcust_id = ".$bcust_id ;
	
	$fwViewData['detail'] = $fwDb->queryOne($sql);
}