<?php
$fwMainView = 'file:' . getcwd() . '/upload.tpl';
$submit = $fwRequest->getParam('subAddDetail', '');
$fwViewData['bsn_id'] = $fwRequest->getParam('bsn_id', '');
$$tablebusinessseller = new Fw_Db_Table('business_file');
$bf_id = $fwRequest->getparam('bf_id', 0); 

if($bf_id > 0)
	{
$sql2="SELECT * FROM business_file WHERE bf_id = ".$bf_id;
$userData= $fwDb->queryOne($sql2);
$fwViewData['detail'] = $userData;
$fwViewData['button'] = "Edit";
}else{$fwViewData['msg'] =0;
$fwViewData['button'] = "Add";	}	
if($submit)
{
 $detail = $fwRequest->getParam($TABLE, array());	

	if($_FILES['image'])
		{
		$docfile = $_FILES['image']['name'];
		$file_type = $_FILES['image']['type'];
			


				$valid_file_types = array('image/jpeg','image/gif','image/png','image/bmp');
			   
				if(in_array($file_type, $valid_file_types))
				{
					$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
					$src = $_FILES['image']['tmp_name'];
					$destination = BASE_DIR . 'files/business_files/'.$docfile;
					$detail['bf_name']= $docfile;
								list($width, $height, $type, $attr) = getimagesize($_FILES['image']['tmp_name']);
				  				$detail['bf_width'] = $width;
								$detail['bf_height'] = $height;
								$detail['bf_type'] = $type;
								$detail['bf_attr'] = $attr;
					if (!move_uploaded_file($src, $destination))
					{
						echo "Possible file upload attack";
						
					}
					else
					{
						chmod($destination, 0664);
					}
				
				}
		
		}

$bf_bsn_id = (int)$detail['bf_bsn_id'];
$table_id =  (int)$detail['bf_id'];
$_SESSION['bsn_id'] = $bf_bsn_id;
unset($detail['bs_id']);
				
						if($table_id > 0)
						{
							$$tablebusinessseller->setWhere("bf_id = ".$table_id);
							$id= $$tablebusinessseller->updateRow($detail);
						}
						else
						{
							$id=$$tablebusinessseller->insertRow($detail);
						}

$fwViewData['msg'] = $id;
}
if(empty($fwViewData['bsn_id']))
{$fwViewData['bsn_id'] = $_SESSION['bsn_id'];}