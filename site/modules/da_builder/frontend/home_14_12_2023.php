<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('report_table');

  
$matsql = "SELECT * from report_table order by rt_id DESC";	

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
	
	$sqlpd = "select * from report_project_detail where pd_rt_id = ".$rt_id;
    $projdata = $fwDb->queryOne($sqlpd);
	
	
	  $html = "<html><body>";
	  $html .= '<table border="1" width="100%" cellpadding="5" cellspacing="0" style="font-family:calibri">';
	  $html .= "<tr><td width='50%'>Leasee Names:</td><td>".$projdata['pd_leases_name']."</td></tr>";
 	  $html .= "<tr><td>Address: </td><td>".$projdata['pd_address']."</td></tr>";
	  $html .= "<tr><td>Block:</td><td>".$projdata['pd_block']."</td></tr>";
	  $html .= "<tr><td>Section:</td><td>".$projdata['pd_section']."</td></tr>";
	  $html .= "<tr><td>Crown Lease Qualified :</td><td>".$projdata['pd_crown_lease_qual']."</td></tr>";
	  $html .= "<tr><td>District Policy :</td><td>".$projdata['pd_district_policy']."</td></tr>";
	  $html .= "<tr><td>Zone Policy:</td><td>".$projdata['pd_zone_policy']."</td></tr>";
	  $html .= "<tr><td>Lease Variation Policy:</td>".$projdata['pd_le_var_policy']."<td></td></tr>";
	  $html .= "<tr><td>Subdivision Policy:</td>".$projdata['pd_sub_div_policy']."<td></td></tr>";
		 
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

