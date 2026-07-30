<?php
$fwMainView = 'file:' . getcwd() . '/view_enquiry.tpl';
$wa_id = (int)$fwRequest->getParam('wa_id', 0);
$fwViewData['wa_id']  = $wa_id;
$thisTable = new Fw_Db_Table("warranty_enquiry");
$thisTable->setWhere("we_wa_id = $wa_id");
$fwViewData['enquirydata'] = $thisTable->getAllRows(); 
