<?php
		$htmlPDF = '<html>';
		$htmlPDF .= '<table border="1" cellpadding="5" >';
	    $htmlPDF .= '<tr><td border="1">First</td> <td> Second </td></tr>';
		$htmlPDF .= '<tr><td>Abc</td> <td> Second </td>';
		$ttmlPDF .= '</tr>';
		$ttmlPDF .= '</table>';
			
	 	$htmlPDF .= '</html>';
		
		
		//db($htmlPDF);
		
		
	  $tbl2 .= '<table border="1">';
	  $tbl2 .= '<tr><td style="border:1px solid black;">First</td> <td> Second </td></tr>';
	  $tbl2 .= '<tr><td>Abc</td> <td> PQR </td>';
	  $tbl2 .= '</tr>';
	  $tbl2 .= '</table>';
	  
	  //$tbl2 .= '<hr width="20" />';

      //$tbl2 .= '<div style="border:1px solid black !important;">Tana</div>';
		
	  $tbl='<table border="1" cellmargin="0" cellpadding="10" style=" border-collapse: collapse;margin:0px;border:1px solid black;">';

      $tbl.='<tr nobr="true">';
  
      $tbl.='<td>Text<br>Text<br>Text</td>';
      $tbl.='<td >Text<br>Text<br>Text</td>';
    
      $tbl.='</tr>';
  
      $tbl.='<tr nobr="true">';
  
      $tbl.='<td >Text<br>Text<br>Text</td>';
      $tbl.='<td>';
	  
	  $tbl .= $tbl2;
	 
	  //$tbl .= '<table  cellmargin="0" cellpadding="10" style="outline: 1px solid black;">';
//	  $tbl .= '<tr><td style="outline: 1px solid black;">First</td> <td style="outline: 1px solid black;"> Second </td></tr>';
//	  $tbl .= '<tr><td style="outline: 1px solid black;">Abc</td> <td style="outline: 1px solid black;"> Second </td>';
//	  $tbl .= '</tr>';
//	  $tbl .= '</table>';
      
	  //$tbl .= '<span style="border:1px solid black">Testing </span>';
	
	  
	  $tbl .='</td>';
    
    $tbl.='</tr>';

    $tbl.='</table>';
	
	db($tbl);

	

		
		
		$toname = "Bharat";
			
		$heading = "Supplier Warranty Issue";
		//$attach1 = create_supplier_issue_PDF($heading, $htmlPDF, $toname);
		$attach1 = create_supplier_issue_PDF($heading, $tbl, $toname);
		
		$fdata = [];
		if(!empty($attach1)) {
			
			$fdata[] = $attach1;	
		}
		if(!empty($fdata)) {			
				$attachmentsend = serialize($fdata);
		}
		
		$to = "manojsoniephp@gmail.com";
			
	    send_email($toname, $to, 'CGFB', 'info@cgfb.com.au', 'CGFB Warranty Issue Update', $htmlPDF, $attachmentsend);
	
				
	
exit;
