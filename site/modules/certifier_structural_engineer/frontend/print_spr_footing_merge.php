<?php
/**
 * Same merged PDF as site_progress_report.home Merge,
 * for this project (sp_bsn_id) and the Report Type posted as spr_report_type.
 */
$sp_bsn_id = (int)$fwRequest->getParam('sp_bsn_id', 0);
if ($sp_bsn_id <= 0) {
	return;
}

$query = "SELECT bsn_id, bsn_name, bsn_address FROM business WHERE bsn_id = $sp_bsn_id";
$result = $fwDb->queryOne($query);
if (empty($result['bsn_id'])) {
	echo "<script>alert('Project was not found.');</script>";
	return;
}
$bsn_name = $result['bsn_name'];

$allowed_report_types = array(
	'Pre-Footing Inspection',
	'Pre-Slab Inspection',
	'Pre-Floor Frame Inspection',
	'Pre - Pre Sheet Inspection',
	'Pre-Final Inspection',
);
$report_type = trim((string)$fwRequest->getParam('spr_report_type', ''));
if ($report_type === '' || !in_array($report_type, $allowed_report_types, true)) {
	echo "<script>alert('Report type was not recognised.'); history.back();</script>";
	exit;
}

$escaped_report_type = addslashes($report_type);
$taskRow = $fwDb->queryOne("SELECT tn_id, tn_name FROM site_progress_report_task WHERE tn_name = '$escaped_report_type' LIMIT 1");
if (empty($taskRow['tn_id'])) {
	echo "<script>alert('No Site Progress Report merge document found for this project.'); history.back();</script>";
	exit;
}

$tn_id = (int)$taskRow['tn_id'];
$tn_name = $taskRow['tn_name'];

$sql = "SELECT * FROM site_progress_report
	WHERE sp_bsn_id = $sp_bsn_id
	AND (sp_task_name = '$tn_id' OR FIND_IN_SET('$tn_id', sp_task_name))
	ORDER BY sp_id DESC";
$list = $fwDb->query($sql);
if (empty($list)) {
	echo "<script>alert('No Site Progress Report merge document found for this project.'); history.back();</script>";
	exit;
}

$spIDs = [];
foreach ($list as $row) {
	$spIDs[] = (int)$row['sp_id'];
}
$spIDs = array_filter($spIDs);
if (empty($spIDs)) {
	echo "<script>alert('No Site Progress Report merge document found for this project.'); history.back();</script>";
	exit;
}

$query = 'SELECT * FROM site_progress_report_attachments WHERE spra_sp_id IN (' . implode(',', $spIDs) . ')';
$result = $fwDb->query($query);
$site_progress_report_attachments = [];
if (!empty($result)) {
	foreach ($result as $row) {
		if (!isset($site_progress_report_attachments[$row['spra_sp_id']])) {
			$site_progress_report_attachments[$row['spra_sp_id']] = [];
		}
		$site_progress_report_attachments[$row['spra_sp_id']][] = $row;
	}
}
if (empty($site_progress_report_attachments)) {
	echo "<script>alert('No Site Progress Report merge document found for this project.'); history.back();</script>";
	exit;
}

$html = '';
$listKeys = array_keys($list);
$last_key = end($listKeys);

set_time_limit(0);
require_once(LIB_DIR . 'CloudEphpClass.php');
foreach ($list as $index1 => $row) {
	if (empty($site_progress_report_attachments[$row['sp_id']])) {
		continue;
	}
	$attKeys = array_keys($site_progress_report_attachments[$row['sp_id']]);
	$second_last_key = end($attKeys);
	foreach ($site_progress_report_attachments[$row['sp_id']] as $index2 => $record) {
		$html .= '
			<p style="text-align: center;">Project Address: ' . $bsn_name . '</p>
			<p style="text-align: center;">Task Name: ' . $tn_name . '</p>
		';
		$obj = new CloudEphpClass('site_progress_report.home');
		$url = $obj->download($record['spra_attachment'], false);

		$html .= '<table border="1" width="98%" cellpadding="7">
			<tr style="background-color:#FF0; text-align:center">
				<th>Attachment</th>
			</tr>
			<tr>
				<td><img src="' . str_replace(' ', '%20', $url) . '" style="height: 300px;"></td>
			</tr>
			<tr style="background-color:#FF0; text-align:center">
				<th>Comment</th>
			</tr>
			<tr>
				<td>' . $record['spra_comment'] . '</td>
			</tr>
		</table>';

		if ($index1 <> $last_key || $index2 <> $second_last_key) {
			$html .= '<br pagebreak="true" />';
		}
	}
}

