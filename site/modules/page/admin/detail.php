<?php

$submit = $fwRequest->getParam('subAddDetail', '');
	
if(!empty($submit))
{
    $detail = $fwRequest->getParam('pages', array());
	$detail['page_body'] = stripslashes($detail['page_body']);
	
	
    $page_id = (int)$detail['page_id'];
    unset($detail['page_id']);
	
			if($_FILES['upload']['name'])
					{
					
					$docfile =   $_FILES['upload']['name'];
					$file_type = $_FILES['upload']['type'];
							
						if(in_array($file_type,$fwViewData['supportes_files']))		
							{		
										$datetime = trim(date('dmYHi_'),'0');
										$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
										$src = $_FILES['upload']['tmp_name'];
										$destination = BASE_DIR.'upload/'.$datetime.$docfile;
													
											if (!move_uploaded_file($src, $destination))
												{
													echo "Possible file upload attack";
												}
											else
												{
													$detail['page_image']= $datetime.$docfile;
													chmod($destination, 0664);
												
												   $image = new SimpleImage();
												   $image->load($destination);
												   $image->save($destination);
												   
													$thumbdesti =BASE_DIR.'upload/thumb/'.$datetime.$docfile;
												
												   $image->load($destination);
												   $image->resizeToWidth(71);
												   $image->save($thumbdesti);
											
												}
											
											
							} else{$fwViewData['msg'] = "You were selected wrong file type.";}					
						}
	
	
	
	
    
	if(empty($detail['sitemap']))
	{
		$detail['sitemap'] = 0;
	}
	$detail['page_title'] = trim($detail['page_title']);
    $tablePages = new Fw_Db_Table('pages');
    
    $page_parent_id = (int)$detail['page_parent_id'];
    
    if ($page_parent_id != $page_id)
    {
        $tablePages->setWhere("page_id = $page_parent_id");
        $parent_page = $tablePages->getRow();
        
        $sql = "SELECT auto_increment
                FROM INFORMATION_SCHEMA.TABLES
                WHERE table_schema = '" . DB_NAME . "' AND table_name = 'pages'";
        $row = $fwDb->queryOne($sql);
        $new_page_id = $row['auto_increment'];
        
        if (count($parent_page) > 0)
        {
            $detail['page_level'] = $parent_page['page_level'] + 1;
            if ($page_id > 0)
            {
                $detail['page_lineage'] = $parent_page['page_lineage'] . '/' . $page_id;
            }
            else
            {
                $detail['page_lineage'] = $parent_page['page_lineage'] . '/' . $new_page_id;
            }
        }
        else
        {
            $sql = "SELECT auto_increment
                    FROM INFORMATION_SCHEMA.TABLES
                    WHERE table_schema = '" . DB_NAME . "' AND table_name = 'pages'";
            $row = $fwDb->queryOne($sql);
                    
            $detail['page_parent_id'] = -1;
            $detail['page_level'] = 0;
            if ($page_id > 0)
            {
                $detail['page_lineage'] = '/' . $page_id;
            }
            else
            {
                $detail['page_lineage'] = '/' . $new_page_id;
            }
        }
    }
    
    $page_post_slug = preg_replace('/[^a-z0-9]/i', '-', $detail['page_title']);
    $page_post_slug = strtolower($page_post_slug);
    $page_post_slug = $page_post_slug . '.htm';
    $detail['page_post_slug'] = $page_post_slug;
    
    if ($page_id > 0)
    {
        $detail['page_date_modified'] = 'NOW()';
        $tablePages->setWhere("page_id = $page_id");
        $tablePages->updateRow($detail);
        
        $this_page = $tablePages->getRow();
        
        $tablePages->setWhere("page_lineage LIKE '{$this_page['page_lineage']}/%'");
        $tablePages->setOrderBy("page_level ASC, page_lineage ASC, page_title ASC");
        $children = $tablePages->getRows();
        
        foreach ($children as $child)
        {
            $page_parent_id = (int)$child['page_parent_id'];
            $tablePages->setWhere("page_id = $page_parent_id");
            $parent_page = $tablePages->getRow();
            
            $data = array();
            $data['page_date_modified'] = 'NOW()';
            $data['page_level'] = $parent_page['page_level'] + 1;
            $data['page_lineage'] = $parent_page['page_lineage'] . '/' . $child['page_id'];
            $tablePages->setWhere("page_id = {$child['page_id']}");
            $tablePages->updateRow($data);
        }
    }
    else
    {
	
        //$detail['page_action'] = '';
       //$detail['page_action_params'] = '';
        $detail['page_date_created'] = 'NOW()';
        $detail['page_date_modified'] = 'NOW()';
        
        $tablePages->insertRow($detail);
    }
    
    Location(BASE_URL . $XFA['list']);
}	

$page_id = (int)$fwRequest->getParam('page_id', 0);

$tablePages = new Fw_Db_Table('pages');
$tablePages->setOrderBy('page_lineage ASC');
$fwViewData['pages'] = $tablePages->getAllRows();

if ($page_id > 0)
{
	$tablePages = new Fw_Db_Table('pages');
	$tablePages->setWhere("page_id = $page_id");
	$detail = $tablePages->getRow();
	$fwViewData['detail'] = $detail;
    
    $fwViewData['title'] = 'Edit Page';
}
else
{
    $fwViewData['title'] = 'Add Page';
}

$fwViewData['editor'] = 1;