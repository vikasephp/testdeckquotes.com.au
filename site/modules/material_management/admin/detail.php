<?php
$tablecats = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
    $this_id = (int)$detail[$ID];
    unset($detail[$ID]);
$dup = true;

if(!$this_id) 
	{
	$tablecats->setWhere("mr_id = ".$detail['mr_id']." AND sp_id = ".$detail['sp_id']);
	if($tablecats->rowExists()){ $dup = false;}
	}
if($dup)
	{
if($_FILES['images']['name'])	
	{
	$datetime = trim(date('d_m_Y_H_i_'),'0');
	$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $_FILES['images']['name']);
	$path = BASE_DIR.'files/suppliers/materials/'.$docfile;	
	$thumbpath = BASE_DIR.'files/suppliers/materials/thumb/'.$docfile;		
	   
	   $image = new SimpleImage();	   
	   $image->load($_FILES['images']['tmp_name']);
	   $image->resizeToWidth(400);
	   $image->save($path);
	   $image->load($_FILES['images']['tmp_name']);
	   $image->resizeToWidth(150);
	   $image->save($thumbpath);	
	   
	   $detail['ms_image'] = $docfile;
	}	

    if ($this_id > 0)
    	{
        $tablecats->setWhere("$ID = $this_id");
        $tablecats->updateRow($detail);   
    	}
    else
    	{
        $tablecats->insertRow($detail);
    	}    
    Location(BASE_URL . $XFA['list']);
}else{
	$fwViewData['error'] = "Error! Products Exist.";
	$fwViewData['detail'] = $detail;
	}
}

$this_id = (int)$fwRequest->getParam($ID, 0);
if ($this_id > 0)
{
	$tablecats = new Fw_Db_Table($TABLE);
	$tablecats->setWhere("$ID = $this_id");
	$detail = $tablecats->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}

$tablePages = new Fw_Db_Table("materials");
$tablePages->setWhere("mr_status = 'Active'");
$tablePages->setOrderBy('mr_name ASC');
$fwViewData['marerials']=$tablePages->getRows();

$tablePages = new Fw_Db_Table("suppliers");
$tablePages->setWhere("sp_status = 'Active'");
$tablePages->setOrderBy('sp_name ASC');
$fwViewData['suppliers']=$tablePages->getRows();

$tablePages = new Fw_Db_Table("brands");
$tablePages->setWhere("br_status = 'Active'");
$tablePages->setOrderBy('br_name ASC');
$fwViewData['brands']=$tablePages->getRows();