<?php
$tablecats = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');
	
if(!empty($submit))
{
    $detail = $fwRequest->getParam('categories', array());
	
    $cat_id = (int)$detail['cat_id'];
    unset($detail['cat_id']);

	$cat_parent_id = (int)$detail['cat_parent_id'];
    
    if ($cat_parent_id != $cat_id)
    {
        $tablecats->setWhere("cat_id = $cat_parent_id");
        $parent_cat = $tablecats->getRow();
        
        $sql = "SELECT auto_increment
                FROM INFORMATION_SCHEMA.TABLES
                WHERE table_schema = '" . DB_NAME . "' AND table_name = 'product_category'";
        $row = $fwDb->queryOne($sql);
        $new_cat_id = $row['auto_increment'];
        
        if (count($parent_cat) > 0)
        {
            $detail['cat_level'] = $parent_cat['cat_level'] + 1;
            if ($cat_id > 0)
            {
                $detail['cat_lineage'] = $parent_cat['cat_lineage'] . '/' . $cat_id;
            }
            else
            {
                $detail['cat_lineage'] = $parent_cat['cat_lineage'] . '/' . $new_cat_id;
            }
        }
        else
        {
            $sql = "SELECT auto_increment
                    FROM INFORMATION_SCHEMA.TABLES
                    WHERE table_schema = '" . DB_NAME . "' AND table_name = 'product_category'";
            $row = $fwDb->queryOne($sql);
                    
            $detail['cat_parent_id'] = -1;
            $detail['cat_level'] = 0;
            if ($cat_id > 0)
            {
                $detail['cat_lineage'] = '/' . $cat_id;
            }
            else
            {
                $detail['cat_lineage'] = '/' . $new_cat_id;
            }
        }
    }
    

	
	
    if ($cat_id > 0)
    {

        $detail['cat_date_modified'] = 'NOW()';
        $tablecats->setWhere("cat_id = $cat_id");
        $tablecats->updateRow($detail);
        
        $this_cat = $tablecats->getRow();
        
        $tablecats->setWhere("cat_lineage LIKE '{$this_cat['cat_lineage']}/%'");
        $tablecats->setOrderBy("cat_level ASC, cat_lineage ASC, cat_title ASC");
        $children = $tablecats->getRows();
        
        foreach ($children as $child)
        {
            $cat_parent_id = (int)$child['cat_parent_id'];
            $tablecats->setWhere("cat_id = $cat_parent_id");
            $parent_cat = $tablecats->getRow();
            
            $data = array();
            $data['cat_date_modified'] = 'NOW()';
            $data['cat_level'] = $parent_cat['cat_level'] + 1;
            $data['cat_lineage'] = $parent_cat['cat_lineage'] . '/' . $child['cat_id'];
            $tablecats->setWhere("cat_id = {$child['cat_id']}");
            $tablecats->updateRow($data);
        }
    }
    else
    {
	   

	
        $detail['cat_date_created'] = 'NOW()';
        $detail['cat_date_modified'] = 'NOW()';
        
        $tablecats->insertRow($detail);
    }
    
    Location(BASE_URL . $XFA['list']);
}	

$cat_id = (int)$fwRequest->getParam('cat_id', 0);

$tablecats = new Fw_Db_Table($TABLE	);
$tablecats->setOrderBy('cat_lineage ASC');
$fwViewData['categories'] = $tablecats->getAllRows();

if ($cat_id > 0)
{
	$tablecats = new Fw_Db_Table($TABLE);
	$tablecats->setWhere("$ID = $cat_id");
	$detail = $tablecats->getRow();
	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}