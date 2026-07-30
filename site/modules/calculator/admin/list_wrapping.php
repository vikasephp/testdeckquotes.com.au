<?php
$tablePages = new Fw_Db_Table($TABLEWR);

$tablePages->setOrderBy($IDWR.' DESC');

$catdata=$tablePages->getAllRows();

$fwViewData['list'] = $catdata; 

$fwViewData['title'] = "Calculator Wrapping";

