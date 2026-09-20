<?php

require_once('./conf.php');

// Compatibility with PHP 4.0.x
if (!isset($_ENV)) { // PHP 4.0.x
	$_REQUEST = array_merge($HTTP_GET_VARS, $HTTP_POST_VARS, $HTTP_COOKIE_VARS);
}

$auth = &newRoleAuth();

$action = isset($_REQUEST['action'])?$_REQUEST['action']:'';
switch ($action) {
	case 'delete':
	adminsDelete();
	break;

	case 'update':
	adminsUpdate();
	break;

	case 'edit':
	adminsEdit();
	break;

	case 'insert':
	adminsInsert();
	break;

	case 'new':
	adminsNew();
	break;

	default:
	adminsDefault();
	break;
}

function adminsDelete() {
	if (!isset($_REQUEST)) {// PHP 4.0.x
		$_REQUEST = &$GLOBALS['_REQUEST'];
	}

	global $auth;	// For user authentication.
	$auth->requireRoles('deleteUsers');
	$db = &connect();

	$userId = $_REQUEST['user_id'];

	$res = $db->Execute($sql = "DELETE FROM users WHERE user_id = $userId");
	if (false === $res) {
		trigger_error('SQL Syntax Error'.$sql, E_USER_ERROR);
	}
	include('./header.php');
?>
	<p>This account has been deleted.</p>
<?php
	include('./footer.php');
}

function adminsUpdate() {
	if (!isset($_POST)) {// PHP 4.0.x
		$_POST = &$GLOBALS['HTTP_POST_VARS'];
	}

	global $auth;	// For user authentication.
	$auth->requireRoles('editUsers');
	$db = &connect();

	$userId = $_POST['user_id'];
	$email = $_POST['email'];
	$fullname = $_POST['fullname'];

	$res = $db->Execute("UPDATE users SET email = '$email', fullname = '$fullname' WHERE user_id = $userId");
	if (false === $res) {
		trigger_error('SQL Syntax Error'.$sql, E_USER_ERROR);
	}
	include('./header.php');
?>
	<p>The user's information has been updated.</p>
<?php
	include('./footer.php');
}

function adminsEdit() {
	if (!isset($_REQUEST)) {// PHP 4.0.x
		$_REQUEST = &$GLOBALS['_REQUEST'];
	}

	global $auth;	// For user authentication.
	$auth->requireRoles('accessAdmins');
	$db = &connect();

	$userId = $_REQUEST['user_id'];
	if(!is_numeric($userId)) {
		header('Location: admins.php?is_long');
		exit();
	}

	// Get user's info from database.
	$rs = $db->Execute("SELECT * FROM users WHERE user_id = $userId");
	if (false === $rs) {
		trigger_error('SQL Syntax Error', E_USER_ERROR);
	}
	if ($rs->EOF) {
		header('Location: admins.php?');
		exit();
	}

	include('./header.php');
?>
    <h2>Edit user.</h2>
    <form action="admins.php" method="post">
      <input name="action" type="hidden" value="update"/>
      <input name="user_id" type="hidden" value="<?php echo $userId; ?>"/>
      <table align="center" bgcolor="#CCCCCC" cellspacing="1" width="100%">
        <tr>
          <th bgcolor="#EEEEEE">Username:</th>

          <td bgcolor="#FFFFFF"><?php echo $rs->Fields('username'); ?></td>
        </tr>
        <tr>
          <th bgcolor="#EEEEEE">Email:</th>

          <td bgcolor="#FFFFFF"><input name="email" type="text" value="<?php echo $rs->Fields('email'); ?>"/></td>
        </tr>
        <tr>
          <th bgcolor="#EEEEEE">Real Name:</th>

          <td bgcolor="#FFFFFF"><input name="fullname" type="text" value="<?php echo $rs->Fields('fullname'); ?>"/></td>
        </tr>
        <tr>
          <th bgcolor="#EEEEEE">Roles:</th>

          <td bgcolor="#FFFFFF">
            <ul>
<?php
	$rs = $db->Execute('SELECT DISTINCT roles.title '.
		'FROM users_groups, groups_roles, roles '.
		"WHERE users_groups.user_id = $userId AND ".
			'groups_roles.group_id = users_groups.group_id AND '.
			'roles.role_id = groups_roles.role_id');
	if (false === $rs) {
		trigger_error('SQL Syntax Error.', E_USER_ERROR);
	}
	for (; !$rs->EOF; $rs->MoveNext()) {
?>
              <li><?php echo $rs->Fields('title'); ?></li>
<?php } ?>
            </ul>
          </td>
        </tr>
        <tr>
          <td align="center" bgcolor="#FFFFFF" colspan="2"><input type="submit" value="Update"/>
          <input onclick="history.go(-1);" type="button" value="Cancel"/></td>
        </tr>
      </table>
    </form>
<?php
	include('./footer.php');
}

