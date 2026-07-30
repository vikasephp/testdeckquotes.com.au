<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableDocuments = new Fw_Db_Table($TABLE);
$mm_uminid = $fwRequest->getParam($ID, '');
$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
    $detail = $fwRequest->getParam('mmin', array());
	$this_id=$detail[$ID];
	unset($detail[$ID]);

	if($_FILES['docs_p']['name'])
		{
			
				$docfile_1 = $_FILES['docs_p']['name'];
				$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$temp_name_1 = $_FILES['docs_p']['tmp_name'];
				$detail['mm_doc_pdf'] = $docfile_1;
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
//								$detail['mm_doc_pdf'] = $docfile_p;
//								chmod($destination, 0664);
//							}						
		}
		
	if($_FILES['docs_w']['name'])
		{
				
				$docfile_2 = $_FILES['docs_w']['name'];
				$docfile_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
				$temp_name_2 = $_FILES['docs_w']['tmp_name'];
				$detail['mm_doc_word'] = $docfile_2;
				upload($docfile_2, $temp_name_2);
				
//				
//				
//				$docfile_w = $_FILES['docs_w']['name'];
//				$file_type = $_FILES['docs_w']['type'];				
//				
//				$datetime = trim(date('d_m_Y_H_i_'),'0');
//				$docfile_w = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_w);
//				$src = $_FILES['docs_w']['tmp_name'];
//				$destination = BASE_DIR.'files/meeting_minutes_doc/'.$docfile_w;
//				
//					if(!move_uploaded_file($src, $destination))
//							{
//								//echo "Possible file upload attack";
//							}
//					else
//							{
//								$detail['mm_doc_word'] = $docfile_w;
//								chmod($destination, 0664);
//							}						
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
							//$docs['dhd_dh_id']= $this_id;         			
				}		
	
		if($this_id){$fwViewData['opr'] = "Success!"; $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;}
}	

if(!empty($mm_uminid)) {
	
	$tableDocuments->setWhere($ID." = ".$mm_uminid);
	$fwViewData['detail'] = $tableDocuments->getRow();


	
}