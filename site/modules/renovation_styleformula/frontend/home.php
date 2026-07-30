<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$listdata = $fwRequest->getParam($TABLE, array());
$keyword = $listdata['keyword'];
$mid = $listdata['sftype_id'];
$where = "WHERE 1=1 ";
if($keyword):

	$where .= "AND renovation_style_formula.sf_title LIKE '%".$keyword."%'  OR
	           renovation_style_formula.sf_component LIKE '%".$keyword."%'";
	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword']=$_SESSION['keyword'];
elseif($_SESSION['keyword'] && $pagenum > 0):
	$where .= " AND ".$TABLE.".sf_title LIKE '%".$_SESSION['keyword']."'";
	$fwViewData['keyword']=$_SESSION['keyword'];
else:
	unset($_SESSION['mid']);
endif;

if($mid > 0):
	$where .= "AND ".$TABLE.".sftype_id = ".$mid;
	$_SESSION['mid'] = $mid;
	$fwViewData['mid']=$_SESSION['mid'];
elseif($_SESSION['mid'] && $pagenum > 0):
	$where .= "AND ".$TABLE.".sftype_id = ".$_SESSION['mid'];
	$fwViewData['mid']=$_SESSION['mid'];
else:
	unset($_SESSION['mid']);
endif;


if(empty($pagenum))
	{
	unset($_SESSION['last_sql']);
	}

if($_SESSION['last_sql'])
{
	$matsql = $_SESSION['last_sql'];
}
else {
$matsql = "SELECT ".$TABLE.".*, style_formula_types.sft_title, renovation_style_formula.sf_timeatamp , users.user_name FROM ".$TABLE." 
LEFT JOIN style_formula_types ON style_formula_types.sft_id = ".$TABLE.".sftype_id 
LEFT JOIN users on users.user_id = renovation_style_formula.sf_user_id ".$where." ORDER BY ".$TABLE.".".$ID." ASC";	 
} 


if($matsql){$userData = $fwDb->query($matsql);}

if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
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

$_SESSION['last_sql'] = $matsql;

$tablePages = new Fw_Db_Table("style_formula_types");
$tablePages->setWhere("sft_statues = 'Active'");
$tablePages->setOrderBy('sft_title ASC');
$fwViewData['formulatypes']=$tablePages->getRows();
$fwViewData['title'] = $MODULE_PLURAL;