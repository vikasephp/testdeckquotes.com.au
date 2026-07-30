<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableDocuments = new Fw_Db_Table($TABLE);
$pa_id = $fwRequest->getParam($ID, '');
$submit = $fwRequest->getParam('subAddDetail', '');
$fwViewData['pa_id'] = $pa_id;

$docdel = $fwRequest->getParam('di_doc', '');
$paid = (int)$fwRequest->getParam('pa_id', 0);

if(!empty($docdel) && empty($submit))
{
				
	        $tableDocuments->setWhere("pa_id = ".$paid);
			$deldetail[$docdel] = '';
            
			$opr = $tableDocuments->updateRow($deldetail);
			$fwViewData['pa_id'] = $paid;
			unset($docdel);
			//$fwViewData['opr'] = "Success!";
}

if(!empty($submit))
{
    $detail = $fwRequest->getParam('pa', array());

	//$detail['ab_property_address'] = stripslashes($detail['ab_property_address']);

	$this_id=$detail[$ID];
	unset($detail[$ID]);

	if($_FILES['docs_1'])
		{
			
		//db($_FILES['docs_1']);
		//exit;
			
				$docfile_1 = $_FILES['docs_1']['name'];
				$file_type = $_FILES['docs_1']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$src = $_FILES['docs_1']['tmp_name'];
				$destination = BASE_DIR.'files/air_bb_database/'.$docfile_1;
								
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['pa_agreement']= $docfile_1; 
								chmod($destination, 0664);
							}	
			
		}
		
		if($_FILES['docs_2'])
		{
			
				$docfile_2 = $_FILES['docs_2']['name'];
				$file_type =  $_FILES['docs_2']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_2 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
				$src = $_FILES['docs_2']['tmp_name'];
				$destination = BASE_DIR.'files/air_bb_database/'.$docfile_2;
								
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['pa_price_list']= $docfile_2; 
								chmod($destination, 0664);
							}	
			
		}
	
		if($_FILES['docs_3'])
		{
				$docfile_3 = $_FILES['docs_3']['name'];
				$file_type =  $_FILES['docs_3']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_3 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_3);
				$src = $_FILES['docs_3']['tmp_name'];
				$destination = BASE_DIR.'files/air_bb_database/'.$docfile_3;
								
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['pa_quality_assurance']= $docfile_3; 
								chmod($destination, 0664);
							}	
			
		}
	
	
	if($_FILES['docs_4_1'])
		{
			
				$docfile_4_1 = $_FILES['docs_4_1']['name'];
				$file_type =  $_FILES['docs_4_1']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_4_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_4_1);
				$src = $_FILES['docs_4_1']['tmp_name'];
				$destination = BASE_DIR.'files/air_bb_database/'.$docfile_4_1;
								
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['pa_licences_1']= $docfile_4_1; 
								chmod($destination, 0664);
							}	
			
		}
	
		if($_FILES['docs_4_2'])
		{
			
				$docfile_4_2 = $_FILES['docs_4_2']['name'];
				$file_type =  $_FILES['docs_4_2']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_4_2 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_4_2);
				$src = $_FILES['docs_4_2']['tmp_name'];
				$destination = BASE_DIR.'files/air_bb_database/'.$docfile_4_2;
								
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['pa_licences_2']= $docfile_4_2; 
								chmod($destination, 0664);
							}	
			
		}
		
		if($_FILES['docs_4_3'])
		{
			
				$docfile_4_3 = $_FILES['docs_4_3']['name'];
				$file_type =  $_FILES['docs_4_3']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_4_3 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_4_3);
				$src = $_FILES['docs_4_3']['tmp_name'];
				$destination = BASE_DIR.'files/air_bb_database/'.$docfile_4_3;
								
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['pa_licences_3']= $docfile_4_3; 
								chmod($destination, 0664);
							}	
			
		}
		
		
		if($_FILES['docs_5'])
		{
			
				$docfile_5 = $_FILES['docs_5']['name'];
				$file_type =  $_FILES['docs_5']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_5 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_5);
				$src = $_FILES['docs_5']['tmp_name'];
				$destination = BASE_DIR.'files/air_bb_database/'.$docfile_5;
								
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['pa_public_liability']= $docfile_5; 
								chmod($destination, 0664);
							}	
			
		}
	
		if($_FILES['docs_6'])
		{
			
				$docfile_6 = $_FILES['docs_6']['name'];
				$file_type =  $_FILES['docs_6']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_6 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_6);
				$src = $_FILES['docs_6']['tmp_name'];
				$destination = BASE_DIR.'files/air_bb_database/'.$docfile_6;
								
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['pa_workers_group']= $docfile_6; 
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

if(!empty($pa_id)) {
	
	$tableDocuments->setWhere($ID." = ".$pa_id);
	$fwViewData['detail'] = $tableDocuments->getRow();

}

$fwViewData['title'] = "Partners Agreements";
