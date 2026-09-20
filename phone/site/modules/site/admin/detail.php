<?php

$submit = $fwRequest->getParam('subAddDetail', '');
	
if(!empty($submit))
{
    $detail = $fwRequest->getParam('images', array());
    $img_id = (int)$detail['img_id'];
    unset($detail['img_id']);
	
    $this_id = (int)$detail['img_id']; 
	
	


   $image = isset($_FILES['image']['name']) ? $_FILES['image']['name'] : '';
   

    if(!empty($image))
    {
        $image = str_replace(' ', '_', $image);
        
        preg_replace('/[^A-Z0-9._]/i', '_', $image);
          
        $src = $_FILES['image']['tmp_name'];
	
       $destination = BASE_DIR . 'upload/' . $image;
        if (move_uploaded_file($src, $destination))
        {
            chmod($destination, 0664);
            
            $detail['img_path'] = $image;
        }
        else
        {
            die('Sorry, the system was unable to upload the project image.');
        }
    }
  
  
    $thisTable = new Fw_Db_Table('images');
	if ($img_id > 0)
    {
        $thisTable->setWhere("img_id = $img_id");
        $thisTable->updateRow($detail);
    }
    else
    {
        $thisTable->insertRow($detail);
    }
    
    Location($BASE_URL . $XFA['images']);
}	

	

$img_id = (int)$fwRequest->getParam('img_id', 0);



if ($img_id > 0)
{
	$tablePages = new Fw_Db_Table('images');
	$tablePages->setWhere("img_id = $img_id");
	$detail = $tablePages->getRow();
	$fwViewData['detail'] = $detail;

   
    $fwViewData['title'] = 'Edit Image';
}
else
{
    $fwViewData['title'] = 'Add Image';
}