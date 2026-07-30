<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$table = new Fw_Db_Table('bus_customers');
$fwViewData['wa_id'] = (int)$fwRequest->getParam('wa_id', 0);
$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
    	$detail = $fwRequest->getParam('data', array());
	$this_id = (int)$detail['bcust_id'];


	unset($detail['bcust_id']);
	
		if($_FILES['image1']['name'])
		{
				$docfile_1 = $_FILES['image1']['name'];
				$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$temp_name_1 = $_FILES['image1']['tmp_name'];
				$detail['wa_image_1'] = $docfile_1;
				upload($docfile_1, $temp_name_1);
				
						
		}
		
	
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


$bsn_id = (int)$fwRequest->getParam('bsn_id', 0);

if(!empty($bsn_id)) {
        $sql = "SELECT  business.bsn_name, business.bsn_address , bus_customers.bcust_id ,  bus_customers.bcust_vr_comp_date,
	 bus_customers.bcust_vr_raw_footage, bus_customers.bcust_vr_youtube, bcust_vr_youtube2, bus_customers.bcust_vr_testimonial,
	 bus_customers.bcust_vr_design_number, bus_customers.bcust_vr_cust_review
	 from business_sellers 		
	
	Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	Inner Join business ON business_sellers.bs_business_id = business.bsn_id where business.bsn_id = ".$bsn_id ;
	
	$fwViewData['detail'] = $fwDb->queryOne($sql);
	

}

