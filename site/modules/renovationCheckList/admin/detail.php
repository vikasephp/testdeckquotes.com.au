<?php
$tableDocCheck = new Fw_Db_Table($TABLE);
$tableProjecttype = new Fw_Db_Table('project_type');
$submit = $fwRequest->getParam('subAddDetail', '');

$tableMini = new Fw_Db_Table('document_check_list_renovation');

if(!empty($submit))
{
	$data = $fwRequest -> getParam('data','');
	
	if(!empty($data['admin_doc_proj_type'])) {
	$data['admin_doc_proj_type'] =  implode("|",$data['admin_doc_proj_type']);
	}

	if($_FILES['image']['error'] == 0)
	{
		$docfile = $_FILES['image']['name'];
		$file_type = $_FILES['image']['type'];
		$datetime = trim(date('d_m_Y_H_i_'),'0');
		$docfile = $datetime.preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
		$src = $_FILES['image']['tmp_name'];
		$destination = BASE_DIR.FILE_PATH.'files/document_check_list_files/'.$docfile;
	if (!move_uploaded_file($src, $destination))
		{
			echo "Possible file upload attack";
		}
		else
		{
			$data['admin_doc_manual']= $docfile;
			chmod($destination, 0664);
		}
	}
if(!$data['admin_doc_upload_to_dossier']){ $data['admin_doc_upload_to_dossier'] = 0; }

if($data['admin_doc_id']>0)
	{
	$admin_doc_id = $data['admin_doc_id'];
	unset($data['admin_doc_id']);
	$tableDocCheck -> setWhere("admin_doc_id = $admin_doc_id");
	$update = $tableDocCheck -> updateRow($data);
	}
	else
	{
		$insert = $tableDocCheck -> insertRow($data);
		
		$sql = "Select distinct doc_bsn_id from document_check_list_renovation";
		$dbs = $fwDb -> query($sql);
		if(!empty($dbs))
		{
				foreach($dbs as $v)
				{
					//db($v);	
					for($a=2; $a<=7;$a++)
					{
						$tableMini->setWhere("doc_bsn_id =".$v['doc_bsn_id'] .' AND doc_checklist_number = '.$a);	
						if($tableMini->rowExists())
						  {
							$docdetail['doc_bsn_id'] = $v['doc_bsn_id'];  
							$docdetail['doc_name_id'] = $insert; 
							$docdetail['doc_checklist_number'] = $a; 
							$tableMini->insertRow($docdetail);
							
						  }
					}
					
				}
		}
		
		
		
	}
	if($update)
	{
		$i = 1;
	}
	else
	{
		$i= 2;
	}
	Location(BASE_URL . $XFA["list"]."/msg/$i");
}	
/************ On Page Load************/
$tableProjecttype->setWhere("pt_status = 1");
$fwViewData['project_type'] = $tableProjecttype->getRows();
$admin_doc_id = $fwRequest -> getParam('admin_doc_id');

if ($admin_doc_id > 0)
{
	$tableDocCheck = new Fw_Db_Table($TABLE);
	$tableDocCheck->setWhere("$ID = $admin_doc_id");
	$fwViewData['detail'] = $tableDocCheck ->getRow();
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
	
	$data1 = $tableDocCheck ->getRow();
	$fwViewData['data1'] =  explode('|',$data1['admin_doc_proj_type']);
	
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}
