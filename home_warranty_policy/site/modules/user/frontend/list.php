<?php

$user_id = $_SESSION['user']['user_id'];

$submit = $fwRequest->getparam('subAddDetail', '');
$detail = $fwRequest->getparam($TABLE, '');

