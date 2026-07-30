<?php
$id = (int)$fwRequest->getParam($ID, 0);

if($id > 0)
{
   $sql = "SELECT ".$TABLE.".*, email_type.* FROM ".$TABLE." LEFT JOIN email_type ON ".$TABLE.".et_type = email_type.emt_id WHERE ".$TABLE.".et_id = ".$id;
	$fwViewData['detail'] = $fwDb->queryOne($sql);

	if($fwViewData['detail']['et_attachment'])
	{
	$fwViewData['attachments'] = unserialize($fwViewData['detail']['et_attachment']);
	}
	
    $fwViewData['title']= "View ".$MODULE_SINGULAR;
}