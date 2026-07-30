<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$user_id = $_SESSION['user']['user_id'];
$tableDocuments = new Fw_Db_Table($TABLE);
$tabledoc = new Fw_Db_Table($TABLE2);
$this_id = $fwRequest->getParam($ID, '');
$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
	$this_id=$detail[$ID];
	unset($detail[$ID]);
	$detail['bi_author']= $user_id;
	if($_FILES['docs'])
		{
		$docfile = $_FILES['docs']['name'];
		$file_type = $_FILES['docs']['type'];
							
			$datetime = trim(date('d_m_Y_H_i_'),'0');
			$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
			$src = $_FILES['docs']['tmp_name'];
			
			upload($docfile, $src);
			
			$docs['bid_name'] = $docfile;
			$docs['bid_type'] = $file_type;
			$docs['bid_size'] = $_FILES['docs']['size'];
			$docs['bid_insert_date'] = date('Y-m-d H:i');
			
//			$destination = BASE_DIR.FILE_PATH.'files/'.$Document_path.'/'.$docfile;
//										
//							if (!move_uploaded_file($src, $destination))
//							{
//								//echo "Possible file upload attack";
//							}
//							else
//							{
//								$docs['bid_name'] = $docfile;
//								$docs['bid_type'] = $file_type;
//								$docs['bid_size'] = $_FILES['docs']['size'];
//								$docs['bid_insert_date'] = date('Y-m-d H:i');
//								chmod($destination, 0664);
//							}

		}
			if($this_id)
				{
							$docs[$ID2]= $this_id;
							$tableDocuments->setWhere($ID." = ".$this_id);
							$detail['bi_insert_date  '] = date('Y-m-d H:i');
							$this_id = $tableDocuments->updateRow($detail);		
				}
			else
				{
							$detail['bi_insert_date'] = date('Y-m-d H:i');
				 			$this_id = $tableDocuments->insertRow($detail); 
							$docs[$ID2]= $this_id;         			
				}	

			if($docs['bid_name']){ $tabledoc->insertRow($docs);	}

if($this_id){$fwViewData['opr'] = "Success!";}
}	
if ($this_id > 0)
	{
		$sql1 = "Select ".$TABLE.".* from ".$TABLE." where ".$TABLE.".".$ID." = ". $this_id;
		$fwViewData['detail'] = $fwDb->queryOne($sql1);			 
		$fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
	}
else
	{
		$fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
	}

