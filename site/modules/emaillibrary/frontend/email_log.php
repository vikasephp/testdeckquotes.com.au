<?php
$pagenum = $fwRequest->getparam('pagenum','');
$tableEmailLog = new Fw_Db_Table('email_log');

$templateData = $fwRequest->getParam($TABLE,'');
$keyword = $templateData['keyword'];
$where = "WHERE elog_eml_code like '%MS%' ";
$TABLE1 = 'email_log';



if($keyword):
$where .= "AND ".$TABLE1.".elog_eml_code LIKE '%".$keyword."%' "  ;
$_SESSION['keyword'] = $keyword;
$fwViewData['keyword']=$_SESSION['keyword'];
elseif($_SESSION['keyword'] && $pagenum > 0):
$where .= "AND ".$TABLE1.".elog_eml_code LIKE '%".$_SESSION['keyword']."%' ";
$fwViewData['keyword']=$_SESSION['keyword'];
endif;


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
		$tdsql = "SELECT email_log.* FROM email_log " .$where;
		 $tdsql .= $ord;
	}


if($tdsql){ $userData = $fwDb->query($tdsql);}

foreach($userData as $k1 => $v1)
{
	$userData['elog_subject'] = stripslashes($v1['elog_subject']);
	
}

	

if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
    $page_rows = 30;
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
    
    $tdsql2 =  $tdsql." ".$max;


if($tdsql2){ $setdata = $fwDb->query($tdsql2);}

if($setdata)
{
foreach($setdata as $k => $v)
		{
	
		$fwViewData['list'][] = $v;
		}
	}
}
$_SESSION['last_tdsql'] = $tdsql;
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Email Library";