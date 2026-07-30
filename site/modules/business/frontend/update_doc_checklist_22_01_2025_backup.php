<?php		

     $doc_id = $fwRequest -> getParam('doc_id','');
	 $action_name = $fwRequest -> getParam('action','');
		
	if($action_name == "")
	{
    	if(!empty($doc_id))
    	{
    	     
    			$sql_edit_data = "SELECT dcl.*, adcl.*, u.user_name 
    					FROM document_check_list as dcl
    					
    					INNER JOIN admin_document_check_list as adcl
    					ON dcl.doc_name_id = adcl.admin_doc_id
    					
    					LEFT JOIN users as u
    					ON dcl.doc_user_name = u.user_id
    					
    					WHERE dcl.doc_id = $doc_id";
    
    		$doc_data = $fwDb->queryOne($sql_edit_data);
    					
    		if($doc_data['doc_date_uploaded']!=0)
    		{
    			$doc_data['doc_date_uploaded'] = changedate_d_m_Y($doc_data['doc_date_uploaded'])." ".changetime_h_m($doc_data['doc_date_uploaded']);	
    		}
    		else
    		{
    			$doc_data['doc_date_uploaded'] = '';
    		}
    		
    		$fwViewData['doc_data'] = $doc_data;
    		
    	//	echo "<pre>";print_r($_REQUEST); print_r($_FILES); exit();
    
    		//******* Begin Store value in DB after submit*********//
    		$submit_iframe = $fwRequest -> getParam('submit_iframe','');
        
    			$doc = $fwRequest -> getParam('doc','');
    				if($_FILES['image']['error'] == 0)
    				{
    					$docfile = $_FILES['image']['name'];
    					$file_type = $_FILES['image']['type'];
    					
    					$datetime = trim(date('d_m_Y_H_i_'),'0');
    					$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
    					$src = $_FILES['image']['tmp_name'];
    					//$destination = BASE_DIR.FILE_PATH. 'files/document_check_list_files/'.$docfile;
    								
    					upload($docfile, $src);
    				//	echo "<pre>";print_r($_REQUEST); print_r($_FILES); //exit();
    					$doc['doc_file_name']= $docfile;
    					$doc['doc_user_name'] = $_SESSION['user']['user_id'];
    					$doc['doc_date_uploaded'] = date('Y-m-d H:i');
    
                      
    				}
    				
    				$upload = 'ok'; 
    				if(empty($doc['doc_file_name']) AND !empty($doc['doc_file_name_temp']))
    				{
    					$doc['doc_file_name'] = $doc['doc_file_name_temp'];
    					unset($doc['doc_file_name_temp']);
    					
    				}
    				elseif(empty($doc['doc_file_name']))
    				{
    					$doc['doc_file_name'] = '';
    					$doc['doc_date_uploaded']='';
    					$doc['doc_user_name']='';
    				}
    				
    				
    				if(empty($doc['doc_upload_to_dossier']))
    				{
    					$doc['doc_upload_to_dossier'] = 0;
    				}
    				
    				if(empty($doc['doc_not_avail']))
    				{
    					$doc['doc_not_avail'] = 0;
    				}
    				
    
    				$doc_id = $doc['doc_id'];
    				unset($doc['doc_id']);
    				unset($doc['doc_file_name_temp']);
    				$document_check_listTable = new Fw_Db_Table('document_check_list');
    				$document_check_listTable -> setWhere("doc_id = $doc_id");
    				$document_check_listTable -> updateRow($doc);
    				$fwViewData['iframe_data'] = 0;
    				$fwViewData['iframe_msg'] = '1';		
    								
    		//******* End Store value in DB after submit*********//
    	}
    	else
    	{
    	    echo "doc id can't be empty";
    	}
    		echo $upload;
	}
	
	    if($action_name == "updateDocCustomCheckListData")
    	{
    	   $postedData = $_REQUEST;
			$bus_id = $postedData['bus_id'];   
			$divid = $postedData['divid'];   
			$tableid = $postedData['tableid'];  
			
			
		 	$business_documentsTable = new Fw_Db_Table('business_documents');

				$data = $fwRequest -> getParam('data',array());
				if(!$data['bd_upload_dossier']){$data['bd_upload_dossier'] = $data['bd_upload_dossier'] = 0;}
				$document = $_FILES['document'];
              
				if($_FILES['document']['error'] == 0)
				{
					$docfile = $_FILES['document']['name'];
					$file_type = $_FILES['document']['type'];
					
					$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
					$src = $_FILES['document']['tmp_name'];
					$destination = BASE_DIR.FILE_PATH.'files/business_documents/'.$docfile;
					// echo "<pre>";print_r($_REQUEST); print_r($_FILES); exit();
					upload_fdch($docfile, $src);
					
					
					unset($data['bd_doc_name']);
					$data['bd_doc_name'] = $docfile;
						
					if(file_exists($destination))
						{
							$file_exist_error = 1;
						}	
				}

			   if(empty($file_exist_error))	
				{	
					if(!empty($data['bd_doc_name']))
					{
						
						
						
						if(!empty($data['bd_id']) AND $data['bd_id']>0)
						{
							$bd_id = $data['bd_id'];
							unset($data['bd_id']);
							$business_documentsTable -> setWhere("bd_id = $bd_id");
							$business_documentsTable -> updateRow($data);
							$success_msg = "Document Updated Successfully.";
						}
						else
						{
							$data['bd_user_id'] = $_SESSION['user']['user_id'];
							$data['bd_uploaded_date'] = date('Y-m-d H:i');
							$business_documentsTable -> insertRow($data);
							$success_msg = "Document Added Successfully.";
						}
						
						$fwViewData['success_msg'] = $success_msg;
						$fwViewData['showDocumentsIframe'] = '0';
					}
					else
					{
						$fwViewData['file_exist'] = "Document is mandatory. Please select the file.";
						$fwViewData['showDocumentsIframe'] = 1;
					}
				}
				else
				{
					$fwViewData['file_exist'] = "A file already exists with this filename. Please Rename the file and Upload it again.";
					$fwViewData['showDocumentsIframe'] = 1;
				}
				echo "ok";
    	}
         if($action_name == "miniCdcDocName")
    	{
    	    $postedData = $_REQUEST;  

			$doc_id = $postedData['doc_id'];
			$chknm = $postedData['chknm'];
		
			$custom_mini = new Fw_Db_Table('custom_document_check_list_mini');
			$custom_mini->setWhere("cdc_id = $doc_id");
			$fwViewData['cdetail'] = $custom_mini->getRow();
			
    			$minidetail = $fwRequest->getParam('mini', array());
    		
		//	$bsn_id_m = $fwRequest -> getParam('bsn_id_m','');
				
			$bus_id = $fwRequest -> getParam('bus_id','');
              //	echo "<pre> here";print_r($_REQUEST); print_r($_FILES); exit();
				if($_FILES['custom_mini']['error'] == 0)
				{
					$docfile_mini = $_FILES['custom_mini']['name'];
					$file_type = $_FILES['custom_mini']['type'];
					
					$datetime = trim(date('d_m_Y_H_i_'),'0');
					$docfile_mini = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_mini);
					$src = $_FILES['custom_mini']['tmp_name'];
					//$destination = BASE_DIR.FILE_PATH. 'files/document_check_list_files/'.$docfile_mini;
								
					upload($docfile_mini, $src);
					
					$minidetail['cdc_file_name']= $docfile_mini;
					$minidetail['cdc_date_uploaded'] = date('Y-m-d H:i');
				}
			if(empty($minidetail['cdc_file_name']) AND !empty($minidetail['cdc_file_name_temp']))
				{
					$minidetail['cdc_file_name'] = $cdc['doc_file_name_temp'];
					unset($minidetail['cdc_file_name_temp']);
					
				}
				elseif(empty($minidetail['cdc_file_name']))
				{
					$minidetail['cdc_file_name'] = '';
					$minidetail['cdc_date_uploaded']='';
					$minidetail['cdc_user_name']='';
				}
			
			
			$minidetail['cdc_bsn_id']= $bus_id;
			$minidetail['cdc_user_name'] = $_SESSION['user']['user_name'];
			$custom_mini = new Fw_Db_Table('custom_document_check_list_mini');
			
			//$doc_id = $fwRequest -> getParamget('doc_id','');
		
			if(!empty($doc_id))
			{
				$custom_mini -> setWhere("cdc_id = $doc_id");
				$custom_mini -> updateRow($minidetail);
			}
			else
			   {
				   $minidetail['cdc_checklist_number'] = $chknm; 
				   $custom_mini -> insertRow($minidetail);
			   }
			   	echo "ok";
    	}
    	
    	  if($action_name == "adddoc_checklistrenovation")
    	{
    	   	//echo "<pre> here";print_r($_REQUEST); print_r($_FILES); exit();
    	    $_REQUEST['doc_id']  = $_REQUEST['renovation_doc_id'];
    	    $_REQUEST['chknm']  = $_REQUEST['renovation_chknm_id'];
    	    $_REQUEST['bus_id']  = $_REQUEST['renovation_bus_id'];
    	    $postedData = $_REQUEST; 
    	    
    	    $fwViewData['iframe_data_renovation_adddoc'] = 1;
			$doc_id = $fwRequest -> getParam('doc_id','');
			$chknm = $fwRequest -> getParam('chknm',0);
			
			$doc_id = $renovation_doc_id= $fwRequest -> getParam('doc_id','');
			$renovation_chknm = $fwRequest -> getParam('chknm',0);
			$renovation_bus_id = $fwRequest -> getParam('bus_id',0);
		
			$custom_renovation = new Fw_Db_Table('custom_document_check_list_renovation');
			$custom_renovation->setWhere("cdc_id = $doc_id");  
			$fwViewData['cdetail'] = $custom_renovation->getRow();
			
			$renovationdetail = $fwRequest->getParam('renovation', array());
			$bsn_id_m = $fwRequest -> getParamget('bsn_id_m','');
			$bus_id = $_REQUEST['renovation_bus_id'];
            
				if($_FILES['custom_renovation']['error'] == 0)
				{
					$docfile_renovation = $_FILES['custom_renovation']['name'];
					$file_type = $_FILES['custom_renovation']['type'];
					
					$datetime = trim(date('d_m_Y_H_i_'),'0');
					$docfile_renovation = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_renovation);
					$src = $_FILES['custom_renovation']['tmp_name'];
					//$destination = BASE_DIR.FILE_PATH. 'files/document_check_list_files/'.$docfile_renovation;
					
					upload($docfile_renovation, $src);			
					
					$doc['doc_file_name']= $docfile;
					$doc['doc_user_name'] = $_SESSION['user']['user_id'];
					$doc['doc_date_uploaded'] = date('Y-m-d H:i');
					
					$renovationdetail['cdc_file_name']= $docfile_renovation;
					$renovationdetail['cdc_date_uploaded'] = date('Y-m-d H:i');
					
				}
			
			
			if(empty($renovationdetail['cdc_file_name']) AND !empty($renovationdetail['cdc_file_name_temp']))
				{
					$renovationdetail['cdc_file_name'] = $cdc['doc_file_name_temp'];
					unset($renovationdetail['cdc_file_name_temp']);
					
				}
				elseif(empty($renovationdetail['cdc_file_name']))
				{
					$renovationdetail['cdc_file_name'] = '';
					$renovationdetail['cdc_date_uploaded']='';
					$renovationdetail['cdc_user_name']='';
				}
			
		
			$renovationdetail['cdc_bsn_id']= $bus_id;
			$renovationdetail['cdc_user_name'] = $_SESSION['user']['user_name'];
			$custom_renovation = new Fw_Db_Table('custom_document_check_list_renovation');
			
			$doc_id = $fwRequest -> getParamget('doc_id','');
		   
			if(!empty($doc_id) && $doc_id > 0)
			{
				$custom_renovation -> setWhere("cdc_id = $doc_id");
				$custom_renovation -> updateRow($renovationdetail);
			}
			else
			   {
				   $renovationdetail['cdc_checklist_number'] = $chknm;  //echo "<pre>"; print_r($renovationdetail);
				   $custom_renovation -> insertRow($renovationdetail);
			   }
	        	echo "ok";
	
    	}

	exit();
	?>