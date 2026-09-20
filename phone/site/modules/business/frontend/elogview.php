<?php
$fwMainView = 'file:' . getcwd() . '/elogview.tpl';
$tabledelete = new Fw_Db_Table('e_dossier_log');
$edl_id = $fwRequest->getParam('edl_id', 0); 

if($edl_id > 0){ $tabledelete->setWhere('edl_id ='.$edl_id); $fwViewData['elogdetail'] = $tabledelete->getRow();}
