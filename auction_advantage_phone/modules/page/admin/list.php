<?php
$tablePages = new Fw_Db_Table('pages');
$tablePages->setOrderBy('page_lineage ASC');
$fwViewData['list'] = $tablePages->getAllRows();

$fwViewData['title'] = 'Pages';