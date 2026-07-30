<?php
$table = new Fw_Db_Table('letterboxing_planning');

$submit = $fwRequest->getParam('lbsubmit', '');
if(!empty($submit))
{
	
    $lbdetail = $fwRequest->getParam('letterbox', array());
	
	
	$lbdetail['lb_date'] = changedate_d_m_y($lbdetail['lb_date']);
	$lbdetail['lb_when'] = changedate_d_m_y($lbdetail['lb_when']);
	 
	$opr = $table->insertRow($lbdetail); 
	
	
	$fwViewData['message'] = "Your details has been saved successfully....";
	
}

