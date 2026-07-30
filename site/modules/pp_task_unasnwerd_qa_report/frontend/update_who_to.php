<?php


$id = $fwRequest->getParam('id', '');
$type = $fwRequest->getParam('type', '');
$value = $fwRequest->getparam('value', '');


if(!empty($value))
{
	if($type=='Project') {
		$sql1 = "Update ps_que_ans set  ps_who_to_answer_it  = '".$value."' where ps_id = ".$id;	 
		$fwDb -> queryOne($sql1);
	}
	
	if($type=='Proposal') {
		$sql2 = "Update proposal_que_ans set  ps_who_to_answer_it  = '".$value."' where ps_id = ".$id;	 
		$fwDb -> queryOne($sql2);
	}
}



 exit;