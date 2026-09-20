<?php	
$emailid = $fwRequest->getParamget('eid', 0);
$fp = fopen('data.txt', 'w');
fwrite($fp, $emailid);
fclose($fp);
header( 'Content-type: image/gif' );
echo chr(71).chr(73).chr(70).chr(56).chr(57).chr(97).
      chr(1).chr(0).chr(1).chr(0).chr(128).chr(0).
      chr(0).chr(0).chr(0).chr(0).chr(0).chr(0).chr(0).
      chr(33).chr(249).chr(4).chr(1).chr(0).chr(0).
      chr(0).chr(0).chr(44).chr(0).chr(0).chr(0).chr(0).
      chr(1).chr(0).chr(1).chr(0).chr(0).chr(2).chr(2).
      chr(68).chr(1).chr(0).chr(59);
exit;