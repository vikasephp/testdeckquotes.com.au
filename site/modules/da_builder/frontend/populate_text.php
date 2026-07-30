<?php
$fwMainView = 'file:' . getcwd() . '/populate_text.tpl';
$tableTask = new Fw_Db_Table('pp_report_table');
$tableman = new Fw_Db_Table('report_table_main');


$mr_id = $fwRequest->getParam('mr_id', '');


$sql = "Select * from report_rule where rr_mr_id = ".$mr_id;

$fwViewData['textdata'] = $fwDb->query($sql);

$submit = $fwRequest->getParam('addtext', '');
if(!empty($submit))
{
	
	  $rowrum = $fwRequest->getParam('rownum', '');
		
	 $sqlrow = "Select * from report_rule where rr_id = ".$rowrum;	
	 $rowdata = $fwDb->queryOne($sqlrow);
	
	 $sqlfi = "Select mr_statement from report_table_main where mr_id = ".$rowdata['rr_mr_id'];
	 $stdata = $fwDb->queryOne($sqlfi);
		
	 if(strpos($stdata['mr_statement'], $rowdata['rr_text']) !== false){
		 
	 } else {
		
	 
	  $detail['mr_statement'] =  $stdata['mr_statement'] . '<br>'.$rowdata['rr_text'];
	 
	  $tableman->setWhere("mr_id = $rowdata[rr_mr_id]");
	  $opr = $tableman->updateRow($detail);
	
	 }	
	
}

