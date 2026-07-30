<?php

$print = $fwRequest->getParam('print', '');

if(!empty($print))
{
		//$qasql = "Select template_docs.*, template_hub_docs.dhd_type from template_docs
		//		  Inner Join template_hub_docs on template_docs.dh_id = template_hub_docs.dhd_dh_id";

		$qasql = "Select template_docs.* from template_docs";

if($qasql)
{	
	$data_wsexport= $fwDb->query($qasql);
}


if($print)
{
	$filename ="template_document_list_".date('m_d_Y').".pdf";
    $reportname = "Template Document List";
}

if($data_wsexport)
{
	$color = "#CCCCCC";

	foreach($data_wsexport as $k => $v) 
	{
		$doc_name='';
		$docid = $v['dh_id'];
		$tdsqldocs = "SELECT template_hub_docs.* FROM template_hub_docs WHERE template_hub_docs.dhd_dh_id = ".$docid;
		$doc_files = $fwDb->query($tdsqldocs);
		//db($doc_files);
				if($doc_files)
					{
						foreach($doc_files as $kf => $vf)
								{
								$t = explode('.',$vf['dhd_name']);	
									
								 $doc_name .= end($t) . ', ';
								 }
													 
					}

			if($v[dh_last_update] !== '0000-00-00 00:00:00')
			{
				$last_update_date = $v[dh_last_update];	
			}
			 else
			{
		    	$last_update_date = $v[dh_insert_date];	
			}

			$listdata[] = '<tr><td class="fildsvalue" width="10%">'.$v['dh_uid'].'</td>

				<td width="50%" class="fildsvalue">'.trim($v['dh_title']).'</td>
		
				<td width="20%" class="fildsvalue">'.$last_update_date.'</td>
		
				<td width="20%" class="fildsvalue">'.$doc_name.'</td>

			</tr>';

			if($color == "#CCCCCC"){$color = "#FFFFFF";}else{$color = "#CCCCCC";}	

			}

}

//exit;

$curdate = date("d/m/Y"); 		

require_once(BASE_DIR.'tcpdf/config/lang/eng.php');
require_once(BASE_DIR.'tcpdf/tcpdf.php');

// Extend the TCPDF class to create custom Header and Footer

class MYPDF extends TCPDF {


    // Page footer

    public function Footer() {

        // Position at 15 mm from bottom

        $this->SetY(-15);

        // Set font

        $this->SetFont('helvetica', 'I', 8);

        // Page number

		$this->Cell(0, 10, 'BES', 'T', 0, 'L');

		if ($this->getRTL()) {

			$this->SetX($this->original_rMargin);

			$this->Cell(0, 0, $pagenumtxt, 'T', 0, 'L');

		} else {

			$this->SetX($this->original_lMargin);

			$this->Cell(0, 0, $pagenumtxt, 'T', 0, 'R');

		}

        $this->Cell(0, 10, 'Page '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');

    }
}

// create new PDF document

$pdf = new MYPDF('L', PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false); 

// set document information

$pdf->SetCreator(PDF_CREATOR);

$pdf->SetAuthor(SET_AUTHOR);

$pdf->SetTitle('Template Document List prepared by '.SET_PDF_AUTHOR.' <br> Print Date<br>'.date("d/m/Y"));

$pdf->SetSubject('Template Document List prepared by '.SET_PDF_AUTHOR);

$pdf->SetKeywords('BES, PDF');

// set default header data

$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, "Template Document List prepared by ".SET_PDF_AUTHOR." ", " \nPrint Date: ".date("d/m/Y"));

// set header and footer fonts

$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));

$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// set default monospaced font

$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

//set margins

$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);

$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);

$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);



//set auto page breaks

$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);



//set image scale factor

$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);



//set some language-dependent strings

$pdf->setLanguageArray($l);


// set font

$pdf->SetFont('helvetica', '13', 1);

// add a page

$pdf->AddPage();

//set some language-dependent strings

$pdf->setLanguageArray($l);

// -------------------------------------------------------------------


$header = <<<EOF

<!-- EXAMPLE OF CSS STYLE -->

<style>

    table.first {

        color: #003300;

        font-family: helvetica;

        font-size: 60pt;

        border: 0px solid #fff;

        background-color: #FFF;

    }

    td {

        border: 0px solid #fff;

        background-color: #ffffee;

    }

	 th {

        border: 0px solid #fff;

        background-color: #ffffee;

    }

  

</style>

<table class="first" cellpadding="4" cellspacing="2" style="font-size:50px;">

	<tr><td width="10%"><strong>Uid</strong></td><td width="50%"><strong>Name</strong></td><td width="20%">
	<strong>Last Update Date</strong></td><td width="20%"><strong>Document Type</strong></td></tr>

</table>

EOF;

if($listdata)
{	

	foreach($listdata as $ke => $vl)
	{

			$listdata_tr[] = <<<EOF
	
			<!-- EXAMPLE OF CSS STYLE -->
	
			<style>
	
		 b {
	
			color: #333;
	
			font-family: helvetica;
	
			font-weight:bold;
	
			font-size: 60pt;
	
			padding:0;
	
		}

		span {
	
			color: #333;
	
			font-family: helvetica;
	
			font-weight:bold;
	
			font-size: 60pt;
	
			padding:0;
	
		}

    table.first {

        color: #003300;

        font-family: helvetica;

        font-size: 60pt;

        border: 0px solid #fff;

        background-color: #FFF;

    }

    td {

        border: 0px solid #fff;

        background-color: #ffffee;

    }

	 th {

        border: 0px solid #fff;

        background-color: #ffffee;

    }

   

</style>

<table class="first" cellpadding="4" cellspacing="2" style="font-size:50px;">

	$vl

</table>				

EOF;

		}

}



// output the HTML content

$pdf->writeHTML($header, true, false, true, false, '');

if($listdata_tr)
{

foreach($listdata_tr as $key => $vbody)
		{
		if($vbody)
			{
				$pdf->writeHTML($vbody, true, false, true, false, '');
			}
		}
	}
else
	{

	$errorbody = <<<EOF

<!-- EXAMPLE OF CSS STYLE -->

<style>


       table.first {
        color: #003300;
        font-family: helvetica;
        font-size: 60pt;
        border: 0px solid #fff;
        background-color: #FFF;
    }

    td {
        border: 0px solid #fff;
        background-color: #ffffee;
    }

	 th {
        border: 0px solid #fff;
        background-color: #ffffee;
    }

    td.second {
        border: 2px dashed green;
    }

    div.test {

        color: #CC0000;
        background-color: yellow;
        font-family: helvetica;
        font-size: 60pt;
        border: 0px solid #fff;
        text-align: center;
    }

</style>

<div class="test">No record found.!!!</div>

EOF;

	$pdf->writeHTML($errorbody, true, false, true, false, '');

	}

		$pdf->Output($filename, 'I');
   exit;
	}