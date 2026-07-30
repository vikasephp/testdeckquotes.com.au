<?php
$table = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');
$fwViewData['positions'] = $table->getRows();	
if(!empty($submit))
{
	 $detail = $fwRequest->getParam($TABLE, array());
	
		if($_FILES['pdoc']['name'])
		{	
			
			$datetime = trim(date('d_m_Y_H_i_'),'0');
			$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $_FILES['pdoc']['name']);
			$path = BASE_DIR.'files/user_docs/'.$docfile;
			
			if(move_uploaded_file($_FILES['pdoc']['tmp_name'],$path)){
					//print("Done! File saved...");
					$detail['p_document'] = $docfile;
			}else{
					die("Error on uploading!");
			}	
	
		}
	
    $table_id = (int)$detail[$ID];
    unset($detail[$ID]);

	if(!empty($table_id))
	{
		
		$table->setWhere($ID." = ".$table_id);
		$table->updateRow($detail);
	}
	else{

		$table->insertRow($detail);
		}

    Location(BASE_URL . $XFA['list']);
}	

$table_id = (int)$fwRequest->getParam($ID, 0);


if ($table_id > 0)
{
	$table->setWhere("$ID = $table_id");
	$detail = $table->getRow();
	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}