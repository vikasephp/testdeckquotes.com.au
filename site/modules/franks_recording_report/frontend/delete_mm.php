<?php
$fr_id = (int)$fwRequest->getparamget('fr_id', 0);
if ($fr_id > 0)
{
   // $thisTable = new Fw_Db_Table('franks_recording_report');
   // $thisTable->setWhere("fr_id = ".$fr_id);
   
   // $thisTable->deleteRow();		
   
   $sql = "update franks_recording_report set fr_meeting_minutes='' where fr_id = ".$fr_id;
   $fwDb->queryOne($sql);
}
Location(BASE_URL . 'franks_recording_report.home');
exit;