<?php
$fwMainView = 'file:' . getcwd() . '/date.tpl';
$d_id = $fwRequest->getparamget('b_id', 0);
$t_id =$fwRequest->getparamget('t_id', 0);
if ($d_id)
{  	$current_date = date('Y-m-d');
	$current_time = date('H:i');
print($d_id."|".$current_date."|".$t_id."|".$current_time);	
}
