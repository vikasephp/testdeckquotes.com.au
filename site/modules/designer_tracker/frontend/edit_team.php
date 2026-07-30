<?php
$fwMainView = 'file:' . getcwd() . '/edit_team.tpl';

$tableqa = new Fw_Db_Table('design_team');
$fwViewData['catlist'] = $tableqa->getRows();