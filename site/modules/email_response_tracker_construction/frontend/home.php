<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('email_response_construction');

$where = " WHERE  (er_response_status = 1 Or er_response_status = 3) AND er_hide = 0";


$hidden = $fwRequest->getParam('hidden', '');
	if(!empty($hidden)) {
	$where = " WHERE 1 = 1";	
}

$show_hidden = $fwRequest->getParam('show_hidden', '');
	if(!empty($show_hidden)) {
	$where = "WHERE  1 = 1";	
}

$ord =  " ORDER BY if( er_last_email_date = ' '
         OR er_last_email_date IS NULL , 1, 0 ) , STR_TO_DATE( er_last_email_date, '%d-%m-%Y' ) DESC";

$res_status = $fwRequest->getParam('res_status', '');
if($res_status)
{
	 $keys_2 = array_keys($res_status);
	 $ky_2 = $keys_2[0];
	 $val_2 = $res_status[$ky_2];
	 
	  $detail['er_response_status'] = $val_2;
	  $detail['er_resp_status_date'] = date('d-m-Y');
	  $detail['er_resp_status_user'] = $_SESSION['user']['user_name'];

	  $table->setWhere("er_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}

$hide = $fwRequest->getParam('hide', '');
if($hide)
{
	 $keys_2 = array_keys($hide);
	 $ky_2 = $keys_2[0];
	 $val_2 = $hide[$ky_2];
	 
	  $detail['er_hide'] = $val_2;

	  $table->setWhere("er_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}


$clear_search = $fwRequest->getParam('clear_search', '');
if($clear_search) {
	 $fwViewData['clear_search']='';
	 unset($_SESSION['keyword']);
}

$clear = $fwRequest->getParam('clear', '');
if(!empty($clear)) {
	unset($_SESSION['status_search']);
	unset($_SESSION['priority']);
	unset($_SESSION['type_search']);
}

$status_search = $fwRequest->getParam('status_search', '');
if(!empty($status_search)) {
	$where = " where email_response_construction.er_response_status = ".$status_search;
	$_SESSION['status_search'] = $status_search;
}
else if(!empty($_SESSION['status_search'])) {
	$where = " where email_response_construction.er_response_status = ".$_SESSION['status_search'];
}

$type_search = $fwRequest->getParam('type_search', '');
if(!empty($type_search)) {
	$where = " where email_response_construction.er_response_type = ".$type_search;
	$_SESSION['type_search'] = $type_search;
}
else if(!empty($_SESSION['type_search'])) {
	$where = " where email_response_construction.er_response_type = ".$_SESSION['type_search'];
}


$priority = $fwRequest->getParam('priority', '');
if(!empty($priority)) {
	$where = " where email_response_construction.er_priority = '".$priority."'";
	$_SESSION['priority'] = $priority;
}
else if(!empty($_SESSION['priority'])) {
	$where = " where email_response_construction.er_priority = '".$_SESSION['priority']."'";
}

$keyword = $fwRequest->getParam('keyword', '');
if($keyword):
		$where .= " AND ( email_response_construction.er_customer_name LIKE '%".$keyword."%'
		            OR  email_response_construction.er_customer_email  LIKE '%".$keyword."%'
					OR  email_response_construction.er_email_subject LIKE '%".$keyword."%' )";
		
        $_SESSION['keyword'] = $keyword;
elseif($_SESSION['keyword']):
		$where .= " AND email_response_construction.er_customer_name LIKE '%".$_SESSION['keyword']."%'
		            OR  email_response_construction.er_customer_email  LIKE '%".$_SESSION['keyword']."%'
					OR  email_response_construction.er_email_subject LIKE '%".$_SESSION['keyword']."%' )";	      
endif;
  
$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE .' '.$where .' '. $ord;	


if($matsql){$userData = $fwDb->query($matsql);}

$fwViewData['total'] = sizeof($userData);

if(!empty($userData))
{
if (!(isset($pagenum))){ $pagenum = 1; } 
    $rows = count($userData);
    $page_rows = 200;
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
	
	//$fwViewData['list'] = $listsnew;
  }
}


foreach($listsnew as $k=>$v)
{
	$sqlb = "select bsn_id from business where bsn_name like '".$v['er_project']."'";
	$ldata = $fwDb->queryOne($sqlb);
	
	
	$link = BASE_URL ."business.detail/bsn_id/".$ldata['bsn_id'];
	
	$listsnew[$k]['link'] = $link;
	$listsnew[$k]['bsn_id'] = $ldata['bsn_id'];
}

$fwViewData['list'] = $listsnew;

$printreport = $fwRequest->getParam('print', '');
if(!empty($printreport)) {
	$heading = "Email Response Tracker Construction Report";
	$fname='ERT_Construction';
	
	
		
	$html = '<html><body>';
	
	$html .='<table border="1"  cellpadding="5" width="100%">';
	$html .='<tr><th style="width:20%;">Email Source</th><th style="width:24%;">Sender Name & Email</th>
	<th style="width:25%;">Email Subject</th>
	<th style="width:8%;">Date of Last <br>Sender Email</th><th>Responsible Status</th><th style="width:6%;">Priority</th>
	
	</tr>';
	foreach($listsnew as $k => $v)
	{
		$sqlp = "select * from email_response_status where st_id = ".$v['er_response_status'];
		$data = $fwDb->queryOne($sqlp);
		$html .= '<tr nobr="true">';
		$html .= '<td>'.$v['er_email_source'].'</td>';
		$html .= '<td>'.$v['er_customer_name'].'<br>'.$v['er_customer_email'].'</td>';
		$html .= '<td>'.$v['er_email_subject'].'</td>';
		$html .= '<td>'.$v['er_last_email_date'].'</td>';
		$html .= '<td>'.$data['st_option'].'</td>';
		$html .= '<td>'.$v['er_priority'].'</td>';
		$html .= '</tr>';	
	}
	
	$html .= '</table>';
	$html .= '</body><html>';

	create_email_response_pdf($heading, $html, $fname);
}



$fwViewData['title'] = $MODULE_PLURAL;

$sql = "SELECT  * from email_response_status_cons";
$fwViewData['statusdetail'] = $fwDb->query($sql);

$sql_t = "SELECT  * from email_response_type_cons";
$fwViewData['typedetail'] = $fwDb->query($sql_t);