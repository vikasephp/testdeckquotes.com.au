<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$listdata = $fwRequest->getParam($TABLE, array());

$qbTable = new Fw_Db_Table('quote_builder');
$qb_approval = $fwRequest->getParam('qb_approval', '');

if($qb_approval)
{	
	$keyi = array_keys($qb_approval);
	$kyi = $keyi[0];
	$appDetail['qb_approval'] = $qb_approval[$kyi];
	
	
	$qbTable->setWhere('qb_id ='.$kyi);
	$detail = $qbTable->updateRow($appDetail);
	
	
	if($qb_approval[$kyi] == 1) 
	{
		$sqlauto = "select qb_project, qb_component from quote_builder where qb_id = ".$kyi;
		$dataProj = $fwDb->queryOne($sqlauto);
	
		$sqlmake = "select * from quote_builder 
	                   where qb_project = '".$dataProj['qb_project'] . "' and qb_component = ".$dataProj['qb_component']. " 
			   and qb_id != ".$kyi;
	    
		$dataMake = $fwDb->query($sqlmake);
		
		foreach($dataMake as $km => $vm)
		{
			$qbTable->setWhere('qb_id ='.$vm['qb_id']);
			$rejDetail['qb_approval'] = 2;
			$detail9 = $qbTable->updateRow($rejDetail);	
		}
	}
	
	
	if($appDetail['qb_approval'] == 1)
	{
		$sql_1 = "select qb_supplier, qb_project,qb_component, qb_supplier_email from quote_builder where qb_id = ".$kyi;	
		$dataSup = $fwDb->queryOne($sql_1);
		
		$tos1 = $dataSup['qb_supplier_email'];
		$tos2 = trim($tos1,'|');
		$tos3 = explode("|",$tos2);
		
		$eml ='';
		foreach($tos3 as $tk=>$tv)
		{
			$eml .= "'".$tv."',";	
		}
		$eml = trim($eml,',');
		
		
		$sqlco = "select contacts.cs_first_name, contacts.cs_surname, contacts.cs_primary_email, companies.co_company_name
		        from contacts Inner Join companies on contacts.cs_company  =  companies.co_id 
			where contacts.cs_primary_email IN (".$eml.")";
		
		 $detail_to = $fwDb->query($sqlco); 
		 
		 $sqlcompo = "select qb_component from quote_builder_component where qb_id = ".$dataSup['qb_component'];
		 $component = $fwDb->queryOne($sqlcompo); 
		 
		 $subject =  "You Quote has been Approved";
		 
		 foreach($detail_to as $k => $v)
		 {
		 
		 $to_name = $dataSup['qb_supplier'];	 
		 $to = $v['cs_primary_email'];
		 $from_name = "Cgfb Inclusion Team";
		 $from = "info@cgfb.com.au";
		 
		 $message = '';
		 $message .= "Dear ".$dataSup['qb_supplier'].",<br><br>";
		 $message .= "Congratulations! Your quote for ".$dataSup['qb_project']." = " . $component['qb_component']."<br>";
		 $message .= "has been approved. Please proceed to <a href='http://www.constructionquotebuilder.com.au'>.:: ConstructionQuoteBuilder - constructionquotebuilder ::.</a> to review the newest quote status. ";	 
		 $message .= "<br><br>";
		 $message .= "Regards, <br>CGFB Inclusions Team "; 
		  
		send_email($to_name, $to, $from_name, $from, $subject, $message, $attachment='');
		 
		 }
		
		
	}
	
}


$hide = $fwRequest->getParam('hide', '');
if($hide)
{
	 $keys_2 = array_keys($hide);
	 $ky_2 = $keys_2[0];
	 $val_2 = $hide[$ky_2];
	
	  $detail['qb_hide'] = $val_2;
	  $qbTable->setWhere("qb_id = ".$ky_2);
	  if($qbTable->rowExists())
	  {
		 $this_id = $qbTable->updateRow($detail);
	  }	  	
}


