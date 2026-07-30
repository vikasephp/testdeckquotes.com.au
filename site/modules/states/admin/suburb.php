<?php
$table = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');


if(!empty($submit))
{

	$data = $fwRequest -> getParam('data','');
	$_SESSION['s_parent_state'] = $data['s_parent_state'];

	
		foreach($data as $k=>$v)
		{
			$data[$k] = trim($v);
		}
	
		$s_id = $data['s_id'];
			$data['s_type'] = 'subhurb';
			$data['s_date_modified'] = date('Y-m-d');
		
		if($s_id>0)
		{
			$table -> setWhere("s_id = $s_id");
			$update = $table -> updateRow($data);
		}
		else
		{
			$explode_s_name = explode(',',$data['s_name']);
			unset($data['s_name']);
			unset($data['s_id']);
			
			foreach($explode_s_name as $k_e => $v_e)
			{
				$all_names[]['s_name'] = trim($v_e);
			}
			
			foreach($all_names as $k_a => $v_a)
			{
				$data['s_name'] = $v_a['s_name'];
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







$s_id = $fwRequest -> getParam('s_id');
if(!empty($s_id))
{
	$table -> setWhere("s_id = $s_id");
	$detail = $table -> getRow();
	$fwViewData['detail'] = $detail;
	unset($_SESSION['s_parent_state']);
}


if(!empty($_SESSION['s_parent_state']))
{
	$fwViewData['s_parent'] = $_SESSION['s_parent_state'];
}

$table -> setWhere("s_type = 'state'");
$state = $table -> getAllRows();
$fwViewData['state'] = $state;

if ($table_id > 0)
{
    $fwViewData['title'] = 'Edit ' . 'Subhurb';
}
else
{
    $fwViewData['title'] = 'Add '. 'Subhurb';
}