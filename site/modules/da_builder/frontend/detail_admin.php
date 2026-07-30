<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableTask = new Fw_Db_Table('report_builder_admin');

//$user_id = $_SESSION['user']['user_id'];

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('rbadmin', array());
	
	$this_id = (int)$detail['ra_id'];
	unset($detail['ra_id']);
	

    if($this_id > 0)
    {
      		 unset($detail['ra_id']);
       		 $tableTask->setWhere("ra_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    }
	
 else
	{
		     $opr = $tableTask->insertRow($detail); 
	}    	
	       
		    $fwViewData['opr'] = $opr;
			
}

$this_id = (int)$fwRequest->getParam('ra_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('report_builder_admin');
	$tableTask->setWhere("ra_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	

//$sql = "SELECT  rt_project_address  from report_table";
//$fwViewData['projdetail'] = $fwDb->query($sql);