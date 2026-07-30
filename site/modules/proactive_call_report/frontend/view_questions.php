<?php
$fwMainView = 'file:' . getcwd() . '/view_questions.tpl';
$qb_id = (int)$fwRequest->getParam('qb_id', 0);
$fwViewData['qb_id'] =  $qb_id;

//$thisTable = new Fw_Db_Table("quote_builder_qa");
//$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

$sqlpr = "Select * from quote_builder_qa where  qq_quote_builder_id = ".$qb_id;
$fwViewData['proceduredata'] = $fwDb->query($sqlpr); 


