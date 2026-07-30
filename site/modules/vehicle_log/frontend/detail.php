<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table($TABLE);

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail[$ID];

	unset($detail[$ID]);
	
	if($_FILES['veh_photo']['name'])
		{
			
			$docfile_1 = $_FILES['veh_photo']['name'];
			$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
			$temp_name_1 = $_FILES['veh_photo']['tmp_name'];
			$detail['ve_photo'] = $docfile_1;
			upload($docfile_1, $temp_name_1);
			
			
//			$docfile_1 = $_FILES['veh_photo']['name'];
//			$file_type = $_FILES['veh_photo']['type'];				
//			
//			$datetime = trim(date('d_m_Y_H_i_'),'0');
//			$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
//			$src = $_FILES['veh_photo']['tmp_name'];
//			$destination = BASE_DIR.'files/uploads/'.$docfile_1;
//			
//				if(!move_uploaded_file($src, $destination))
//						{
//							//echo "Possible file upload attack";
//						}
//				else
//						{
//							$detail['ve_photo'] = $docfile_1;
//							chmod($destination, 0664);
//						}						
		}
	
	
	if($_FILES['veh_photo2']['name'])
		{
			
			$docfile_2 = $_FILES['veh_photo2']['name'];
			$docfile_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
			$temp_name_2 = $_FILES['veh_photo2']['tmp_name'];
			$detail['ve_photo2'] = $docfile_2;
			upload($docfile_2, $temp_name_2);
			
			
//			
//			$docfile_1 = $_FILES['veh_photo']['name'];
//			$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
//			$temp_name_1 = $_FILES['veh_photo']['tmp_name'];
//			$detail['ve_photo'] = $docfile_1;
//			upload($docfile_1, $temp_name_1);
//			
//			
//			$docfile_11 = $_FILES['veh_photo2']['name'];
//			$file_type  = $_FILES['veh_photo2']['type'];				
//			
//			$datetime = trim(date('d_m_Y_H_i_'),'0');
//			$docfile_11 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_11);
//			$src = $_FILES['veh_photo2']['tmp_name'];
//			$destination = BASE_DIR.'files/uploads/'.$docfile_11;
//			
//				if(!move_uploaded_file($src, $destination))
//						{
//							//echo "Possible file upload attack";
//						}
//				else
//						{
//							$detail['ve_photo2'] = $docfile_11;
//							chmod($destination, 0664);
//						}						
		}
	
	if($_FILES['veh_photo3']['name'])
		{
			
			$docfile_3 = $_FILES['veh_photo3']['name'];
			$docfile_3 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_3);
			$temp_name_3 = $_FILES['veh_photo3']['tmp_name'];
			$detail['ve_photo3'] = $docfile_3;
			upload($docfile_3, $temp_name_3);
			
			
//			
//			$docfile_22 = $_FILES['veh_photo3']['name'];
//			$file_type  = $_FILES['veh_photo3']['type'];				
//			
//			$datetime = trim(date('d_m_Y_H_i_'),'0');
//			$docfile_22 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_22);
//			$src = $_FILES['veh_photo3']['tmp_name'];
//			$destination = BASE_DIR.'files/uploads/'.$docfile_22;
//			
//				if(!move_uploaded_file($src, $destination))
//						{
//							//echo "Possible file upload attack";
//						}
//				else
//						{
//							$detail['ve_photo3'] = $docfile_22;
//							chmod($destination, 0664);
//						}						
		}	
		
	if($_FILES['co_reg_doc']['name'])
		{
			
			$docfile_4 = $_FILES['co_reg_doc']['name'];
			$docfile_4 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_4);
			$temp_name_4 = $_FILES['co_reg_doc']['tmp_name'];
			$detail['ve_copy_reg_doc'] = $docfile_4;
			upload($docfile_4, $temp_name_4);
			
//			$docfile_2 = $_FILES['co_reg_doc']['name'];
//			$file_type = $_FILES['co_reg_doc']['type'];				
//			
//			$datetime = trim(date('d_m_Y_H_i_'),'0');
//			$docfile_2 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
//			$src = $_FILES['co_reg_doc']['tmp_name'];
//			$destination = BASE_DIR.'files/uploads/'.$docfile_2;
//			
//				if(!move_uploaded_file($src, $destination))
//						{
//							//echo "Possible file upload attack";
//						}
//				else
//						{
//							$detail['ve_copy_reg_doc'] = $docfile_2;
//							chmod($destination, 0664);
//						}						
		}
		
		
	if($_FILES['co_insu_doc']['name'])
		{
			
			$docfile_5 = $_FILES['co_insu_doc']['name'];
			$docfile_5 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_5);
			$temp_name_5 = $_FILES['co_insu_doc']['tmp_name'];
			$detail['ve_copy_insu_doc'] = $docfile_5;
			upload($docfile_5, $temp_name_5);
			
					
//			$docfile_3 = $_FILES['co_insu_doc']['name'];
//			$file_type = $_FILES['co_insu_doc']['type'];				
//			
//			$datetime = trim(date('d_m_Y_H_i_'),'0');
//			$docfile_3 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_3);
//			$src = $_FILES['co_insu_doc']['tmp_name'];
//			$destination = BASE_DIR.'files/uploads/'.$docfile_3;
//			
//				if(!move_uploaded_file($src, $destination))
//						{
//							//echo "Possible file upload attack";
//						}
//				else
//						{
//							$detail['ve_copy_insu_doc'] = $docfile_3;
//							chmod($destination, 0664);
//						}						
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

$sql_tp1 = "SELECT  * from type_master where tm_type like '%3rd Party Insurers%'";
$tp_id = $fwDb->queryOne($sql_tp1);		

$sql_tp2 = "SELECT  * from type_options where to_type_id  =  ".$tp_id['tm_id'];
$tpdata = $fwDb->query($sql_tp2);
$fwViewData['tpdata'] = $tpdata ;