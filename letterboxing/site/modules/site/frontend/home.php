<?php
$table = new Fw_Db_Table('letterboxing');

$submit = $fwRequest->getParam('lbsubmit', '');
if(!empty($submit))
{
	
    	$lbdetail = $fwRequest->getParam('letterbox', array());
	
	$lbdetail['lb_date'] = date("d-m-Y");
	$lbdetail['lb_date_delivered'] = changedate_d_m_y($lbdetail['lb_date_delivered']);
	 
	$opr = $table->insertRow($lbdetail); 
	
	
	$fwViewData['message'] = "Your details has been saved successfully....";
	
}