$undo = $fwRequest->getParam('undo', '');
if(!empty($undo))
{
	$qb_id = $fwRequest->getParam('qb_id', '');
	$k2 = array_keys($qb_id);
	$key = $k2[0];
	$appDetail['qb_approval'] = '';
	$qbTable->setWhere('qb_id ='.$key);
	$detail = $qbTable->updateRow($appDetail);
		
}
$savedata = $fwRequest->getParam('savedata', '');
if($savedata) { 

if($_FILES['pr_letter']['name'])
		{
			$wa_id = $fwRequest->getParam('wa_id', '');
						
						$docfile_1 = $_FILES['pr_letter']['name'];
						$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
						$temp_name_1 = $_FILES['pr_letter']['tmp_name'];
						$detail['wa_com_close_letter'] = $docfile_1;
						upload($docfile_1, $temp_name_1);
							
							$table->setWhere('wa_id = '.$wa_id);
							if($table->rowExists())
							{
								
								$detail = $table->updateRow($detail);	
							}		
			}
}


//$where = " WHERE wa_status = 'Open' ";
$where = " WHERE qb_approval <> 2 And qb_hide = 0";
$submit = $fwRequest->getParam('showall', '');
if(!empty($submit)) {
	$where = "WHERE 1=1";
	$_SESSION['openclose'] = 0;
	//$_SESSION['where'] =  $where;	
}
$ord ='';

    
$search = $fwRequest->getParam('search', '');
if(!empty($search))
{
  $search_project = $fwRequest->getParam('project_name', '');

  if($search_project):
  	
       $where .= " AND qb_project  LIKE '%".$search_project."%'  ";
       $_SESSION['search_project'] = $search_project;
       $fwViewData['search_project']=$_SESSION['search_project'];

  elseif($_SESSION['search_project'] && $pagenum > 0):
		
       $where .= " AND qb_project LIKE  '%".$_SESSION['search_project']."%' ";
       $fwViewData['search_project']=$_SESSION['search_project'];
	
  endif;
  
    $_SESSION['where'] = $where; 
}
  //
  
 $search_s = $fwRequest->getParam('search_supplier', '');
if(!empty($search_s))
{
  $supplier_name = $fwRequest->getParam('supplier_name', '');
  
  if($supplier_name):
  	
       $where .= " AND qb_supplier  LIKE '%".$supplier_name."%'  ";
       $_SESSION['supplier_name'] = $supplier_name;
       $fwViewData['supplier_name']=$_SESSION['supplier_name'];

  elseif($_SESSION['supplier_name'] && $pagenum > 0):
		
       $where .= " AND qb_supplier LIKE  '%".$_SESSION['supplier_name']."%' ";
       $fwViewData['supplier_name']=$_SESSION['supplier_name'];
	
  endif;
  
    $_SESSION['where'] = $where; 
} 
 
  $search_rs = $fwRequest->getParam('search_rs', '');
  if(!empty($search_rs))
  {
	 $resstaf = $fwRequest->getParam('resstaf', '');
  }
  
   
$clear = $fwRequest->getParam('clear', '');
if($clear) {
	
	unset($_SESSION['search_project']);
	$fwViewData['search_project'] = '';
	$where = " WHERE qb_approval <> 2 ";
	unset($resstaf);
	unset($_SESSION['where']);
}
 
  
  if($pagenum > 1) {
	if(isset($_SESSION['ord'])) { $ord = $_SESSION['ord']; }
	if(isset($_SESSION['where'])) { $where = $_SESSION['where']; }
  }
 
 //if(isset($_SESSION['where'])) { $where = $_SESSION['where']; }
  
 
$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where .' ' .$ord;
	
if($matsql){$userData = $fwDb->query($matsql);}

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

		$setdata2[] = $list;
	endforeach;
	
	$fwViewData['list'] = $listsnew;
  }
}


