<?php
$tabletasks = new Fw_Db_Table($TABLE);
$tablebusness_status = new Fw_Db_Table('project_type');
$tablebusness_auth_area = new Fw_Db_Table('authorizearea');
$tablebusness_data_fields = new Fw_Db_Table('datafields');
$submit = $fwRequest->getParam('subAddDetail', '');
$submit2 = $fwRequest->getParam('subAddDetail_assign', '');
$fwViewData['authorizearea'] = $tablebusness_auth_area->getAllRows();	
$fwViewData['datafields'] = $tablebusness_data_fields->getAllRows();		




if(!empty($submit2))
{
$data = $fwRequest -> getParam('data','');


if($submit2 == 'Yes'){$data2['bst_status'] = 1;}
else{$data2['bst_status'] = 0;}
		$tabletasks -> setWhere("bst_id = {$data['bst_id']}");
		$update = $tabletasks -> updateRow($data2);
}

if(!empty($submit))
{
	$data = $fwRequest->getParam('data','');

	if($_FILES['image']['error'] == 0)
	{
		$docfile = $_FILES['image']['name'];
		$file_type = $_FILES['image']['type'];
		
		$datetime = trim(date('d_m_Y_H_i_'),'0');
		$docfile = $datetime.preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
		$src = $_FILES['image']['tmp_name'];
		$destination = BASE_DIR.FILE_PATH.'files/task_files/'.$docfile;
					
		if (!move_uploaded_file($src, $destination))
		{
			echo "Possible file upload attack";
		}
		else
		{
			$data['bst_document']= $docfile;
			chmod($destination, 0664);
		}
	}
	
	
	if(!empty($data['bst_business_status_id']) AND empty($data['bst_id']))
	{
		$_SESSION['current_bst_business_status_id'] = $data['bst_business_status_id'];
	}

	if($data['bst_id']>0)
	{
		$bst_id = $data['bst_id'];
		unset($data['bst_id']);
		$tabletasks -> setWhere("bst_id = $bst_id");
		$update = $tabletasks -> updateRow($data);
	}
	else
	{
		$sql = "SELECT MAX(bst_order) as maxbsts FROM busness_status_task WHERE bst_business_status_id = ".$data['bst_business_status_id'];
		$maxdata = $fwDb->queryOne($sql);
		$data['bst_order'] = (int)$maxdata['maxbsts'] +1;
		$insert = $tabletasks -> insertRow($data);
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



/****** Begin fetch busness_status for dropdown*********/
$busness_status = $tablebusness_status -> getRows();
$fwViewData['busness_status'] = $busness_status;
/****** End fetch busness_status for dropdown*********/

$bst_id = $fwRequest -> getParam('bst_id');
if ($bst_id > 0)
{
	$tablecats = new Fw_Db_Table($TABLE);
	$tablecats->setWhere("$ID = $bst_id");
	$detail = $tablecats->getRow();
	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
	
	unset($_SESSION['current_bst_business_status_id']);
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
	
	if($_SESSION['current_bst_business_status_id']>0)
	{
		$fwViewData['current_bst_business_status_id'] = $_SESSION['current_bst_business_status_id'];
	}
}



