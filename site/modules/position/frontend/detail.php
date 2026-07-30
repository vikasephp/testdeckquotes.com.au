<?php
$table = new Fw_Db_Table('positions');
$submit = $fwRequest->getParam('subAddDetail', '');
$fwViewData['positions'] = $table->getRows();	
if(!empty($submit))
{
	 $detail = $fwRequest->getParam('position', array());
		
	
		if($_FILES['pdoc']['name'])
		{	
			$datetime = trim(date('d_m_Y_H_i_'),'0');
			$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $_FILES['pdoc']['name']);
			$path = BASE_DIR.'files/user_docs/'.$docfile;
			
			if(move_uploaded_file($_FILES['pdoc']['tmp_name'],$path)){
					$detail['p_document'] = $docfile;
			}else{
					die("Error on uploading!");
			}	
		}
	
		if($_FILES['pdoc2']['name'])
		{	
			$datetime = trim(date('d_m_Y_H_i_'),'0');
			$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $_FILES['pdoc2']['name']);
			$path = BASE_DIR.'files/user_docs/'.$docfile;
			
			if(move_uploaded_file($_FILES['pdoc2']['tmp_name'],$path)){
					$detail['p_relevant_award'] = $docfile;
			}else{
					die("Error on uploading!");
			}	
		}
	
		if($_FILES['pdoc3']['name'])
		{	
			$datetime = trim(date('d_m_Y_H_i_'),'0');
			$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $_FILES['pdoc3']['name']);
			$path = BASE_DIR.'files/user_docs/'.$docfile;
			
			if(move_uploaded_file($_FILES['pdoc3']['tmp_name'],$path)){
					$detail['p_position_budget_tool'] = $docfile;
			}else{
					die("Error on uploading!");
			}	
		}


		if($_FILES['pdoc4']['name'])
		{	
			$datetime = trim(date('d_m_Y_H_i_'),'0');
			$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $_FILES['pdoc4']['name']);
			$path = BASE_DIR.'files/user_docs/'.$docfile;
			
			if(move_uploaded_file($_FILES['pdoc4']['tmp_name'],$path)){
					$detail['p_advertising_text'] = $docfile;
			}else{
					die("Error on uploading!");
			}	
		}	

		if($_FILES['pdoc5']['name'])
		{	
			$datetime = trim(date('d_m_Y_H_i_'),'0');
			$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $_FILES['pdoc5']['name']);
			$path = BASE_DIR.'files/user_docs/'.$docfile;
			
			if(move_uploaded_file($_FILES['pdoc5']['tmp_name'],$path)){
					$detail['p_letter_of_offer'] = $docfile;
			}else{
					die("Error on uploading!");
			}	
		}

		if($_FILES['pdoc6']['name'])
		{	
			$datetime = trim(date('d_m_Y_H_i_'),'0');
			$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $_FILES['pdoc6']['name']);
			$path = BASE_DIR.'files/user_docs/'.$docfile;
			
			if(move_uploaded_file($_FILES['pdoc6']['tmp_name'],$path)){
					$detail['p_learning_development'] = $docfile;
			}else{
					die("Error on uploading!");
			}	
		}
	
    $table_id = (int)$detail['p_id'];
    unset($detail[$ID]);

	if(!empty($table_id))
	{
		
		$table->setWhere("p_id = ".$table_id);
		$table->updateRow($detail);
	}
	else{
		db("Testing");
		
		$table->insertRow($detail);
		//exit;
		}

    Location(BASE_URL . $XFA['list']);
}	

$table_id = (int)$fwRequest->getParam('p_id', 0);


if ($table_id > 0)
{
	$table->setWhere("p_id = $table_id");
	$detail = $table->getRow();
	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}