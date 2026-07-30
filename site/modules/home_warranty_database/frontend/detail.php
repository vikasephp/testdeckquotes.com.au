<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table($TABLE);
$fwViewData['wa_id'] = (int)$fwRequest->getParam('wa_id', 0);
$submit = $fwRequest->getParam('subAddDetail', '');

$table = new Fw_Db_Table('warranty_log_detail_task');
$yesno = $fwRequest->getParam('yesno', '');


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

	unset($detail[$ID]);
	
		if($_FILES['image1']['name'])
		{
				$docfile_1 = $_FILES['image1']['name'];
				$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$temp_name_1 = $_FILES['image1']['tmp_name'];
				$detail['wa_image_1'] = $docfile_1;
				upload($docfile_1, $temp_name_1);
				
				
				
//				$docfile_1 = $_FILES['image1']['name'];
//				$file_type = $_FILES['image1']['type'];				
//				
//				$datetime = trim(date('d_m_Y_H_i_'),'0');
//				$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
//				$src = $_FILES['image1']['tmp_name'];
//				$destination = BASE_DIR.'files/warranty_log/'.$docfile_1;
//				
//					if(!move_uploaded_file($src, $destination))
//							{
//								//echo "Possible file upload attack";
//							}
//					else
//							{
//								$detail['wa_image_1'] = $docfile_1;
//								chmod($destination, 0664);
//							}						
		}
		
		if($_FILES['image2']['name'])
		{
				
				$docfile_2 = $_FILES['image2']['name'];
				$docfile_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
				$temp_name_2 = $_FILES['image2']['tmp_name'];
				$detail['wa_image_2'] = $docfile_2;
				upload($docfile_2, $temp_name_2);
				
				
//				$docfile_2 = $_FILES['image2']['name'];
//				$file_type = $_FILES['image2']['type'];				
//				
//				$datetime = trim(date('d_m_Y_H_i_'),'0');
//				$docfile_2 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
//				$src = $_FILES['image2']['tmp_name'];
//				$destination = BASE_DIR.'files/warranty_log/'.$docfile_2;
//				
//					if(!move_uploaded_file($src, $destination))
//							{
//								//echo "Possible file upload attack";
//							}
//					else
//							{
//								$detail['wa_image_2'] = $docfile_2;
//								chmod($destination, 0664);
//							}						
		}
	
		if($_FILES['image3']['name'])
		{
				
				$docfile_3 = $_FILES['image3']['name'];
				$docfile_3 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_3);
				$temp_name_3 = $_FILES['image3']['tmp_name'];
				$detail['wa_image_3'] = $docfile_3;
				upload($docfile_3, $temp_name_3);
				
				
//				
//				$docfile_3 = $_FILES['image3']['name'];
//				$file_type = $_FILES['image3']['type'];				
//				
//				$datetime = trim(date('d_m_Y_H_i_'),'0');
//				$docfile_3 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_3);
//				$src = $_FILES['image3']['tmp_name'];
//				$destination = BASE_DIR.'files/warranty_log/'.$docfile_3;
//				
//					if(!move_uploaded_file($src, $destination))
//							{
//								//echo "Possible file upload attack";
//							}
//					else
//							{
//								$detail['wa_image_3'] = $docfile_3;
//								chmod($destination, 0664);
//							}						
		}

	
		if($_FILES['image4']['name'])
		{
				
				$docfile_4 = $_FILES['image4']['name'];
				$docfile_4 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_4);
				$temp_name_4 = $_FILES['image4']['tmp_name'];
				$detail['wa_image_4'] = $docfile_4;
				upload($docfile_4, $temp_name_4);
				
				
//				$docfile_4 = $_FILES['image4']['name'];
//				$file_type = $_FILES['image4']['type'];				
//				
//				$datetime = trim(date('d_m_Y_H_i_'),'0');
//				$docfile_4 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_4);
//				$src = $_FILES['image4']['tmp_name'];
//				$destination = BASE_DIR.'files/warranty_log/'.$docfile_4;
//				
//					if(!move_uploaded_file($src, $destination))
//							{
//								//echo "Possible file upload attack";
//							}
//					else
//							{
//								$detail['wa_image_4'] = $docfile_4;
//								chmod($destination, 0664);
//							}						
		}
	
	
	
		if($_FILES['image5']['name'])
		{
				
				$docfile_5 = $_FILES['image5']['name'];
				$docfile_5 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_5);
				$temp_name_5 = $_FILES['image5']['tmp_name'];
				$detail['wa_image_5'] = $docfile_5;
				upload($docfile_5, $temp_name_5);
				
//				
//				
//				$docfile_5 = $_FILES['image5']['name'];
//				$file_type = $_FILES['image5']['type'];				
//				
//				$datetime = trim(date('d_m_Y_H_i_'),'0');
//				$docfile_5 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_5);
//				$src = $_FILES['image5']['tmp_name'];
//				$destination = BASE_DIR.'files/warranty_log/'.$docfile_5;
//				
//					if(!move_uploaded_file($src, $destination))
//							{
//								//echo "Possible file upload attack";
//							}
//					else
//							{
//								$detail['wa_image_5'] = $docfile_5;
//								chmod($destination, 0664);
//							}						
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
	
	$table_1 = new Fw_Db_Table('warranty_log_detail_task');
	$sql_1 = "select warranty_log_task.* from warranty_log_task"; 
	$masterdata = $fwDb->query($sql_1); 

	
	foreach($masterdata as $k => $v)
	{
	  $table_1->setWhere("wd_task_id = ".$v['wt_id']. " And wd_wl_id = ".$this_id);
	  $taskdetail['wd_wl_id'] = $this_id;	
	  $taskdetail['wd_task_id'] = $v['wt_id'];	
	  if(!$table_1->rowExists())
	  {
		 $opr1 = $table_1->insertRow($taskdetail);  
	  }
	}
	
	
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	

$sql = "SELECT  business.* from business";
$fwViewData['projdetail'] = $fwDb->query($sql);

$sql2= "select tm_id from type_master where tm_type = 'Insurance Status' " ;
$tmdata = $fwDb->queryOne($sql2); 

$sql2= "select to_option from type_options where to_type_id = ". $tmdata['tm_id'] ;
$fwViewData['insu_status'] = $fwDb->query($sql2);