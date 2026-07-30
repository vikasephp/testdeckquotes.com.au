<?php
/*
<fusedoc fuse="fbx_Layouts.php">
	<responsibilities>
		this file contains all the conditional logic for determining which layout file, if any, should be used for this circuit. It should result in the setting of the Fusebox public API variables $Fusebox['layoutDir'] and $Fusebox['layoutFile']
	</responsibilities>
	<io>
		<out>
			<string name="$Fusebox['layoutDir']" />
			<string name="$Fusebox['layoutFile']" />
		</out>
	</io>
</fusedoc>
*/

if(empty($fwMainView))
{
	$fwMainView = 'default/default.tpl';
}

// assign data to smarty
$smarty->assign('fwSubViews', $fwSubViews);
$smarty->assign('BASE_URL', BASE_URL);
$smarty->assign('SITE_NAME', SITE_NAME);
$smarty->assign('SITE_DESC', SITE_DESC);
$smarty->assign('SITE_EMAIL', SITE_EMAIL);
$smarty->assign('XFA', $XFA);
$smarty->assign('ENV', ENV);
$smarty->assign('_SESSION', $_SESSION);
$smarty->assign('circuit', $Fusebox['circuit']);
$smarty->assign('fuse', $Fusebox['fuseaction']);
$smarty->assign('fuseaction', $Fusebox['circuit'] . '.' . $Fusebox['fuseaction']);

foreach ($fwViewData as $key=>$value)
{
    $smarty->assign($key, $value);
}

// render view
$smarty->display($fwMainView);