<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableDocuments = new Fw_Db_Table($TABLE);
$da_id = $fwRequest->getParam($ID, '');
$submit = $fwRequest->getParam('subAddDetail', '');
$fwViewData['da_id'] = $da_id;

if(!empty($submit))
{
    $detail = $fwRequest->getParam('edc', array());
	
//	db($detail);
//	exit;
	
	$this_id=$detail[$ID];
	unset($detail[$ID]);

	if($_FILES['docs_p']['name'])
		{
				
				$docfile_1 = $_FILES['docs_p']['name'];
				$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$temp_name_1 = $_FILES['docs_p']['tmp_name'];
				$detail['edc_document'] = $docfile_1;
				upload($docfile_1, $temp_name_1);
				
				
//				$docfile_p = $_FILES['docs_p']['name'];
//				$file_type = $_FILES['docs_p']['type'];				
//				
//				$datetime = trim(date('d_m_Y_H_i_'),'0');
//				$docfile_p = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_p);
//				$src = $_FILES['docs_p']['tmp_name'];
//				$destination = BASE_DIR.'files/employee_documents/'.$docfile_p;
//				
//					if(!move_uploaded_file($src, $destination))
//							{
//								//echo "Possible file upload attack";
//							}
//					else
//							{
//								$detail['edc_document'] = $docfile_p;
//								chmod($destination, 0664);
//							}						
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

$fwViewData['title'] = "Employee Document Center";
$sql = "Select * from users 
        Inner join users_groups on users.user_id = users_groups.user_id
		where users_groups.group_id != 2  order by users.user_name ASC";
		
$fwViewData['userData'] =  $fwDb->query($sql);