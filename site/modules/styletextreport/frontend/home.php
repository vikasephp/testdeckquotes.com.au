<?php

$ar_id = $fwRequest->getParam('ar_id', '');


$matsql = "SELECT style_formula.*, style_formula_types.sft_title, style_formula.sf_timeatamp FROM style_formula 
LEFT JOIN style_formula_types ON style_formula_types.sft_id = style_formula.sftype_id ORDER BY style_formula.sf_title ASC";	 
$userData = $fwDb->query($matsql);

$fwViewData['components'] = $userData;
//$tableReports = new Fw_Db_Table("style_formula");
//$tableReports->setOrderBy('sf_title ASC');
//$fwViewData['components']=$tableReports->getRows();
$fwViewData['title'] = "Style Text Report";




$submit = $fwRequest->getParam('test', '');

if(!empty($submit))
{
  $detail = $fwRequest->getParam('guide', array());
  $html = '';
  $i=1;
  foreach($detail as $k => $v)
  {
		$sql = "select sf_title, sf_body from style_formula where sf_id = " .$k;
		$data = $fwDb->queryOne($sql);
		
		if($i==1) 
		{
				$title = $data['sf_title'];
				$html .= '<p><strong>'. $data['sf_title']. '</strong></p>';
				$data2['sf_body'] = str_replace("’","'",$data['sf_body']);
		}
		else
		{
			if($title != $data['sf_title'])
			{
			$html .= '<p><strong>'. $data['sf_title']. '</strong></p>';
			$title = $data['sf_title'];
			}
			
			$data2['sf_body'] = str_replace("’","'",$data['sf_body']);	
		}
		$html .= $data2['sf_body']; 
		
		$i++;
  }
   
  header("Content-type: application/vnd.ms-word.doc");
  header("Content-Disposition: attachment;Filename=guide.doc");    
  echo "<html>";
  echo "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=Windows-1252\">";
  echo "<body style='font-family:font-family:Calibri !important; font-size:12px !important;'>";
  echo $html;
  echo "</body>";
  echo "</html>";
  exit;
}

