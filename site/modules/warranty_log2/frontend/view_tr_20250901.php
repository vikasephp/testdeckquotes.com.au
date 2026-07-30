<?php
$fwMainView = 'file:' . getcwd() . '/view_tr.tpl';

$submit = $fwRequest->getParam('subAddDetail', '');
$wa_id = $fwRequest->getParam('wa_id', 0);
$fwViewData['wa_id'] =  $wa_id;

$table = new Fw_Db_Table('supplier_email_warranty');

$email_report = $fwRequest->getParam('email_report', '');
if($email_report)
{
	
	 $keys = array_keys($email_report);
	 $ky = $keys[0];
	 $val = $email_report[$ky];
	 if($val == 'on' ) { $edetail['se_auto_email'] = 1; } else { $edetail['se_auto_email'] = 0; }
	 
	 
	 $table->setWhere("se_id = ".$ky);
	 if($table->rowExists())
	 {
		$table->updateRow($edetail);
	 } 
}

$sqlA = "select distinct se_wa_id from supplier_email_warranty ";
$dataA = $fwDb->query($sqlA);
foreach($dataA as $k=>$v)
{
	$sqlB = "select wa_status from warranty_log where wa_id = ".$v['se_wa_id'];
	$dataB = $fwDb->queryOne($sqlB);
	
	
	 $detail['se_status'] = $dataB['wa_status'];
	 $table->setWhere("se_wa_id = ".$v['se_wa_id']);
	 if($table->rowExists())
	 {
		$table->updateRow($detail);
	 } 
}

/*
$sqls = "select se_id, se_wa_id,  se_supplier, se_first_name, se_surname, se_email, sum(se_no_of_alerts) as tot, se_auto_email 
	    from supplier_email_warranty where se_status = 'Open' or se_status = 'Pending' 
        group by se_email order by se_supplier";*/

//Query for Separate Number of Open & Pending Issue
$sqls = "select se_id, se_wa_id, se_supplier, se_first_name, se_surname, se_email, se_auto_email, SUM(CASE WHEN se_status = 'Open' THEN se_no_of_alerts ELSE 0 END) AS open_alerts, SUM(CASE WHEN se_status = 'Pending' THEN se_no_of_alerts ELSE 0 END) AS pending_alerts from supplier_email_warranty where se_status = 'Open' or se_status = 'Pending' group by se_email order by se_supplier";
$supemailData = $fwDb->query($sqls);

foreach($supemailData as $sk=>$sv)
{

	$sqlcom = "Select cs_first_name, cs_surname from contacts where cs_primary_email = '".$sv['se_email']."'";
		
		$comData = $fwDb->query($sqlcom);
		
		if(count($comData) >=2 ) {
		$name1="";
		foreach($comData as $n => $m)
		{
		$name1  .= implode(" ",$m) .", ";
		}
		
		
		
		
		$supemailData[$sk]['se_first_name'] = $name1;
		$supemailData[$sk]['se_surname'] = '';
		
		}
		$sql123 = "select count(*) as total from warranty_log where wa_include_supplier Like '%".$sv['se_supplier']."%' and
                  (wa_status = 'Open' or wa_status = 'Pending' )";
	  
	     
	  	$totData = $fwDb->queryOne($sql123 );
	    $supemailData[$sk]['total'] = $totData['total'];	
	
}


$fwViewData['supemailData'] = $supemailData;
