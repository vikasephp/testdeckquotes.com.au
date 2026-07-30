<?php
$pagenum = $fwRequest->getparamget('pagenum',0);

$submit = $fwRequest->getParam('print', '');
if(!empty($submit))
{
	$heading = "Questions ans Answer";

	$qasql = "SELECT ".$TABLE.".* FROM ".$TABLE ;	

    if($qasql){$qaData = $fwDb->query($qasql);}
	
	$html = '';	
	foreach($qaData as $m)
	{
	$html .=  "<b>" .$m['qa_question'] ."</b>";
	$html .= $m['qa_answer'] ."<br>";
	}
	create_open_PDF($heading,$html,$fname);
}

$listdata = $fwRequest->getParam($TABLE, array());

$keyword = $listdata['keyword'];
$where = "WHERE 1=1 ";

if($keyword) {
$_SESSION['keyword'] = $keyword;
$fwViewData['keyword']=$_SESSION['keyword'];
}
else { unset($_SESSION['keyword']); }

	
if($keyword):
$where .= "AND ".$TABLE.".cqa_question LIKE '%".$keyword."%' OR ".$TABLE.".cqa_answer LIKE '%".$keyword."%' OR 
           ".$TABLE.".cqa_customer_name LIKE '%".$keyword."%' OR ".$TABLE.".cqa_project_name LIKE '%".$keyword."%'";
	
	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword'] && $pagenum > 0):

	$where .= "AND ".$TABLE.".cqa_question LIKE '%".$_SESSION['keyword']."%' OR ".$TABLE.".cqa_answer LIKE '%".$_SESSION['keyword']."%'
	OR ".$TABLE.".cqa_customer_name LIKE '%".$_SESSION['keyword']."%' OR ".$TABLE.".cqa_project_name LIKE '%".$_SESSION['keyword']."%' ";
	
	$fwViewData['keyword']=$_SESSION['keyword'];
endif;
   
$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where." ORDER BY ".$TABLE.".".$ID." ASC";	

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
$tablePages = new Fw_Db_Table("style_formula_types");
$tablePages->setWhere("sft_statues = 'Active'");
$tablePages->setOrderBy('sft_title ASC');
$fwViewData['formulatypes']=$tablePages->getRows();
$fwViewData['title'] = $MODULE_PLURAL;

