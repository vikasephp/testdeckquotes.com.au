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
$possql = "SELECT p_id, p_name from positions order by p_name";	

$fwViewData['posData'] = $fwDb->query($possql);

$mergesubmit = $fwRequest->getParam('merge', '');
if(!empty($mergesubmit))
{
$position = $fwRequest->getParam('position', '');
$fwViewData['position'] = $position;


$mergesql = "SELECT * from job_agreement where  ja_position like '%".$position."%'";

$mergedata = $fwDb->query($mergesql);

$html = "<html><body style='font-family:calibri;'>";
$html .= "<h2 style='text-align:center;'>Job Agreement Builder</h2><br><br><br>";
$html .= "<strong>Position : ".$position."</strong><br><br>";

foreach($mergedata as $k => $v)
{
	
$s = trim(preg_replace('#^<p>|</p>$#i', '', trim($v['ja_text'])));	
$html .= "<strong>Type</strong>  : ".$v['ja_type']. "<br>";
$html .= "<strong>Title</strong> : ".$v['ja_title']. "<br>";
//$html .= "<strong>Text</strong>  : ".$v['ja_text'];
$html .= "<strong>Text</strong>  : ".$s;
$html .= "<hr><br>";	
}
$html .= "</body></html>";
 	  
	  header("Content-type: application/vnd.ms-word.doc");
	  header("Content-Disposition: attachment;Filename=TaskList.doc");    
	  echo "<html>";
	  echo "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=Windows-1252\">";
	  echo "<body>";
	  echo $html;
	  echo "</body>";
	  echo "</html>";
	  exit;		
}