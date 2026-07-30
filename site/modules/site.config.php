<?php 
// php settings
// error_reporting(E_ALL);
error_reporting(E_ALL ^ E_NOTICE ^ E_DEPRECATED);
ini_set('session.save_path', TMP_DIR.'sess');
ini_set('display_errors', 'On');
ini_set('magic_quotes_gpc', 'Off');
ini_set('magic_quotes_runtime', 'Off');
ini_set('register_globals', 'Off');
ini_set('register_long_arrays', 'On');
ini_set('session.gc_maxlifetime', 31536000);
//ini_set('memory_limit','256M');
$ENV = 'production';
$DB_TYPE = 'mysql';
//$DB_HOST = 'localhost';
//$DB_NAME = 'admin3_deckquot8thFeb';
//$DB_USER = 'admin3_deckuser';
//$DB_PASS = 'TMN)xgK#~0Py';

switch ($_SERVER['HTTP_HOST'])
		{		
			case 'localhost':
			   error_reporting(E_ALL ^ E_NOTICE ^ E_DEPRECATED);
				ini_set('display_errors', 'On');
				$ENV = 'development';
				$DB_HOST = 'localhost';
				$DB_NAME = 'gcon2';
				$DB_USER = 'root';
				$DB_PASS = '';
			break;
		}
define('SITE_NAME', 'GCON CMS');
define('SITE_DESC', 'Example site description');
define('SITE_KEYWORD', 'Example, site, keywords');
define('SITE_EMAIL', 'service@turnkeystudios.com.au'); 
define('DEVELOPEDBY','Developed by<a href="http://www.ephpsolutions.com" target="_blank">Ephp Solutions.</a>');
define('SITE_EMAIL_SEND', 'service@turnkeystudios.com.au');
define('FROM_NAME', 'Turnkey Studios');
define('ENV', $ENV);
define('DB_TYPE', $DB_TYPE);
define('DB_HOST', $DB_HOST);
define('DB_NAME', $DB_NAME);
define('DB_USER', $DB_USER);
define('DB_PASS', $DB_PASS);
define('GROUP_ADMINISTRATORS', 1);
define('GROUP_CUSTOMERS', 2);
define('GROUP_USERS', 3);
define('GROUP_EMPLOYEES', 4);
define('PAGE_TOP_MENU', 1);
define('PAGE_MAIN_MENU', 2);
define('PAGE_BOTTOM_MENU', 3);
define('PAGE_HOME', 4);
define('PAGE_CONTACT_US', 5);
define('BUYER_REPORT_EMAIL_SECTION', 8);
define('BUYER_REPORT_QA_SECTION', 7);
define('SET_PDF_AUTHOR', 'Turnkey Studios');
define('PDF_HEADER_BES_LOGO', 'maincapitallogo.png');
define('ROOT_URL', 'http://www.deckquotes.com.au/');
define('FILE_PATH', '');
define('WEBSITE_STATUS', '1');