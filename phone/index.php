<?php
header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
header("Cache-Control: no-store, no-cache, must-revalidate");
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache");
//db($_SERVER); exit;
// handle sef url
if (isset($_SERVER['REDIRECT_URL']))
{
    if($_SERVER['REDIRECT_URL'] == '/phone/index.php'){
        
        if(!empty($_SERVER['argv'][0])){
            if (strpos($_SERVER['REQUEST_URI'], '?') !== false) {
               $_SERVER['REQUEST_URI'] = str_replace("&", "/", $_SERVER['REQUEST_URI']); 
                $_SERVER['REQUEST_URI'] = str_replace("=", "/", $_SERVER['REQUEST_URI']); 
                $_SERVER['REQUEST_URI'] = str_replace("?", "/", $_SERVER['REQUEST_URI']); 
            }
             $_SERVER['REDIRECT_URL'] = $_SERVER['REQUEST_URI'];
        }
       
    }
    if($_SERVER['REDIRECT_URL'] != '/phone/index.php'){
    parseSefUrl();
    }
}
// web root
$base_url = 'http';
if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on')
{
    $base_url .= 's';
}
$base_url .= '://' . $_SERVER['HTTP_HOST'] . $_SERVER['SCRIPT_NAME']; 
$base_url = preg_replace('@[^/]*$@i', '', $base_url);
define('BASE_URL', $base_url);

// doc root
define('BASE_DIR', getcwd() . '/');

// site root
define('SITE_DIR', BASE_DIR . 'site/');

// lib root
define('LIB_DIR', SITE_DIR . 'lib/');

// tmp dir
define('MODULES_DIR', SITE_DIR . 'modules/');

// tmp dir
define('TMP_DIR', SITE_DIR . 'tmp/');

// hand over control to fusebox
require_once('./site/lib/fusebox/fbx_Fusebox3.0_PHP4.1.x.php');

// function to parse sef url
function parseSefUrl()
{
    $relative_url = preg_replace('@[^/]*$@i', '', $_SERVER['SCRIPT_NAME']);
    
    $sef_url = preg_replace('@^' . $relative_url . '@i', '', $_SERVER['REDIRECT_URL']);
    
    $sef_url = trim($sef_url, '/');
   
    if(empty($sef_url))
    {
        return false;
    }
    
    $parts = explode('/', $sef_url);

    if(count($parts) == 0)
    {
        return false;
    }

    if (substr($parts[0], -3, 3) == 'htm')
    {
        $post_slug = $parts[0];
        
        $_GET['post_slug'] = $post_slug;
        $_REQUEST['post_slug'] = $post_slug;
        
        return true;
    }
  //db($parts); exit;  
    if (count($parts) == 1)
    {
        if (!preg_match('/[^a-z0-9-]/i', $parts[0]))
        {
            $memorial_unique_url = $parts[0];
            
            $_GET['memorial_unique_url'] = $memorial_unique_url;
            $_REQUEST['memorial_unique_url'] = $memorial_unique_url;
            
            return true;
        }
    }

    /*
     * Business Documents live pages ONLY.
     * /business_document/{type}/{name} → business_document.page
     * Does not change other modules (phone_log, etc.) or dotted URLs like business_document.home
     */
    if (
        isset($parts[0], $parts[1], $parts[2])
        && $parts[0] === 'business_document'
    ) {
        $bd_actions = array('home', 'edit', 'delete', 'page', 'view_type', 'add_type', 'delete_type');
        if (!in_array($parts[1], $bd_actions, true)) {
            $_GET['fuseaction'] = 'business_document.page';
            $_REQUEST['fuseaction'] = 'business_document.page';
            $_GET['type_slug'] = $parts[1];
            $_REQUEST['type_slug'] = $parts[1];
            $_GET['name_slug'] = $parts[2];
            $_REQUEST['name_slug'] = $parts[2];
            return true;
        }
    }
    
    $fuseaction = $parts[0];

    if (strpos($fuseaction, '.') === false)
    {
        $fuseaction .= '.home';
    }

    unset($parts[0]);

    $request_variables = array();

    $total_parts = count($parts);

    for($i=1; $i<=$total_parts; $i=$i+2)
    {
        $key = $parts[$i];

        $value = '';

        if(isset($parts[$i+1]))
        {
            $value = $parts[$i+1];
        }

        $request_variables[$key] = $value;
    }

    $_GET['fuseaction'] = $fuseaction;
    $_REQUEST['fuseaction'] = $fuseaction;

    foreach($request_variables as $key=>$value)
    {
        $_GET[$key] = $value;
        $_REQUEST[$key] = $value;
    }
    
    return true;
}

// function used for debugging
function db($debugArray, $name="")
{
	$nameText = "Debug: ";
	if ($name)
    {
		$nameText = "Debug display of '$name':";
    }
    echo "<p><b>$nameText</b><pre>\n";
    print_r($debugArray);
    echo "</pre></p>\n";
}