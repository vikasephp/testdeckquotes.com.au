<?php
$fwMainView = 'file:' . getcwd() . '/open.tpl';
$fileid = $fwRequest->getParam('fileid', '');
$drive = access_gdrive();

$file = printFile($drive, $fileid);
if($file['alternateLink']): Location($file['alternateLink']); endif;
echo "Document access denied!";
exit;