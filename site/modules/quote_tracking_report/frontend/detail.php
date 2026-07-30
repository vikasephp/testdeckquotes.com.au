<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$table = new Fw_Db_Table('quote_tracking_report');
$tableColumn = new Fw_Db_Table('quote_tracking_columns');
$po_id = $fwRequest->getParam('qt_id', '');
$submit = $fwRequest->getParam('subAddDetail', '');


if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail[$ID];
	
	$sqlbsn = "Select bsn_id from business where bsn_name = '".$detail['qt_project_address']."'";
	$bsndata = $fwDb->queryOne($sqlbsn);
	$detail['qt_bsn_id'] = $bsndata['bsn_id']; 
	
	
    if($this_id > 0)
    	{
       		 $table->setWhere("$ID = $this_id");
	     	 $opr = $table->updateRow($detail);   
    	}
		else
		{
			 $opr = $table->insertRow($detail); 
		}    	
	    $fwViewData['opr'] = "Success";	
		
		$sqlbs= "Update business_sellers set bs_qtr_remove = 0 where bs_business_id = ".$bsndata['bsn_id'];
	    $fwDb->queryOne($sqlbs);	
		
	$sqlcol = "select qc_column, qc_drop_value from quote_tracking_columns ";
	$datacol2 = $fwDb->query($sqlcol);
	
    	$sqla = "Select   bsn_starting_onsite_date from business where bsn_name  = '". $detail['qt_project_address']."'" ;
		$data = $fwDb->queryOne($sqla);


	foreach($datacol2 as $k1=>$v1)
	{
	 	  		   
			$d1 =  date('d-m-Y', strtotime($data['bsn_starting_onsite_date']. $v1['qc_drop_value'] .' days'));
			
			$datanew[$v1['qc_column']] = $d1;
			
			$sqlu = "update quote_tracking_report set ".$v1['qc_column']. " = '".$d1."' where qt_project_address = '".$detail['qt_project_address']."'";
			$fwDb -> queryOne($sqlu);	
	}
		
}	

$this_id = (int)$fwRequest->getParam($ID, 0);
if ($this_id > 0) {
	
    $table = new Fw_Db_Table($TABLE);
	$table->setWhere("$ID = $this_id");
	$detail = $table->getRow();
	

	$fwViewData['detail'] = $detail;
	
}
$fwViewData['title'] = "Add / Edit Quote Tracking Report";

$sql = "SELECT business.bsn_id, business.bsn_name from business ";
$fwViewData['projdetail'] = $fwDb->query($sql);