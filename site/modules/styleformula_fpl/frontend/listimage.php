<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$ID = 'ig_id';
$TABLE = 'galleries_fpl';
$keyword = $fwRequest->getParam('keyword', '');
$where = "WHERE 1=1 ";


if($keyword):
$where .= "AND ".$TABLE.".title LIKE '%".$keyword."%' OR ".$TABLE.".tags LIKE '%".$keyword."%' OR ".$TABLE.".uid = ".$keyword;

$_SESSION['keyword'] = $keyword;
$fwViewData['keyword']=$_SESSION['keyword'];
elseif($_SESSION['keyword'] && $pagenum > 0):
$where .= "AND ".$TABLE.".title LIKE '%".$_SESSION['keyword']."%' OR ".$TABLE.".tags LIKE '%".$_SESSION['keyword']."%' OR ".$TABLE.".uid = ".$keyword;
$fwViewData['keyword']=$_SESSION['keyword'];
else:
unset($_SESSION['mid']);
unset($_SESSION['keyword']);
endif;
$matsql = "SELECT galleries_fpl.* from galleries_fpl ". $where;	   

if($matsql){$userData = $fwDb->query($matsql);}



if(!empty($userData))
{
if (!(isset($pagenum))){ $pagenum = 1; } 
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
    if($sql2){$lists= $fwDb->query($sql2);

	foreach($lists as $list):
		//if($list['tags']):
//			$matsql = "SELECT sft_title FROM style_formula_types WHERE sft_id IN (".$list['tags'].") ";	
//			$list['tags'] = $fwDb->query($matsql);
//		endif;
		$listsnew[] = $list;
	endforeach;
	
	$fwViewData['list'] = $listsnew;
  }
}
$tablePages = new Fw_Db_Table("style_formula_types");
$tablePages->setWhere("sft_statues = 'Active'");
$tablePages->setOrderBy('sft_title ASC');
$fwViewData['formulatypes']=$tablePages->getRows();
$fwViewData['title'] = $MODULE_PLURAL;