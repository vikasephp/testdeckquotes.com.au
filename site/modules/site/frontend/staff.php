<?php
$fwAuthGroup->forceLogin();
$table = new Fw_Db_Table("frank_staff");
$submit = $fwRequest->getParam('subAddDetail', '');

$cd = date("d-m-Y h:i:sa");
$user = $_SESSION['user']['user_name'];

if(!empty($submit))
{
	
    	$detail = $fwRequest->getParam('staff', array());
	$this_id = (int)$detail['f_id'];
        unset($detail['f_id']);
	
	
	
    if($this_id > 0)
    	{
		
       		 $table->setWhere("f_id = $this_id");
	     	 $opr = $table->updateRow($detail);
    	}
	else
	{	
	
		 //$detail['ph_user_created'] = $user;
		// $detail['ph_date_time'] = $cd;
		 $opr = $table->insertRow($detail); 
		 $fwViewData['opr'] = $opr;
	}    	
    
   
		
		Location(BASE_URL . 'site.stafflist');
}

$this_id = (int)$fwRequest->getParam('f_id', 0);
if ($this_id > 0)
{
	
	$table = new Fw_Db_Table("frank_staff");
	$table->setWhere("f_id = $this_id");
        $detail = $table->getRow();
	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;	
}




