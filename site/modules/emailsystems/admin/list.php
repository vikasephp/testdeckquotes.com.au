<?php
 $detail = $fwRequest->getparam($TABLE, array());
$pagenum = $fwRequest->getparamget('pagenum','');

if(empty($detail) && empty($pagenum ))
	{unset($_SESSION['last_query']);}
if($detail)
{
unset($_SESSION['last_query']);
$sec_id =$detail['et_section']; 

if($sec_id)
	{
$pagenum = $fwRequest->getparamget('pagenum','');
$sql = "SELECT ".$TABLE.".*, email_type.*, busness_status.st_name, busness_status_task.bst_task_name FROM ".$TABLE." 
LEFT JOIN email_type ON ".$TABLE.".et_section = email_type.emt_id 
LEFT JOIN busness_status ON ".$TABLE.".et_task_status = busness_status.st_id 
LEFT JOIN busness_status_task ON ".$TABLE.".et_task = busness_status_task.bst_id 
WHERE ".$TABLE.".et_section = $sec_id ORDER BY ".$TABLE.".et_section ASC";

$_SESSION['sec_id'] = $sec_id;
$fwViewData['sec_id'] = $_SESSION['sec_id'];
$_SESSION['last_query'] = $sql;

	}
}
if(empty($sql) && $_SESSION['last_query']){$sql =$_SESSION['last_query']; $fwViewData['sec_id'] = $_SESSION['sec_id'];}

if($sql){$userData = $fwDb->query($sql);}

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
    
    $sql2 =  $sql." ".$max;
if($sql2){$fwViewData['list']= $fwDb->query($sql2);}
}
$fwViewData['title'] = $MODULE_PLURAL;


$thisTable_types = new Fw_Db_Table('email_type');
$fwViewData['section'] = $thisTable_types->getAllRows();
