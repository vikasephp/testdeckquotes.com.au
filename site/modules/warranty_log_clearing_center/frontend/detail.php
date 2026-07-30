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

	if($detail['wa_qicc'] == 'on') {
		$detail['wa_qicc'] = 1;
	} else {
		$detail['wa_qicc'] = 0;	
	}

	$detail['wa_user'] = $user_name;


	unset($detail[$ID]);
	
		if($_FILES['image1']['name'])
		{
				$docfile_1 = $_FILES['image1']['name'];
				$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$temp_name_1 = $_FILES['image1']['tmp_name'];
				$detail['wa_image_1'] = $docfile_1;
				upload($docfile_1, $temp_name_1);
				
				
				
				$docfile_1 = $_FILES['image1']['name'];
				$file_type = $_FILES['image1']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$src = $_FILES['image1']['tmp_name'];
				$destination = BASE_DIR.'files/warranty_log/'.$docfile_1;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['wa_image_1'] = $docfile_1;
								chmod($destination, 0664);
							}						
		}
		
		if($_FILES['image2']['name'])
		{
				
				$docfile_2 = $_FILES['image2']['name'];
				$docfile_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
				$temp_name_2 = $_FILES['image2']['tmp_name'];
				$detail['wa_image_2'] = $docfile_2;
				upload($docfile_2, $temp_name_2);
		}
	
		if($_FILES['image3']['name'])
		{
				
				$docfile_3 = $_FILES['image3']['name'];
				$docfile_3 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_3);
				$temp_name_3 = $_FILES['image3']['tmp_name'];
				$detail['wa_image_3'] = $docfile_3;
				upload($docfile_3, $temp_name_3);										
		}

	
		if($_FILES['image4']['name'])
		{
				
				$docfile_4 = $_FILES['image4']['name'];
				$docfile_4 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_4);
				$temp_name_4 = $_FILES['image4']['tmp_name'];
				$detail['wa_image_4'] = $docfile_4;
				upload($docfile_4, $temp_name_4);
										
		}
	
	
	
		if($_FILES['image5']['name'])
		{
				
				$docfile_5 = $_FILES['image5']['name'];
				$docfile_5 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_5);
				$temp_name_5 = $_FILES['image5']['tmp_name'];
				$detail['wa_image_5'] = $docfile_5;
				upload($docfile_5, $temp_name_5);
				
												
		}
	
		if($_FILES['video_file']['name'])
		{
				
				$docfile_6 = $_FILES['video_file']['name'];
				$docfile_6 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_6);
				$temp_name_6 = $_FILES['video_file']['tmp_name'];
				$detail['wa_video'] = $docfile_6;
				upload($docfile_6, $temp_name_6);
		}
		
		if($_FILES['credit_note']['name'])
		{
				
				$docfile_7 = $_FILES['credit_note']['name'];
				$docfile_7 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_7);
				$temp_name_7 = $_FILES['credit_note']['tmp_name'];
				$detail['wa_credit_note'] = $docfile_7;
				upload($docfile_7, $temp_name_7);
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
		
}

$submittrade = $fwRequest->getParam('trade_resp', '');

if(!empty($submittrade))
{
	$table_ts = new Fw_Db_Table('trade_responsibility');
    	$detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail[$ID];
	unset($detail[$ID]);
	

	if($detail['wa_qicc'] == 'on') {
		$detail['wa_qicc'] = 1;
	} else {
		$detail['wa_qicc'] = 0;	
	}

	$detail['wa_user'] = $user_name;
	
	$detail['wa_log_number'] = $this_id;
	
	$opr = $table_ts->insertRow($detail); 
	$fwViewData['opr'] = $opr;
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
	
$sqlpr = "Select * from warranty_log_priority";
$fwViewData['prdetail'] = $fwDb->query($sqlpr); 	


$sql_c = "Select * from companies";
$fwViewData['compdetail'] = $fwDb->query($sql_c);