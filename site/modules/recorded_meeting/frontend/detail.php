<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table($TABLE);
$user_id = $_SESSION['user']['user_id'];

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
	
	$data = explode("|",$detail['cqa_customer_name']);

	$detail['cqa_customer_name'] = trim($data[0]);
	$detail['cqa_project_name'] = trim($data[1]);
	$detail['cqa_project_status'] = trim($data[2]);
	
	$this_id = (int)$detail[$ID];

	$detail['cqa_answer'] = stripslashes($detail['cqa_answer']);
	$detail['cqa_question'] = stripslashes($detail['cqa_question']);

	unset($detail[$ID]);
	$detail['cqa_user_create'] = $_SESSION['user']['user_name'];
	$detail['qa_last_updated'] = date('d/m/Y');
		
		
    if($this_id > 0)
    	{
        $tableqa->setWhere("$ID = $this_id");
		
		$tableusers = new Fw_Db_Table('users');
		$tableusers->setWhere("user_id = $user_id");
		$usrdetail = $tableusers->getRow();
		$detail['qa_last_updated_by'] = $usrdetail['user_name'];
        $opr = $tableqa->updateRow($detail);   
    	}
		else
		{
			 $opr = $tableqa->insertRow($detail); 
		}    	
	    $fwViewData['opr'] = $opr;
		
		//Location(BASE_URL . $XFA['home']);
}

$this_id = (int)$fwRequest->getParam($ID, 0);
if ($this_id > 0)
{
	$tableqa = new Fw_Db_Table($TABLE);
	$tableqa->setWhere("$ID = $this_id");
	$detail = $tableqa->getRow();
	
	$detail['cqa_customer_name'] = $detail['cqa_customer_name'] ." | " .$detail['cqa_project_name'] ." | ". $detail['cqa_project_status'];
	//db($detail);
	//exit;
	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}

	$tableusers = new Fw_Db_Table('users');
	$tableusers->setWhere("user_id = $user_id");
	$usrdetail = $tableusers->getRow();
	$fwViewData['username'] = $usrdetail['user_name'];
	
	
	$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status_date from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id";
		

$fwViewData['projdetail2'] = $fwDb->query($sql);
	