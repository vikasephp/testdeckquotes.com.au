<?php
$tabledropbox =  new Fw_Db_Table('design_interface_edropbox');

$id = $fwRequest->getParam('id', '');
$fovalue = $fwRequest->getparam('fovalue', '');
$edavalue = $fwRequest->getparam('edavalue', '');
$qedvalue = $fwRequest->getparam('qedvalue', '');
$fpvalue = $fwRequest->getparam('fpvalue', '');
$del_id = $fwRequest->getparam('del_id', '');
$dv = $fwRequest->getparam('dv', '');
//$value = str_replace('=','\\', $value);

if(!empty($fovalue))
{
	$sql = "Update design_interface_edropbox set didb_foldername  = '".$fovalue ."' where didb_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

if(!empty($edavalue))
{
	$sql = "Update design_interface_edropbox set didb_edf_available  = ".$edavalue ." where didb_id = ".$id;		 
	$fwDb -> queryOne($sql);
}

if(!empty($qedvalue))
{
	$sql = "Update design_interface_edropbox set didb_qed  = ".$qedvalue ." where didb_id = ".$id;		 
	$fwDb -> queryOne($sql);
}

if(!empty($fpvalue))
{
	$sql = "Update design_interface_edropbox set didb_filepath  = '".$fpvalue ."' where didb_id = ".$id;	 
	$fwDb -> queryOne($sql);
}


if(!empty($del_id))
{
	
	$thisTable = new Fw_Db_Table('design_interface_edropbox');
    $thisTable->setWhere("didb_id = ". $del_id);
    $thisTable->deleteRow();
	
}

if(!empty($dv))
{
	
	$thisTable = new Fw_Db_Table('design_interface_edropbox');
    $thisTable->setWhere("didb_foldername = '". $dv."'");
    $thisTable->deleteRow();
	
}

 exit;