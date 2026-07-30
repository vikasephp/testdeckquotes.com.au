<?php
$fwMainView = 'file:' . getcwd() . '/edit_catergory.tpl';

$tableqa = new Fw_Db_Table('brief_builder_catergory');
$fwViewData['catlist'] = $tableqa->getRows();