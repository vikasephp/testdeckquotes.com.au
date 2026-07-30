<?php
require_once(MODULES_DIR . 'common.init.php');
$fwMainView = 'admin/admin.tpl';
//if($_SESSION['site_id'] && $_SESSION['site_id'] !== 100){$fwMainView = 'admin/admin.tpl';}else{$fwMainView = 'admin/superadmin.tpl';}
$fwAuthGroup->forceLogin();
$fwAuthGroup->requireAtLeast('Administrators');
$fwViewData['menu'] = array();
if(!$fwViewData['email_temp_vars'])
	{
					$fwViewData['email_temp_vars'] = array('Buyer first name' => '{{buyerfname}}',
										'Buyer last name' => '{{buyerlname}}',
										'Seller first name' => '{{sellerfname}}',
										'Seller last name' => '{{sellerlname}}',
										'Source of enquiry' => '{{enquirysource}}',
										'Current time' => '{{currenttime}}',
										'General disclaimer status' => '{{gdstatus}}',
										'Logo url' => '{{logourl}}',
										'Business name' => '{{businessname}}' ); 
}