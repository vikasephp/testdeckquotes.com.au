<?php
$tablecats = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');
$this_id = (int)$fwRequest->getParam($ID, 0);

if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
    $this_id = (int)$detail[$ID];
    unset($detail[$ID]);
	
	$detail['es_signature'] = stripslashes($detail['es_signature']);
	
	if($_FILES['logo'])
				{
				$docfile = $_FILES['logo']['name'];
				
				$file_type = $_FILES['logo']['type'];
				$refku = date("Ymdis", time());
				$docfile = strtolower(preg_replace('/[^A-Z0-9._]/i', '_', $docfile));
				$docfile = $refku .'_'.$docfile;
				$src = $_FILES['logo']['tmp_name'];				
				$destination = BASE_DIR.FILE_PATH.'files/email_library/'.$docfile;
	
					if (!move_uploaded_file($src, $destination))
						{
							echo "Possible file upload attack";
						}
					else
						{
							$detail['es_logo'] = $docfile;
							//$detail['type'] = $file_type;
							//$detail['size'] = $_FILES['image']['size'];
							chmod($destination, 0664);
						}
					}

      if($this_id > 0)
    	{
        $tablecats->setWhere("$ID = $this_id");
        $opr = $tablecats->updateRow($detail);   
		Location(BASE_URL. $XFA['list']);
    	}
    else
    	{
		$lastSql = "SELECT eml_id, eml_unique_id  FROM emaillibrary ORDER BY eml_id DESC LIMIT 1" ; 
		$lastdata  = $fwDb->query($lastSql);
			
		$tablecats-> setWhere("es_name='".$detail['es_name']."'");
		
		
			if($tablecats->rowExists())
			{
				$fwViewData['message'] = "Signature Name Already Exists";
				$fwViewData['detail'] = $detail;
			}
			else
			{	
				$opr = $tablecats->insertRow($detail);
				Location(BASE_URL. $XFA['list']);
			}
		} 
		
	}
//}

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