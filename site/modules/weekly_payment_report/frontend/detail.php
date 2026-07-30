<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');

$cd = date("d-m-Y h:i:sa");
$user = $_SESSION['user']['user_name'];

 $fwViewData['user'] = $user;
 

if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail[$ID];

	unset($detail[$ID]);
	
	
	
	if($_FILES['invoices']['name'])
		{
				$docfile_1 = $_FILES['invoices']['name'];
				$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$temp_name_1 = $_FILES['invoices']['tmp_name'];
				$detail['wp_invoices'] = $docfile_1;
				upload($docfile_1, $temp_name_1);
		}
	
	if($_FILES['bankfile']['name'])
		{
				$docfile_2 = $_FILES['bankfile']['name'];
				$docfile_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
				$temp_name_2 = $_FILES['bankfile']['tmp_name'];
				$detail['wp_bank_file'] = $docfile_2;
				upload($docfile_2, $temp_name_2);
		}
		
	if($_FILES['qa_signoff']['name'])
		{
				$docfile_3 = $_FILES['qa_signoff']['name'];
				$docfile_3 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_3);
				$temp_name_3 = $_FILES['qa_signoff']['tmp_name'];
				$detail['wp_qa_signoff'] = $docfile_3;
				upload($docfile_3, $temp_name_3);
		}	
	
	$detail['wp_manual_aud_date'] = date('d-m-Y');
	
    if($this_id > 0)
    	{
		
       		 $tableqa->setWhere("$ID = $this_id");
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
	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;	
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	