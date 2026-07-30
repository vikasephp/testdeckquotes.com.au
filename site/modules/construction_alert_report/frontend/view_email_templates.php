<?php
$fwMainView = 'file:' . getcwd() . '/view_email_templates.tpl';

$dt_id = $fwRequest->getParam('dt_id', '');
$fwViewData['dt_id'] = $dt_id;
$_SESSION['dt_id'] = $dt_id;
$where = " WHERE tdt_dt_id =  ". $dt_id;
  



$sql_1 = "Select * from email_template_mini " ; 
$templatedata = $fwDb->query($sql_1);
$fwViewData['templatedata'] =  $templatedata;

//$table = new Fw_Db_Table('designer_tracker');
//$table->setWhere("dt_id  = $dt_id");
//$project = $table->getRow();
//
//
//   $sql = "select dpn_bsn_id from document_proposal_name where dpn_unique_id = '".$project['dt_checklist_no']."'";
//   $ppt = $fwDb->queryOne($sql);
//   
//
//   $sqlq = "select bsn_name from business where bsn_id = '".$ppt['dpn_bsn_id']."'";
//   $bname = $fwDb->queryOne($sqlq);
//   
//  $fwViewData['bsn_name'] = $bname['bsn_name'];