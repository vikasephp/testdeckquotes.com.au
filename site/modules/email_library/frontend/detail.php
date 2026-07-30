<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tablecats = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
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
	$tablecats = new Fw_Db_Table($TABLE);
	$tablecats->setWhere("$ID = $this_id");
	$fwViewData['detail'] = $tablecats->getRow();
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}

$tablePages = new Fw_Db_Table("style_formula_types");
$tablePages->setWhere("sft_statues = 'Active'");
$tablePages->setOrderBy('sft_title ASC');
$fwViewData['formulatypes']=$tablePages->getRows();
