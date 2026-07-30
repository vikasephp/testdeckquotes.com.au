<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableDocuments = new Fw_Db_Table($TABLE);
$ab_id = $fwRequest->getParam($ID, '');
$submit = $fwRequest->getParam('subAddDetail', '');
$fwViewData['ab_id'] = $ab_id;

$docdel = $fwRequest->getParam('di_doc', '');
$abid = (int)$fwRequest->getParam('ab_id', 0);

if(!empty($docdel) && empty($submit))
{
				
	        $tableDocuments->setWhere("ab_id = ".$abid);
			$deldetail[$docdel] = '';
            
			$opr = $tableDocuments->updateRow($deldetail);
			$fwViewData['ab_id'] = $abid;
			unset($docdel);
			//$fwViewData['opr'] = "Success!";
}

if(!empty($submit))
{
    $detail = $fwRequest->getParam('air', array());

	$detail['ab_property_address'] = stripslashes($detail['ab_property_address']);

	$this_id=$detail[$ID];
	unset($detail[$ID]);

	if($_FILES['docs_11']['name'])
		{
			
			
			$docfile_1 = $_FILES['docs_11']['name'];
			$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
			$temp_name_1 = $_FILES['docs_11']['tmp_name'];
			$detail['ab_aggr_with_client_1'] = $docfile_1;
			upload($docfile_1, $temp_name_1 ,BUCKET_NAME);
			
//				$docfile_11 = $_FILES['docs_11']['name'];
//				$file_type = $_FILES['docs_11']['type'];				
//				
//				$datetime = trim(date('d_m_Y_H_i_'),'0');
//				$docfile_11 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_11);
//				$src = $_FILES['docs_11']['tmp_name'];
//				$destination = BASE_DIR.'files/air_bb_database/'.$docfile_11;
//								
//					if(!move_uploaded_file($src, $destination))
//							{
//								
//							}
//					else
//							{
//								$detail['ab_aggr_with_client_1']= $docfile_11; 
//								chmod($destination, 0664);
//							}	
			
		}
		
		if($_FILES['docs_12']['name'])
		{
			
			
			$docfile_12 = $_FILES['docs_12']['name'];
			$docfile_12 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_12);
			$temp_name_12 = $_FILES['docs_12']['tmp_name'];
			$detail['ab_aggr_with_client_2'] = $docfile_12;
			upload($docfile_12, $temp_name_12,BUCKET_NAME);
			
		}
	
		if($_FILES['docs_13']['name'])
		{
			
			$docfile_13 = $_FILES['docs_13']['name'];
			$docfile_13 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_13);
			$temp_name_13 = $_FILES['docs_13']['tmp_name'];
			$detail['ab_aggr_with_client_3'] = $docfile_13;
			upload($docfile_13, $temp_name_13,BUCKET_NAME);
			
			
//				$docfile_13 = $_FILES['docs_13']['name'];
//				$file_type =  $_FILES['docs_13']['type'];				
//				
//				$datetime = trim(date('d_m_Y_H_i_'),'0');
//				$docfile_13 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_13);
//				$src = $_FILES['docs_13']['tmp_name'];
//				$destination = BASE_DIR.'files/air_bb_database/'.$docfile_13;
//								
//					if(!move_uploaded_file($src, $destination))
//							{
//								//echo "Possible file upload attack";
//							}
//					else
//							{
//								$detail['ab_aggr_with_client_3']= $docfile_13; 
//								chmod($destination, 0664);
//							}	
			
		}
	
	
	if($_FILES['docs_21']['name'])
		{
			
			$docfile_21 = $_FILES['docs_21']['name'];
			$docfile_21 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_21);
			$temp_name_21 = $_FILES['docs_21']['tmp_name'];
			$detail['ab_business_case_1'] = $docfile_21;
			upload($docfile_21, $temp_name_21,BUCKET_NAME);
			
			
//				$docfile_21 = $_FILES['docs_21']['name'];
//				$file_type =  $_FILES['docs_21']['type'];				
//				
//				$datetime = trim(date('d_m_Y_H_i_'),'0');
//				$docfile_21 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_21);
//				$src = $_FILES['docs_21']['tmp_name'];
//				$destination = BASE_DIR.'files/air_bb_database/'.$docfile_21;
//								
//					if(!move_uploaded_file($src, $destination))
//							{
//								//echo "Possible file upload attack";
//							}
//					else
//							{
//								$detail['ab_business_case_1']= $docfile_21; 
//								chmod($destination, 0664);
//							}	
			
		}
	
		if($_FILES['docs_22']['name'])
		{
			
			
			
			$docfile_22 = $_FILES['docs_22']['name'];
			$docfile_22 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_22);
			$temp_name_22 = $_FILES['docs_22']['tmp_name'];
			$detail['ab_business_case_2'] = $docfile_22;
			upload($docfile_22, $temp_name_22,BUCKET_NAME);
			
