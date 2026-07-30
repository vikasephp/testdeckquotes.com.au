<?php
$fwMainView = 'file:' . getcwd() . '/view_letter.tpl';

$tableqa = new Fw_Db_Table('letter_code');
$fwViewData['catlist'] = $tableqa->getRows();