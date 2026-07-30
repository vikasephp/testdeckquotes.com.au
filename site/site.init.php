<?php
/* load configuration */
//require_once('load_bes.php');
require_once('site.config.php');
/* load configuration */

/* framework related variables */
$fwMainView = '';
$fwSubViews = array();
$fwViewData = array();
$fwViewData['FILE_PATH'] = FILE_PATH;
$XFA = array();
$XFA['site'] = 'site.home';
$XFA['admin'] = 'admin.home';
$XFA['login'] = 'site.login';
$XFA['logout'] = 'site.logout';
$XFA['forgotPassword'] = 'site.forgotPassword';
$XFA['register'] = 'site.register';

/* framework related variables */
/* fusebox initialization */
// in case no fuseaction was given, I'll set up one to use by default.
if (!isset($attributes['fuseaction'])) {
    $attributes['fuseaction'] = 'site.home';
}
if (WEBSITE_STATUS == 0) {
    $attributes['fuseaction'] = 'site.blocked';
}

// useful constants
if (!isset($GLOBALS['self'])) {
    $GLOBALS['self'] = 'index.php';
}

// we don't use the fusebox layout files
$Fusebox['layoutDir'] = '';
$Fusebox['layoutFile'] = '';

// should fusebox silently suppress its own error messages? default is FALSE
$Fusebox['suppressErrors'] = true;
/* fusebox initialization */

/* smarty initialization */
require_once(LIB_DIR . 'smarty/Smarty.class.php');
$smarty = new Smarty;
$smarty->template_dir = SITE_DIR . 'views/';
$smarty->compile_dir = TMP_DIR . 'templates_c/';
$smarty->cache_dir = TMP_DIR . 'cache/';
$smarty->caching = 0;
$smarty->left_delimiter = '{{';
$smarty->right_delimiter = '}}';
/* smarty initialization */

/* database layer initialization */
require_once(LIB_DIR . 'Fw/Db.php');
$fwDb = Fw_Db::getInstance();
/* database layer initialization */

/* auth initialization */
require_once(LIB_DIR . 'Fw/Auth/Group.php');
$fwAuthGroup = Fw_Auth_Group::getInstance();
/* auth initialization */

/* request initialization */
require_once(LIB_DIR . 'Fw/Request.php');
$fwRequest = Fw_Request::getInstance();
/* request initialization */

/* load table model */
require_once(LIB_DIR . 'Fw/Db/Table.php');
/* load table model */

// handle post slug
if (isset($_REQUEST['post_slug'])) {
    $clean_post_slug = $fwDb->escape($_REQUEST['post_slug']);

    $tablePage = new Fw_Db_Table('pages');
    $tablePage->setWhere("page_post_slug = $clean_post_slug");
    $detail = $tablePage->getRow();

    $id = $detail['page_id'];
    $_GET['page_id'] = $id;
    $_REQUEST['page_id'] = $id;
    $attributes['page_id'] = $id;
    $fwViewData['page_id'] = $id;

    if (!empty($detail['page_action'])) {
        $fuseaction = $detail['page_action'];
        $_GET['fuseaction'] = $fuseaction;
        $_REQUEST['fuseaction'] = $fuseaction;
        $attributes['fuseaction'] = $fuseaction;
        $fwViewData['fuseaction'] = $fuseaction;

        if (!empty($detail['page_action_params'])) {
            $param_pairs = explode('&', $detail['page_action_params']);
            foreach ($param_pairs as $param_pair) {
                list($field, $value) = explode('=', $param_pair);

                $_GET[$field] = $value;
                $_REQUEST[$field] = $value;
                $attributes[$field] = $value;
            }
        }
    } else {
        $fuseaction = 'page.detail';
        $_GET['fuseaction'] = $fuseaction;
        $_REQUEST['fuseaction'] = $fuseaction;
        $attributes['fuseaction'] = $fuseaction;
        $fwViewData['fuseaction'] = $fuseaction;
    }
}

$sql = "select * from s3bucket where s_id = 1";
$s3data = $fwDb->queryOne($sql);

define('ACCESS_KEY',  $s3data['s_acc_k']);
define('SECRET_KEY',  $s3data['s_sec_k']);
define('BUCKET_NAME', $s3data['s_bucket_name']);

$sql2 = "select * from s3bucket_test_video where s_id = 1";
$s3dataV = $fwDb->queryOne($sql2);

define('ACCESS_KEY_V',  $s3dataV['s_acc_k']);
define('SECRET_KEY_V',  $s3dataV['s_sec_k']);
define('BUCKET_NAME_V', $s3dataV['s_bucket_name']);


$sqlsm = "select * from smtp_logins where sm_id = 1";
$smdata = $fwDb->queryOne($sqlsm);

define('SMTP_USER',  $smdata['sm_user']);
define('SMTP_PASS',  $smdata['sm_password']);
