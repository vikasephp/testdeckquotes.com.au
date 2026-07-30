<?php

$table = new Fw_Db_Table("contact_update_form");
$submit = $fwRequest->getParam('subAddDetail', '');
$cs_id = $fwRequest->getParam('cs_id', 0);

$matsql = "SELECT contacts.* ,  companies.co_company_name from contacts 
           Left join companies ON contacts.cs_company = companies.co_id
	   where contacts.cs_id = ".$cs_id;
	   
	   $fwViewData['detail'] = $fwDb->queryOne($matsql);

if(!empty($submit))
{
	
    	$detail = $fwRequest->getParam('contact', array());
	$this_id = (int)$detail['cu_id'];

	unset($detail['cu_id']);
	
       if($this_id > 0)
    	{
		
       		 $table->setWhere("cu_id = $this_id");
	     	 $opr = $table->updateRow($detail);
    	}
	else
	{	
			
		 $opr = $table->insertRow($detail); 
		 $fwViewData['opr'] = $opr;
	}    	
		
		//Location(BASE_URL . $XFA['home']);
}
