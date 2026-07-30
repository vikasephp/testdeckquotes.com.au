<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$where = "WHERE 1=1 ";
$fwViewData['ran'] =  rand(100000,999999);
$table = new Fw_Db_Table('quality_assurance_report');


$hide = $fwRequest->getParam('hide', '');
if($hide)
{
	 foreach($hide as $k9=>$v9)
	 {
		  $id = $k9; 
	 }
	
	  $detail['qa_hide'] = $v9;

	  $table->setWhere("qa_id = ".$id);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }
}


$where = " WHERE quality_assurance_report.qa_hide = 0 ";
$unhide = $fwRequest->getParam('unhide', '');
if(!empty($unhide)) {
	$where = " WHERE 1 = 1 ";	
}


	
if($keyword):
$where .= "AND business.bsn_sub_status LIKE '%".$keyword."%'";
	
	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword'] && $pagenum > 0):

	$where .= "AND business.bsn_sub_status LIKE '%".$_SESSION['keyword']."%'";
	
	$fwViewData['keyword']=$_SESSION['keyword'];
endif;
   
if(empty($pagenum))
	{
	unset($_SESSION['last_tdsql']);
	}
		

$sql = "Select quality_assurance_report.* , business.bsn_id, business.bsn_address from quality_assurance_report
        Inner Join business on quality_assurance_report.qa_bsn_id = business.bsn_id ". $where;


if($sql){$userData = $fwDb->query($sql);}


$fwViewData['total'] = sizeof($userData);

if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

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
	$numstartvounter =  $page_rows * ($pagenum-1) + 1;
	$fwViewData['numstartvounter'] = $numstartvounter;
		
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
    
    $sql2 =  $sql." ".$max;

if($sql2)
{  

 $setdata = $fwDb->query($sql2);
 
foreach($setdata as $k => $v)
{
		
		$link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$v['bsn_id'];	
		
		$setdata2[$k]['qa_id'] = $v['qa_id'];
		$setdata2[$k]['bsn_id'] = $v['bsn_id'];
		$setdata2[$k]['bsn_address'] = $v['bsn_address'];
		//$setdata2[$k]['hia_sign_date'] = changedate_d_m_y($ccdate);
		$setdata2[$k]['link'] = $link;
		$setdata2[$k]['qa_cno'] = $v['qa_cno'];
		$setdata2[$k]['qa_user'] = $v['qa_user'];
		$setdata2[$k]['qa_hide'] = $v['qa_hide'];		
}
 
 	$fwViewData['list'] =  $setdata2;
		
 }
}

$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Project Plans Quality Assurance Checklist";

$word = $fwRequest->getParam('word', '');

if(!empty($word)) {
	
	  $bsn_id = $fwRequest->getParam('bsn_id', '');
	
	  $sqladdr = "Select bsn_address from business where bsn_id = ".$bsn_id;	
	  $addr = $fwDb->queryOne($sqladdr);
	
	  $sqlusr = "Select qa_user from quality_assurance_report where qa_cno   = ".$word;	
	  $user = $fwDb->queryOne($sqlusr);
	  
	  
	  $sqlele = "Select * from pro_plan_quality_assu_checklist
	             inner join elements on pro_plan_quality_assu_checklist.qac_el_id = elements.el_id
		     where pro_plan_quality_assu_checklist.qac_chk_no = ". $word;
	  $data = $fwDb->query($sqlele);
	
	
	  $html = "<html><body><h1>Project Plans Quality Assurance Checklist</h1><br>";
	  $html .= '<table border="1" width="100%" cellpadding="5" cellspacing="0" style="font-family:calibri">';
	  $html .= "<tr><td width='25%'>Project Address</td><td>".$addr['bsn_address']."</td></tr>";
 	  $html .= "<tr><td>Proposal Checklist</td><td>".$word."</td></tr>";
	  $html .= "<tr><td>User</td><td>".$user['qa_user'] ."</td></tr>";
	  $html .= '<tr><td>Report Date</td><td>'. date("d-m-Y").'</td></tr>';
	  $html .= "</table><br>";
	  $html .= '<table border="1" width="100%" cellpadding="8" cellspacing="0" style="font-family:calibri">';
	  $html .= "<tr><th width='35%'>Element</th>";
	  $html .= "<th width='10%'>Applicable</th>";
	  $html .= "<th width='35%'>Comments</th>";
	  $html .= "<th width='15%'>User and Date</th></tr>";
	 
	  foreach($data as $k2 => $v2)
	  {
	  if($v2['qac_yes_no'] == 1) { $yn = "Yes" ; } else { $yn = "No" ; }	  
	  	  
	  $html .= "<tr><td width='35%'><strong>".$v2['el_group'] ."</strong> - " .$v2['el_element']. "</td>";
	  $html .= "<td width='10%'>".$yn."</td>";
	  $html .= "<td width='35%'>".$v2['qac_comment']."</td>";
	  $html .= "<td width='15%'>".$v2['qac_user']."<br>".$v2['qac_when']."</td></tr>";  
	  }
	  
	  $html .= "</table>";
	  $html .= "</body></html>";
	  header("Content-type: application/vnd.ms-word.doc");
	  header("Content-Disposition: attachment;Filename=project_plan_qa_report.doc");    
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

