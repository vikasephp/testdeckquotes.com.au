<?php

$page_id = (int)$fwRequest->getparam('page_id', 0);
	
if ($page_id > 0)
{
	$tablePages = new Fw_Db_Table('pages');
	$tablePages->setWhere("page_id = $page_id");
	$fwViewData['detail'] = $tablePages->getRow();
    
    $fwViewData['title'] = $fwViewData['detail']['page_title'];

}
else
{
    Location(BASE_URL . $XFA['list']);
}