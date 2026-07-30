<?php
$fwMainView = 'file:' . getcwd() . '/date_popup.tpl';
$tableTask = new Fw_Db_Table('quote_tracking_date_popup');
$tablepo = new Fw_Db_Table('quote_tracking_report_po');
$tabledel = new Fw_Db_Table('quote_tracking_report_delivery');

$qt_id = $fwRequest->getParam('qt_id', 0);
$cn = $fwRequest->getParam('cn', '');
$cn = str_replace('%20',' ',$cn);
$fwViewData['cn'] = $cn;

$fi = $fwRequest->getParam('fi', '');

$sql = "Select qt_project_address from quote_tracking_report where qt_id = ".$qt_id;
$pdata = $fwDb->queryOne($sql);
$fwViewData['pdata'] = $pdata;

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('popup', array());
	
	$this_id = (int)$detail['qp_id'];
	unset($detail['qp_id']);
	
	$sql1 = "select qt_bsn_id from quote_tracking_report where qt_id = ".$qt_id;
	$bsn_data = $fwDb->queryOne($sql1);
	$bsn_id = $bsn_data['qt_bsn_id'];
	
	
    if($this_id > 0)
    	{
             unset($detail['qp_id']);
			 $tableTask->setWhere('qp_qt_id = '.$qt_id. ' and qp_component = "'.$cn.'"');
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		     $detail['qp_qt_id'] = $qt_id;
			 $detail['qp_component'] = $cn;
			 $opr = $tableTask->insertRow($detail); 
	}    	
	    
		if($detail['qp_status'] == 'Not Required')
		{
			
			$detail2[$fi] = $detail['qp_status'];
			$tablepo->setWhere('qt_bsn_id = '.$bsn_id);
	     	$opr = $tablepo->updateRow($detail2);
			
			$tabledel->setWhere('qt_bsn_id = '.$bsn_id);
	     	$opr2 = $tabledel->updateRow($detail2);
		}
		
		if($detail['qp_status'] == 'Complete')
		{
			
			$detail2[$fi] = "In Progress";
			$tablepo->setWhere('qt_bsn_id = '.$bsn_id);
	     	$opr = $tablepo->updateRow($detail2);
		}
		
		$fwViewData['opr'] = $opr;
		
	
}

$this_id = (int)$fwRequest->getParam('qp_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('quote_tracking_date_popup');
	$tableTask->setWhere("qp_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	

$tablest = new Fw_Db_Table('quote_tracking_status');

$fwViewData['stdetail'] = $tablest->getRows();

$sqlcom = "Select co_company_name from companies";
$fwViewData['comdetail'] = $fwDb->query($sqlcom);

$sqlcom = "Select * from quote_tracking_date_popup where qp_qt_id = ".$qt_id. " and qp_component = '".$cn."'";
$fwViewData['detail'] = $fwDb->queryOne($sqlcom);
