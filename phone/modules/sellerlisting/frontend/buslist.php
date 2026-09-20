<?php
$bsn_name = $fwRequest->getParamget('bsn_name', '');
$sql = "Select bsn_name, bsn_id from business WHERE bsn_name like '".$bsn_name."%'";
$busData = $fwDb->query($sql);
if($busData)
{
	foreach($busData as $k => $v)
	{
	$bsn_id = $v['bsn_id'];
	$bsn_name = "'".$v['bsn_name']."'";
	
	$data.='<a href="javascript:setsalevalue('.$bsn_id.','.$bsn_name.');">'.$v['bsn_name'].'</a><br>';
	}
}
if(empty($data))
	{$data = 'No data found.';}
$data .='<div style="float:right; padding-bottom:5px;"><a href="javascript:closediv();">Close</a></div>';
echo $data;
exit;