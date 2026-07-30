<?php
$pagenum = $fwRequest->getparam('pagenum', '');
$tablePages = new Fw_Db_Table($TABLE);
$export = $fwRequest->getParam('export', 0);
$short = $fwRequest->getParam('s', '');

//Clear Cache Function
require_once __DIR__ . '/../../../lib/smarty/Smarty.class.php';
$smarty = new Smarty();

$basePath = realpath(__DIR__ . '/../../../../'); // This resolves to /public_html
$smarty->template_dir = $basePath .'/site/views/';
//$smarty->template_dir = '/home/testdeckquotes/testdeckquotes.com.au/public_html/site/';
//$smarty->template_dir = '/home/testdeckquotes/testdeckquotes.com.au/public_html/site/modules/recruitment_list/frontend/';
$smarty->compile_dir  = $basePath .'/site/tmp/templates_c/';
$smarty->cache_dir    = $basePath .'/site/cache/';
$smarty->config_dir   = $basePath .'/site/configs/';

// Set delimiters to double curly braces
$smarty->left_delimiter = '{{';
$smarty->right_delimiter = '}}';

//$smarty->assign('BASE_URL', 'https://testdeckquotes.com.au');

$smarty->clear_all_cache(60); // This clears all cache
//$smarty->clear_cache('default/default.tpl', null, null, 60);
$smarty->display('default/default.tpl');
//echo "cache cleared";
//End Clear Cache Function

$fwViewData['ran'] =  rand(100000, 999999);

$save_rc = $fwRequest->getParam('save_rc', '');
if (!empty($save_rc)) {
	$re_id = $fwRequest->getParam('re_id', 0);
	$link = $fwRequest->getParam('re_recruitment_checklist', '');

	$tablePages->setWhere('re_id = ' . $re_id);
	$detailRC['re_recruitment_checklist'] = $link;

	$opr = $tablePages->updateRow($detailRC);

	$fwViewData['opr'] = $opr;
}


$save_oc = $fwRequest->getParam('save_oc', '');
if (!empty($save_oc)) {
	$re_id = $fwRequest->getParam('re_id', 0);
	$link = $fwRequest->getParam('re_onboarding_checklist', '');

	$tablePages->setWhere('re_id = ' . $re_id);
	$detailOC['re_onboarding_checklist'] = $link;

	$opr = $tablePages->updateRow($detailOC);

	$fwViewData['opr'] = $opr;
}



// Save email 1 sent
$email_1 = $fwRequest->getParam('email_1', '');
if (!empty($email_1)) {
	$dt = date('d-m-Y h:i:sa');
	$user = $_SESSION['user']['user_name'];
	$key = array_keys($email_1);
	$ky = $key[0];

	$emailDetail['re_email_1_sent'] = $email_1[$ky];
	$emailDetail['re_email_1_user'] = $user;
	$emailDetail['re_email_1_date'] = $dt;

	$tablePages->setWhere('re_id = ' . $ky);
	$detail = $tablePages->updateRow($emailDetail);
}
//End Email 1 Sent

