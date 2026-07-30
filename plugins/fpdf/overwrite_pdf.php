
<?php
ob_start();
require __DIR__ . '/vendor/autoload.php';
use setasign\Fpdi\Fpdi;
// initiate FPDI
$pdf = new Fpdi();
$pdf->AddPage();

echo $_SERVER['DOCUMENT_ROOT']."/plugins/fpdf/pdf_files/CSKP31.pdf";

$pdf->setSourceFile($_SERVER['DOCUMENT_ROOT']."/plugins/fpdf/pdf_files/CSKP31.pdf");
// import page 1
$tplId = $pdf->importPage(1);
// use the imported page and place it at point 5,5 with your preferred width in mm
$pdf->useTemplate($tplId, 5, 5, 210);
$pdf->SetFont('Arial','B',16); // Font Name, Font Style (eg. 'B' for Bold), Font Size
$pdf->SetTextColor(0,0,0); // RGB
$pdf->SetXY(16, 15); // X start, Y start in mm
$text = "Hello World!";
$pdf->Write(0, $text);
$pdf->Output($_SERVER['DOCUMENT_ROOT']."/plugins/fpdf/CSKP31.pdf",'F');
ob_end_flush(); 
?>