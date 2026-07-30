<?php

require_once('./conf.php');

$auth = &newAuth();
$auth->logout();

?>
<?php include('header.php'); ?>
    <p>You have been logged out. Now you can go to the <a href="main.php">Front
    Page</a></p>
<?php include('footer.php'); ?>
