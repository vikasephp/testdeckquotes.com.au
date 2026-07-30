<?php
$postedData = $_GET;

if (!empty($postedData['file_name']) && !empty($postedData['module_name'])) {
    require_once(LIB_DIR . 'CloudEphpClass.php');
    $obj = new CloudEphpClass($postedData['module_name']);

    $file_url = $obj->download($postedData['file_name'], false);

    // Check if it's a URL or a file path
    if (filter_var($file_url, FILTER_VALIDATE_URL)) {
        // It's a URL (e.g. S3 signed URL)
        // Use readfile if accessible, or force download via headers

        // Download file content
        $file_content = file_get_contents($file_url);
        if ($file_content !== false) {
            $basename = basename($postedData['file_name']);

            header('Content-Description: File Transfer');
            header('Content-Type: application/octet-stream');
            header('Content-Disposition: attachment; filename="' . $basename . '"');
            header('Expires: 0');
            header('Cache-Control: must-revalidate');
            header('Pragma: public');
            header('Content-Length: ' . strlen($file_content));

            echo $file_content;
            exit;
        } else {
            echo "Failed to fetch the file.";
            exit;
        }
    } else {
        // If local path
        $file_path = $file_url;
        if (file_exists($file_path)) {
            header('Content-Description: File Transfer');
            header('Content-Type: application/octet-stream');
            header('Content-Disposition: attachment; filename="' . basename($file_path) . '"');
            header('Expires: 0');
            header('Cache-Control: must-revalidate');
            header('Pragma: public');
            header('Content-Length: ' . filesize($file_path));
            readfile($file_path);
            exit;
        } else {
            echo "File not found.";
            exit;
        }
    }
} else {
    echo "file_name or module_name is missing";
}
