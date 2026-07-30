<?php
$rc_link = (int)$fwRequest->getparam('rc_link', 0);
$oc_link = (int)$fwRequest->getparam('oc_link', 0);

	if ($rc_link > 0)
	{
		$thisTable = new Fw_Db_Table('recruitment_list');
		$thisTable->setWhere("re_id = $rc_link");
		$detail['re_recruitment_checklist'] = '';
		$thisTable->updateRow($detail);
		
	}
	
	if ($oc_link > 0)
	{
		$thisTable = new Fw_Db_Table('recruitment_list');
		$thisTable->setWhere("re_id = $oc_link");
		$detail['re_onboarding_checklist'] = '';
		$thisTable->updateRow($detail);
		
	}
	
Location(BASE_URL . "recruitment_list.home");