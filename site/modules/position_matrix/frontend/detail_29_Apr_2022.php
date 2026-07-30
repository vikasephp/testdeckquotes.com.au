<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableDocuments = new Fw_Db_Table($TABLE);
$pm_id = $fwRequest->getParam($ID, '');
$submit = $fwRequest->getParam('subAddDetail', '');
$fwViewData['pm_id'] = $pm_id;

if(!empty($submit))
{
    $detail = $fwRequest->getParam('pm', array());

	$this_id=$detail[$ID];
	unset($detail[$ID]);

	if($_FILES['docs_1'])
		{
				$docfile_1 = $_FILES['docs_1']['name'];
				$file_type = $_FILES['docs_1']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$src = $_FILES['docs_1']['tmp_name'];
				$destination = BASE_DIR.'files/meeting_minutes_doc/'.$docfile_1;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['pm_recruitment_text'] = $docfile_1;
								chmod($destination, 0664);
							}						
		}
		
		
		if($_FILES['docs_2'])
		{
				$docfile_2 = $_FILES['docs_2']['name'];
				$file_type = $_FILES['docs_2']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_2 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
				$src = $_FILES['docs_2']['tmp_name'];
				$destination = BASE_DIR.'files/meeting_minutes_doc/'.$docfile_2;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['pm_key_result_stm'] = $docfile_2;
								chmod($destination, 0664);
							}						
		}
		
		
		if($_FILES['docs_3'])
		{
				$docfile_3 = $_FILES['docs_3']['name'];
				$file_type = $_FILES['docs_3']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_3 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_3);
				$src = $_FILES['docs_3']['tmp_name'];
				$destination = BASE_DIR.'files/meeting_minutes_doc/'.$docfile_3;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['pm_pos_agreement'] = $docfile_3;
								chmod($destination, 0664);
							}						
		}
		
		
		if($_FILES['docs_4'])
		{
				$docfile_4 = $_FILES['docs_4']['name'];
				$file_type = $_FILES['docs_4']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_4 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_4);
				$src = $_FILES['docs_4']['tmp_name'];
				$destination = BASE_DIR.'files/meeting_minutes_doc/'.$docfile_4;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['pm_letter_of_offer'] = $docfile_4;
								chmod($destination, 0664);
							}						
		}
	
		
		if($_FILES['docs_5'])
		{
				$docfile_5 = $_FILES['docs_5']['name'];
				$file_type = $_FILES['docs_5']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_5 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_5);
				$src = $_FILES['docs_5']['tmp_name'];
				$destination = BASE_DIR.'files/meeting_minutes_doc/'.$docfile_5;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['pm_training_plan'] = $docfile_5;
								chmod($destination, 0664);
							}						
		}
		
		
		if($_FILES['extra1'])
		{
				$docfile_e1 = $_FILES['extra1']['name'];
				$file_type = $_FILES['extra1']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_e1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_e1);
				$src = $_FILES['extra1']['tmp_name'];
				$destination = BASE_DIR.'files/meeting_minutes_doc/'.$docfile_e1;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['pm_extra_doc1'] = $docfile_e1;
								chmod($destination, 0664);
							}						
		}	
	
	if($_FILES['extra2'])
		{
				$docfile_e2 = $_FILES['extra2']['name'];
				$file_type = $_FILES['extra2']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_e2 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_e2);
				$src = $_FILES['extra2']['tmp_name'];
				$destination = BASE_DIR.'files/meeting_minutes_doc/'.$docfile_e2;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['pm_extra_doc2'] = $docfile_e2;
								chmod($destination, 0664);
							}						
		}	
	
	
	if($_FILES['extra3'])
		{
				$docfile_e3 = $_FILES['extra3']['name'];
				$file_type = $_FILES['extra3']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_e3 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_e3);
				$src = $_FILES['extra3']['tmp_name'];
				$destination = BASE_DIR.'files/meeting_minutes_doc/'.$docfile_e3;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['pm_extra_doc3'] = $docfile_e3;
								chmod($destination, 0664);
							}						
		}	
	
	
	if($_FILES['extra4'])
		{
				$docfile_e4 = $_FILES['extra4']['name'];
				$file_type = $_FILES['extra4']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_e4 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_e4);
				$src = $_FILES['extra4']['tmp_name'];
				$destination = BASE_DIR.'files/meeting_minutes_doc/'.$docfile_e4;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['pm_extra_doc4'] = $docfile_e4;
								chmod($destination, 0664);
							}						
		}	
	
	
	
	if($_FILES['extra5'])
		{
				$docfile_e5 = $_FILES['extra5']['name'];
				$file_type = $_FILES['extra5']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_e5 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_e5);
				$src = $_FILES['extra5']['tmp_name'];
				$destination = BASE_DIR.'files/meeting_minutes_doc/'.$docfile_e5;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['pm_extra_doc5'] = $docfile_e5;
								chmod($destination, 0664);
							}						
		}	
	
	
	
	if($_FILES['extra6'])
		{
				$docfile_e6 = $_FILES['extra6']['name'];
				$file_type = $_FILES['extra6']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_e6 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_e6);
				$src = $_FILES['extra6']['tmp_name'];
				$destination = BASE_DIR.'files/meeting_minutes_doc/'.$docfile_e6;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['pm_extra_doc6'] = $docfile_e6;
								chmod($destination, 0664);
							}						
		}	
	
	if($_FILES['extra7'])
		{
				$docfile_e7 = $_FILES['extra7']['name'];
				$file_type = $_FILES['extra7']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_e7 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_e7);
				$src = $_FILES['extra7']['tmp_name'];
				$destination = BASE_DIR.'files/meeting_minutes_doc/'.$docfile_e7;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['pm_extra_doc7'] = $docfile_e7;
								chmod($destination, 0664);
							}						
		}	
	
		if($_FILES['extra8'])
		{
				$docfile_e8= $_FILES['extra8']['name'];
				$file_type = $_FILES['extra8']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_e8 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_e8);
				$src = $_FILES['extra8']['tmp_name'];
				$destination = BASE_DIR.'files/meeting_minutes_doc/'.$docfile_e8;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['pm_extra_doc8'] = $docfile_e8;
								chmod($destination, 0664);
							}						
		}
		
		if($_FILES['extra9'])
		{
				$docfile_e9= $_FILES['extra9']['name'];
				$file_type = $_FILES['extra9']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_e9 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_e9);
				$src = $_FILES['extra9']['tmp_name'];
				$destination = BASE_DIR.'files/meeting_minutes_doc/'.$docfile_e9;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['pm_extra_doc9'] = $docfile_e9;
								chmod($destination, 0664);
							}						
		}
		
		if($_FILES['extra10'])
		{
				$docfile_e10= $_FILES['extra10']['name'];
				$file_type = $_FILES['extra10']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_e10 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_e10);
				$src = $_FILES['extra10']['tmp_name'];
				$destination = BASE_DIR.'files/meeting_minutes_doc/'.$docfile_e10;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['pm_extra_doc10'] = $docfile_e10;
								chmod($destination, 0664);
							}						
		}
		
		
			if($this_id)
				{
					
							$tableDocuments->setWhere($ID." = ".$this_id);
							$this_id = $tableDocuments->updateRow($detail);		
				}
			else
				{
													
				 			$this_id = $tableDocuments->insertRow($detail); 
							         			
				}		
	
		if($this_id){$fwViewData['opr'] = "Success!"; $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;}
}	

if(!empty($pm_id)) {
	
	$tableDocuments->setWhere($ID." = ".$pm_id);
	$fwViewData['detail'] = $tableDocuments->getRow();

}
$tablePositions = new Fw_Db_Table('positions');
$fwViewData['positions'] = $tablePositions->getRows();