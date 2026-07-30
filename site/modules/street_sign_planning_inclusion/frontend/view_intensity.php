<?php
$fwMainView = 'file:' . getcwd() . '/view_intensity.tpl';

$thisTable = new Fw_Db_Table("street_sign_intensity_pl");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

