<?php
$folderPath = $_SERVER['DOCUMENT_ROOT'] . '/download_files';
$fileList = glob($folderPath . '/*');
//echo "<pre>"; print_r($fileList);
foreach ($fileList as $file) {
   if (is_file($file)) {
      unlink($file);
   }
}
exit;