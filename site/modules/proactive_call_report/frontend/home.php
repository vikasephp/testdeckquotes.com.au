<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$listdata = $fwRequest->getParam($TABLE, array());

$Table = new Fw_Db_Table('proactive_call_report');


$hide = $fwRequest->getParam('hide', '');
if($hide)
{
	 $keys_2 = array_keys($hide);
	 $ky_2 = $keys_2[0];
	 $val_2 = $hide[$ky_2];
	
	  $detail['pr_hide'] = $val_2;
	  $Table->setWhere("pr_id = ".$ky_2);
	  if($Table->rowExists())
	  {
		 $this_id = $Table->updateRow($detail);
	  }	  	
}



$where = " WHERE pr_hide = 0";
$submit = $fwRequest->getParam('showall', '');
if(!empty($submit)) {
	$where = " WHERE 1=1";
}

   
 
$matsql = "SELECT * from proactive_call_report ". $where ." order by pr_id desc ";

	
if($matsql){$userData = $fwDb->query($matsql);}


if(!empty($userData))
{
if (!(isset($pagenum))){ $pagenum = 1; } 
    $rows = count($userData);
    $page_rows = 300;
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

		$setdata2[] = $list;
	endforeach;
	
	$fwViewData['list'] = $listsnew;
  }
}


$fwViewData['list'] = $setdata2;
$fwViewData['title'] = $MODULE_PLURAL;
 		
$sqlpr = "Select * from pcr_call_result ";
$fwViewData['crdetail'] = $fwDb->query($sqlpr); 	

$sqlst = "Select * from pcr_status_admin  ";
$fwViewData['stdetail'] = $fwDb->query($sqlst); 

$sqloc = "Select * from proactive_outcome  ";
$fwViewData['ocdetail'] = $fwDb->query($sqloc); 
