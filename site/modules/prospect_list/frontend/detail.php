<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table($TABLE);

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail[$ID];

	$detail['cl_notes'] = stripslashes($detail['cl_notes']);
	unset($detail[$ID]);
	
	
	
	if($_FILES['si']['name'])
		{
				
			$docfile_1 = $_FILES['si']['name'];
			$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
			$temp_name_1 = $_FILES['si']['tmp_name'];
			$detail['pl_sales_intro'] = $docfile_1;
			upload($docfile_1, $temp_name_1);
				
//				$docfile_1 = $_FILES['si']['name'];
//				$file_type = $_FILES['si']['type'];				
//				
//				$datetime = trim(date('d_m_Y_H_i_'),'0');
//				$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
//				$src = $_FILES['si']['tmp_name'];
//				$destination = BASE_DIR.'files/prospect_list/'.$docfile_1;
//				
//					if(!move_uploaded_file($src, $destination))
//							{
//								//echo "Possible file upload attack";
//							}
//					else
//							{
//								$detail['pl_sales_intro'] = $docfile_1;
//								chmod($destination, 0664);
//							}						
		}
		
	if($_FILES['sp']['name'])
		{
				
			$docfile_2 = $_FILES['sp']['name'];
			$docfile_2 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
			$temp_name_2 = $_FILES['sp']['tmp_name'];
			$detail['pl_sales_prop'] = $docfile_2;
			upload($docfile_2, $temp_name_2);
				
//				$docfile_2 = $_FILES['sp']['name'];
//				$file_type = $_FILES['sp']['type'];				
//				
//				$datetime = trim(date('d_m_Y_H_i_'),'0');
//				$docfile_2 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
//				$src = $_FILES['sp']['tmp_name'];
//				$destination = BASE_DIR.'files/prospect_list/'.$docfile_2;
//				
//					if(!move_uploaded_file($src, $destination))
//							{
//								//echo "Possible file upload attack";
//							}
//					else
//							{
//								$detail['pl_sales_prop'] = $docfile_2;
//								chmod($destination, 0664);
//							}						
		}
		
	if($_FILES['ma']['name'])
		{
				
				$docfile_3 = $_FILES['ma']['name'];
				$docfile_3 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_3);
				$temp_name_3 = $_FILES['ma']['tmp_name'];
				$detail['pl_mana_agree'] = $docfile_3;
				upload($docfile_3, $temp_name_3);
				
//				$docfile_3 = $_FILES['ma']['name'];
//				$file_type = $_FILES['ma']['type'];				
//				
//				$datetime = trim(date('d_m_Y_H_i_'),'0');
//				$docfile_3 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_3);
//				$src = $_FILES['ma']['tmp_name'];
//				$destination = BASE_DIR.'files/prospect_list/'.$docfile_3;
//				
//					if(!move_uploaded_file($src, $destination))
//							{
//								//echo "Possible file upload attack";
//							}
//					else
//							{
//								$detail['pl_mana_agree'] = $docfile_3;
//								chmod($destination, 0664);
//							}						
		}		
	
	if($_FILES['extra1']['name'])
		{
				
				
				$docfile_e1 = $_FILES['extra1']['name'];
				$docfile_e1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_e1);
				$temp_name_e1 = $_FILES['extra1']['tmp_name'];
				$detail['pl_extra_doc_1'] = $docfile_e1;
				upload($docfile_e1, $temp_name_e1);
				
//				$docfile_e1 = $_FILES['extra1']['name'];
//				$file_type = $_FILES['extra1']['type'];				
//				
//				$datetime = trim(date('d_m_Y_H_i_'),'0');
//				$docfile_e1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_e1);
//				$src = $_FILES['extra1']['tmp_name'];
//				$destination = BASE_DIR.'files/prospect_list/'.$docfile_e1;
//				
//					if(!move_uploaded_file($src, $destination))
//							{
//								//echo "Possible file upload attack";
//							}
//					else
//							{
//								$detail['pl_extra_doc_1'] = $docfile_e1;
//								chmod($destination, 0664);
//							}						
		}	
	
	if($_FILES['extra2']['name'])
		{
				
				$docfile_e2 = $_FILES['extra2']['name'];
				$docfile_e2 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_e2);
				$temp_name_e2 = $_FILES['extra2']['tmp_name'];
				$detail['pl_extra_doc_2'] = $docfile_e2;
				upload($docfile_e2, $temp_name_e2);
				
//				$docfile_e2 = $_FILES['extra2']['name'];
//				$file_type = $_FILES['extra2']['type'];				
//				
//				$datetime = trim(date('d_m_Y_H_i_'),'0');
//				$docfile_e2 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_e2);
//				$src = $_FILES['extra2']['tmp_name'];
//				$destination = BASE_DIR.'files/prospect_list/'.$docfile_e2;
//				
//					if(!move_uploaded_file($src, $destination))
//							{
//								//echo "Possible file upload attack";
//							}
//					else
//							{
//								$detail['pl_extra_doc_2'] = $docfile_e2;
//								chmod($destination, 0664);
//							}						
		}	
	
	
	if($_FILES['extra3']['name'])
		{
				
				$docfile_e3 = $_FILES['extra3']['name'];
				$docfile_e3 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_e3);
				$temp_name_e3 = $_FILES['extra3']['tmp_name'];
				$detail['pl_extra_doc_3'] = $docfile_e3;
				upload($docfile_e3, $temp_name_e3);
				
