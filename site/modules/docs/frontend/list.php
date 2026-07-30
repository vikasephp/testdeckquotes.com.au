<?php 
$fwMainView = 'file:' . getcwd() . '/list.tpl';
$requset = $fwRequest->getparamget('a_req', 'getAll');

require_once LIB_DIR.'src/Google_Client.php';
require_once LIB_DIR.'src/contrib/Google_DriveService.php';
$client = new Google_Client();
$drive = new Google_DriveService($client);
if (isset($_SESSION['token'])) {
  $client->setAccessToken($_SESSION['token']);
}
if ($client->getAccessToken()) {
if($requset):
				switch ($requset):
				case 'getAll':
				$optParams = array();
				
				$optParams['q'] = "mimeType = 'application/vnd.google-apps.folder' and not 'dhirephp@gmail.com' in owners";
				$files = $drive->files->listFiles($optParams);
 				$fwViewData['gfodersdata'] = $files['items'];
				
				/*$optParams['q'] = "mimeType != 'application/vnd.google-apps.folder' and trashed = false and not 'dhirephp@gmail.com' in owners";
				$files = $drive->files->listFiles($optParams);
 				$fwViewData['gfilesdata'] = $files['items'];*/
			
				$optParams['q'] = "mimeType != 'application/vnd.google-apps.folder' and trashed = false";
				$files = $drive->files->listFiles($optParams);
 				$fwViewData['gfilesdata'] = $files['items'];
	

				break;				
				default:				
endswitch;	
endif;
  // We're not done yet. Remember to update the cached access token.
  // Remember to replace $_SESSION with a real database or memcached.
  $_SESSION['token'] = $client->getAccessToken();
} else {
  $authUrl = $client->createAuthUrl();
  print "<a href='$authUrl'>Connect Me!</a>";
}
//$file = $drive->files->get('0BxaYGchgRQrud1VNTHc1eUkyZkU');
//DB($file);
$fwViewData['title'] = "Docs Management";
