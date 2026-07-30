<?php
$thisTable = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getparam('subAddDetail', '');
$temp_sec = $fwRequest->getparam($TABLE, array());
$temp_section = $temp_sec['et_section'];

if(!empty($submit))
{
   $detail = $fwRequest->getparam($TABLE, array());
	 $id = (int)$detail[$ID];
     unset($detail[$ID]);


if($detail['et_status']){$detail['et_status'] = 1;}else{$detail['et_status'] = 0;}

	if($_FILES['attachment']['name'])
		{
		
		for($i=0; $i<6; $i++)
			{
		$docfile = $_FILES['attachment']['name'][$i];
		
				if($docfile)
					{
							$file_type = $_FILES['attachment']['type'][$i];
	$valid_file_types = array('image/jpeg','image/gif','image/png','image/bmp', 'application/pdf','application/vnd.openxmlformats-officedocument.wordprocessingml.document');
						   
							if(in_array($file_type, $valid_file_types))
								{
									$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
									$src = $_FILES['attachment']['tmp_name'][$i];
									$destination = BASE_DIR.FILE_PATH.'files/template_files/'.$docfile;
									$detail['et_attachment'][]= $docfile;
												
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
			}
		}
//$detail['et_attachment'] = serialize($detail['et_attachment']);	
		 if($id > 0)
			{			
				$thisTable->setWhere("$ID = $id");
				$tempdata = $thisTable->getRow();
				$old_atta_array = $tempdata['et_attachment'];
	
				if($old_atta_array){$array1 = unserialize($old_atta_array);}
				if($detail['et_attachment']){$array2 = $detail['et_attachment'];}

				if(!empty($array1) && is_array($array1) && !empty($array2) && is_array($array2))
					{
					$array = array_merge($array1, $array2);		
					}elseif($array1)
					{
					$array = $array1;
					}elseif($array2)
					{
					$array = $array2;
					}

				if($array){$detail['et_attachment'] = serialize($array);}
				$thisTable->updateRow($detail);
			}
			else
			{	
			 $id = $thisTable->insertRow($detail); 
			 Location(BASE_URL. $XFA['list']);
			             
			}
			if($detail['et_section'] == 1 OR $detail['et_section'] == 5)
				{
		
				}
	//Location(BASE_URL. $XFA['list']);
}
$fwViewData['title'] = "Add ".$MODULE_SINGULAR;
$fwViewData['button'] = "Add";
$id = (int)$fwRequest->getParam($ID, 0);
if($id > 0)
{
    $thisTable->setWhere("$ID = $id");
	$fwViewData['detail'] = $thisTable->getRow();
	//$fwViewData['detail']['et_body'] = ($fwViewData['detail']['et_body']) ? stripslashes($fwViewData['detail']['et_body']):'';
    $fwViewData['title']= "Edit ".$MODULE_SINGULAR;
	$fwViewData['button'] = "Edit";
$temp_section = $fwViewData['detail']['et_section'];
$fwViewData['B_TASKS_ID'] = $fwViewData['detail']['et_task'];
$et_attachment = $fwViewData['detail']['et_attachment'];
$fwViewData['et_attachments'] = unserialize($et_attachment);
}

$thisTable_types = new Fw_Db_Table('email_type');
$fwViewData['types'] = $thisTable_types->getAllRows();
if(!empty($temp_section))
		{

			switch ($temp_section)
				{
					case 1:
					$fwViewData['name'] = 'show';
					$fwViewData['attachment'] = 'show';
					break;
					
					case 3:
					$fwViewData['name'] = 'show';
					$fwViewData['attachment'] = 'hide';
					break;
					
					case 2:
					$fwViewData['name'] = 'show';
					$fwViewData['attachment'] = 'show';
					
					if($temp_sec['et_task_status'])
						{
						$fwViewData['B_STATUS_ID'] = $temp_sec['et_task_status'];
						}else{
					$fwViewData['B_STATUS_ID'] = $fwViewData['detail']['et_task_status'];
						}
						
						
					$thisTable_types = new Fw_Db_Table('busness_status');
					$fwViewData['B_STATUS'] = $thisTable_types->getAllRows();
					if($fwViewData['B_STATUS_ID'])
						{				
						$thisTable_types = new Fw_Db_Table('busness_status_task');
						$thisTable_types->setWhere("bst_business_status_id =".$fwViewData['B_STATUS_ID']);
						$fwViewData['B_TASKS'] = $thisTable_types->getAllRows();
						}				
					break;
									
					case 4:
					$fwViewData['name'] = 'show';
					$fwViewData['attachment'] = 'show';
						
					if($temp_sec['et_task_types'])
						{
						$fwViewData['B_TYPES_ID'] = $temp_sec['et_task_types'];
						}else{
					$fwViewData['B_TYPES_ID'] = $fwViewData['detail']['et_task_types'];
						}
			
					$thisTable_types = new Fw_Db_Table('project_type');
					$fwViewData['B_TYPES'] = $thisTable_types->getAllRows();
					if($fwViewData['B_TYPES_ID'])
						{				
						$thisTable_types = new Fw_Db_Table('project_types_task');
						$thisTable_types->setWhere("bst_business_status_id =".$fwViewData['B_TYPES_ID']);
						$fwViewData['B_TYPE_TASKS'] = $thisTable_types->getAllRows();
						}
					break;
					
					case 5:
					$fwViewData['name'] = 'show';
					$fwViewData['attachment'] = 'show';
					break;
					
					case 6:
					$fwViewData['name'] = 'show';
					$fwViewData['attachment'] = 'show';
					break;
					
					case 7:
					$fwViewData['name'] = 'show';
					$fwViewData['attachment'] = 'hide';
					break;
					
					default:
					$fwViewData['name'] = 'show';
					$fwViewData['attachment'] = 'hide';
					break;
				}
		$fwViewData['section'] = $temp_section;
		}