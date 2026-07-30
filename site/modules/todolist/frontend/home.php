<?php
$pagenum = $fwRequest->getparam('pagenum','');
$tablePages = new Fw_Db_Table($TABLE);
$export = $fwRequest->getParam('export', 0);
$user_id = $_SESSION['user']['user_id'];
//$order = "ORDER BY CONVERT (".$TABLE.".btdl_title USING latin2) ASC";
$order = "ORDER BY btdl_urgency ASC";
$logged_username = $_SESSION['user']['user_username'];

if(empty($pagenum))
	{
	unset($_SESSION['last_sql']);
	}
if(!empty($submit))
	{
		$detail = $fwRequest->getParam($TABLE, array());
		$fwViewData['detail'] = $detail;
		$fwViewData['ord_id'] = $detail['orderBy'];	
	}	
if($fwViewData['USER_GROUP'] != 'Administrators'){ $extquery = " AND ".$TABLE.".btdl_responcible_id =".$user_id; }
	if($sql = $_SESSION['last_sql']){$sql = $_SESSION['last_sql'];}
	else{$sql = "SELECT ".$TABLE.".*, creusers.user_name as creator,  resusers.user_name as responsible  FROM ".$TABLE." 
	LEFT JOIN users as creusers ON creusers.user_id = ".$TABLE.".btdl_creator_id 
	LEFT JOIN users as resusers ON resusers.user_id = ".$TABLE.".btdl_responcible_id 
	WHERE ".$TABLE.".btdl_status = 0 ". $extquery." ".$order;}

if($sql){ $userData = $fwDb->query($sql);}	

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
	$numstartvounter =  $page_rows * ($pagenum-1) + 1;
	$fwViewData['numstartvounter'] = $numstartvounter;
		
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

if($sql2){ $setdata = $fwDb->query($sql2);}

if($setdata)
	{
foreach($setdata as $k => $v)
		{
		$docid = $v['btdl_id'];
		$sqldocs = "SELECT business_to_do_list_docs.* FROM business_to_do_list_docs WHERE business_to_do_list_docs.btdl_list_id = ".$docid;
		$doc_files = $fwDb->query($sqldocs);
				if($doc_files)
					{
						foreach($doc_files as $kf => $vf)
								{
								if($vf['btdl_docs_type']){$vf['iconpath'] = get_icon_path($vf['btdl_docs_type'], $vf['btdl_docs_name'], 'business_todo_documents');}
								$filedata[] = $vf;
								}
					}
		$v['doc_files'] = $filedata;
		unset($filedata);
		$fwViewData['list'][] = $v;
		}
	}
}
$_SESSION['last_sql'] = $sql;
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = $MODULE_SINGULAR;