//						
//				$docfile_e3 = $_FILES['extra3']['name'];
//				$file_type = $_FILES['extra3']['type'];				
//				
//				$datetime = trim(date('d_m_Y_H_i_'),'0');
//				$docfile_e3 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_e3);
//				$src = $_FILES['extra3']['tmp_name'];
//				$destination = BASE_DIR.'files/prospect_list/'.$docfile_e3;
//				
//					if(!move_uploaded_file($src, $destination))
//							{
//								//echo "Possible file upload attack";
//							}
//					else
//							{
//								$detail['pl_extra_doc_3'] = $docfile_e3;
//								chmod($destination, 0664);
//							}						
		}	
	
	
	if($_FILES['extra4']['name'])
		{
				
				$docfile_e4 = $_FILES['extra4']['name'];
				$docfile_e4 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_e4);
				$temp_name_e4 = $_FILES['extra4']['tmp_name'];
				$detail['pl_extra_doc_4'] = $docfile_e4;
				upload($docfile_e4, $temp_name_e4);
				
				
//				$docfile_e4 = $_FILES['extra4']['name'];
//				$file_type = $_FILES['extra4']['type'];				
//				
//				$datetime = trim(date('d_m_Y_H_i_'),'0');
//				$docfile_e4 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_e4);
//				$src = $_FILES['extra4']['tmp_name'];
//				$destination = BASE_DIR.'files/prospect_list/'.$docfile_e4;
//				
//					if(!move_uploaded_file($src, $destination))
//							{
//								//echo "Possible file upload attack";
//							}
//					else
//							{
//								$detail['pl_extra_doc_4'] = $docfile_e4;
//								chmod($destination, 0664);
//							}						
		}	
	
	
	
	if($_FILES['extra5']['name'])
		{
				$docfile_e5 = $_FILES['extra5']['name'];
				$docfile_e5 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_e5);
				$temp_name_e5 = $_FILES['extra5']['tmp_name'];
				$detail['pl_extra_doc_5'] = $docfile_e5;
				upload($docfile_e5, $temp_name_e5);
				
				
//				$docfile_e5 = $_FILES['extra5']['name'];
//				$file_type = $_FILES['extra5']['type'];				
//				
//				$datetime = trim(date('d_m_Y_H_i_'),'0');
//				$docfile_e5 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_e5);
//				$src = $_FILES['extra5']['tmp_name'];
//				$destination = BASE_DIR.'files/prospect_list/'.$docfile_e5;
//				
//					if(!move_uploaded_file($src, $destination))
//							{
//								//echo "Possible file upload attack";
//							}
//					else
//							{
//								$detail['pl_extra_doc_5'] = $docfile_e5;
//								chmod($destination, 0664);
//							}						
		}	
	
	
	
	if($_FILES['extra6']['name'])
		{
				
				$docfile_e6 = $_FILES['extra6']['name'];
				$docfile_e6 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_e6);
				$temp_name_e6 = $_FILES['extra6']['tmp_name'];
				$detail['pl_extra_doc_6'] = $docfile_e6;
				upload($docfile_e6, $temp_name_e6);	
				
//				
//				$docfile_e6 = $_FILES['extra6']['name'];
//				$file_type = $_FILES['extra6']['type'];				
//				
//				$datetime = trim(date('d_m_Y_H_i_'),'0');
//				$docfile_e6 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_e6);
//				$src = $_FILES['extra6']['tmp_name'];
//				$destination = BASE_DIR.'files/prospect_list/'.$docfile_e6;
//				
//					if(!move_uploaded_file($src, $destination))
//							{
//								//echo "Possible file upload attack";
//							}
//					else
//							{
//								$detail['pl_extra_doc_6'] = $docfile_e6;
//								chmod($destination, 0664);
//							}						
		}	
	
	if($_FILES['extra7']['name'])
		{
				
				$docfile_e7 = $_FILES['extra7']['name'];
				$docfile_e7 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_e7);
				$temp_name_e7 = $_FILES['extra7']['tmp_name'];
				$detail['pl_extra_doc_7'] = $docfile_e7;
				upload($docfile_e7, $temp_name_e7);
				
				
//				$docfile_e7 = $_FILES['extra7']['name'];
//				$file_type = $_FILES['extra7']['type'];				
//				
//				$datetime = trim(date('d_m_Y_H_i_'),'0');
//				$docfile_e7 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_e7);
//				$src = $_FILES['extra7']['tmp_name'];
//				$destination = BASE_DIR.'files/prospect_list/'.$docfile_e7;
//				
//					if(!move_uploaded_file($src, $destination))
//							{
//								//echo "Possible file upload attack";
//							}
//					else
//							{
//								$detail['pl_extra_doc_7'] = $docfile_e7;
//								chmod($destination, 0664);
//							}						
		}	
	
	
   	if($this_id > 0)
    	{
       		 $tableqa->setWhere("$ID = $this_id");
       		 $opr = $tableqa->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableqa->insertRow($detail); 
	}    	
   		 $fwViewData['opr'] = $opr;
			
		//Location(BASE_URL . $XFA['home']);
}

$this_id = (int)$fwRequest->getParam($ID, 0);
if ($this_id > 0)
{
	$tableqa = new Fw_Db_Table($TABLE);
	$tableqa->setWhere("$ID = $this_id");
	$detail = $tableqa->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	