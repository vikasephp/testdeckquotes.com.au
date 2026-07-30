<?php
include_once $_SERVER['DOCUMENT_ROOT'].'/file_upload/server/s3/S3.php';
require_once $_SERVER['DOCUMENT_ROOT'].'/plugins/fpdf/fpdf/fpdf.php';
require_once $_SERVER['DOCUMENT_ROOT'].'/plugins/fpdf/vendor/setasign/fpdi/src/autoload.php';

use setasign\Fpdi\Fpdi;

$sql = "SELECT cn_survey_pdf FROM customer_nps_report WHERE cn_openclose = 0 ORDER BY IF(cn_date = ' ' OR cn_date IS NULL, 0, 1), STR_TO_DATE(cn_date, '%d-%m-%Y') DESC";
$rows = $fwDb->query($sql);

$pdfFiles = [];
foreach ($rows as $r) {
    if (!empty($r['cn_survey_pdf'])) {
        $pdfFiles[] = $r['cn_survey_pdf'];
    }
}

if (empty($pdfFiles)) {
    die("No survey PDFs found to merge.");
}

$bucket = BUCKET_NAME;
$folder = "files/uploads_2023/"; 
$s3 = new S3(ACCESS_KEY, SECRET_KEY);

$tmpFiles = [];
foreach ($pdfFiles as $fileName) {
    $fileData = $s3->getObject($bucket, $folder.$fileName, $saveTo=false);
    $localPath = sys_get_temp_dir() . "/" . basename($fileName);
    file_put_contents($localPath, $fileData->body);
    $tmpFiles[] = $localPath;
}

// Merge PDFs using FPDI
$mergedFile = sys_get_temp_dir() . "/All_Surveys_Merged.pdf";
$pdf = new FPDI();

foreach ($tmpFiles as $pdfFile) {
    $pageCount = $pdf->setSourceFile($pdfFile);
    for ($page = 1; $page <= $pageCount; $page++) {
        $tplIdx = $pdf->importPage($page);
        $size = $pdf->getTemplateSize($tplIdx);
        $pdf->AddPage($size['orientation'], [$size['width'], $size['height']]);
        $pdf->useTemplate($tplIdx);
    }
}

$pdf->Output('F', $mergedFile);

$date = date('d-m-Y');
$filename = "Surveys_PDF_" . $date . ".pdf";

header('Content-Type: application/pdf');
header('Content-Disposition: attachment; filename="'.$filename.'"');
header('Content-Length: ' . filesize($mergedFile));

readfile($mergedFile);


unlink($mergedFile);
foreach ($tmpFiles as $file) {
    @unlink($file);
}
exit;
