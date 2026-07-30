<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table($TABLE);

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail[$ID];

	unset($detail[$ID]);
	
		if($_FILES['image1'])
		{
				$docfile_1 = $_FILES['image1']['name'];
				$file_type = $_FILES['image1']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$src = $_FILES['image1']['tmp_name'];
				$destination = BASE_DIR.'files/warranty_log/'.$docfile_1;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['wa_image_1'] = $docfile_1;
								chmod($destination, 0664);
							}						
		}
		
		if($_FILES['image2'])
		{
				$docfile_2 = $_FILES['image2']['name'];
				$file_type = $_FILES['image2']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_2 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
				$src = $_FILES['image2']['tmp_name'];
				$destination = BASE_DIR.'files/warranty_log/'.$docfile_2;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['wa_image_2'] = $docfile_2;
								chmod($destination, 0664);
							}						
		}
	
		if($_FILES['image3'])
		{
				$docfile_3 = $_FILES['image3']['name'];
				$file_type = $_FILES['image3']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_3 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_3);
				$src = $_FILES['image3']['tmp_name'];
				$destination = BASE_DIR.'files/warranty_log/'.$docfile_3;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['wa_image_3'] = $docfile_3;
								chmod($destination, 0664);
							}						
		}

	
		if($_FILES['image4'])
		{
				$docfile_4 = $_FILES['image4']['name'];
				$file_type = $_FILES['image4']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_4 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_4);
				$src = $_FILES['image4']['tmp_name'];
				$destination = BASE_DIR.'files/warranty_log/'.$docfile_4;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['wa_image_4'] = $docfile_4;
								chmod($destination, 0664);
							}						
		}
	
	
	
		if($_FILES['image5'])
		{
				$docfile_5 = $_FILES['image5']['name'];
				$file_type = $_FILES['image5']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_5 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_5);
				$src = $_FILES['image5']['tmp_name'];
				$destination = BASE_DIR.'files/warranty_log/'.$docfile_5;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['wa_image_5'] = $docfile_5;
								chmod($destination, 0664);
							}						
		}
	
	
    if($this_id > 0)
    	{
       		 $tableqa->setWhere("$ID = $this_id");
	     	 $opr = $tableqa->updateRow($detail);   
    	}
		else
		{
			 $opr = $tableqa->insertRow($detail); 
		}    	
	    $fwViewData['opr'] = $opr;
		
		//Location(BASE_URL . $XFA['home']);
}

$this_id = (int)$fwRequest->getParam($ID, 0);
if ($this_id > 0)
{
	$tableqa = new Fw_Db_Table($TABLE);
	$tableqa->setWhere("$ID = $this_id");
	$detail = $tableqa->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	

$sql = "SELECT  business.* from business";
		

$fwViewData['projdetail'] = $fwDb->query($sql);