//				$docfile_22 = $_FILES['docs_22']['name'];
//				$file_type =  $_FILES['docs_22']['type'];				
//				
//				$datetime = trim(date('d_m_Y_H_i_'),'0');
//				$docfile_22 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_22);
//				$src = $_FILES['docs_22']['tmp_name'];
//				$destination = BASE_DIR.'files/air_bb_database/'.$docfile_22;
//								
//					if(!move_uploaded_file($src, $destination))
//							{
//								//echo "Possible file upload attack";
//							}
//					else
//							{
//								$detail['ab_business_case_2']= $docfile_22; 
//								chmod($destination, 0664);
//							}	
			
		}
		if($_FILES['docs_23']['name'])
		{
			
				
			$docfile_23 = $_FILES['docs_23']['name'];
			$docfile_23 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_23);
			$temp_name_23 = $_FILES['docs_23']['tmp_name'];
			$detail['ab_business_case_3'] = $docfile_23;
			upload($docfile_23, $temp_name_23,BUCKET_NAME);
				
//				$docfile_23 = $_FILES['docs_23']['name'];
//				$file_type =  $_FILES['docs_23']['type'];				
//				
//				$datetime = trim(date('d_m_Y_H_i_'),'0');
//				$docfile_23 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_23);
//				$src = $_FILES['docs_23']['tmp_name'];
//				$destination = BASE_DIR.'files/air_bb_database/'.$docfile_23;
//								
//					if(!move_uploaded_file($src, $destination))
//							{
//								//echo "Possible file upload attack";
//							}
//					else
//							{
//								$detail['ab_business_case_3']= $docfile_23; 
//								chmod($destination, 0664);
//							}	
			
		}
	
		if($_FILES['docs_31']['name'])
		{
			
			$docfile_31 = $_FILES['docs_31']['name'];
			$docfile_31 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_31);
			$temp_name_31 = $_FILES['docs_31']['tmp_name'];
			$detail['ab_pl_statement_1'] = $docfile_31;
			upload($docfile_31, $temp_name_31,BUCKET_NAME);
			
			
			
//				$docfile_31 = $_FILES['docs_31']['name'];
//				$file_type =  $_FILES['docs_31']['type'];				
//				
//				$datetime = trim(date('d_m_Y_H_i_'),'0');
//				$docfile_31 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_31);
//				$src = $_FILES['docs_31']['tmp_name'];
//				$destination = BASE_DIR.'files/air_bb_database/'.$docfile_31;
//								
//					if(!move_uploaded_file($src, $destination))
//							{
//								//echo "Possible file upload attack";
//							}
//					else
//							{
//								$detail['ab_pl_statement_1']= $docfile_31; 
//								chmod($destination, 0664);
//							}	
			
		}
	
		if($_FILES['docs_32']['name'])
		{
			
			
			$docfile_32 = $_FILES['docs_32']['name'];
			$docfile_32 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_32);
			$temp_name_32 = $_FILES['docs_32']['tmp_name'];
			$detail['ab_pl_statement_2'] = $docfile_32;
			upload($docfile_32, $temp_name_32,BUCKET_NAME);
			
	
			
		}
	
		if($_FILES['docs_33']['name'])
		{
			
			$docfile_33 = $_FILES['docs_33']['name'];
			$docfile_33 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_33);
			$temp_name_33 = $_FILES['docs_33']['tmp_name'];
			$detail['ab_pl_statement_3'] = $docfile_33;
			upload($docfile_33, $temp_name_33,BUCKET_NAME);
				
				
	
			
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

if(!empty($ab_id)) {
	
	$tableDocuments->setWhere($ID." = ".$ab_id);
	$fwViewData['detail'] = $tableDocuments->getRow();

}
$tablePositions = new Fw_Db_Table('positions');
$fwViewData['positions'] = $tablePositions->getRows();
$fwViewData['title'] = "Air B&B Database";
