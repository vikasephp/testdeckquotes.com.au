<?php
$fwMainView = 'file:' . getcwd() . '/add_image.tpl';
$tablecats = new Fw_Db_Table('galleries_fpl');
$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('galleries_fpl', array());
	$this_id = (int)$detail['ig_id'];
    
	unset($detail['ig_id']); 
	
			if($_FILES['image']['name'])
				{
				
				$docfile_1 = $_FILES['image']['name'];
				$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$temp_name_1 = $_FILES['image']['tmp_name'];
				$detail['file'] = $docfile_1;
				upload($docfile_1, $temp_name_1);
				
				
//				$docfile = $_FILES['image']['name'];
//				$file_type = $_FILES['image']['type'];
//				$datetime = trim(date('Hi'),'0');
//				$docfile = strtolower(preg_replace('/[^A-Z0-9._]/i', '_', $docfile));
//				$src = $_FILES['image']['tmp_name'];				
//				$destination = BASE_DIR.FILE_PATH.'files/galleries/'.$docfile;
//
//					if (!move_uploaded_file($src, $destination))
//						{
//							//echo "Possible file upload attack";
//						}
//					else
//						{
//							$detail['file'] = $docfile;
//							$detail['type'] = $file_type;
//							$detail['size'] = $_FILES['image']['size'];
//							chmod($destination, 0664);
//						}
									
				// Load the original image
				//$image = new SimpleImage();
//				$image->load(BASE_DIR.'files/galleries/'.$docfile);			
//				// Create a squared version of the image
//				$image->resizeToWidth(250);
//				$image->save(BASE_DIR.'files/galleries/250_'.$docfile);
//				$image->resizeToWidth(50);
//				$image->save(BASE_DIR.'files/galleries/50_'.$docfile);
	}
	//if($detail['tags']): $detail['tags'] = implode(",", $detail['tags']);  endif;
   
    if($this_id > 0)
    	{
        $tablecats->setWhere("ig_id = $this_id");
        $opr = $tablecats->updateRow($detail);   
    	} else{ $opr = $tablecats->insertRow($detail); }    	
	    
		$fwViewData['opr'] = $opr;
		
}

$this_id = (int)$fwRequest->getParam('ig_id', 0);


if ($this_id > 0)
{
	$tablecats = new Fw_Db_Table('galleries_fpl');
	$tablecats->setWhere("ig_id = $this_id");
	$detail = $tablecats->getRow();
	//if($detail['tags']): $detail['tags'] = explode(",", $detail['tags']); else:$detail['tags'] = array(); endif;
	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit Image';
}
else
{
    $fwViewData['title'] = 'Add Image';
}

$tablePages = new Fw_Db_Table("style_formula_types");
$tablePages->setWhere("sft_statues = 'Active'");
$tablePages->setOrderBy('sft_title ASC');
$fwViewData['formulatypes']=$tablePages->getRows();