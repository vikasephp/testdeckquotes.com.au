<?php
$fwMainView = 'file:' . getcwd() . '/edit_letter_code.tpl';

$tableqa = new Fw_Db_Table('letter_code');
$fwViewData['catlist'] = $tableqa->getRows();