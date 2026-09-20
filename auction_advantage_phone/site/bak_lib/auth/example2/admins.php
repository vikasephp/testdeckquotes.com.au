<?php

require_once('./conf.php');

$auth = &newGroupAuth();
$auth->requireGroups('admins');

?>
<?php include('header.php'); ?>
    <p>This zone is reserved for admins only. If you don't belong to the admins group you can't access this page becouse it uses the AuthGroup::requireGroups() method.</p>

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
<?php include('footer.php'); ?>
