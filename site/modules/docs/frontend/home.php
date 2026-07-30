<?php
require_once LIB_DIR.'src/Google_Client.php';
require_once LIB_DIR.'src/contrib/Google_DriveService.php';
session_start();

$client = new Google_Client();
$drive = new Google_DriveService($client);

if (isset($_GET['code'])) {
  $client->authenticate();
  $_SESSION['token'] = $client->getAccessToken();
  $redirect = 'http://' . $_SERVER['HTTP_HOST'] . $_SERVER['PHP_SELF'];
  //header('Location: ' . filter_var($redirect, FILTER_SANITIZE_URL));
  Location(BASE_URL."docs.home");
}

if (isset($_SESSION['token'])) {
  $client->setAccessToken($_SESSION['token']);
}
if ($client->getAccessToken()) {
  $_SESSION['token'] = $client->getAccessToken();
  
} else {
  $authUrl = $client->createAuthUrl();
  print "<a href='$authUrl'>Connect Me!</a>";
}
$fwViewData['title'] = "Docs Management";