<?php
$fwMainView = 'file:' . getcwd() . '/view_en_notes.tpl';
$psre_id = (int)$fwRequest->getParam('psre_id', 0);

$sql = "SELECT psr_enquiry_notes.*, users.user_name FROM `psr_enquiry_notes` Left JOIN users on psr_enquiry_notes.psren_created_by = users.user_id where psr_enquiry_notes.psren_psre_id = ".$psre_id ." order by psr_enquiry_notes.psren_created_at desc ";
$data = $fwDb->query($sql);

$fwViewData['psre_id'] = $psre_id;
$fwViewData['data'] = $data; 