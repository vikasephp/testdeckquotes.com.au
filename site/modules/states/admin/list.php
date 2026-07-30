<?php
$tablePages = new Fw_Db_Table($TABLE);


/******Begin Set default state initially*******/
$state_shortcodes = $fwRequest -> getParam('get_state','');
if(!empty($_SESSION['s_parent_state']) AND empty($state_shortcodes))
{
	$state_shortcodes = $_SESSION['s_parent_state'];
}
elseif(empty($state_shortcodes))
{
	$tablePages -> setwhere("s_type = 'state'");
	$tablePages->setOrderBy($ID.' ASC');
	$first_state = $tablePages -> getRow();
	$state_shortcodes = $first_state['s_shortcodes'];
}
$fwViewData['state_shortcodes'] = $state_shortcodes;
/******End Set default state initially*******/




/******Begin get only s_type = subhurb to be shown in list*******/
$tablePages -> setwhere("s_type = 'subhurb' AND s_parent_state = '$state_shortcodes'" );
$tablePages->setOrderBy('s_postal_code ASC');
$catdata=$tablePages->getAllRows();
$fwViewData['list'] = $catdata; 
/******End get only s_type = subhurb to be shown in list*******/




/******Begin get only s_type = subhurb to be shown in list*******/
$tablePages -> setwhere("s_type = 'state'");
$tablePages->setOrderBy($ID.' ASC');
$state = $tablePages -> getRows();
$fwViewData['state'] = $state;
/******End get only s_type = subhurb to be shown in list*******/






/******Begin Send msg parameters to list *******/
$fwViewData['title'] = $MODULE_PLURAL;
$msg = $fwRequest -> getParam('msg','');
if(!empty($msg))
{
	if($msg = 1)
	{
		$msg = "Record(s) Inserted Successfully.";
	}
	elseif($msg = 2)
	{
		$msg = "Record(s) Updated Successfully.";
	}
	elseif($msg = 3)
	{
		$msg = "Record couldn't be able to Add or Update";
	}
	
	$fwViewData['msg'] = $msg;
}
/******End Send msg parameters to list *******/