<?php

require_once('./conf.php');

$auth = &newAuth();
$auth->forceLogin();

?>
<?php include('header.php'); ?>
    <p>Here is your account info. I use the <code>$auth->user</code> array to show the information stored in the session but you can also use <code>$_SESSION['user']</code> or <code>$HTTP_POST_VARS['user']</code>.</p>

    <table align="center" border="1" cellpadding="4" width="400">
      <tr>
        <th>Login:</th>

        <td><?php echo $auth->user['login']; ?></td>
      </tr>
      <tr>
        <th>Name:</th>

        <td><?php echo $auth->user['fullname']; ?></td>
      </tr>
      <tr>
        <th>Email:</th>

        <td><?php echo $auth->user['email']; ?></td>
      </tr>
    </table>
<?php include('footer.php'); ?>
