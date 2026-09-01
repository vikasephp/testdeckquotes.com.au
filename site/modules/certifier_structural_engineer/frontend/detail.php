<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table($TABLE);
$fwViewData['wa_id'] = (int)$fwRequest->getParam('wa_id', 0);
$submit = $fwRequest->getParam('subAddDetail', '');
$yesno = $fwRequest->getParam('yesno', '');

$user_name = $_SESSION['user']['user_name'];
if($yesno)
{
	 foreach($yesno as $k=>$v)
	 {
		  $id = $k; 
	 }
	 
	  $detailTask['wd_yes_no'] = $v;
	  $detailTask['wd_date'] = date('d-m-Y');
	  $table->setWhere('wt_id = '.$id);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detailTask);
	  }
}

if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail[$ID];
	
	
	unset($detail[$ID]);
			
		if($_FILES['survey_result']['name'])
		{
				
				$docfile_2 = $_FILES['survey_result']['name'];
				$docfile_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
				$temp_name_2 = $_FILES['survey_result']['tmp_name'];
				$detail['rr_survery_result'] = $docfile_2;
				upload($docfile_2, $temp_name_2);
		}
	
	
    if($this_id > 0)
    	{
       		 $tableqa->setWhere("$ID = $this_id");
	     	 $opr = $tableqa->updateRow($detail);   
    	}
	else
	{
		
			$tableqa->setWhere("cse_project Like '%" . $detail['cse_project']."%'");

			if (!$tableqa->rowExists()) {
				 $detail['cse_qa'] = 1;
				 $opr = $tableqa->insertRow($detail); 
			} else {
				 $fwViewData['error'] = 'Project Already Exists';		
			}
		 
		 
	}    	
		if (!empty($opr)) {
			$fwViewData['opr'] = 1;
		}
		
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

$sql = "SELECT  bsn_id, bsn_name from business where bsn_sub_status = 'Open'";
$fwViewData['projdetail'] = $fwDb->query($sql);
 	
