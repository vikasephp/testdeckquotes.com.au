<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$user_id = $_SESSION['user']['user_id'];
$tableDocuments = new Fw_Db_Table($TABLE);
$this_id = $fwRequest->getParam($ID, '');
$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
	$this_id=$detail[$ID];
	unset($detail[$ID]);
	$detail['bg_auther']= $user_id;
	

	if($_FILES['docs']['size'] > 0)
		{
		$docfile = $_FILES['docs']['name'];
		$file_type = $_FILES['docs']['type'];
							
							$datetime = trim(date('d_m_Y_H_i_'),'0');
							$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
							$src = $_FILES['docs']['tmp_name'];
							$destination = BASE_DIR.FILE_PATH.'files/'.$Document_path.'/'.$docfile;
										
							if (!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
							else
							{
								$detail['bg_image_path'] = $docfile;
								$detail['bg_type'] = $file_type;
								$detail['bg_size'] = $_FILES['docs']['size'];
								$detail['bg_insert_date'] = date('Y-m-d H:i');
								
								chmod($destination, 0664);
							}

		}
			if($this_id)
				{
								$tableDocuments->setWhere($ID." = ".$this_id);
							$detail['bg_last_update'] = date('Y-m-d H:i');
							$this_id = $tableDocuments->updateRow($detail);		
				}
			else
				{
							$detail['bg_insert_date'] = date('Y-m-d H:i');
				 			$this_id = $tableDocuments->insertRow($detail); 
						       			
				}	
			
			
if($this_id){$fwViewData['opr'] = "Success!";}
}	

if ($this_id > 0)
	{
		$sql1 = "Select ".$TABLE.".* from ".$TABLE."
				 where ".$TABLE.".".$ID." = ". $this_id;
		$fwViewData['detail'] = $fwDb->queryOne($sql1);			 
		$fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
	}
else
	{
		$fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
	}

