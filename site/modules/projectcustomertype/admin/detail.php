<?php
$thisTable = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getparam('subAddDetail', '');

$temp_sec = $fwRequest->getparam($TABLE, '');

if(!empty($submit))
{
   $detail = $fwRequest->getparam($TABLE, array());
   
	 $id = (int)$detail[$ID];
     unset($detail[$ID]);
		 if($id > 0)
			{
				$thisTable->setWhere("$ID = $id");
				$thisTable->updateRow($detail);
			}
			else
			{	
			 $thisTable->insertRow($detail);             
			}
	Location(BASE_URL. $XFA['list']);
}
$fwViewData['title'] = "Add ".$MODULE_SINGULAR;
$fwViewData['button'] = "Add";
$id = (int)$fwRequest->getParam($ID, 0);
if($id > 0)
{
    $thisTable->setWhere("$ID = $id");
	$fwViewData['detail'] = $thisTable->getRow();
    $fwViewData['title']= "Edit ".$MODULE_SINGULAR;
	$fwViewData['button'] = "Edit";
}

