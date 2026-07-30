<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$fwViewData['ran'] =  rand(100000,999999);

$where = "WHERE 1=1 ";
   
$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where." ORDER BY ".$TABLE.".dolr_enquiry_date DESC, ".$TABLE.".".$ID." DESC";	

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
    if($sql2){
		$lists = $fwDb->query($sql2);
		$listsnew = [];
		foreach($lists as $k => $v ):
		
			$sql_note_date = "SELECT doc_created_at FROM dual_occupancy_notes where doc_docqa_id = ".$v['docqa_id']." order by doc_id desc limit 1";
			$data_note_date = $fwDb->queryOne($sql_note_date);
			$v['note_date'] = $data_note_date['doc_created_at'];
			
			$listsnew[] = $v;
		endforeach;
		
		//echo "<pre>"; print_r($listsnew); exit();
		
		$fwViewData['list'] = $listsnew;
	  }
}

$fwViewData['title'] = $MODULE_PLURAL;
