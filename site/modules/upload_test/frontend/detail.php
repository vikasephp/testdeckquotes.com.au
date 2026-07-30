<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableDocuments = new Fw_Db_Table($TABLE);
$sb_id = $fwRequest->getParam($ID, '');
$submit = $fwRequest->getParam('subAddDetail', '');
$fwViewData['sb_sb'] = $sb_id;

if(!empty($submit))
{
    $detail = $fwRequest->getParam('staff_bulletin', array());

	$this_id=$detail[$ID];
	unset($detail[$ID]);

	ini_set('upload_max_filesize', '500M');
	ini_set('post_max_size', '550M');
	ini_set('memory_limit', '1020M');
	ini_set('max_input_time', '8000');
	ini_set('max_execution_time','8000');

	if($_FILES['docs_p'])
		{
				$docfile_p = $_FILES['docs_p']['name'];
				$file_type = $_FILES['docs_p']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_p = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_p);
				$src = $_FILES['docs_p']['tmp_name'];
				$destination = BASE_DIR.'files/test_upload/'.$docfile_p;
				
				db($destination);
				exit;
			
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['sb_document'] = $docfile_p;
								chmod($destination, 0664);
							}						
		}
		
		
			if($docfile_p) {
				if($this_id)
					{
								
								$tableDocuments->setWhere($ID." = ".$this_id);
								//$this_id = $tableDocuments->updateRow($detail);		
					}
				else
					{
													
								//$this_id = $tableDocuments->insertRow($detail); 
													
					}		
			}
	
		if($this_id){$fwViewData['opr'] = "Success!"; $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;}
}	

if(!empty($sb_id)) {
	
	$tableDocuments->setWhere($ID." = ".$sb_id);
	$fwViewData['detail'] = $tableDocuments->getRow();

}

$fwViewData['title'] = "Staff Bulletin";