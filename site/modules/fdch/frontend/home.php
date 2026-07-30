<?php
$pagenum = $fwRequest->getparamget('pagenum',0);

$listdata = $fwRequest->getParam($TABLE, array());

$keyword = $listdata['keyword'];
$where = " where bd_doc_name  <> '' ";

if($keyword) {
$_SESSION['keyword'] = $keyword;
$fwViewData['keyword']=$_SESSION['keyword'];
}
else { unset($_SESSION['keyword']); }

	
if($keyword):
	$where .= " AND business.bsn_name LIKE '%".$keyword."%' OR  business_documents_finance.bd_type LIKE '%".$keyword."%' ";
	
	//$where .= " AND business.bsn_name LIKE '%".$keyword."%' OR admin_document_check_list_financial.admin_doc_name LIKE '%".$keyword."%' OR 
	//           ".$TABLE.".cqa_customer_name LIKE '%".$keyword."%' OR ".$TABLE.".cqa_project_name LIKE '%".$keyword."%'";		   
			   
		
		$_SESSION['keyword'] = $keyword;
		$fwViewData['keyword']=$_SESSION['keyword'];
	
elseif($_SESSION['keyword'] && $pagenum > 0):
	
		$where .= " AND business.bsn_name LIKE '%".$keyword."%' ";
		
		$fwViewData['keyword']=$_SESSION['keyword'];
endif;
   
$matsql = "SELECT ".$TABLE.".*, business.bsn_name, users.user_name  FROM ".$TABLE."
          Inner Join business On ".$TABLE.".bd_bsi_id = business.bsn_id 
		  Inner Join users On ".$TABLE.".bd_user_id  = users.user_id
          ".$where;	

$ord =    " ORDER BY ".$TABLE.".".'bd_uploaded_date '." DESC";


$ascdsc = $fwRequest->getParam('sortorder','');

if($ascdsc == 1) { $ad = "ASC"; } else {  $ad = "DESC"; }

$upd = $fwRequest->getParam('upd','');
    if(!empty($upd)) { $ord = " Order By bd_uploaded_date ". $ad; }
	
$cla = $fwRequest->getParam('cla','');
    if(!empty($cla)) { $ord = " Order By bd_cover_letter_date ". $ad; }
	
$etc = $fwRequest->getParam('etc','');
    if(!empty($etc)) { $ord = " Order By bd_emailed_client_date ". $ad; }	

$ptc = $fwRequest->getParam('ptc','');
    if(!empty($ptc)) { $ord = " Order By bd_posted_client_date ". $ad; }

$matsql .= $ord;

//db($matsql); exit;

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

		$listsnew[] = $list;
	endforeach;
	
	$fwViewData['list'] = $listsnew;
  }
}

$fwViewData['title'] = $MODULE_PLURAL;

