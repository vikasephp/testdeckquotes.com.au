<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table($TABLE);

$fwViewData['user']= $_SESSION['user']['user_name'];
$fwViewData['currdate'] = date('d-m-Y');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
    $this_id = (int)$detail[$ID];


    unset($detail[$ID]);
	
     if($_FILES['document']['name'])
		{
			
			$docfile_1 = $_FILES['document']['name'];
			$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
			$temp_name_1 = $_FILES['document']['tmp_name'];
			$detail['dd_document'] = $docfile_1;
			upload($docfile_1, $temp_name_1);
			
			
//			
//			$docfile_1 = $_FILES['document']['name'];
//			$file_type = $_FILES['document']['type'];				
//			
//			$datetime = trim(date('d_m_Y_H_i_'),'0');
//			$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
//			$src = $_FILES['document']['tmp_name'];
//			$destination = BASE_DIR.'files/mistake_log/'.$docfile_1;
//			
//				if(!move_uploaded_file($src, $destination))
//						{
//							//echo "Possible file upload attack";
//						}
//				else
//						{
//							$detail['dd_document'] = $docfile_1;
//							chmod($destination, 0664);
//						}						
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
	$fwViewData['this_id'] = $this_id;
}
else
{
        $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
