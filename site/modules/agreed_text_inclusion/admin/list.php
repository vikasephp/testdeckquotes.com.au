<?php
$pagenum = $fwRequest->getparam('pagenum','');
$tablePages = new Fw_Db_Table($TABLE);

$templateData = $fwRequest->getParam($TABLE,'');
$keyword = $templateData['keyword'];
$where = "WHERE 1=1 ";

$order = "  ";

//if($keyword):
//$where .= "AND ".$TABLE.".eml_link_uid LIKE '%".$keyword."%' "  ;
//$_SESSION['keyword'] = $keyword;
//$fwViewData['keyword']=$_SESSION['keyword'];
//elseif($_SESSION['keyword'] && $pagenum > 0):
//$where .= "AND ".$TABLE.".eml_link_uid LIKE '%".$_SESSION['keyword']."%' ";
//$fwViewData['keyword']=$_SESSION['keyword'];
//endif;

	
$logged_username = $_SESSION['user']['user_username'];

if(empty($pagenum))
	{
	unset($_SESSION['last_tdsql']);
	}
if(!empty($submit))
	{
		$detail = $fwRequest->getParam($TABLE, array());
		$fwViewData['detail'] = $detail;

	}elseif(empty($pagenum)){unset($_SESSION['keyword']);}	

	if($_SESSION['last_tdsql']){$tdsql = $_SESSION['last_tdsql'];}
	else{$tdsql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where . $order;}


if($tdsql){ $userData = $fwDb->query($tdsql);}	

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
$fwViewData['title'] = "Agreed Text Inclusion";