foreach($setdata2 as $k => $v2)
{
	
  
 	 $sq12= "SELECT  bsn_starting_onsite_date from business 
	         where business.bsn_name = '".$v2['qb_project']."'";  
	
	 $data = $fwDb->queryOne($sq12);
	 

	 $sql3 = "Select qb_due_date_week, qb_due_date_sod from quote_builder_component where qb_id = ".$v2['qb_component'];
	 $data2 = $fwDb->queryOne($sql3);

	 $w = $data2['qb_due_date_week'];
	 $s = $data2['qb_due_date_sod'];
	  
	 $dy = $w * 7;
	 $tdate = $data['bsn_starting_onsite_date'];
	
	  
	 if(!empty($tdate)) {
		if($s == 1 ) {	
			 $tdate = date('d-m-Y', strtotime($tdate .' -'.$dy.' day'));
		} else {
			$tdate = date('d-m-Y', strtotime($tdate .' +'.$dy.' day'));
		}
	 } else {
		 
		 $tdate='';
	 }
	 
	 
	 $sqlco = "select co_id from companies where co_company_name = '".$v2['qb_supplier']."'";
	 $codata = $fwDb->queryOne($sqlco);
	 
	 
	 $sqlT = "Select * from quote_upload where qu_quote_builder_id = " .$v2['qb_id'];
	 $quoteData_1 = $fwDb->queryOne($sqlT);
	
	 $sqlQ = "Select * from quote_builder_qa where qq_quote_builder_id = " .$v2['qb_id'];
	 $quoteData_2 = $fwDb->query($sqlQ);
	 $totque = count($quoteData_2); 
	 
	 $sqlA = "Select * from quote_builder_qa where qq_quote_builder_id = " .$v2['qb_id'] ." and  length(qq_answer) > 0 ";
	 $quoteData_A = $fwDb->query($sqlA);
	 $totans = count($quoteData_A);
	 
	 if($totans == 0) {
		$colr = 'style="background:#F00"';	  
	 } elseif($totans == $totque) {
		$colr = 'style="background: #0C6"';	 
	 } elseif ($totans < $totque) {
		$colr = 'style="background: #FF0"'; 
	 }
	 $sqlrs = "Select qb_sup_position from quote_builder_component where qb_id = ".$v2['qb_component'];
	 $datars = $fwDb->queryOne($sqlrs);
	 
	 $sqlcm = "Select qb_component from quote_builder_component where qb_id = ".$v2['qb_component'];
	 $cmdetail = $fwDb->queryOne($sqlcm); 
	 
	 $setdata2[$k]['co_id'] = $codata['co_id'];
	 $setdata2[$k]['due_date'] = $tdate;
	 $setdata2[$k]['quote_detail'] = $quoteData_1['qu_message'];
	 $setdata2[$k]['qu_quote_builder_id'] = $quoteData_1['qu_quote_builder_id'];
	 $setdata2[$k]['attach_1'] = $quoteData_1['qu_attachment_1'];
	 $setdata2[$k]['attach_2'] = $quoteData_1['qu_attachment_2'];
	 $setdata2[$k]['attach_3'] = $quoteData_1['qu_attachment_3'];
	 $setdata2[$k]['attach_4'] = $quoteData_1['qu_attachment_4'];
	 $setdata2[$k]['attach_5'] = $quoteData_1['qu_attachment_5'];
	 if($totque > 0) {  $setdata2[$k]['que'] = $totque; } else { $setdata2[$k]['que'] = 0; }
	 $setdata2[$k]['qb_sup_position'] = $datars['qb_sup_position'];
	 $setdata2[$k]['colr'] = $colr;
	 $setdata2[$k]['qb_component'] = $cmdetail['qb_component'];
	  
}

if($resstaf) {
	foreach($setdata2 as $k2=>$v2)
	{
		if($v2['qb_sup_position'] <> $resstaf) {
			unset($setdata2[$k2]);
		}			
	}
}
$fwViewData['list'] = $setdata2;
$fwViewData['title'] = $MODULE_PLURAL;

 		
$sqlpr = "Select * from quote_builder_component";
$fwViewData['cdetail'] = $fwDb->query($sqlpr); 


$sqlti = "Select tm_id from type_master where tm_type = 'Quote Status'";
$type_id = $fwDb->queryOne($sqlti); 
 		
$sqlto = "Select to_id, to_option from type_options where to_type_id  = ". $type_id['tm_id'];
$fwViewData['qstatus'] = $fwDb->query($sqlto); 

$sqlrs = "Select distinct cs_position  from contacts order by cs_position";
$fwViewData['rsdetail'] = $fwDb->query($sqlrs); 

