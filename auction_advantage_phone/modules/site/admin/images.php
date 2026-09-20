<?php
$tablePages = new Fw_Db_Table('images');
$tablePages->setOrderBy('img_set_id ASC');
$fwViewData['list'] = $tablePages->getAllRows();


$fwViewData['title'] = 'Images';