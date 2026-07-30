<?php

$ar_id = $fwRequest->getParam('ar_id', '');

$matsql = "SELECT renovation_style_formula.*, style_formula_types.sft_title, renovation_style_formula.sf_timeatamp FROM renovation_style_formula 
LEFT JOIN style_formula_types ON style_formula_types.sft_id = renovation_style_formula.sftype_id ORDER BY renovation_style_formula.sf_title ASC";	 

$userData = $fwDb->query($matsql);

$fwViewData['components'] = $userData;

$fwViewData['title'] = "Style Text Report";

$submit = $fwRequest->getParam('test', '');

if(!empty($submit))
{
  $detail = $fwRequest->getParam('guide', array());
  
 
  $html = '';
  $i=1;
  foreach($detail as $k => $v)
  {
		$sql = "select sf_title, sf_body from renovation_style_formula where sf_id = " .$k;
		$data = $fwDb->queryOne($sql);
		
		if($i==1) 
		{
				$title = $data['sf_title'];
				$html .= '<p style="font-family:calibri;"><strong>'. $data['sf_title']. '</strong></p>';
		}
		else
		{
			if($title != $data['sf_title'])
			{
			$html .= '<p style="font-family:calibri;"><strong>'. $data['sf_title']. '</strong></p>';
			$title = $data['sf_title'];
			}
				
		}
		$html .= '<span style="font-family:calibri;">' .$data['sf_body'] .'</span>'; 
		
		$i++;
  }
   
  header("Content-type: application/vnd.ms-word.doc");
  header("Content-Disposition: attachment;Filename=renovation_guide.doc");    
  echo "<html>";
  echo "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=Windows-1252\">";
  echo "<body style='font-family:font-family:Calibri !important; font-size:12px !important;'>";
  echo $html;
  echo "</body>";
  echo "</html>";
  exit;
}

