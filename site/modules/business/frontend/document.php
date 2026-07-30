<?php
$fwMainView = 'file:' . getcwd() . '/document.tpl';
$submit = $fwRequest->getParam('subAddDetail', '');
$user_id = $_SESSION['user']['user_id'];
$fwViewData['bsn_id'] = $fwRequest->getParam('bsn_id', '');
$$tablebusinessseller = new Fw_Db_Table('business_documents');
$bd_id = $fwRequest->getparam('bd_id', 0); 

if($bd_id > 0)
	{
$sql2="SELECT * FROM business_documents WHERE bd_id = ".$bd_id;
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
				$valid_file_types = array('image/jpeg','image/gif','image/png','image/bmp', 'application/pdf');
			   
				if(in_array($file_type, $valid_file_types))
				{
					$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
					$src = $_FILES['image']['tmp_name'];
					$destination = BASE_DIR . 'files/business_docs/'.$docfile;
					$detail['bd_doc_name']= $docfile;
								/*list($width, $height, $type, $attr) = getimagesize($_FILES['image']['tmp_name']);
				  				$detail['bf_width'] = $width;
								$detail['bf_height'] = $height;
								$detail['bf_type'] = $type;
								$detail['bf_attr'] = $attr;*/
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

$table_id =  (int)$detail['bd_id'];
$_SESSION['bsn_id'] = (int)$detail['bd_bsi_id'];



unset($detail['bd_id']);
				
						if($table_id > 0)
						{
							$$tablebusinessseller->setWhere("bd_id = ".$table_id);
							$id= $$tablebusinessseller->updateRow($detail);
						}
						else
						{
							$detail['bd_user_id'] = $user_id;
						
							$id=$$tablebusinessseller->insertRow($detail);
						}

$fwViewData['msg'] = $id;
}
if(empty($fwViewData['bsn_id']))
{$fwViewData['bsn_id'] = $_SESSION['bsn_id'];}