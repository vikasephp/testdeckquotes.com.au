<?php

$limit = (int)$fwRequest->getParam('limit', 50);
$offset = (int)$fwRequest->getParam('offset', 0);
if ($limit < 1) {
	$limit = 50;
}
if ($offset < 0) {
	$offset = 0;
}

$queueData = array('items' => array(), 'total' => 0);
$fwViewData['apiError'] = '';

require_once(LIB_DIR . 'AIClass.php');

try {
	$aiObject = new AIClass();
	if (!method_exists($aiObject, 'getReviewQueue')) {
		$fwViewData['apiError'] = 'AIClass.php on the server is missing getReviewQueue(). Please upload the updated site/lib/AIClass.php.';
	} else {
		$queueData = $aiObject->getReviewQueue($limit, $offset);
		if (isset($queueData['success']) && $queueData['success'] === false) {
			$fwViewData['apiError'] = !empty($queueData['message']) ? $queueData['message'] : 'Unable to load review queue.';
		}
	}
} catch (Exception $e) {
	$fwViewData['apiError'] = 'Review queue error: ' . $e->getMessage();
}

$fwViewData['queueData'] = $queueData;
$fwViewData['queueItems'] = (isset($queueData['items']) && is_array($queueData['items'])) ? $queueData['items'] : array();
$fwViewData['queueTotal'] = (int)(isset($queueData['total']) ? $queueData['total'] : 0);
$fwViewData['queueLimit'] = $limit;
$fwViewData['queueOffset'] = $offset;
$fwViewData['title'] = 'HITL Review Queue';
