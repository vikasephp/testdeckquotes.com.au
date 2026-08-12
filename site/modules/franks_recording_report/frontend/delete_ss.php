<?php
$fr_id = (int)$fwRequest->getparamget('fr_id', 0);
if ($fr_id > 0)
{
  
   $sql = "update franks_recording_report set fr_ss_word_doc = '' where fr_id = ".$fr_id;
   $fwDb->queryOne($sql);
}
Location(BASE_URL . 'franks_recording_report.home');
exit;