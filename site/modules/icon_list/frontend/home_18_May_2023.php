<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$listdata = $fwRequest->getParam($TABLE, array());

//$keyword = $listdata['keyword'];
$where = "WHERE 1=1 ";
  
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

$fwViewData['title'] = $MODULE_PLURAL;




$submit = $fwRequest->getParam('print', '');
if(!empty($submit))
{
	$heading = "Icon List Report";
	$sssql = "SELECT * from icon_list ";	

        $ssData = $fwDb->query($sssql);
	
	
	$html = '<table cellpadding="5">';
	$html .= '<tr><th width="20%">Icon Name</th><th width="10%">Colour</th><th width="20%">Icon</th><th width="50%">Icon Text</th></tr>';
	$fname="";
		
	foreach($ssData as $m)
	{
		
		if($m['ic_icon_image']) {		
			$img = '<img src="https://www.deckquotes.com.au/files/asset_list/'.$m['ic_icon_image'].'" width="70">';
		}else {
			$img='';
		}
		$html .='<tr nobr="true">';
		$html .= '<td>'.$m['ic_icon_name'].'</td>';

		$html .= '<td>'.$m['ic_icon_color'].'</td>';
		$html .= '<td>'.$img.'</td>';
		$html .= '<td>'.$m['ic_icon_text'].'</td>';
		
		$html .='</tr>';	
		//db($img);	
	}
	$html .= '</table>';
	create_iconlist_PDF($heading,$html,$fname);
	
}
