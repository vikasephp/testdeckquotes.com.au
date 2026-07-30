<?php
$fwMainView = 'file:' . getcwd() . '/add_answer.tpl';
$tableTask = new Fw_Db_Table('warranty_enquiry');

$fwViewData['wa_id'] = (int)$fwRequest->getParam('wa_id', 0);
$fwViewData['we_id'] = (int)$fwRequest->getParam('we_id', 0);



$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
    $detail = $fwRequest->getParam('enquiry', array());
	$wa_id = $fwRequest->getParam('wa_id', 0);
	
	$this_id = (int)$detail['we_id'];
	unset($detail['we_id']);
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['we_id']);
       		 $tableTask->setWhere("we_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
		
		
		$sql1 = "Select wa_project,wa_problem from warranty_log where wa_id = ".$wa_id;
		$pdata = $fwDb->queryOne($sql1);
		
		
		
		$sq12= "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
         		bus_customers.bcust_misc_email1 from business_sellers 		
	 		    Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
			    Inner Join business ON business_sellers.bs_business_id = business.bsn_id where business.bsn_name = '".$pdata['wa_project']."'";
		
		
		$datanew = $fwDb->queryOne($sq12);
		

		
		$sql3 = "Select * from warranty_enquiry where we_id = ".$this_id;
		$enqdata = $fwDb->queryOne($sql3);
		
		
		
		$toname = $datanew['bcust_fname']. ' '.$datanew['bcust_lname'];
		$to = $datanew['bcust_misc_email1'];
		$subject = "A new answer is provided to your warranty issue enquiry";
		
		
		//$to = 'manojsoniephp@gmail.com';
		 
		$html = "<html><body>";
		$html .= '<p>Hi '.$datanew['bcust_fname'].' '.$datanew['bcust_lname'].'</p>';
	    $html .= '<p>Our staff have provided an answer to your enquiry regarding a warranty issue of your project. Please see the below table for details:</p>';
		
		$html .= '<table border="1" cellpadding="5" width="100%">';
		$html .= '<tr>';
		$html .= '<td>Project Address</td>';
		$html .= '<td>'.$pdata['wa_project'].'</td>';
		$html .='</tr>';
		
		$html .= '<tr>';
		$html .= '<td>Problem</td>';
		$html .= '<td>'.$pdata['wa_problem'].'</td>';
		$html .= '</tr>';
		
		$html .= '<tr>';
		$html .= '<td>Enquiry</td>';
		$html .= '<td>'.$enqdata['we_enquiry'].'</td>';
		$html .= '</tr>';
		
		$html .= '<tr>';
		$html .= '<td>Answer</td>';
		$html .= '<td>'.$enqdata['we_answer'].'</td>';
		$html .= '</tr>';
		
		$html .= '</table>';
		
		$html .= '<p>You may also proceed to our Warrnay Report Website to view the newest update of your warranty issues. </p>';
		$html .= '<p>Regards,<br>';
	    $html .= '<p>CGFB Operations Team<br>';
		$html .= "</body></html>";
		 
					   
	    send_email($toname, $to, 'CGFB Warranty Team', 'warranty@cgfb.com.au', $subject, $html, $attachment='');
		
		
		
		
		
	    $fwViewData['opr'] = $opr;
}

    $we_id = (int)$fwRequest->getParam('we_id', 0);

	$tableTask->setWhere("we_id = $we_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
