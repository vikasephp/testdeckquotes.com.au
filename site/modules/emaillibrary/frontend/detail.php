<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tablecats = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');

  $group = array_keys($_SESSION['user']['::groups::']);
  $fwViewData['group'] = $group[0];

if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
    
    $detail['eml_email_content'] =  stripslashes($detail['eml_email_content']);
    	
	if(!empty($detail['template_docs'])) {
	$detail['eml_temp_docs'] = implode("|",$detail['template_docs']);
	}
    $this_id = (int)$detail[$ID];
    unset($detail[$ID]);

    if($_FILES['docs'])
				{
				$docfile = $_FILES['docs']['name'];
				
				$file_type = $_FILES['docs']['type'];
				$datetime = trim(date('Hi'),'0');
				$docfile = strtolower(preg_replace('/[^A-Z0-9._]/i', '_', $docfile));
				$src = $_FILES['docs']['tmp_name'];				
				$destination = BASE_DIR.FILE_PATH.'files/email_library/'.$docfile;
	
					if (!move_uploaded_file($src, $destination))
						{
							echo "Possible file upload attack";
						}
					else
						{
							$detail['eml_attachments'] = $docfile;
							//$detail['type'] = $file_type;
							//$detail['size'] = $_FILES['image']['size'];
							chmod($destination, 0664);
						}
					
				}



      if($this_id > 0)
    	{
			$tablecats->setWhere("$ID = $this_id");
			
			//if($detail['eml_ie_email'] == 'Internal')
			//{ 
			//	 $detail['eml_code'] = str_replace("-E-","-I-" ,$detail['eml_code']);
			//}
			//elseif($detail['eml_ie_email'] == 'External')
			//{
			//	$detail['eml_code'] = str_replace("-I-",'-E-' ,$detail['eml_code']);
			//}
		
	        $opr = $tablecats->updateRow($detail);   
    	}
    else
    	{
		$lastSql = "SELECT eml_id, eml_unique_id  FROM emaillibrary ORDER BY eml_id DESC LIMIT 1" ; 
		$lastdata  = $fwDb->query($lastSql);
		
		
			
       		$opr = $tablecats->insertRow($detail);
		
		$urlData['eml_url'] = BASE_URL . "site.email_view/eml_id/".$opr;
		$tablecats->setWhere("$ID = ".$opr);
		$opr2 = $tablecats->updateRow($urlData);
		
		if(empty($lastdata[0]['eml_unique_id']))
		{
			$data['eml_unique_id'] = '0001';	
		}
		else {
			$inr = (int)($lastdata[0]['eml_unique_id']);
			$inr++;	
			
			$dc = strlen($inr);
			if($dc == 1 ) { $inr = '000'.$inr; } 
			if($dc == 2 ) { $inr = '00'.$inr; } 
			if($dc == 3 ) { $inr = '0'.$inr; } 
			
			$data['eml_unique_id'] = $inr;
		}
		
		
		$idSql = "SELECT eml_id,eml_business_stream  FROM emaillibrary ORDER BY eml_id DESC LIMIT 1" ; 
		$iddata  = $fwDb->query($idSql);
		$eup_id = $iddata[0]['eml_id'];
		$bus_stream = $iddata[0]['eml_business_stream'];
		
		//if($detail['eml_ie_email'] == 'Internal')
		//{ 
		// $L = "I";
		//}
		//elseif($detail['eml_ie_email'] == 'External')
		//{
		//$L = "E";	
		//}
		
		$data['eml_code'] = $bus_stream.'-'.$data['eml_unique_id'];
		$tablecats->setWhere("$ID = $eup_id");
	
        $opr1 = $tablecats->updateRow($data); 
	
			} 
		//Location(BASE_URL. $XFA['home']);
		$fwViewData['opr'] = $opr;
	
}

$this_id = (int)$fwRequest->getParam($ID, 0);
if ($this_id > 0)
{
	$tablecats = new Fw_Db_Table($TABLE);
	$tablecats->setWhere("$ID = $this_id");
	$fwViewData['detail'] = $tablecats->getRow();
	
	$fwViewData['templ'] = explode("|", $fwViewData['detail']['eml_temp_docs']);
		
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Create '.$MODULE_SINGULAR;
}

$tablePages = new Fw_Db_Table("style_formula_types");
$tablePages->setWhere("sft_statues = 'Active'");
$tablePages->setOrderBy('sft_title ASC');
$fwViewData['formulatypes']=$tablePages->getRows();



$sql="SELECT u.user_id,u.user_name,ug.group_id, g.group_name
      FROM users u, groups g, users_groups ug
      WHERE u.user_id=ug.user_id AND ug.group_id=g.group_id AND g.group_id != 2 AND u.user_id != 1 
	  ORDER BY g.group_id ASC, u.user_name ASC"; 
$fwViewData['users'] = $fwDb->query($sql);


$tableSign = new Fw_Db_Table("email_signature");
$fwViewData['signature'] = $tableSign->getRows();


$sqltdocs = "Select template_docs.dh_title, template_hub_docs.dhd_name2 from template_docs
	             Inner Join template_hub_docs On template_docs.dh_uid = template_hub_docs.dhd_dh_id
				 Order By template_docs.dh_uid";

	$fwViewData['templatedocs'] = $fwDb->query($sqltdocs);


	
	
	//$sqldoc = "SELECT admin_document_check_list.admin_doc_name, document_check_list.doc_file_name FROM admin_document_check_list
	//		Inner Join document_check_list on admin_document_check_list.admin_doc_id = doc_name_id ";	
			//WHERE document_check_list.doc_bsn_id = " .$bsn_id. " And document_check_list.doc_file_name != '';
			 
	//$fwViewData['docdata'] = $fwDb->query($sqldoc);

