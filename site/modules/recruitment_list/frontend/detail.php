<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableDocuments = new Fw_Db_Table($TABLE);
$re_id = $fwRequest->getParam($ID, '');
$submit = $fwRequest->getParam('subAddDetail', '');
$fwViewData['re_id'] = $re_id;

if(!empty($submit))
{
    $detail = $fwRequest->getParam('recruitment', array());
	$this_id=$detail[$ID];
	unset($detail[$ID]);

	if($_FILES['docs_p']['name'])
		{
				
				$docfile_1 = $_FILES['docs_p']['name'];
				$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$temp_name_1 = $_FILES['docs_p']['tmp_name'];
				$detail['re_survey_link'] = $docfile_1;
				upload($docfile_1, $temp_name_1);
				
				
				
//				$docfile_p = $_FILES['docs_p']['name'];
//				$file_type = $_FILES['docs_p']['type'];				
//				
//				$datetime = trim(date('d_m_Y_H_i_'),'0');
//				$docfile_p = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_p);
//				$src = $_FILES['docs_p']['tmp_name'];
//				$destination = BASE_DIR.'files/meeting_minutes_doc/'.$docfile_p;
//				
//					if(!move_uploaded_file($src, $destination))
//							{
//								//echo "Possible file upload attack";
//							}
//					else
//							{
//								$detail['re_survey_link'] = $docfile_p;
//								chmod($destination, 0664);
//							}						
		}
		
		
		if($_FILES['docs_2']['name'])
		{
				
				
				$docfile_2 = $_FILES['docs_2']['name'];
				$docfile_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
				$temp_name_2 = $_FILES['docs_2']['tmp_name'];
				$detail['re_doc2'] = $docfile_2;
				upload($docfile_2, $temp_name_2);
				
								
//				
//				$docfile_2 = $_FILES['docs_2']['name'];
//				$file_type = $_FILES['docs_2']['type'];				
//				
//				$datetime = trim(date('d_m_Y_H_i_'),'0');
//				$docfile_2 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
//				$src = $_FILES['docs_2']['tmp_name'];
//				$destination = BASE_DIR.'files/meeting_minutes_doc/'.$docfile_2;
//				
//					if(!move_uploaded_file($src, $destination))
//							{
//								//echo "Possible file upload attack";
//							}
//					else
//							{
//								$detail['re_doc2'] = $docfile_2;
//								chmod($destination, 0664);
//							}						
		}
		
		
		if($_FILES['docs_3']['name'])
		{
			
				$docfile_3 = $_FILES['docs_3']['name'];
				$docfile_3 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_3);
				$temp_name_3 = $_FILES['docs_3']['tmp_name'];
				$detail['re_doc3'] = $docfile_3;
				upload($docfile_3, $temp_name_3);		
		}
		
	
			if($_FILES['survey_result']['name'])
		{
			
				$docfile_4 = $_FILES['survey_result']['name'];
				$docfile_4 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_4);
				$temp_name_4 = $_FILES['survey_result']['tmp_name'];
				$detail['re_survey_result'] = $docfile_4;
				upload($docfile_4, $temp_name_4);		
		}
		
			if($this_id)
				{
							//$docs['dhd_dh_id']= $this_id;
							$tableDocuments->setWhere($ID." = ".$this_id);
							$this_id = $tableDocuments->updateRow($detail);		
				}
			else
				{
							//$detail['dh_insert_date'] = date('Y-m-d H:i');
							//db($detail);														
				 			$this_id = $tableDocuments->insertRow($detail); 
							         			
				}		
	
		if($this_id){$fwViewData['opr'] = "Success!"; $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;}
}	

if(!empty($re_id)) {
	
	$tableDocuments->setWhere($ID." = ".$re_id);
	$fwViewData['detail'] = $tableDocuments->getRow();


	
}