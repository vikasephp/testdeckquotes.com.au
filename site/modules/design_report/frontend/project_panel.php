<?php
$fwMainView = 'file:' . getcwd() . '/project_panel.tpl';

$sql = "Select  dpn_bsn_id
	from document_proposal_name where dpn_dr_hide = 0";

$bsnData = $fwDb->query($sql);

$indata ="(";
foreach($bsnData as $k => $v)
{
	$indata .= $v['dpn_bsn_id']. ",";	
}

$indata .= "0)";


	
        $sqldesigner = "Select count(*) as tot, prd_name from person_responsible_detail
	        where person_responsible_detail.prd_bsn_id IN ". $indata . " And person_responsible_detail.prd_position = 'Designer'
	        Group by prd_name ";
		
	$dataDesig = $fwDb->query($sqldesigner);
	
	$fwViewData['dataDesig'] =  $dataDesig;

        $sqloa = "Select count(*) as tot, prd_name from person_responsible_detail
	        where person_responsible_detail.prd_bsn_id IN ". $indata . " And person_responsible_detail.prd_position = 'Overseas Architect'
	        Group by prd_name ";
		
	$dataoa = $fwDb->query($sqloa);


	$fwViewData['dataoa'] =  $dataoa;