<?php
$_SESSION['clipboard_data'] = "None";
$cd = $fwRequest->getParamget('cb', '');
if($cd){$_SESSION['clipboard_data'] = $cd;}
print($_SESSION['clipboard_data']);
exit;