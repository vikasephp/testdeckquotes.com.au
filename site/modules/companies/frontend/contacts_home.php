<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('companies');


//$listdata = $fwRequest->getParam($TABLE, array());
//
//$keyword = $listdata['keyword'];
//$where = "WHERE 1=1 ";
//
//if($keyword) {
//$_SESSION['keyword'] = $keyword;
//$fwViewData['keyword']=$_SESSION['keyword'];
//}
//else { unset($_SESSION['keyword']); }

	
//if($keyword):
//$where .= "AND ".$TABLE.".cl_what LIKE '%".$keyword."%' OR ".$TABLE.".cl_company_name LIKE '%".$keyword."%' OR 
//               ".$TABLE.".cl_contact_name LIKE '%".$keyword."%' OR ".$TABLE.".cl_position LIKE '%".$keyword."%' OR
//			   ".$TABLE.".cl_address LIKE '%".$keyword."%' OR ".$TABLE.".cl_phone LIKE '%".$keyword."%' OR 
//			   ".$TABLE.".cl_mobile LIKE '%".$keyword."%' OR ".$TABLE.".cl_email LIKE '%".$keyword."%' OR
//			   ".$TABLE.".cl_website LIKE '%".$keyword."%' OR ".$TABLE.".cl_notes LIKE '%".$keyword."%' OR ".$TABLE.".cl_calendar_ref LIKE '%".$keyword."%' ";
//	
//	$_SESSION['keyword'] = $keyword;
//	$fwViewData['keyword']=$_SESSION['keyword'];
//
//elseif($_SESSION['keyword'] && $pagenum > 0):
//
//	$where .= "AND ".$TABLE.".cl_what LIKE '%".$_SESSION['keyword']."%' OR ".$TABLE.".cl_company_name LIKE '%".$_SESSION['keyword']."%'
//	            OR ".$TABLE.".cl_contact_name LIKE '%".$_SESSION['keyword']."%' OR ".$TABLE.".cl_phone LIKE '%".$_SESSION['keyword']."%' 
//			    OR ".$TABLE.".cl_address LIKE '%".$_SESSION['keyword']."%' OR ".$TABLE.".cl_position LIKE '%".$_SESSION['keyword']."%' 
//				OR ".$TABLE.".cl_mobile LIKE '%".$_SESSION['keyword']."%' OR ".$TABLE.".cl_email LIKE '%".$_SESSION['keyword']."%'
//				OR ".$TABLE.".cl_website LIKE '%".$_SESSION['keyword']."%' OR ".$TABLE.".cl_notes LIKE '%".$_SESSION['keyword']."%' OR ".$TABLE.".cl_calendar_ref LIKE '%".$_SESSION['keyword']."%'
//				";	
//	
//	$fwViewData['keyword']=$_SESSION['keyword'];
//endif;
   
//$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where." ORDER BY ".$TABLE.".".$ID." ASC";
$matsql = "SELECT contacts.* , companies.co_company_name, companies.co_categry, type_options.to_option, 
           companies.co_resp_status  from contacts 
           Inner join companies ON contacts.cs_company = companies.co_id
	   Left join type_options on contacts.cs_position = type_options.to_id
	   ";	

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
