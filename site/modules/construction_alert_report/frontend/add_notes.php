<?php
$fwMainView = 'file:' . getcwd() . '/add_notes.tpl';
$tableTask = new Fw_Db_Table('car_notes');
$car_id = (int)$fwRequest->getParam('car_id', 0);
$fwViewData['car_id'] = $car_id;

$user = $_SESSION['user']['user_name'];
$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('notes', array());
	$this_id = (int)$detail['cn_id'];
	unset($detail['cn_id']);
	
	$detail['cn_date'] = date('d-m-Y');
	$detail['cn_car_id'] = $car_id;
	$detail['cn_added_by'] = $user;
	
	if($_FILES['supp_attach'])
		{
				$docfile_1 = $_FILES['supp_attach']['name'];
				$file_type = $_FILES['supp_attach']['type'];				
				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$src = $_FILES['supp_attach']['tmp_name'];
				$destination = BASE_DIR.'files/uploads/'.$docfile_1;
				
	
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['cn_attachment'] = $docfile_1;
								chmod($destination, 0664);
								
							}
													
		}
	
	

	
    if($this_id > 0)
    	{
      		 unset($detail['cn_id']);
       		 $tableTask->setWhere("cn_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
			
}

$this_id = (int)$fwRequest->getParam('cn_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('car_notes');
	$tableTask->setWhere("cn_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
     $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
