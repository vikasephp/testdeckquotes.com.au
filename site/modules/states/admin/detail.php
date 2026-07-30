<?php
$table = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');
	

if($submit)
{
	$data = $fwRequest -> getParam('data','');
	foreach($data as $k=>$v)
	{
		$data[$k] = trim($v);
	}
	
	if(count(v) > 0)
	{
		$data['s_parent_state'] = '0';
		$data['s_type'] = 'state';
		$data['s_date_modified'] = date('Y-m-d');
	
		
		if($data['s_id']>0)
		{
			$table -> setWhere('s_id='.$data['s_id']);
			$update = $table -> updateRow($data);
		}
		else
		{
			$insert = $table -> insertRow($data);
		}
	}
	
	
	if($insert)
	{
		$msg = 1;
	}
	elseif($update)
	{
		$msg = 2;
	}
	else
	{
		$msg = 3;
	}

Location(BASE_URL . $XFA['list']."/msg/".$msg);
}







$table_id = (int)$fwRequest->getParam($ID, 0);
if ($table_id > 0)
{
	$table->setWhere("$ID = $table_id");
	$detail = $table->getRow();
	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}