<?php
$fwMainView = 'file:' . getcwd() . '/view_person_responsible.tpl';

$thisTable = new Fw_Db_Table("esmr_person_responsible");

$fwViewData['componentData'] = $thisTable->getAllRows(); 

