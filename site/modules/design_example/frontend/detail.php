<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tablecats = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
    $this_id = (int)$detail[$ID];
    unset($detail[$ID]);
	$detail['userid'] = $_SESSION['user']['user_id'];
		$allowtypes = array('image/jpeg', 'image/png', 'image/gif');
		if($_FILES['docs'])
		{
		$docfile = $_FILES['docs']['name'];
		$file_type = $_FILES['docs']['type'];
		
							$datetime = trim(date('d_m_Y_H_i_'),'0');
							$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
							$src = $_FILES['docs']['tmp_name'];						
							$destination = BASE_DIR.'files/design_examples/'.$docfile;	
							if (!move_uploaded_file($src, $destination))
								{
									echo "Possible file upload attack";
								}
							else
								{
									$detail['de_design_image']= $docfile;
							
									chmod($destination, 0664);
								}	
					if(in_array($file_type, $allowtypes)):									
					// Load the original image
					$image = new SimpleImage();
					$image->load(BASE_DIR.'files/design_examples/'.$docfile);			
					// Create a squared version of the image
					$image->resizeToWidth(200);
					$image->save(BASE_DIR.'files/design_examples/thumb/'.$docfile);
					endif;														
		}

	  if($this_id > 0)
		{
		$tablecats->setWhere("$ID = $this_id");
		$opr = $tablecats->updateRow($detail);   
		}
	else
		{
		$opr = $tablecats->insertRow($detail);
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
		$fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
	}