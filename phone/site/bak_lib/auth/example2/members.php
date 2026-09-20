<?php

require_once('./conf.php');

$auth = &newGroupAuth();
$auth->requireAtLeast('members', 'admins');

?>
<?php include('header.php'); ?>
    <p>This is the members area. As a member you are entitled to see your account
    info:</p>

    <table align="center" border="1" cellpadding="4" width="400">
      <tr>
        <th>Username:</th>

        <td><?php echo $auth->user['username']; ?></td>
      </tr>
      <tr>
        <th>Real Name:</th>

        <td><?php echo $auth->user['fullname']; ?></td>
      </tr>
      <tr>
        <th>Email:</th>

        <td><?php echo $auth->user['email']; ?></td>
      </tr>
      <tr>
        <th>Groups:</th>

        <td><?php print_r($auth->user['::groups::']); ?></td>
      </tr>
    </table>

    <p>This page uses the method GroupAuth::requireAtLeast() so users in admins and
    members groups can access this zone.</p>
<?php include('footer.php'); ?>
