<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$listdata = $fwRequest->getParam($TABLE, array());
$keyword = $listdata['keyword'];
$where = "WHERE 1=1 ";

if($keyword):
$where .= "AND ".$TABLE.".de_style LIKE '%".$keyword."%'";
$_SESSION['keyword'] = $keyword;
$fwViewData['keyword']=$_SESSION['keyword'];
elseif($_SESSION['keyword'] && $pagenum > 0):
$where .= "AND ".$TABLE.".de_style LIKE '%".$_SESSION['keyword']."'";
$fwViewData['keyword']=$_SESSION['keyword'];
endif;

//$matsql = "SELECT ".$TABLE.".*, users.user_name FROM ".$TABLE." 
//LEFT JOIN users ON users.user_id = ".$TABLE.".userid ".$where." ORDER BY ".$TABLE.".".$ID." ASC";	   

$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where." ORDER BY ".$TABLE.".".$ID." ASC";	

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
if($sql2){ //$fwViewData['list']= $fwDb->query($sql2);

$data = $fwDb->query($sql2);

		foreach($data as $kf => $vf)
				{
			if($vf['type']){$vf['iconpath'] = get_icon_path($vf['type'], $vf['filename'], 'drawing_designs/thumb');}
			$filedata[] = $vf;
				}
$fwViewData['list']	= $filedata;	
}
}
 $fwViewData['title'] = $MODULE_PLURAL;