//Send Email to Customer when Email 1 Sent is Enabled 
$sendEmail = $fwRequest->getParam('send_customer_email', '');
//$email_cust = $fwRequest->getParam('email_cust', '');
$re_id = (int)$fwRequest->getParam('re_id', 0);
//if (!empty($email_cust) && $sendEmail) {}
if ($re_id > 0 && $sendEmail) {
	$queryLoginCheck = "SELECT re_is_login_enabled FROM `recruitment_list` WHERE re_id = ".$re_id;
	$data_queryLoginCheck = $fwDb->queryOne($queryLoginCheck);
	if($data_queryLoginCheck['re_is_login_enabled'] == 1){
	
	$dt = date('d-m-Y h:i:sa');
	$user = $_SESSION['user']['user_name'];
	//$key = array_keys($email_cust);
	//$ky = $key[0];

	//$emailDetail['re_cust_email_sent'] = $email_cust[$ky];
	$emailDetail['re_cust_email_sent'] = 1;
	$emailDetail['re_cust_email_user'] = $user;
	$emailDetail['re_cust_email_date'] = $dt;

	$tablePages->setWhere('re_id = ' . $re_id);
	$detail = $tablePages->updateRow($emailDetail);
	
	// Send Email To Customer When Toggle is ON Start
	//$sql_email = "SELECT re_name, re_phone, re_email FROM recruitment_list where re_id = ". $re_id;
	$sql_email = "SELECT re_name, re_phone, re_email, (SELECT p_name FROM positions WHERE p_id = rl.re_position_apply) AS p_name FROM recruitment_list rl WHERE re_id = ". $re_id;
	$data_email = $fwDb->queryOne($sql_email);
	
	$message = '<html><body>';
	$message .= '<p>Hi ' . $data_email['re_name'] . ',</p>';
	$message .= '<p>';
	$message .= 'Thank you for reaching out and for your interest in this position.<br/>';
	$message .= 'We invite you to explore our recruitment portal to learn more about the role and access all relevant documents.<br/>';
	$message .= 'To log in, please use your registered email address as username and mobile number as password:<br/>';
	$message .= '</p>';
	
	$message .= '<p>';
	$message .= 'Portal Link: <a href="https://recruitments.deckquotes.com.au/login">https://recruitments.deckquotes.com.au/login</a><br/>';
	$message .= 'Email: ' . $data_email['re_email'] . '<br/>';
	$message .= 'Mobile Number: ' . $data_email['re_phone'] . '<br/>';
	$message .= '</p>';
	
	$message .= '<p>The portal includes two surveys: a <b>General Survey</b> and a <b>Position-Specific Survey</b>. Please ensure both are completed, as we can only process your application once we receive them.</p>';
	$message .= '<p>If your application progresses, we will be in touch shortly to arrange an interview.</p>';
	
	$message .= '<p>';
	$message .= 'Best regards, <br/>';
	$message .= '<span style="color:rgb(85,142,213)">Recruitment Team</span> <span style="color:rgb(255,192,0)"><b>|</b></span> <span style="color:rgb(85,142,213)">Canberra Granny Flat Builders & Fixed Price Extensions</span> <br/>';
	$message .= '<span style="color:rgb(85,142,213)">Phone: 1300 979 658</span> <span style="color:rgb(255,192,0)"><b>|</b></span> <span style="color:rgb(85,142,213)">Fax: 1300 979 657</span> <br/><span style="color:rgb(85,142,213)">Postal: GPO Box 2265 Canberra City 2602</span> <br/><span style="color:rgb(85,142,213)">ACT Building Lic: 2012767</span>';
	$message .= '</p>';
	
	$message .= '<p><img src="'.BASE_URL.'images/cgfb_sign_footer.png"/></p>';

	//$to = $data_email['re_email'];
	$toname = $data_email['re_name'];
	$subject = $data_email['p_name']. ' Position Applied - Recruitment with Canberra Granny Flat Builders and Fixed Price Extensions';

	//$to = 'rahul@ephpsolutions.com';
	$to = 'jas@ephpsolutions.com';

	if ($data_email) {
		send_email($toname, $to, 'CGFB TEAM', 'recruitment@cgfb.com.au', $subject, $message, $attachment = '');
	}
	// Send Email To Customer When Toggle is ON Ends
	}
	$redirectUrl = $_SERVER['REQUEST_URI'];
    header("Location: $redirectUrl");
    exit;
}
//End Send Email to Customer when Email 1 Sent is Enabled 


// Save email 2 sent
$email_2 = $fwRequest->getParam('email_2', '');
if (!empty($email_2)) {
	$dt = date('d-m-Y h:i:sa');
	$user = $_SESSION['user']['user_name'];
	$key = array_keys($email_2);
	$ky = $key[0];

	$emailDetail['re_email_2_sent'] = $email_2[$ky];
	$emailDetail['re_email_2_user'] = $user;
	$emailDetail['re_email_2_date'] = $dt;

	$tablePages->setWhere('re_id = ' . $ky);
	$detail = $tablePages->updateRow($emailDetail);
}
//End Email 1 Sent



$hide = $fwRequest->getParam('hide', '');


if ($hide) {

	foreach ($hide as $k => $v) {
		$id = $k;
	}

	$detail['re_hide'] = $v;
	$tablePages->setWhere("re_id = " . $id);
	if ($tablePages->rowExists()) {
		$this_id = $tablePages->updateRow($detail);
	}
}

$login = $fwRequest->getParam('login', '');
if ($login) {
	foreach ($login as $k => $v) {
		$id = $k;
	}

	$detail['re_is_login_enabled'] = $v;
	$tablePages->setWhere("re_id = " . $id);
	if ($tablePages->rowExists()) {
		$this_id = $tablePages->updateRow($detail);
	}
}

