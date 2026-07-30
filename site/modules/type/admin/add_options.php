<?php

$fwMainView = 'file:' . getcwd() . '/add_options.tpl';
$thisTable = new Fw_Db_Table('type_options');
$submit = $fwRequest->getparam('subAddDetail', '');

$tm_id = $fwRequest->getParam('tm_id', '');
$fwViewData['tm_id'] = $tm_id;
$temp_sec = $fwRequest->getparam($TABLE, '');

if(!empty($submit))
{
   $detail = $fwRequest->getparam('option', array());
   $fwViewData['tm_id'] = $detail['to_type_id'];
   //db($detail); 
   //exit; 
    
     $opt = "'".$detail['to_option']."'"; 
    
     $id = (int)$detail['to_id'];
     unset($detail['to_id']);
     
	$thisTable->setWhere("to_option =".$opt. " and to_type_id =".$detail['to_type_id']);
	if(!$thisTable->rowExists())
	{
		 if($id > 0)
			{
				$thisTable->setWhere("to_id = $id");
				$thisTable->updateRow($detail);
			}
			else
			{	
				 $thisTable->insertRow($detail);             
			}
	          Location(BASE_URL. "typeAdmin.view_options/tm_id/". $detail['to_type_id']);
		  
	} else {
		$fwViewData['msg'] = "Duplicate Entry";
	}
}


$fwViewData['title'] = "Add Option";
$fwViewData['button'] = "Add";
$id = (int)$fwRequest->getParam('to_id', 0);

if($id > 0)
{
  	
    $thisTable->setWhere("to_id = $id");
    $fwViewData['detail'] = $thisTable->getRow();
    $fwViewData['title']= "Edit ".$MODULE_SINGULAR;
    $fwViewData['button'] = "Edit";
}