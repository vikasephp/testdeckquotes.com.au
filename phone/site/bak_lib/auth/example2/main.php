<?php

require_once('./conf.php');

$auth = &newGroupAuth();
$auth->startSession();

?>
<?php include('header.php'); ?>
<?php if ($auth->isIdentified) { ?>
    <p>Welcome back <b><?php echo $auth->user['fullname']; ?></b>.</p>

<?php } ?>
    <p>This is Example 2's main page. There are some accounts created for this
    example:</p>

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

        <td>members</td>
      </tr>
      <tr>
        <td>god</td>

        <td>god</td>

        <td>admins</td>
      </tr>
    </table>
<?php include('footer.php'); ?>
