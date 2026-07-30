<?php


$ar_id = $fwRequest->getParam('ar_id', '');

$matsql = "SELECT style_formula_fpl.*, style_formula_types.sft_title FROM style_formula_fpl 
LEFT JOIN style_formula_types ON style_formula_types.sft_id = style_formula_fpl.sftype_id ORDER BY style_formula_fpl.sf_title ASC";	 

$userData = $fwDb->query($matsql);

$fwViewData['components'] = $userData;

$fwViewData['title'] = "Style Text Report";

$submit = $fwRequest->getParam('test', '');

if(!empty($submit))
{
  $detail = $fwRequest->getParam('guide', array());
  
  $html = "<img src =".BASE_URL."images/header.jpg>";
  $i=1;
  foreach($detail as $k => $v)
  {
  if(!empty($v['sf_id'])) {
 	   
		$sql = "select style_formula_fpl.sf_title, style_formula_fpl.sf_body, style_formula_fpl.sf_cost_price, 
		        style_formula_fpl.sf_unit_type, galleries_fpl.file from style_formula_fpl 
		        left join galleries_fpl on style_formula_fpl.sf_link_uid = galleries_fpl.ig_id
  		        where style_formula_fpl.sf_id = " .$k;
		
			
		$data = $fwDb->queryOne($sql);
		
		if($i==1) 
		{
				$title = $data['sf_title'];
				$html .= '<p style="font-family:Calibri; font-size:16px;line-height:22px;"><strong>'. $data['sf_title']. '</strong></p>';
		}
		else
		{
			if($title != $data['sf_title'])
			{
			$html .= '<p style="font-family:Calibri; font-size:16px;line-height:22px;"><strong>'. $data['sf_title']. '</strong></p>';
			$title = $data['sf_title'];
			}
				
		}
		$markup = $data['sf_cost_price'] * $v['percentage'] / 100;
		$unitvalue = $markup + $data['sf_cost_price'];
		$totitemval =  $unitvalue * $v['unit_value'];
		
	
		//$html .= '<p style="font-family:Calibri !important; font-size:16px;line-height:22px;">'.$data['sf_body']."</p>"; 
		
		$html .= '<div style="font-family:Calibri; font-size:16px;line-height:22px;">'.$data['sf_body'].'</div>';
		
		if(!empty($data['file'])) {
			
			$source = "https://deckquote.s3.amazonaws.com/files/galleries/".$data['file'];
			$destination = BASE_DIR."files/galleries/".$data['file'];
			copy($source, $destination);
			
			$html .= "<img src =".BASE_URL."files/galleries/".$data['file']." width='180' height='150'>";
		}
		$html .= "<p style='font-family:calibri,sans-serif; font-size:16px;line-height:22px'>";
		$html .= "Unit Type  : ". $data['sf_unit_type']."<br>"; 
		$html .= "Unit : ".$v['unit_value']."<br>"; 
		$html .= "Cost Price : ".number_format($data['sf_cost_price'],2)."<br>"; 
		$html .= "Percent  % : ".$v['percentage']."% <br>"; 
		$html .= "Markup  : ". $markup. "<br>";
		$html .= "Unit Value  : ". $unitvalue. "<br>"; 
		$html .= "Total Item Value : ". number_format($totitemval,2). "<br>";
		$html .= "</p>"; 
		$html .= "<br style='page-break-before:always' />";
		$i++;
		}
  }
 

  header("Content-type: application/vnd.ms-word.doc");
  header("Content-Disposition: attachment;Filename=guide.doc");    
  echo "<html>";
 // echo "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=Windows-1252\">";
  echo '<body style="font-family: Calibri !important; font-size:16px !important;">';
  echo $html;
  echo "</body>";
  echo "</html>";
  exit;
}

