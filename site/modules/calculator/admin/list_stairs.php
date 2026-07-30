<?php
$tableStairs = new Fw_Db_Table($TABLEST);

$tableStairs->setOrderBy($IDST.' DESC');

$stdata = $tableStairs->getAllRows();

$fwViewData['list'] = $stdata; 

$fwViewData['title'] = "Calculator Stairs";