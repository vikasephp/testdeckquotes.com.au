<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$mid = $fwRequest->getParam('material_short', 0);
if($mid>0):
$where = "WHERE materials.mr_id = ".$mid;
$_SESSION['mid'] = $mid;
$fwViewData['mid']=$_SESSION['mid'];
elseif($_SESSION['mid'] && $pagenum > 0):
$where = "WHERE materials.mr_id = ".$_SESSION['mid'];
$fwViewData['mid']=$_SESSION['mid'];
else:
unset($_SESSION['mid']);
endif;
	
	$matsql = "SELECT ".$TABLE.".*, materials.mr_name, suppliers.*, brands.br_name, brands.br_logo FROM ".$TABLE." 
		   LEFT JOIN materials ON materials.mr_id = ".$TABLE.".mr_id 
		   LEFT JOIN suppliers ON suppliers.sp_id = ".$TABLE.".sp_id 
		   LEFT JOIN brands ON brands.br_id = ".$TABLE.".br_id ".$where." Order By materials.mr_name ASC";	   

if($matsql){$userData = $fwDb->query($matsql);}


if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
    $page_rows = 10;
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

$tablePages = new Fw_Db_Table("materials");
$tablePages->setWhere("mr_status = 'Active'");
$tablePages->setOrderBy('mr_name ASC');
$fwViewData['marerials']=$tablePages->getRows();