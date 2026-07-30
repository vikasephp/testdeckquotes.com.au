<?php
require_once(LIB_DIR . 'AIClass.php');

header('Content-Type: application/json');

$did = trim($fwRequest->getParam('did', ''));
if ($did === '' && isset($_POST['did'])) {
	$did = trim($_POST['did']);
}
$action = trim($fwRequest->getParam('action', ''));
if ($action === '' && isset($_POST['action'])) {
	$action = trim($_POST['action']);
}
$reviewedBy = isset($_SESSION['user']['user_name']) ? $_SESSION['user']['user_name'] : '';
$response = array('success' => false, 'message' => 'Invalid request');

if ($did === '' || $reviewedBy === '') {
	echo json_encode($response);
	exit;
}

$aiObject = new AIClass();

if ($action === 'poll_status') {
	$data = $aiObject->getPipelineStatus($did);
	$response = array(
		'success' => true,
		'data' => $data,
	);
} elseif ($action === 'poll_flags') {
	$statusFilter = trim($fwRequest->getParam('status', ''));
	$severityFilter = trim($fwRequest->getParam('severity', ''));
	$data = $aiObject->getDidFlags($did, $statusFilter, $severityFilter);
	$response = array(
		'success' => true,
		'data' => $data,
	);
} elseif ($action === 'reject') {
	$flagId = trim($fwRequest->getParam('flag_id', ''));
	if ($flagId === '' && isset($_POST['flag_id'])) {
		$flagId = trim($_POST['flag_id']);
	}
	$comment = trim($fwRequest->getParam('comment', ''));
	if ($comment === '' && isset($_POST['comment'])) {
		$comment = trim($_POST['comment']);
	}
	if ($flagId === '') {
		$response['message'] = 'Missing flag id';
		echo json_encode($response);
		exit;
	}
	$data = $aiObject->reviewFlag($did, $flagId, 'reject', $reviewedBy, $comment);
	$response = array(
		'success' => !isset($data['success']) || $data['success'] !== false,
		'message' => isset($data['message']) ? $data['message'] : (isset($data['error']['message']) ? $data['error']['message'] : 'Flag rejected'),
		'data' => $data,
	);
} elseif ($action === 'comment') {
	$flagId = trim($fwRequest->getParam('flag_id', ''));
	if ($flagId === '' && isset($_POST['flag_id'])) {
		$flagId = trim($_POST['flag_id']);
	}
	$comment = trim($fwRequest->getParam('comment', ''));
	if ($comment === '' && isset($_POST['comment'])) {
		$comment = trim($_POST['comment']);
	}
	if ($flagId === '' || $comment === '') {
		$response['message'] = 'Comment is required';
		echo json_encode($response);
		exit;
	}
	$data = $aiObject->reviewFlag($did, $flagId, 'comment', $reviewedBy, $comment);
	$response = array(
		'success' => !isset($data['success']) || $data['success'] !== false,
		'message' => isset($data['message']) ? $data['message'] : 'Fix request accepted',
		'data' => $data,
	);
} elseif ($action === 'edit_content') {
	$flagId = trim($fwRequest->getParam('flag_id', ''));
	if ($flagId === '' && isset($_POST['flag_id'])) {
		$flagId = trim($_POST['flag_id']);
	}
	$contentJson = $fwRequest->getParam('content', '');
	if ($contentJson === '' && isset($_POST['content'])) {
		$contentJson = $_POST['content'];
	}
	$content = json_decode($contentJson, true);
	if ($flagId === '' || !is_array($content)) {
		$response['message'] = 'Invalid content payload';
		echo json_encode($response);
		exit;
	}
	$data = $aiObject->editFlagContent($did, $flagId, $reviewedBy, $content);
	$response = array(
		'success' => !isset($data['success']) || $data['success'] !== false,
		'message' => isset($data['message']) ? $data['message'] : 'Content saved',
		'data' => $data,
	);
}

echo json_encode($response);
exit;
