<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('development_log');

$completed = $fwRequest->getParam('completed', '');
if($completed)
{
	 $keys_2 = array_keys($completed);
	 $ky_2 = $keys_2[0];
	 $val_2 = $completed[$ky_2];
	
	  $detail['de_completed'] = $val_2;
	  $table->setWhere("de_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}


$where = " WHERE de_hide = 0 ";

$hidden = $fwRequest->getParam('hidden', '');
	if(!empty($hidden)) {
	$where = " WHERE 1 = 1";	
}

$hidden = $fwRequest->getParam('hidden', '');
	if(!empty($hidden)) {
	$where = " WHERE 1 = 1";	
}



$clear = $fwRequest->getParam('clear', '');
if($clear) {
	 $fwViewData['due_date']='';
}



$hide = $fwRequest->getParam('hide', '');
if($hide)
{
	 $keys_2 = array_keys($hide);
	 $ky_2 = $keys_2[0];
	 $val_2 = $hide[$ky_2];
	
	  $detail['de_hide'] = $val_2;
	  $table->setWhere("de_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}


$keyword = $fwRequest->getParam('keyword', '');
if($keyword):

	$where .= " AND phone_log.ph_name LIKE '%".$keyword."%' OR 
	            phone_log.ph_company LIKE '%".$keyword."%' OR 
                    phone_log.ph_user_created  LIKE '%".$keyword."%' OR 
		    phone_log.ph_steam  LIKE '%".$keyword."%'  ";
		    
	
	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword'] && $pagenum > 0):

	$where .= " AND phone_log.ph_name LIKE '%".$_SESSION['keyword']."%' OR 
	            phone_log.ph_company LIKE '%".$_SESSION['keyword']."% OR 
		    phone_log.ph_user_created 	 LIKE '%".$_SESSION['keyword']."%' OR 
		    phone_log.ph_steam LIKE '%".$_SESSION['keyword']."%' ";	
	
	$fwViewData['keyword']=$_SESSION['keyword'];
endif;
  
$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE . $where . " Order by de_order ";	

if($matsql){$userData = $fwDb->query($matsql);}

$sql = "Select count(*) as total from development_log where de_completed = 1 ";
$fwViewData['data'] = $fwDb->queryOne($sql);

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

$sqlT = "Select * from development_log_type ";
$data = $fwDb->query($sqlT);
$fwViewData['typeData'] = $data;


$printreport = $fwRequest->getParam('print', '');
if(!empty($printreport)) {
	$heading = "Development Log Report";
	$fname='hello';
	
	$sqlp= "select * from development_log where de_hide = 0 ";
	$data = $fwDb->query($sqlp);
		
	$html = '<html><body>';
	
	$html .='<table border="1"  cellpadding="5" width="100%">';
	$html .='<tr><th style="width:8%;">Priority</th>
	             <th style="width:30%;">What</th>
				 <th style="width:11%;">Progress</th>
			     <th style="width:8%;">Type </th>
			     <th style="width:8%;">Estimate Hours</th>
				 <th style="width:7%;">Hours So Far</th>
			     <th style="width:28%;">Developer Comment</th>
			</tr>';
	
	foreach($data as $k => $v)
	{
		
		$html .= '<tr nobr="true">';
		//$html = "<tr>";
		$html .= '<td>'.$v['de_order'].'</td>';
		$html .= '<td>'.$v['de_what'].'</td>';
		$html .= '<td>'.$v['de_percentage'].'</td>';
		$html .= '<td>'.$v['de_type'].'</td>';
		$html .= '<td>'.$v['de_total_hours'].'</td>';
		$html .= '<td>'.$v['de_hours_sofor'].'</td>';
		$html .= '<td>'.$v['de_dev_comment'].'</td>';
		$html .= '</tr>';	
	}
	
	$html .= '</table>';
	$html .= '</body><html>';

	create_dev_pdf($heading, $html, $fname);
}