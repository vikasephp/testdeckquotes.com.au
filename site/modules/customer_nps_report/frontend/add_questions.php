<?php
$fwMainView = 'file:' . getcwd() . '/add_questions.tpl';
$tableTask = new Fw_Db_Table('quote_builder_qa');
$qb_id = (int)$fwRequest->getParam('qb_id', 0);
$user_id = $_SESSION['user']['user_id'];
$fwViewData['qb_id'] =  $qb_id;


$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('task', array());
	$qb_id = $detail['qq_quote_builder_id'];
	$this_id = (int)$detail['qq_id'];
	unset($detail['qq_id']);
	
	
	
	if($_FILES['attach_1']['name'])
		{
			$docfile_1 = $_FILES['attach_1']['name'];
			$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
			$temp_name_1 = $_FILES['attach_1']['tmp_name'];
			$quoteData_1['qq_attachment'] = $docfile_1;
			
			upload($docfile_1, $temp_name_1);
			
				$tableTask->setWhere('qq_id = '.$this_id);
				if($tableTask->rowExists())
				{
				
					$detail2 = $tableTask->updateRow($quoteData_1);	
				}		
		}
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['qq_id']);
       		 $tableTask->setWhere("qq_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
		 
		 $sql_1 = "select qb_supplier, qb_project,qb_component from quote_builder where qb_id = ".$qb_id;	
		 $dataSup = $fwDb->queryOne($sql_1);
		
		 $sqlco = "select  contacts.cs_primary_email, companies.co_company_name
		          from contacts Inner Join companies on contacts.cs_company  =  companies.co_id 
			  where companies.co_company_name = '".$dataSup['qb_supplier']."'";
		 $detail_to = $fwDb->query($sqlco); 
		 
		 $sqlcompo = "select qb_component from quote_builder_component where qb_id = ".$dataSup['qb_component'];
		 $component = $fwDb->queryOne($sqlcompo); 
		 
		 $subject =  "New Response";
		 
		 foreach($detail_to as $k => $v)
		 {
		 
		 $to_name = $dataSup['qb_supplier'];	 
		 $to = $v['cs_primary_email'];
		 $from_name = "Cgfb Inclusion Team";
		 $from = "info@cgfb.com.au";
		 
		 $message = '';
		 $message .= "Dear ".$dataSup['qb_supplier'].",<br><br>";
		 $message .= "You have received a new response regarding to the question for ".$dataSup['qb_project']." - " .$component['qb_component'].".<br>";
		 $message .= "Please proceed to <a href='http://www.constructionquotebuilder.com.au'>.:: ConstructionQuoteBuilder - constructionquotebuilder ::.</a> to review the answer. ";	 
		 $message .= "<br><br>";
		 $message .= "Regards, <br>CGFB Inclusions Team "; 
		  
		
		send_email($to_name, $to, $from_name, $from, $subject, $message, $attachment='');
		 //db($message);
		 }
		 
		 //exit;
		 
		 
		 
    	}
	//else
//	{
//		 $opr = $tableTask->insertRow($detail); 
//	}    	
	    $fwViewData['opr'] = $opr;
		
	
}

$this_id = (int)$fwRequest->getParam('qq_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('quote_builder_qa');
	$tableTask->setWhere("qq_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
