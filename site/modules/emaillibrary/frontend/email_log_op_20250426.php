<?php
$pagenum = $fwRequest->getparam('pagenum','');
$tableEmailLog = new Fw_Db_Table('email_log');

$templateData = $fwRequest->getParam($TABLE,'');
$keyword = (!empty($templateData['keyword'])) ? $templateData['keyword'] : NULL;
$where = "WHERE elog_eml_code like 'OP%' ";
$TABLE1 = 'email_log';


if($keyword):
$where .= "AND ".$TABLE1.".elog_eml_code LIKE '%".$keyword."%' "  ;
$_SESSION['keyword'] = $keyword;
$fwViewData['keyword']=$_SESSION['keyword'];
elseif($_SESSION['keyword'] && $pagenum > 0):
$where .= "AND ".$TABLE1.".elog_eml_code LIKE '%".$_SESSION['keyword']."%' ";
$fwViewData['keyword']=$_SESSION['keyword'];
endif;

/*Search by Project Name*/
$project_name = $fwRequest->getParam('project_name', '');
if($project_name):
   $where .= " AND ".$TABLE1.".elog_business LIKE '%".$project_name."%'  " ;
   $_SESSION['project_name'] = $project_name;
   $fwViewData['project_name']=$_SESSION['project_name'];
elseif($_SESSION['project_name'] && $pagenum >= 0):
   $where .= " AND ".$TABLE1.".elog_business LIKE '%".$_SESSION['project_name']."%'   ";
   $fwViewData['project_name']=$_SESSION['project_name'];
endif;

/*Clear Search*/
$clear = $fwRequest->getParam('clear', '');
if($clear) {
	 unset($_SESSION['project_name']);
	 unset($_SESSION['keyword']);
	 $where = "WHERE elog_eml_code like 'OP%' ";
	 $ord = " order by elog_id desc ";
}

if(empty($pagenum))
	{
	unset($_SESSION['last_tdsql']);
	}
if(!empty($submit))
	{
		$detail = $fwRequest->getParam($TABLE, array());
		$fwViewData['detail'] = $detail;

	}elseif(empty($pagenum)){unset($_SESSION['keyword']);}	

	

	$ord = " order by elog_id desc ";

 $eid = $fwRequest->getParam('id','');
 if(!empty($eid)) { $ord = " Order By elog_id "; }

 $ecode = $fwRequest->getParam('ecode','');
 if(!empty($ecode)) {  $ord = " Order By elog_eml_code ";  }
 
 $datesent = $fwRequest->getParam('datesent','');
 if(!empty($datesent)) {  $ord = " Order By elog_date ";  }
 
 $from = $fwRequest->getParam('from','');
 if(!empty($from)) {  $ord = " Order By elog_from ";  }
 
 $to = $fwRequest->getParam('to','');
 if(!empty($to)) {  $ord = " Order By elog_to ";  }
 
 $forbusiness = $fwRequest->getParam('forbusiness','');
 if(!empty($forbusiness)) {  $ord = " Order By elog_business ";  }
 
 $pdocs = $fwRequest->getParam('pdocs','');
 if(!empty($pdocs)) {  $ord = " Order By elog_doc_attached ";  }
 
 $tdocs = $fwRequest->getParam('tdocs','');
 if(!empty($tdocs)) {  $ord = " Order By elog_temp_attached ";  }
 

if($_SESSION['last_tdsql'])
	{ 
		$tdsql = $_SESSION['last_tdsql'];
	}
	else
	{
		$tdsql = "SELECT SQL_CALC_FOUND_ROWS null as row_name,  email_log.* FROM email_log " .$where;
		 $tdsql .= $ord;
	}
  $records_data = $fwDb->query($tdsql); $total_records = 0;

if($tdsql){ 
     if (!(isset($pagenum)))
    {
        $pagenum = 1;
    }
    if ($pagenum <= 1)
    {
        $pagenum = 1;
    }
    
    $page_rows = 50; $rows=  $total_records = count($records_data);
    
    $max = 'limit ' .($pagenum - 1) * $page_rows .',' .$page_rows;
    
   $tdsql2 =  $tdsql." ".$max;

    
  if($tdsql2){ $setdata = $fwDb->query($tdsql2);}
  
   /* $total_rows = $fwDb->query('SELECT FOUND_ROWS() as rows');
	$total_rows = $total_rows[0]['rows'];
	//$rows = count($userData);
	$rows = $total_rows;   */
    
}

/*foreach($userData as $k1 => $v1)
{
	$userData['elog_subject'] = stripslashes($v1['elog_subject']);
	
}*/

	

if(!empty($setdata))
{

    
    $page_rows = 50;
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


//if($setdata)
//{
//foreach($setdata as $k => $v)
//		{
//	
//		$fwViewData['list'][] = $v;
//		}
//	}
//}

}
foreach($setdata as $k =>$v)
{
	$d1 = explode(",",$v['elog_doc_attached']);
	
	foreach($d1 as $k1=>$v1)
	{
$setdata[$k]['elog_doc_attached_new'] .= "<a href='/emaillibrary.download_content?file_name=".trim($v1)."&module_name=emaillibrary.email_log_op'>".$v1."</a><br>";	
	}
	
	$d2 = explode(",",$v['elog_temp_attached']);
	
	foreach($d2 as $k2=>$v2)
	{
$setdata[$k]['elog_temp_attached_new'] .= "<a href='https://deckquotes.com.au/files/template_documents_hub/".$v2. "'target='_blank'>".$v2."</a><br>";	
	}
	
$setdata[$k]['elog_image_new'] .= "<a href='".$BASE_URL ."files/email_attachment/".$v['elog_image']. "'target='_blank'>".$v['elog_image']."</a><br>";	
$setdata[$k]['elog_attach1_new'].="<a href='".$BASE_URL ."files/email_attachment/".$v['elog_attachment1']."'target='_blank'>".$v['elog_attachment1']."</a><br>";
$setdata[$k]['elog_attach2_new'].="<a href='".$BASE_URL ."files/email_attachment/".$v['elog_attachment2']."'target='_blank'>".$v['elog_attachment2']."</a><br>";
$setdata[$k]['elog_attach3_new'].="<a href='".$BASE_URL ."files/email_attachment/".$v['elog_attachment3']."'target='_blank'>".$v['elog_attachment3']."</a><br>";
}

$fwViewData['list'] = $setdata;


$_SESSION['last_tdsql'] = $tdsql;
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Email Library";