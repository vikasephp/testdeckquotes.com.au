<?php
$fwMainView = 'file:' . getcwd() . '/letter_upload.tpl';
$tableqa = new Fw_Db_Table('letter_code');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('lettercode', array());
	$this_id = (int)$detail['lc_id'];

	unset($detail['lc_id']);
	
	if($_FILES['letter'])
		{
				$docfile_1 = $_FILES['letter']['name'];
				$file_type = $_FILES['letter']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$src = $_FILES['letter']['tmp_name'];
				
				$detail['lc_upload'] = $docfile_1;
				upload($docfile_1, $src);
				
				
			//	$destination = BASE_DIR.'files/uploads/'.$docfile_1;
//				
//					if(!move_uploaded_file($src, $destination))
//							{
//								//echo "Possible file upload attack";
//							}
//					else
//							{
//								$detail['lc_upload'] = $docfile_1;
//								chmod($destination, 0664);
//							}						
		}
			
	
    if($this_id > 0)
    	{
       		 $tableqa->setWhere("lc_id = $this_id");
	     	 $opr = $tableqa->updateRow($detail);   
    	}
		else
		{
			 $opr = $tableqa->insertRow($detail); 
		}    	
	    $fwViewData['opr'] = $opr;
		
		Location(BASE_URL . 'timeline_report.view_letter');
}

$this_id = (int)$fwRequest->getParam('lc_id', 0);
if ($this_id > 0)
{
	$tableqa = new Fw_Db_Table('letter_code');
	$tableqa->setWhere("lc_id = $this_id");
	$detail = $tableqa->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	