<?php
$fwMainView = 'file:' . getcwd() . '/read.tpl';
$tablebulletin = new Fw_Db_Table($TABLE);
$sb_id = $fwRequest->getParam('sb_id', '');
$submit = $fwRequest->getParam('subAddDetail', '');
$fwViewData['sb_id'] = $sb_id;

	$uid = $_SESSION['user']['user_id'];
	
	$userTable = new Fw_Db_Table('users');
    $userTable->setWhere("user_id = $uid");
	$userdata =  $userTable->getRow();
	$u = $userdata['user_name'];


if(!empty($submit))
{
    $detail = $fwRequest->getParam('staff_bulletin', array());
	$sb_id=$detail[$ID];
	unset($detail[$ID]);

		if($detail['read'] == 1)
		{
		$udata='';
		$tablebulletin ->setWhere("sb_id = ".$sb_id);
		$data = $tablebulletin ->getRow();
		$udata = $data['sb_read_understood'];
		
		$tablebulletin ->setWhere("sb_read_understood LIKE '%".$u. "%' AND sb_id = ". $sb_id);
		if(!$tablebulletin ->rowExists())
		{
			if($udata) {
				$updatedata['sb_read_understood'] = $udata. " , " .$userdata['user_name'];
			}
			else {
				$updatedata['sb_read_understood'] = $userdata['user_name'];
			}
			$tablebulletin ->setWhere("sb_id = ".$sb_id);
			
				if($tablebulletin ->rowExists())
				{
					$tablebulletin ->updateRow($updatedata);
				}
		}

		}
		
	
		if($sb_id){$fwViewData['opr'] = "Success!"; $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;}
}	

$fwViewData['title'] = "Staff Bulletin";