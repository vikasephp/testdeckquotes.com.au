<?php

require_once('./conf.php');

$auth = &newAuth();
$auth->startSession();

?>
<?php include('header.php'); ?>
    <p>This is Example 1's front page. You can compare this script to the front page of
    your own website. Here we use <code>Auth</code> to access User's information if he is
    logged in to show personalized content.</p>
<?php if ($auth->isIdentified) { ?>
    <p>Welcome <b><?php echo $auth->user['fullname']; ?></b>. Now that you have identified
    you can access your <a href="protected.php">account info</a>. Don't forguet to <a
    href="logout.php">Logout</a> before you leave.</p>
<?php } else { ?>
    <p>You are not logged in so you see the same content as everybody. If you want to see
    personalized content <a href="login.php">login</a> first.</p>

    <p>For demostration purposes there are some account created:</p>

    <table align="center" border="0" width="75%">
      <tr>
        <th>Username</th>

        <th>Password</th>
      </tr>
      <tr>
        <td>adnoctum</td>

        <td>adnoctum</td>
      </tr>
      <tr>
        <td>jcesar</td>

        <td>jcesar</td>
      </tr>
      <tr>
        <td>guest</td>

        <td>guest</td>
      </tr>
      <tr>
        <td>god</td>

        <td>god</td>
      </tr>
    </table>
<?php } ?>
<?php include('footer.php'); ?>
