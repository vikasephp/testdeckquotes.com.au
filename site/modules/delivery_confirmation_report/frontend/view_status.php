<?php
$fwMainView = 'file:' . getcwd() . '/view_status.tpl';

$thisTable = new Fw_Db_Table("delivery_conf_status");

$hide = $fwRequest->getParam('hide', '');
if($hide)
{
	 $keys_2 = array_keys($hide);
	 $ky_2 = $keys_2[0];
	 $val_2 = $hide[$ky_2];
	
	  $detail['st_hide'] = $val_2;
	  $thisTable->setWhere("st_id = ".$ky_2);
	  if($thisTable->rowExists())
	  {
		 $this_id = $thisTable->updateRow($detail);
	  }	  	
}


$Table = new Fw_Db_Table("delivery_conf_status");
$fwViewData['statusData'] = $Table->getAllRows(); 

