<?php
$thisTable = new Fw_Db_Table('profile');

$u_id = $_SESSION['user']['user_id'];
$submit = $fwRequest->getparam('subAddDetail', '');
$p_id = $fwRequest->getparam('profile_id', '');

   	$data1 = new Fw_Db_Table('profile');
	$data1->setWhere("profile_id = $p_id");
	$data = $data1->getRow();
   // $fwViewData['cdata'] = $cdata;
    $fwViewData['detail'] = $data;

if(!empty($submit))
{
$detail = $fwRequest->getparam('profile', '');
$detail['user_id'] = $u_id;
$p_id = $detail['profile_id'];




												//		$part_id = (int)$detail['part_id'];
												//		unset($detail['part_id']);
														
												// 	for main image	
												//	$Mimage = isset($_FILES['image2']['name']) ? $_FILES['image2']['name'] : '';
												//
												//	if(!empty($Mimage))
												//	{
												//	$Mimage = str_replace(' ', '_', $Mimage);
												//
												//	preg_replace('/[^A-Z0-9._]/i', '_', $Mimage);
												//  
												//	$src = $_FILES['image2']['tmp_name'];
												//
												//	$destination = BASE_DIR . 'images/' . $Mimage;
												//	if (move_uploaded_file($src, $destination))
												//	{
												//		chmod($destination, 0664);
												//	
												//		$detail['part_main_image'] = $Mimage;
												//	}
												//	else
												//	{
												//		die('Sorry, the system was unable to upload the project image.');
												//	}
												//	}
  
		
		
		
			if($p_id > 0)
			{
			    $thisTable->setWhere("profile_id = $p_id");
				$thisTable->updateRow($detail);
				Location(BASE_URL . $XFA['list']);
			}
			else
			{
				$thisTable->setWhere("profile_id = ".$detail['profile_id']);
	
				if(!$thisTable->rowExists())
				{
			
						$profile_id = $thisTable->insertRow($detail);             
				}
				else
				{	
					$fwViewData['msg'] = "This Profile already present";
				}
			}					
		
	
		if(!$fwViewData['msg'])
		{
			//Location($settings['site']['root'] . $XFA['list']);
			Location(BASE_URL . $XFA['list']);
		}
}	
