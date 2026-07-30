<?php

$tableColumn = new Fw_Db_Table('quote_tracking_columns');
$field = $fwRequest->getParam('field', '');
$value = $fwRequest->getparam('value', '');
$value = str_replace('%20',' ',$value);

if(!empty($field))
{
	
	 $detailcol['qc_text_value'] = $value;
	 $detailcol['qc_column'] = $field;
	 $tableColumn->setWhere("qc_column = '".$field."'");
	 if(!$tableColumn->rowExists()){
		 $opr = $tableColumn->insertRow($detailcol);
	 } else {
		  $opr = $tableColumn->updateRow($detailcol);
	 }
	
	
	//$sql = "Update quote_tracking_columns set  qc_text_value  = '".$value."' where qc_column = '".$field."'";	 
	//$fwDb -> queryOne($sql);
}



 exit;