<?php

$fwViewData['title'] = 'Welcome To PlanetPaper.com';
$sent = $fwRequest->getparam('sent','');
if(!empty($sent))
{
    $fwViewData['sent'] = $sent;
}