$listdata = $fwRequest->getParam($TABLE, array());

$keyword = $listdata['keyword'];
$where = "WHERE re_hide = 0 ";
$showall = $fwRequest->getParam('showall', '');
if (!empty($showall)) {
	$where = "WHERE 1 = 1";
} else {
	$where = "WHERE re_hide = 0 ";
}

if ($keyword) {
	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword'] = $_SESSION['keyword'];
} else {
	unset($_SESSION['keyword']);
}


if ($keyword):
	$where .= "AND " . $TABLE . ".re_position LIKE '%" . $keyword . "%' OR " . $TABLE . ".re_name LIKE '%" . $keyword . "%'";

	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword'] = $_SESSION['keyword'];

elseif ($_SESSION['keyword'] && $pagenum > 0):

	$where .= "AND " . $TABLE . ".re_position LIKE '%" . $keyword . "%' OR " . $TABLE . ".re_name LIKE '%" . $keyword . "%'";

	$fwViewData['keyword'] = $_SESSION['keyword'];
endif;


$filter_position = $fwRequest->getParam('filter_position', '');
$re_position_apply = $fwRequest->getParam('re_position_apply', '');
if($filter_position && $re_position_apply) {
	$_SESSION['re_position_apply'] = $re_position_apply;
	$fwViewData['re_position_apply'] = $re_position_apply;
	$where .= ' AND re_position_apply = ' . $re_position_apply;
}
elseif($re_position_apply == '') {
	$where .= '';
}
elseif(isset($_SESSION['re_position_apply'])) {
	$fwViewData['re_position_apply'] = $_SESSION['re_position_apply'];
	$where .= ' AND re_position_apply = ' . $_SESSION['re_position_apply'];
}

$reset = $fwRequest->getParam('reset', '');
if($reset) {
	$fwViewData['keyword'] = '';
	unset($_SESSION['keyword']);
	$fwViewData['re_position_apply'] = '';
	unset($_SESSION['re_position_apply']);
	$where = "WHERE re_hide = 0 ";
}


//Get Positions   
$get_positions = "SELECT position_matrix.pm_position, positions.p_name FROM `position_matrix` Left JOIN positions on position_matrix.pm_position = positions.p_id";
if ($get_positions) {
	$get_positions_data = $fwDb->query($get_positions);
	$fwViewData['get_positions_data'] =  $get_positions_data;
}

$sql = "SELECT " . $TABLE . ".* FROM " . $TABLE . " " . $where . " Order by re_id DESC ";

if ($sql) {
	$userData = $fwDb->query($sql);
}

if (!empty($userData)) {
	if (!(isset($pagenum))) {
		$pagenum = 1;
	}

	$rows = count($userData);

	$page_rows = 400;
	$last = ceil($rows / $page_rows);

	if ($pagenum <= 1) {
		$pagenum = 1;
	} elseif ($pagenum > $last) {
		$pagenum = $last;
	}
	$numstartvounter =  $page_rows * ($pagenum - 1) + 1;
	$fwViewData['numstartvounter'] = $numstartvounter;

	$fwViewData['last'] = $last;
	$fwViewData['lastone'] = $last - 1;
	$fwViewData['lasttow'] = $last - 2;
	$fwViewData['pagenum'] = $pagenum;
	$pagenatedatanext = $pagenum;
	$pagenatedataprev = $pagenum;
	for ($i = 0; $i < 9; $i++) {
		$paginate[$pagenatedatanext] = $pagenatedatanext;
		$pagenatedatanext++;
	}
	$fwViewData['paginatenext'] = $paginate;
	$pagenatedataprev = $pagenum;
	for ($i = 0; $i < 9; $i++) {
		$paginateprev[$pagenatedataprev] = $pagenatedataprev;
		$pagenatedataprev--;
	}
	$fwViewData['paginateprev'] = array_reverse($paginateprev);

	$max = 'limit ' . ($pagenum - 1) * $page_rows . ',' . $page_rows;

	$sql2 =  $sql . " " . $max;

	if ($sql2) {

		$setdata = $fwDb->query($sql2);
		$fwViewData['list'] =  $setdata;
	}
}

$_SESSION['last_sql'] = $sql;
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Recruitment List";
