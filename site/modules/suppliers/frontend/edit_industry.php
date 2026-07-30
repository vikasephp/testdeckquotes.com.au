<?php
$fwMainView = 'file:' . getcwd() . '/edit_industry.tpl';

$tableqa = new Fw_Db_Table('suppliers_industry');
$fwViewData['catlist'] = $tableqa->getRows();