<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableDocuments = new Fw_Db_Table($TABLE);
$mri_id = $fwRequest->getParam($ID, '');
$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
        
	$fwViewData['load'] = "Testing";
	
	$detail = $fwRequest->getParam('mri', array());
	$this_id=$detail[$ID];
	unset($detail[$ID]);

	if($_FILES['docs_a']['name'])
		{
				
				$docfile_1 = $_FILES['docs_a']['name'];
				$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$temp_name_1 = $_FILES['docs_a']['tmp_name'];
				$detail['mri_audio_files'] = $docfile_1;
				upload($docfile_1, $temp_name_1);
				
				
//				$docfile_a = $_FILES['docs_a']['name'];
//				$file_type = $_FILES['docs_a']['type'];				
//				
//				$datetime = trim(date('d_m_Y_H_i_'),'0');
//				$docfile_a = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_a);
//				$src = $_FILES['docs_a']['tmp_name'];
//				$destination = BASE_DIR.'files/meeting_minutes_doc/'.$docfile_a;
//				
//					if(!move_uploaded_file($src, $destination))
//							{
//								//echo "Possible file upload attack";
//							}
//					else
//							{
//								$detail['mri_audio_files'] = $docfile_a;
//								chmod($destination, 0664);
//							}						
		}
		
	if($_FILES['docs_t']['name'])
		{
				
				$docfile_2 = $_FILES['docs_t']['name'];
				$docfile_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
				$temp_name_2 = $_FILES['docs_t']['tmp_name'];
				$detail['mri_transcript_file'] = $docfile_2;
				upload($docfile_2, $temp_name_2);
				
					
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
				 			$this_id = $tableDocuments->insertRow($detail); 
				}		
	
		if($this_id){$fwViewData['opr'] = "Success!"; $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;}
}	

if(!empty($mri_id)) {
	
	$tableDocuments->setWhere($ID." = ".$mri_id);
	$fwViewData['detail'] = $tableDocuments->getRow();
}

	$fwViewData['title'] = "Meeting Recording - Internal";