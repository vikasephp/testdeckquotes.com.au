<?php
$tablePages = new Fw_Db_Table($TABLE);
$tablePages->setOrderBy('cat_lineage ASC');
$catdata=$tablePages->getAllRows();
$fwViewData['list'] = $catdata; 

$fwViewData['totalcat'] = count($catdata);

foreach($catdata as $key => $value)
		{
			if($value['cat_parent_id'] == -1)
				{
				$data[]=$value;
				}
		}
$fwViewData['totalmaincat']= count($data);

$fwViewData['title'] = $MODULE_PLURAL;