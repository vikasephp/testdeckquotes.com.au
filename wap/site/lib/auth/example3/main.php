<?php

require_once('./conf.php');

$auth = &newRoleAuth();
$auth->startSession();

?>
<?php include('header.php'); ?>
<?php if ($auth->isIdentified) { ?>
    <p>Welcome back <b><?php echo $auth->user['fullname']; ?></b>.</p>

<?php } ?>
    <p>Example 3 demostrate the use of roles to manage users' groups. As always there are four accounts created:</p>

    <table align="center" border="0" width="75%">
      <tr>
        <th>Username</th>

        <th>Password</th>

        <th>Group(s)</th>
      </tr>
      <tr>
        <td>adnoctum</td>

        <td>adnoctum</td>

        <td>members</td>
      </tr>
      <tr>
        <td>jcesar</td>

        <td>jcesar</td>

        <td>members</td>
      </tr>
      <tr>
        <td>guest</td>

        <td>guest</td>

        <td>guests</td>
      </tr>
      <tr>
        <td>god</td>

        <td>god</td>

        <td>admins</td>
      </tr>
    </table>
<?php include('footer.php'); ?>