if (trim($html) === '') {
	echo "<script>alert('No Site Progress Report merge document found for this project.'); history.back();</script>";
	exit;
}

$heading = 'Site Progress Report';
$fileName = 'site_progress_report_attachments';

if (!function_exists('generatePDF')) {
	function generatePDF($heading, $html, $nameoffile)
	{
		require_once(BASE_DIR . 'tcpdf/config/lang/eng.php');
		require_once(BASE_DIR . 'tcpdf/tcpdf.php');
		$PDF_PAGE_ORIENTATION = "L";

		if (!class_exists('MYPDF')) {
			class MYPDF extends TCPDF
			{
				public function Footer()
				{
					$this->SetY(-15);
					$this->SetFont('helvetica', 'I', 8);
					$this->Cell(0, 10, 'CGFB', 'T', 0, 'L');
					if ($this->getRTL()) {
						$this->SetX($this->original_rMargin);
						$this->Cell(0, 0, $pagenumtxt, 'T', 0, 'L');
					} else {
						$this->SetX($this->original_lMargin);
						$this->Cell(0, 0, $pagenumtxt, 'T', 0, 'R');
					}
					$this->Cell(0, 10, 'Page ' . $this->getAliasNumPage() . '/' . $this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
				}
			}
		}

		$filename = $nameoffile . "_" . "_" . date('d_m_Y') . ".pdf";
		$headtext = $heading . " - " . date("d/m/Y");
		$pdf = new MYPDF($PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, false, 'UTF-8', false);
		$pdf->SetCreator(PDF_CREATOR);
		$pdf->SetAuthor('Canberra Granny Flat Builders');
		$pdf->SetTitle("CGFB");
		$pdf->SetSubject($heading);
		$pdf->SetKeywords('GCON, PDF');
		$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, $headtext, "Canberra Granny Flat Builders");
		$pdf->setHeaderFont(array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
		$pdf->setFooterFont(array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));
		$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);
		$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
		$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
		$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);
		$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);
		$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);
		$pdf->setLanguageArray($l);
		$pdf->SetFont('helvetica', '23', 10);
		$pdf->AddPage();
		$pdf->setLanguageArray($l);
		$pdf->setJPEGQuality(105);

		$vbody = <<<EOF
<!-- EXAMPLE OF CSS STYLE -->
<style>
	table.first {
        color: #003300;
        font-family: helvetica;
        font-size: 8pt;
        border: 1px solid #CCC;
        background-color: #FFF;
    }
    td {
        border: 1px solid #CCC;
        background-color: #fff;
    }
	th {
        border: 1px solid #CCC;
        background-color: #FF0;
		text-slign: center;
    }
    td.second {
        border: 2px dashed green;
    }   
</style>
$html		
EOF;

		$pdf->writeHTML($vbody, true, false, true, false, '');
		$filepath = 'reports/' . $filename;
		$filepath_save = BASE_DIR . $filepath;
		$filepath_url = BASE_URL . $filepath;
		ob_end_clean();
		$pdf->Output($filepath_save, 'F');
		echo "<script>window.open('$filepath_url', '_blank','toolbar=yes, width=800, height=550'); window.focus();</script>";
		return $filepath_url;
	}
}

generatePDF($heading, $html, $fileName);
echo "<script>history.back();</script>";
exit;
