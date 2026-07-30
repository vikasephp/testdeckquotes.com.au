<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableDocuments = new Fw_Db_Table($TABLE);
$da_id = $fwRequest->getParam($ID, '');
$submit = $fwRequest->getParam('subAddDetail', '');
$fwViewData['da_id'] = $da_id;

if(!empty($submit))
{
    $detail = $fwRequest->getParam('da_tracker', array());
	$this_id=$detail[$ID];
	unset($detail[$ID]);

	if($_FILES['docs_p'])
		{
				$docfile_p = $_FILES['docs_p']['name'];
				$file_type = $_FILES['docs_p']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_p = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_p);
				$src = $_FILES['docs_p']['tmp_name'];
				$destination = BASE_DIR.'files/meeting_minutes_doc/'.$docfile_p;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['da_merge_plans'] = $docfile_p;
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

if(!empty($da_id)) {
	
	$tableDocuments->setWhere($ID." = ".$da_id);
	$fwViewData['detail'] = $tableDocuments->getRow();

}

$fwViewData['title'] = "DA Tracker";