<?php

$page_id = (int)$fwRequest->getParam('img_id', 0);

if ($page_id > 0)
{
    $tablePages = new Fw_Db_Table("images");
    $tablePages->setWhere("img_id = $page_id");
    $tablePages->deleteRow();
}

Location(BASE_URL . $XFA['images']);