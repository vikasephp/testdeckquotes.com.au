<?php

$page_id = (int)$fwRequest->getParam('page_id', 0);

if ($page_id > 0)
{
    $tablePages = new Fw_Db_Table("pages");
    $tablePages->setWhere("page_id = $page_id");
    $tablePages->deleteRow();
}

Location(BASE_URL . $XFA['list']);