<?php

$tableDocCheck = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
	$data = $fwRequest -> getParam('data','');
	
	$data['admin_cdoc_type'] = implode('|',$data['admin_cdoc_type']);
	
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
			$data['admin_cdoc_manual']= $docfile;
			chmod($destination, 0664);
		}
	}
	
if(!$data['admin_cdoc_upload_to_dossier'])
{
	$data['admin_cdoc_upload_to_dossier'] = 0;
}

	if($data['admin_cdoc_id']>0)
	{
		$admin_cdoc_id = $data['admin_cdoc_id'];
		unset($data['admin_cdoc_id']);
		$tableDocCheck -> setWhere("admin_cdoc_id = $admin_cdoc_id");
		$update = $tableDocCheck -> updateRow($data);
	}
	else
	{
		$insert = $tableDocCheck -> insertRow($data);
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

$admin_cdoc_id = $fwRequest -> getParam('admin_cdoc_id');

if ($admin_cdoc_id > 0)
{
	$tableDocCheck = new Fw_Db_Table($TABLE);
	$tableDocCheck->setWhere("$ID = $admin_cdoc_id");
	$detail = $tableDocCheck ->getRow();
	$fwViewData['detail'] = $detail;
	$fwViewData['type'] = explode('|',$detail['admin_cdoc_type']);
	
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}

// ************** Retrive Project Type ********************//
	$tableProjType = new Fw_Db_Table('project_type');
	$fwViewData['projdetail'] = $tableProjType ->getRows();