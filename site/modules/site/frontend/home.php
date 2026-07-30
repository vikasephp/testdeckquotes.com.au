<?php
$tablePages = new Fw_Db_Table("pages");
$tablePages->setWhere("page_id = " . PAGE_HOME);
$fwViewData['detail'] = $tablePages->getRow();
$fwViewData['title'] = $fwViewData['detail']['page_title'];
// sub sections
$tablePages->setWhere("page_lineage LIKE '" . $fwViewData['detail']['page_lineage'] . "/%' AND page_level = 2");
$tablePages->setOrderBy('page_id ASC');
$sub_sections = $tablePages->getRows();
$fwViewData['sub_section'] = array();
$fwViewData['SET_PDF_AUTHOR'] = SET_PDF_AUTHOR;		


$toname = "Dhara";
$turl = 'http://www.gcon.turnkeydecks.com.au/site.emailtracking/eid/50000000';
$to = "dharmendrap@ephpsolutions.com";
$from = SITE_EMAIL;
$subject = "Test new";
$email_body= '<html><p>Test Email</p>Email Text</html>';

//send_email($toname, $to, $fromname, $from, $subject, $email_body,'');

