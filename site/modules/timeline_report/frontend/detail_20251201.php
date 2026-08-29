<?php
//get the current limit
$memlimit = ini_get('memory_limit');
//set it to something else
ini_set("memory_limit", "512M");
ini_set('max_execution_time', 0);

$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table($TABLE);

$tablecode = new Fw_Db_Table('letter_code');
$fwViewData['codedata'] = $tablecode->getRows();

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail[$ID];


	$days = $detail['tc_days_delay'];
	$dt = date('d-m-Y',strtotime($detail['tc_rev_comp_date']. ' + '.$days.' days'));	
	

	unset($detail[$ID]);
	
		if($_FILES['letter']['name'])
		{
				$docfile_1 = $_FILES['letter']['name'];
				$file_type = $_FILES['letter']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$temp_name_1 = $_FILES['letter']['tmp_name'];
				
				upload($docfile_1, $temp_name_1);
				$detail['tc_letter_upload'] = $docfile_1;
				
//				$destination = BASE_DIR.'files/uploads/'.$docfile_1;
//				
//					if(!move_uploaded_file($src, $destination))
//							{
//								//echo "Possible file upload attack";
//							}
//					else
//							{
//								$detail['tc_letter_upload'] = $docfile_1;
//								chmod($destination, 0664);
//							}						
		}
		
		if($_FILES['evidence']['name'])
		{
				
				$docfile_2 = $_FILES['evidence']['name'];
				$docfile_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
				$temp_name_2 = $_FILES['evidence']['tmp_name'];
				$detail['tc_evidence'] = $docfile_2;
				upload($docfile_2, $temp_name_2);
		}	
		
	
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

$sql = "SELECT  business.* from business";
$fwViewData['projdetail'] = $fwDb->query($sql);

$tableUsers = new Fw_Db_Table('users');
$tableUsers->setOrderBy('user_name'.' ASC');
$fwViewData['userdetail'] =  $tableUsers->getRows();