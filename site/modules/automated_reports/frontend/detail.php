<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tablecats = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
    $this_id = (int)$detail[$ID];
    unset($detail[$ID]);
 
 		if($_FILES['rulesdoc'])
		{
				$docfile_1 = $_FILES['rulesdoc']['name'];
				$file_type = $_FILES['rulesdoc']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$src = $_FILES['rulesdoc']['tmp_name'];
				$destination = BASE_DIR.'files/meeting_minutes_doc/'.$docfile_1;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								//db("Testing");
								//exit;
								$detail['ar_rules_doc'] = $docfile_1;
								chmod($destination, 0664);
							}						
		}
 
 	//db($detail);
	//exit;
 
      if($this_id > 0)
    	{
			$tablecats->setWhere("$ID = $this_id");
			$edata = $tablecats->getRow();
						
			$detail['ar_receving_email'] = $edata['ar_receving_email'] . " , " . $detail['ar_email'];
	        $opr = $tablecats->updateRow($detail);   
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
    $fwViewData['title'] = 'Create '.$MODULE_SINGULAR;
}

