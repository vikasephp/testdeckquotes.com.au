<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table($TABLE);

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail[$ID];

	

	unset($detail[$ID]);
	
		if($_FILES['image1']['name'])
		{
				
				$docfile_1 = $_FILES['image1']['name'];
				$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$temp_name_1 = $_FILES['image1']['tmp_name'];
				$detail['bb_image'] = $docfile_1;
				upload($docfile_1, $temp_name_1);
				
				
//				$docfile_1 = $_FILES['image1']['name'];
//				$file_type = $_FILES['image1']['type'];				
//				
//				$datetime = trim(date('d_m_Y_H_i_'),'0');
//				$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
//				$src = $_FILES['image1']['tmp_name'];
//				$destination = BASE_DIR.'files/brief_builder/'.$docfile_1;
//				
//					if(!move_uploaded_file($src, $destination))
//							{
//								//echo "Possible file upload attack";
//							}
//					else
//							{
//								$detail['bb_image'] = $docfile_1;
//								chmod($destination, 0664);
//							}						
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


$sqlcat = "Select * from brief_builder_catergory";
$fwViewData['catData'] = $fwDb->query($sqlcat);