<?php
$postedData = $_POST;
if (!empty($postedData['file_name']) && !empty($postedData['id'])) {
    $zipfile = $postedData['file_name'];
    $filetoinclude = $_SERVER['DOCUMENT_ROOT'] . '/file_upload/server/s3/S3.php';
    include_once $filetoinclude;
    $raw_data = "";
    $s3 = new S3(ACCESS_KEY, SECRET_KEY);
    try {
        $bucket_name  = BUCKET_NAME;
        $file_data = $s3->getObject($bucket_name, 'files/brief_builder/' . $zipfile, $saveTo = false);
        //	echo "<pre>";print_r($file_data);  
        $file_data = $file_data->body;
        $type = pathinfo($zipfile, PATHINFO_EXTENSION);
        $raw_data = 'data:image/' . $type . ';base64,' . base64_encode($file_data);

        $data =  ['status' => 'true', "errAlert" => '', "data" => ["rawImgData" => $raw_data, "fileName" => $postedData['file_name'], "id" => $postedData['id']]];
    } catch (ErrorException $ex) {
        //$this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
        echo $ex->getLine();
        $data =  ['status' => 'false', "errAlert" => '', "data" => ["rawImgData" => $raw_data, "fileName" => $postedData['file_name'], "id" => $postedData['id']]];
    }
} else {
    $data =  ['status' => 'false', "errAlert" => 'Please enter valid value'];
}

header('Content-Type: application/json; charset=utf-8');
echo json_encode($data);
exit();
