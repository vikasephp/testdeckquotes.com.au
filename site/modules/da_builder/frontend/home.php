<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('report_table');
$keyword = $fwRequest->getParam('keyword', '');

$ord = " order by rt_id DESC";

$reset = $fwRequest->getParam('reset', '');

if(!empty($reset)) {
	unset($_SESSION['submit_1']);
	unset($_SESSION['submit_2']);	
}


$submit_1 = $fwRequest->getParam('sort_by_projects', '');
$submit_2 = $fwRequest->getParam('sort_by_designer', '');

if($submit_1 || $_SESSION['submit_1']) {
	$ord = " Order by  rt_project_address ";
	unset($_SESSION['submit_2']);
	$_SESSION['submit_1'] = true;
}
  
if($submit_2 || $_SESSION['submit_2']) {
	$ord = " Order by  rt_cust_designer  ASC";
	$_SESSION['submit_2'] = true;
	unset($_SESSION['submit_1']);
}  



$clear = $fwRequest->getParam('clear', '');

if(!empty($clear)) {
	unset($_SESSION['keyword']);
	unset($keyword);
	$fwViewData['keyword']='';	
}
	
if($keyword):
$where .= " where report_table.rt_project_address LIKE '%".$keyword."%'";
            	
	    $_SESSION['keyword'] = $keyword;
	    $fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword']):

$where .= " where report_table.rt_project_address LIKE '%".$_SESSION['keyword']."%' ";	
	
	    $fwViewData['keyword']=$_SESSION['keyword'];
endif;

  
$matsql = "SELECT * from report_table ". $where. ' '. $ord;	


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
	
	$sql = "select * from report_table_main where mr_report_id = ".$rt_id ." and  mr_exclude_print = 0 ";
    $data = $fwDb->query($sql);
	
	$sqlpd = "select * from report_project_detail where pd_rt_id = ".$rt_id;
    $projdata = $fwDb->queryOne($sqlpd);
	
	$sqlrt = "Select rt_project_address ,rt_report_type, rt_cust_designer from report_table where rt_id = ".$rt_id;
    $datart = $fwDb->queryOne($sqlrt);

  

   $sqlrb = "Select rb_report_name, rb_id from report_build where rb_id = ".$datart['rt_report_type'];
   $rbdata = $fwDb->queryOne($sqlrb);
	
    $html0 = "<p>Report Name :".$rbdata['rb_report_name']."</p>";
    $html0 .= "<p>Customer Designer :".$datart['rt_cust_designer']."</p>";

	
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
	  $html .= "<th width='25%'>Specification</th>";
	  $html .= "<th width='5%'>Status</th>";
	  $html .= "<th width='15%'>Criteria</th>";
	  $html .= "<th width='15%'>Statement</th>";
	  $html .= '<th width="5%" style="text-align:center;" >Compliance</th></tr>';
	  
	  foreach($data as $k=>$v)
	  {
		  if($v['mr_status'] == 'Not Compliant') { $icon = 'X'; }
		  elseif($v['mr_status'] == 'Compliant') { $icon = '&radic;'; }
		  elseif($v['mr_status'] == 'NA') { $icon =  'N/A'; } else { $icon = '!'; } 
		
		  $html .= "<tr><td width='5%'>".$v['mr_order']."</td>";
		  $html .= "<td width='5%'>".$v['mr_specification']."</td>";
	      $html .= "<td width='5%'>".$v['mr_status']."</td>";
		  $html .= "<td width='5%'>".$v['mr_criteria']."</td>";
		  $html .= "<td width='5%'>".$v['mr_statement']."</td>"; 
		  $html .= "<td width='5%' style='text-align:center;'>".$icon."</td></tr>"; 
	  }
	  
	  $html .= "</table>";
	
	 header("Content-type: application/vnd.ms-word.doc");
	 header("Content-Disposition: attachment;Filename=da_report.doc"); 
	


//	  echo "<html>";
//	  echo "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=Windows-1252\">";
//	  echo "<body>";
//	  echo "<div style='font-family:calibri;'>";
//	  echo $html;
//	  echo "</div>";
//	  echo "</body>";
//	  echo "</html>";
	  
	  $content = '<html xmlns:v="urn:schemas-microsoft-com:vml" '
        .'xmlns:o="urn:schemas-microsoft-com:office:office" '
        .'xmlns:w="urn:schemas-microsoft-com:office:word" '
        .'xmlns:m="http://schemas.microsoft.com/office/2004/12/omml"= '
        .'xmlns="http://www.w3.org/TR/REC-html40">'
        .'<head><meta http-equiv="Content-Type" content="text/html; charset=Windows-1252">'
        .'<title></title>'
        .'<!--[if gte mso 9]>'
        .'<xml>'
        .'<w:WordDocument>'
        .'<w:View>Print'
        .'<w:Zoom>100'
        .'<w:DoNotOptimizeForBrowser/>'
        .'</w:WordDocument>'
        .'</xml>'
        .'<![endif]-->'
        .'<style>
        @page WordSection1
       {
		size:792.0pt 612.0pt;

	mso-page-orientation:landscape;

	margin:72.0pt 72.0pt 72.0pt 72.0pt;

	mso-header-margin:35.4pt;

	mso-footer-margin:35.4pt;

	mso-paper-source:0;
		 }
	
	div.WordSection1

	{page:WordSection1;}
        h2 { font-family: Arial; font-size: 18px; text-align:center; }
        p.para {font-family: Arial; font-size: 13.5px; text-align: justify;}
        </style>'
        .'</head>'
        .'<body>'
		.$html0
        .'<h2>Welcome To eTutorialsPoint</h2><br/>'
        .'<div class=WordSection1>'
        .$html

     
        .'</div>' 
        .'</body>' 
        .'</html>'; 
	  
	echo $content;   
	  
	  
	  
	  exit;		
}

