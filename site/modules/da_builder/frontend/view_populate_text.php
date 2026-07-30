<?php
$fwMainView = 'file:' . getcwd() . '/view_populate_text.tpl';
$tableTask = new Fw_Db_Table('report_populate_text');
$tableman = new Fw_Db_Table('report_table_main');

$mr_id = $fwRequest->getParam('mr_id', '');
$rb_id = $fwRequest->getParam('rb_id', '');
$mr_admin_id = $fwRequest->getParam('mr_admin_id', '');

$sqlpt = "select * from report_populate_text where pt_mr_id = ".$mr_id;
$fwViewData['populatedata'] = $fwDb->query($sqlpt);

$fwViewData['mr_id'] = $mr_id;
$fwViewData['rb_id'] = $rb_id;
$fwViewData['mr_admin_id'] = $mr_admin_id;

$submit = $fwRequest->getParam('addtext', '');
if(!empty($submit))
{
	
	 $rowrum = $fwRequest->getParam('rownum', '');
		
	 $sqlrow = "Select * from report_populate_text where pt_id = ".$rowrum;	
	 $rowdata = $fwDb->queryOne($sqlrow);
	
	 $sqlfi = "Select mr_statement from report_table_main where mr_id = ".$rowdata['pt_mr_id'];
	 $stdata = $fwDb->queryOne($sqlfi);
		
	  if(strpos($stdata['mr_statement'], $rowdata['pt_text']) !== false){
		 
	  } else {
	 
	  	$detail['mr_statement'] =  $stdata['mr_statement'] . ''.$rowdata['pt_text'];
	 
	 	$tableman->setWhere("mr_id = $rowdata[pt_mr_id]");
	  	$opr = $tableman->updateRow($detail);
	
	 }	
	
}

$thisTable = new Fw_Db_Table("report_populate_text");
 $thisTable->setWhere("pt_mr_id = $mr_id");
$fwViewData['populatedata'] = $thisTable->getAllRows(); 

$sqlpt = "select * from report_populate_text where pt_rb_id = ".$rb_id. " and pt_mr_admin_id = ".$mr_admin_id;
$fwViewData['populatedata'] = $fwDb->query($sqlpt);