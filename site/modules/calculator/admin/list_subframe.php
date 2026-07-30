<?php
$tablePages = new Fw_Db_Table($TABLESF);

$tablePages->setOrderBy($IDSF.' DESC');

$catdata=$tablePages->getAllRows();

$fwViewData['list'] = $catdata; 

$fwViewData['title'] = "Calculator Subframe";

