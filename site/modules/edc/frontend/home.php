<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$mid = $fwRequest->getParam('employees', 0);

$edcdata = $fwRequest->getParam('edc', array());

$keyword = $edcdata['keyword'];
$where = "WHERE 1=1 ";

if($keyword) {
$_SESSION['keyword'] = $keyword;
$fwViewData['keyword']=$_SESSION['keyword'];
$where = "WHERE 1=1 AND edc_document like '%".$keyword."%'";
}
else { unset($_SESSION['keyword']); }

if($mid>0):

$where = "WHERE empl_doc_center.edc_user_id = ".$mid. " And edc_document like '%".$keyword."%'";
$_SESSION['mid'] = $mid;
$fwViewData['mid']=$_SESSION['mid'];
elseif($_SESSION['mid'] && $pagenum > 0):
$where = "empl_doc_center.edc_user_id = ".$_SESSION['mid'];
$fwViewData['mid']=$_SESSION['mid'];
else:
unset($_SESSION['mid']);
endif;
	
$matsql = "SELECT empl_doc_center.*, users.user_name FROM empl_doc_center
		   Inner JOIN users ON empl_doc_center.edc_user_id = users.user_id "
		  .$where. " Order by empl_doc_center.edc_id DESC";	   

if($matsql){$userData = $fwDb->query($matsql);}


if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
    $page_rows = 20;
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
if($sql2){$fwViewData['list']= $fwDb->query($sql2);}
}


$fwViewData['title'] = $MODULE_PLURAL;

//$tablePages = new Fw_Db_Table("materials");
//$tablePages->setWhere("mr_status = 'Active'");
//$tablePages->setOrderBy('mr_name ASC');
//$fwViewData['marerials']=$tablePages->getRows();

//$sql = "SELECT u.*,ug.group_id, g.group_name
//        FROM users u, groups g, users_groups ug
//        where u.user_id=ug.user_id AND ug.group_id=g.group_id AND g.group_id != 2 AND u.user_id != 1 ORDER By u.user_name ASC"; 
 
$sql = "Select * from users 
        Inner join users_groups on users.user_id = users_groups.user_id
		where users_groups.group_id != 2  order by users.user_name ASC";
		
$fwViewData['userData'] =  $fwDb->query($sql);
