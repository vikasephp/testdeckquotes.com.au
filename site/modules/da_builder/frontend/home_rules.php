<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('report_table');
$mr_id = $fwRequest->getParam('mr_id', '');
$fwViewData['mr_id'] = $mr_id;
  
$matsql = "SELECT * from report_rule where rr_mr_id  = ".$mr_id;	

if($matsql){$userData = $fwDb->query($matsql);}

$fwViewData['total'] = sizeof($userData);

if(!empty($userData))
{
if (!(isset($pagenum))){ $pagenum = 1; } 
    $rows = count($userData);
    $page_rows = 100;
    $last = ceil($rows/$page_rows);    
    if ($pagenum <= 1)
    {
        $pagenum = 1;
    }
    elseif ($pagenum > $last)
    {
        $pagenum = $last;
    }
    $fwViewData['last'] = $last;
    $fwViewData['lastone'] = $last-1;
	$fwViewData['lasttow'] = $last-2;
    $fwViewData['pagenum'] = $pagenum;
	$pagenatedatanext = $pagenum;
	$pagenatedataprev = $pagenum;
	for($i=0; $i<9; $i++)
		{
		$paginate[$pagenatedatanext] = $pagenatedatanext;
		$pagenatedatanext ++;
		}
		$fwViewData['paginatenext'] = $paginate;
	$pagenatedataprev = $pagenum;	
	for($i=0; $i<9; $i++)
		{
		$paginateprev[$pagenatedataprev] = $pagenatedataprev;
		$pagenatedataprev --;
		}
	$fwViewData['paginateprev'] = array_reverse($paginateprev);
	
    $max = 'limit ' .($pagenum - 1) * $page_rows .',' .$page_rows;
    
    $sql2 =  $matsql." ".$max;
    if($sql2){$lists= $fwDb->query($sql2);

	foreach($lists as $list):

		$listsnew[] = $list;
	endforeach;
	
	//$fwViewData['list'] = $listsnew;
  }
}

foreach($listsnew as $k1=>$v1)
{
	$sql4 = "select rb_report_name from report_build where rb_id = ".$v1['rt_report_type'];
	$data4 = $fwDb->queryOne($sql4);
	$listsnew[$k1]['report_type'] = $data4['rb_report_name'];
	
}

$fwViewData['list'] = $listsnew;
$fwViewData['title'] = $MODULE_PLURAL;

// Merge Print The Word Document

$word = $fwRequest->getParam('word', '');
$rt_id = $fwRequest->getParam('rt_id', '');

if(!empty($word)) {
	
	$sql = "select * from report_table_main where mr_report_id = ".$rt_id;
    $data = $fwDb->query($sql);
	
	  $html = "<html><body>";
	  $html .= '<table border="1" width="100%" cellpadding="5" cellspacing="0" style="font-family:calibri">';
	  $html .= "<tr><td width='50%'>Leasee Names:</td><td></td></tr>";
 	  $html .= "<tr><td>Address: </td><td></td></tr>";
	  $html .= "<tr><td>Block:</td><td></td></tr>";
	  $html .= '<tr><td>Section:</td><td></td></tr>';
	  $html .= '<tr><td>Crown Lease Qualified :</td><td></td></tr>';
	  $html .= '<tr><td>District Policy :</td><td></td></tr>';
	  $html .= '<tr><td>Zone Policy:</td><td></td></tr>';
	  $html .= '<tr><td>Lease Variation Policy:</td><td></td></tr>';
	  $html .= '<tr><td>Subdivision Policy:</td><td></td></tr>';
		 
	  $html .= "</table><br>";
	  
	  $html .= '<table border="1" width="100%" cellpadding="8" cellspacing="0" style="font-family:calibri">';
	  $html .= "<tr><th width='5%'>Order</th>";
	  $html .= "<th width='30%'>Speficication</th>";
	  $html .= "<th width='5%'>Status</th>";
	  $html .= "<th width='15%'>Criteria</th>";
	  $html .= "<th width='15%'>Statement</th></tr>";
	  
	  foreach($data as $k=>$v)
	  {
		
		  $html .= "<tr><td width='5%'>".$v['mr_order']."</td>";
		  $html .= "<td width='5%'>".$v['mr_specification']."</td>";
	      $html .= "<td width='5%'>".$v['mr_status']."</td>";
		  $html .= "<td width='5%'>".$v['mr_criteria']."</td>";
		  $html .= "<td width='5%'>".$v['mr_statement']."</td></tr>"; 
	  }
	  
	  $html .= "</table>";
	
 header("Content-type: application/vnd.ms-word.doc");
	  header("Content-Disposition: attachment;Filename=da_report.doc");    
	  echo "<html>";
	  echo "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=Windows-1252\">";
	  echo "<body>";
	  echo "<div style='font-family:calibri;'>";
	  echo $html;
	  echo "</div>";
	  echo "</body>";
	  echo "</html>";
	  exit;		
}