function adminsInsert() {
	if (!isset($_POST)) {// PHP 4.0.x
		$_POST = &$GLOBALS['HTTP_POST_VARS'];
	}

	global $auth;	// For user authentication.
	$auth->requireRoles('createUsers');
	$db = &connect();

	$username = $_POST['username'];
	$password = md5($_POST['password']);
	$email = $_POST['email'];
	$fullname = $_POST['fullname'];

	$res = $db->Execute('INSERT INTO users (username, password, email, fullname) '.
		"VALUES ('$username', '$password', '$email', '$fullname')");
	if (false === $res) {
		trigger_error('SQL Syntax Error', E_USER_ERROR);
	}

	include('./header.php');
?>
    <p>The user account has been created.</p>
<?php
	include('./footer.php');
}

function adminsNew() {
	global $auth;	// For user authentication.
	$auth->requireRoles('accessAdmins');

	include('./header.php');
?>
    <h2>Registered users.</h2>
    <form action="admins.php" method="post">
      <input name="action" type="hidden" value="insert"/>
      <table align="center" bgcolor="#CCCCCC" cellspacing="1" width="100%">
        <tr>
          <th bgcolor="#EEEEEE">Username:</th>

          <td bgcolor="#FFFFFF"><input name="username" type="text"/></td>
        </tr>
        <tr>
          <th bgcolor="#EEEEEE">Password:</th>

          <td bgcolor="#FFFFFF"><input name="password" type="password"/></td>
        </tr>
        <tr>
          <th bgcolor="#EEEEEE">Email:</th>

          <td bgcolor="#FFFFFF"><input name="email" type="text"/></td>
        </tr>
        <tr>
          <th bgcolor="#EEEEEE">Real Name:</th>

          <td bgcolor="#FFFFFF"><input name="fullname" type="text"/></td>
        </tr>
        <tr>
          <td align="center" bgcolor="#FFFFFF" colspan="2"><input type="submit" value="Create"/>
          <input onclick="history.go(-1);" type="button" value="Cancel"/></td>
        </tr>
      </table>
    </form>
<?php
}


function adminsDefault() {
	global $auth;	// For user authentication.
	$auth->requireRoles('accessAdmins');
	$db = &connect();

	include('./header.php');
?>
    <h2>Registered users.</h2>
    <table align="center" bgcolor="#CCCCCC" cellspacing="1" width="100%">
      <tr>
        <th bgcolor="#EEEEEE">Username:</th>

        <th bgcolor="#EEEEEE">Email:</th>

        <th bgcolor="#EEEEEE">Real Name:</th>

        <th bgcolor="#EEEEEE">Action:</th>
      </tr>
<?php
	$rs = $db->Execute('SELECT * FROM users');
	if (false === $rs) {
		trigger_error('SQL Syntax Error', E_USER_ERROR);
	}
	for (; !$rs->EOF; $rs->MoveNext()) {
?>
      <tr>
        <td bgcolor="#FFFFFF"><?php echo $rs->Fields('username'); ?></td>

        <td bgcolor="#FFFFFF"><?php echo $rs->Fields('email'); ?></td>

        <td bgcolor="#FFFFFF"><?php echo $rs->Fields('fullname'); ?></td>

        <td bgcolor="#FFFFFF"><a href="admins.php?action=edit&user_id=<?php echo $rs->Fields('user_id'); ?>">Edit</a>,
        <a href="admins.php?action=delete&user_id=<?php echo $rs->Fields('user_id'); ?>" onclick="return confirm('¿Seguro que desea eliminar este usuario?');">Delete</a></td>
      </tr>
<?php
	}
?>
    </table>
    <p><a href="admins.php?action=new">New User</a></p>
<?php
	include('./footer.php');
}

?>
