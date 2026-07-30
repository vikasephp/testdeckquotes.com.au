<?php
$fwMainView = 'file:' . getcwd() . '/doctype_list.tpl';
$doc_name = $fwRequest->getparamget('doc_name', '');
if(!empty($doc_name)){
$sql="SELECT document_types.* FROM document_types 
WHERE document_types.dt_name LIKE '%".$doc_name."%'";

$userData= $fwDb->query($sql);

$fwViewData['detail'] = $userData;}