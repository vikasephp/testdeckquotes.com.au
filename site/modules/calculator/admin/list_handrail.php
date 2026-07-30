<?php
$tablePages = new Fw_Db_Table($TABLEHR);

$tablePages->setOrderBy($IDHR.' DESC');

$catdata=$tablePages->getAllRows();

$fwViewData['list'] = $catdata; 

$fwViewData['title'] = "Calculator Handrail";