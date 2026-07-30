<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table($TABLE);

$docid = $fwRequest->getParam('docid', '');
if($docid > 0 && empty($submit))
{	
			
		$tableqa->setWhere("ic_id = ".$docid);
		$deldetail['ic_icon_image'] = '';
    
		$opr = $tableqa->updateRow($deldetail);
		$fwViewData['ic_id'] = $docid;
		unset($docid);			
}


$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail[$ID];
	
	$sqldup = "select * from icon_list where ic_icon_name  = '".$detail['ic_icon_name']."'";	
	
	$data = $fwDb->query($sqldup);
	
	
	if(!empty($data) && ($this_id == 0)) {
		$fwViewData['msg'] = "This icon is already entered...";
	} 
	else 
	{
	
		unset($detail[$ID]);
		
			if($_FILES['image1'])
			{
					$docfile_1 = $_FILES['image1']['name'];
					$file_type = $_FILES['image1']['type'];				
					$tmp = $_FILES['image1']['tmp_name'];
					$datetime = trim(date('d_m_Y_H_i_'),'0');
					$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
					$src = $_FILES['image1']['tmp_name'];
					$destination = BASE_DIR.'files/asset_list/'.$docfile_1;
					
					if (!move_uploaded_file($src, $destination))
					{
						//echo "Possible file upload attack";
					}
					else
					{
						$detail['ic_icon_image']= $docfile_1;
					
						chmod($destination, 0664);
					}
			}
						
		
	    if($this_id > 0)
		{
			 $tableqa->setWhere("$ID = $this_id");
			 $opr = $tableqa->updateRow($detail); 
			 
		         $detail_text['dif_text'] = $detail['ic_icon_text'] ;
 			 
			 $sql_key = "select ic_icon_name  from icon_list where ic_id  = ".$this_id;	
			 $data_key = $fwDb->queryOne($sql_key);
			 
			 $nm = $data_key['ic_icon_name'];
			 
			 
			 $tablekf = new Fw_Db_Table('design_interface_features'); 
			 $tablekf->setWhere("dif_key_feature = '".$nm."'");
			 $opr = $tablekf->updateRow($detail_text); 
		}
		else
		{
			 $opr = $tableqa->insertRow($detail); 
		}    	
		
	    $fwViewData['opr'] = $opr;
	}
		//Location(BASE_URL . $XFA['home']);
}

$this_id = (int)$fwRequest->getParam($ID, 0);
if ($this_id > 0)
{
	$tableqa = new Fw_Db_Table($TABLE);
	$tableqa->setWhere("$ID = $this_id");
	$detail = $tableqa->getRow();
	$img = explode(".",$detail['ic_icon_image']);
	$fwViewData['type'] = strtoupper($img[1]);
	$fwViewData['ic_id'] = $this_id;
	
	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
         $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}


$sqlk = "select * from design_interface_keyfeatures";
$fwViewData['keydata'] = $fwDb->query($sqlk);

	