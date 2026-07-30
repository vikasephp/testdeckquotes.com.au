<?php
$pagenum = $fwRequest->getparam('pagenum','');
$tablePages = new Fw_Db_Table($TABLE);
$export = $fwRequest->getParam('export', 0);
$short = $fwRequest->getParam('s', '');

if($short)
	{
	switch ($short)
			{
				case 'lc':
				$_SESSION['sort_order'] = $TABLE.".btdl_title DESC";
				break;
				
				case 'bl':
				$_SESSION['sort_order'] = $TABLE.".btdl_title ASC";
				break;
			
			}
	}

if($_SESSION['sort_order']){$order = "ORDER BY ".$_SESSION['sort_order'];}else{$order = "ORDER BY ".$TABLE.".btdl_title ASC";}
	
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

if($sql = $_SESSION['last_sql'])	
	{$sql = $_SESSION['last_sql'];
	}
	else
		{
		$sql = "SELECT * FROM ".$TABLE." ".$order;
		}

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



if($sql2){ $fwViewData['list'] = $fwDb->query($sql2);}


if($setdata)
	{
foreach($setdata as $k => $v)
		{
		$bsnid = $v['mlbs_business_id'];
		
		$sqlcount = "SELECT count(byer_enquiry.be_id) as allbuyers FROM byer_enquiry WHERE byer_enquiry.be_business_id = ".$bsnid;
		$v = array_merge($v,$fwDb->queryOne($sqlcount));
		
			$sqlcount = "SELECT count(byer_enquiry.be_id) as activebuyers FROM byer_enquiry WHERE byer_enquiry.be_status= 1 AND byer_enquiry.be_business_id = ".$bsnid;
		$v = array_merge($v, $fwDb->queryOne($sqlcount));
		$fwViewData['list'][] = $v;
	
		
		}
	}
 }

$_SESSION['last_sql'] = $sql;
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = $MODULE_SINGULAR;

	