<?php
$function = $fwRequest->getParam('function', '');

switch($function)	
		{
		case 'buyer_q_a':
		$bsn_id = $fwRequest->getParam('bsn_id', '');
		$queid = $fwRequest->getParam('queid', '');
		$custid = $fwRequest->getParam('custid', '');
		//send_answer_to_all_buyers_qa($bsn_id,$queid,$custid);	
		send_answer_to_all_buyers_qa($bsn_id);		
		break;
		}
