<?php 
// php settings
error_reporting(E_ALL ^ E_NOTICE ^ E_DEPRECATED);
//ini_set('error_reporting', E_ALL & ~E_NOTICE & ~E_STRICT & ~E_DEPRECATED);
ini_set('session.save_path', TMP_DIR.'sess');
ini_set('display_errors', 'On');
ini_set('magic_quotes_gpc', 'Off');
ini_set('magic_quotes_runtime', 'Off');
ini_set('register_globals', 'Off');
ini_set('register_long_arrays', 'On');
ini_set('session.gc_maxlifetime', 31536000);
//ini_set('memory_limit','256M');
ini_set('post_max_size','512M');
$ENV = 'development';
$DB_TYPE = 'mysqli';
$DB_HOST = 'localhost';
$DB_NAME = 'testdeckquotes_testdb';
$DB_USER = 'testdeckquotes_testdb';
$DB_PASS = 'Fracture#Transfer#Cyt0p1ast';
//$DB_HOST = 'deckquotes.cz8n0vd4lqh4.us-east-1.rds.amazonaws.com';
//$DB_NAME = 'deckquotes';
//$DB_USER = 'admin';
//$DB_PASS = 'IQipieiJt5yVPqUruorU';
$DB_CHARSET = 'utf8';

/*$DB_HOST = 'localhost';
$DB_NAME = 'deckquotescom_maindb';
$DB_USER = 'deckquotescom_mainuser';
$DB_PASS = 'cWTtZIWoSN{d';
$DB_CHARSET = 'utf8';*/

$MySqliCon = mysqli_connect($DB_HOST,$DB_USER,$DB_PASS,$DB_NAME);

switch ($_SERVER['HTTP_HOST'])
		{		
			case 'localhost':
			   error_reporting(E_ALL ^ E_NOTICE ^ E_DEPRECATED);
				ini_set('display_errors', 'On');
				$ENV = 'development';
				$DB_HOST = 'localhost';
				$DB_NAME = 'gcon';
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
define('DB_CHARSET', $DB_CHARSET);
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
define('ROOT_URL', 'https://www.deckquotes.com.au/');
define('FILE_PATH', '');
define('WEBSITE_STATUS', '1');

//define('ACCESS_KEY', 'AKIA2AMNCYNNXQ3Y5CRL');
//define('SECRET_KEY', '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');
