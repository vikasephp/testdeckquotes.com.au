<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tablecats = new Fw_Db_Table($TABLE);
$tableindustry = new Fw_Db_Table('suppliers_industry');
$fwViewData['inddata'] = $tableindustry->getRows();


$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
    $this_id = (int)$detail[$ID];
    unset($detail[$ID]);
	
	if($_FILES['excel'])
		{
				$docfile_1 = $_FILES['excel']['name'];
				//$file_type = $_FILES['image1']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$src = $_FILES['excel']['tmp_name'];
				$destination = BASE_DIR.'files/suppliers/'.$docfile_1;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['sp_upload_excel'] = $docfile_1;
								chmod($destination, 0664);
							}						
		}
	
	
    if ($this_id > 0)
    	{
        $tablecats->setWhere("$ID = $this_id");
        $opr = $tablecats->updateRow($detail);   
    	}
    else
    	{
        $opr = $tablecats->insertRow($detail);
    	}    
  $fwViewData['opr'] = $opr;
}	

$this_id = (int)$fwRequest->getParam($ID, 0);

if ($this_id > 0)
{
	$tablecats->setWhere("$ID = $this_id");
	$detail = $tablecats->getRow();
	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}