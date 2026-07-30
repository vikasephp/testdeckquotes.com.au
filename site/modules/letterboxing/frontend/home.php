<?php

$table = new Fw_Db_Table('letterboxing');
$pagenum = $fwRequest->getparamget('pagenum',0);

$upload_map = $fwRequest->getParam('upload_map', '');
if($upload_map) 
{ 
		if($_FILES['map']['name'])
		{

			$docfile_11 = $_FILES['map']['name'];
			$docfile_11 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_11);
			$temp_name_11 = $_FILES['map']['tmp_name'];
			$lbData['lb_map'] = $docfile_11;
			
			upload($docfile_11, $temp_name_11);
			
			$lb_id = $fwRequest->getParam('lb_id', '');
				
				$table->setWhere('lb_id = '.$lb_id);
				if($table->rowExists())
				{
				
					$detail = $table->updateRow($lbData);	
				}		
		}	
}


$approve = $fwRequest->getParam('approve', '');
if($approve)
{
	 $appr = $fwRequest->getParam('approve', '');
	 $keys_2 = array_keys($appr);
	 $ky_2 = $keys_2[0];
	 $val_2 = $appr[$ky_2];
	
	  $detail['lb_approved'] = $val_2;
	  $detail['lb_approved_user'] = $_SESSION['user']['user_name'];
	  $table->setWhere("lb_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}

$ord =  " ORDER BY if( lb_date = ' '
        OR lb_date IS  NULL , 0, 1 ) , STR_TO_DATE( lb_date, '%d-%m-%Y' ) DESC ";

	   
$matsql = "Select letterboxing.* from letterboxing ". $ord;

if($matsql){$userData = $fwDb->query($matsql);}

if(!empty($userData))
{
if (!(isset($pagenum))){ $pagenum = 1; } 
    $rows = count($userData);
    $page_rows = 400;
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
  }
}

$fwViewData['list'] = $listsnew;
$fwViewData['title'] = "Letter Boxing";
