<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table('time_tracker');
$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
    	$detail = $fwRequest->getParam($TABLE, array());
	    $this_id = (int)$detail['tt_id'];

	unset($detail[$ID]);
	
		if($_FILES['image1'])
		{
				$docfile_1 = $_FILES['image1']['name'];
				$file_type = $_FILES['image1']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$src = $_FILES['image1']['tmp_name'];
				$destination = BASE_DIR.'files/uploads/'.$docfile_1;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['car_image1'] = $docfile_1;
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
				$destination = BASE_DIR.'files/uploads/'.$docfile_2;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['car_image2'] = $docfile_2;
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
				$destination = BASE_DIR.'files/uploads/'.$docfile_3;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['car_image3'] = $docfile_3;
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
				$destination = BASE_DIR.'files/uploads/'.$docfile_4;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['car_image4'] = $docfile_4;
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
				$destination = BASE_DIR.'files/uploads/'.$docfile_5;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['car_image5'] = $docfile_5;
								chmod($destination, 0664);
							}						
		}
	
	
    if($this_id > 0)
    	{
       		 $tableqa->setWhere("tt_id = $this_id");
	     	 $opr = $tableqa->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableqa->insertRow($detail); 
	}    	
    
    $fwViewData['opr'] = $opr;
		
		//Location(BASE_URL . $XFA['home']);
}



$this_id = (int)$fwRequest->getParam('tt_id', 0);
if ($this_id > 0)
{
	$tableqa = new Fw_Db_Table('time_tracker');
	$tableqa->setWhere("tt_id = $this_id");
	$detail = $tableqa->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;	
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	

$sql = "SELECT  bsn_name from business";
$fwViewData['projdetail'] = $fwDb->query($sql);
