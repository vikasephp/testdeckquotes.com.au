<?php

$tableColumn = new Fw_Db_Table('quote_tracking_columns');
$field = $fwRequest->getParam('field', '');
$value = $fwRequest->getparam('value', '');
$value = str_replace('%20',' ',$value);

if(!empty($field))
{
	
	 $detailcol['qc_res_staff'] = $value;
	 $detailcol['qc_column'] = $field;
	 $tableColumn->setWhere("qc_column = '".$field."'");
	 if(!$tableColumn->rowExists()){
		 $opr = $tableColumn->insertRow($detailcol);
	 } else {
		  $opr = $tableColumn->updateRow($detailcol);
	 }
	
}



 exit;