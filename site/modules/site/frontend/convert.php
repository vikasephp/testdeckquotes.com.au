<?php

require_once(BASE_DIR .'/convertapi-php-master/lib/ConvertApi/autoload.php');

use  \lib\ConvertApi\ConvertApi;

# set your api secret
ConvertApi::setApiSecret('DI6TDM5knMLupqgn');

# Example of saving Word docx to PDF and to PNG
# https://www.convertapi.com/docx-to-pdf
# https://www.convertapi.com/docx-to-png

$dir = sys_get_temp_dir();

# Use upload IO wrapper to upload file only once to the API
$upload = new \ConvertApi\FileUpload('E:/wamp/www/wordpdf/proposal.docx');

$result = ConvertApi::convert('pdf', array('File' => $upload));
$savedFiles = $result->saveFiles($dir);

echo "The PDF saved to:\n";
print_r($savedFiles);

# Reuse the same uploaded file
$result = ConvertApi::convert('png', array('File' => $upload));
$savedFiles = $result->saveFiles($dir);

echo "The PNG saved to:\n";
print_r($savedFiles);
