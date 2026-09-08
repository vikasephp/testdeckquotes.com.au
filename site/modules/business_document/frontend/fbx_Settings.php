<?php
/*
<fusedoc fuse="fbx_Settings.php">
	<responsibilities>
		I set up the enviroment settings for this circuit.
	</responsibilities>
</fusedoc>
*/
require_once(MODULES_DIR . 'frontend.init.php');

/*
 * Live page (fuseaction = page) must allow Public documents without login.
 * Session is still started so Internal / Draft checks can detect a logged-in user.
 * All other admin screens still require login.
 */
$isLivePage = (isset($Fusebox['fuseaction']) && $Fusebox['fuseaction'] === 'page');
$isApiWrite = (isset($Fusebox['fuseaction']) && $Fusebox['fuseaction'] === 'api_write');
if ($isLivePage) {
	if (method_exists($fwAuthGroup, 'startSession')) {
		$fwAuthGroup->startSession();
	}
} elseif ($isApiWrite) {
	/* API uses the write key, not a GCONS login. */
} else {
	$fwAuthGroup->forceLogin();
}

$MODULE_SINGULAR = 'Business Documents';
$MODULE_PLURAL = 'Business Documents';

$fwViewData['MODULE_SINGULAR'] = $MODULE_SINGULAR;
$fwViewData['MODULE_PLURAL'] = $MODULE_PLURAL;

$TABLE = 'url_table_pages';
$ID = 'utp_id';
$fwViewData['TABLE'] = $TABLE;
$fwViewData['ID'] = $ID;

$TYPE_TABLE = 'url_table_types';
$TYPE_ID = 'utt_id';
$fwViewData['TYPE_TABLE'] = $TYPE_TABLE;
$fwViewData['TYPE_ID'] = $TYPE_ID;

$BASEFOLDER = 'business_document';
$fwViewData['BASEFOLDER'] = $BASEFOLDER;

$XFA['home'] = $Fusebox['circuit'] . '.home';
$XFA['page'] = $Fusebox['circuit'] . '.page';
$XFA['edit'] = $Fusebox['circuit'] . '.edit';
$XFA['delete'] = $Fusebox['circuit'] . '.delete';
$XFA['view_type'] = $Fusebox['circuit'] . '.view_type';
$XFA['add_type'] = $Fusebox['circuit'] . '.add_type';
$XFA['delete_type'] = $Fusebox['circuit'] . '.delete_type';
$XFA['import'] = $Fusebox['circuit'] . '.import';
$XFA['extract_images'] = $Fusebox['circuit'] . '.extract_images';
$XFA['api_write'] = $Fusebox['circuit'] . '.api_write';

/* Shared register / harvest helpers (also loaded site-wide via common.init) */
$__url_table_helper = LIB_DIR . 'url_table_helper.php';
if (is_file($__url_table_helper)) {
	require_once($__url_table_helper);
}
