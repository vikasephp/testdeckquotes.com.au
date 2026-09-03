<?php

$id = $fwRequest->getParam('dolr_id', '');
$value = $fwRequest->getparam('value', '');

$value = str_replace('%20', ' ', $value);

$sql = "Update dual_occupancy_lead_report set dolr_property_type = '".$value."' where dolr_id = ".$id;	 
$fwDb -> queryOne($sql);

exit;

?>