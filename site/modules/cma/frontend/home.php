<?php
$pagenum = $fwRequest->getparam('pagenum','');
$tablePages = new Fw_Db_Table($TABLE);
$export = $fwRequest->getParam('export', 0);
$tablestates= new Fw_Db_Table('states');
//$order = "ORDER BY CONVERT (".$TABLE.".btdl_title USING latin2) ASC";
//$order = "ORDER BY btdl_urgency ASC";
$submit = $fwRequest->getParam('filter', '');

$detail = $fwRequest->getParam($TABLE, array());

if(empty($pagenum)){unset($_SESSION['last_sql']);}
if($submit)
	{
	$detail = $fwRequest->getParam($TABLE, array());
	}
$where = "WHERE 1=1 ";

if(!empty($detail))
	{
	
		if($detail['c_location'])
		{
		$tablestates->setWhere("s_id = ".$detail['c_location']);
		$statedata = $tablestates->getRow();
	$tablestates->setWhere("s_parent_state = '".$statedata['s_shortcodes']."'");
	$tablestates->setOrderBy("s_name ASC");
	$fwViewData['cities'] = $tablestates->getRows();
	$fwViewData['detail'] = $detail;
		}
	
		$detail = $fwRequest->getParam($TABLE, array());
		if($detail['c_location']){$where .= " AND cma.c_location = ".$detail['c_location'];}
		
		if($detail['c_city']){$where .= " AND cma.c_city = ".$detail['c_city'];}
		
		if($detail['c_industry']){$where .= " AND cma.c_industry = ".$detail['c_industry'];}
		if($detail['c_status']){$where .= " AND cma.c_status = ".$detail['c_status'];}
		
		if($detail['c_price_from'] && $detail['c_price_to']){$where .= " AND cma.c_price >= ".$detail['c_price_from']." AND cma.c_price <= ".$detail['c_price_to'];}
		elseif($detail['c_price_from']){$where .= " AND cma.c_price >= ".$detail['c_price_from'];}
		elseif($detail['c_price_to']){$where .= " AND cma.c_price <= ".$detail['c_price_to'];}
	
		if($detail['c_date_listed_from'] && $detail['c_date_listed_to']){$where .= " AND cma.c_date_listed >= '".changedate_y_m_d($detail['c_date_listed_from'])."' AND cma.c_date_listed <= '".changedate_y_m_d($detail['c_date_listed_to'])."'";}
		elseif($detail['c_date_listed_from']){$where .= " AND cma.c_date_listed >= '".changedate_y_m_d($detail['c_date_listed_from'])."'";}
		elseif($detail['c_date_listed_to']){$where .= " AND cma.c_date_listed <= '".changedate_y_m_d($detail['c_date_listed_to'])."'";}
	
	}	
$logged_username = $_SESSION['user']['user_username'];


if(!empty($submit))
	{
		$detail = $fwRequest->getParam($TABLE, array());
	
		$fwViewData['ord_id'] = $detail['orderBy'];	
	}	

	if($sql = $_SESSION['last_sql']){$sql = $_SESSION['last_sql'];}
	else{
	$sql = "SELECT ".$TABLE.".*, creusers.user_name as creator, industry.ind_name, busness_status.st_name, location.s_name as sname, city.s_name as cname, location.s_shortcodes as scode FROM ".$TABLE." 
	LEFT JOIN users as creusers ON creusers.user_id = ".$TABLE.".c_user_id 
	LEFT JOIN industry ON industry.ind_id = ".$TABLE.".c_industry 
	LEFT JOIN busness_status ON busness_status.st_id = ".$TABLE.".c_status 
	LEFT JOIN states as location ON location.s_id = ".$TABLE.".c_location
	LEFT JOIN states as city ON city.s_id = ".$TABLE.".c_city ".$where." ORDER BY ".$TABLE.".".$ID." DESC";}

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
		$docid = $v['c_id'];
		$sqldocs = "SELECT cma_images.* FROM cma_images WHERE cma_images.cma_id = ".$docid;
		$doc_files = $fwDb->query($sqldocs);
				if($doc_files){							
		$v['c_images'] = $doc_files;
					}
		unset($doc_files);
		$list[] = $v;
		}
	}
}
$fwViewData['list'] = $list;

$_SESSION['last_sql'] = $sql;
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = $MODULE_SINGULAR;

