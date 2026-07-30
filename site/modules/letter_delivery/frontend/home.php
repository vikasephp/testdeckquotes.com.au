<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('letter_delivery');


$where = " WHERE ld_hide = 0";

$hidden = $fwRequest->getParam('hidden', '');
	if(!empty($hidden)) {
	$where = " WHERE 1 = 1";	
}



$hide = $fwRequest->getParam('hide', '');
if($hide)
{
	 $keys_2 = array_keys($hide);
	 $ky_2 = $keys_2[0];
	 $val_2 = $hide[$ky_2];
	
	  $detail['ld_hide'] = $val_2;
	  $table->setWhere("ld_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}



// Create Sticker starts

$print = $fwRequest->getParam('print', '');
if(!empty($print))
{
	$ld_id = $fwRequest->getParam('ld_id', '');
	$sqlp = "Select * from letter_delivery	where ld_id = ".$ld_id;
	
	$stic = $fwDb->queryOne($sqlp);
	

	$html = '<html><body>';	
	$html .= '<table border="1" width="100%" cellpadding="7">';

	$html .= "<tr><th>Job Id</th> <td>" .$stic['ld_id']. "</td></tr>";
	$html .= "<tr><th>Suburb</th> <td>" .$stic['ld_suburb']. "</td></tr>";
	$html .= "<tr><th>Quantity Assigned</th> <td>" .$stic['ld_quantity_assigned']. "</td></tr>";
	$html .= "<tr><th>Delivery End Date</th> <td>" .$stic['ld_delivered_due_date']. "</td></tr>";
	$html .= "<tr><th>Delivery Personnel</th> <td>" .$stic['ld_delivery_personnel']. "</td></tr>";
	$html .= "<tr><th>Brochure ID</th> <td>" .$stic['ld_brochure_id']. "</td></tr>";
	
	
	$html .= "</table>";
	$html .= '</body></html>';
	
	$heading = "Letter Delivery Sticker";
	create_sticker($heading,$html);
	
}


// Create Sticker ends





$clear = $fwRequest->getParam('clear', '');
if($clear) {
	 $fwViewData['due_date']='';
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
  
$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where;	


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

$sqlp = "SELECT  business.* from business";
$fwViewData['projdetail'] = $fwDb->query($sqlp);

$sqls = "select co_id, co_company_name from companies";
$fwViewData['supdetail'] = $fwDb->query($sqls);

$sql_1 = "select distinct car_project from construction_alert_report";
$fwViewData['project_data'] = $fwDb->query($sql_1 );

$sqlti = "Select tm_id from type_master where tm_type = 'Urgency Rating'";
$type_id = $fwDb->queryOne($sqlti); 
 		
$sqlto = "Select to_id, to_option from type_options where to_type_id  = ". $type_id['tm_id'];
$fwViewData['urgency'] = $fwDb->query($sqlto); 

$sql_2 = "select distinct car_supplier from construction_alert_report";
$fwViewData['supplier'] = $fwDb->query($sql_2);

$sql_3 = "select tm_id from type_master where tm_type = 'Construction Alert Report Team' " ;
$tmdata = $fwDb->queryOne($sql_3); 

$sql_4 = "select to_option from type_options where to_type_id = ". $tmdata['tm_id'] ;
$fwViewData['who'] = $fwDb->query($sql_4); 

$sql_5 = "select distinct apd_comp_date from action_plan_step_detail";
$fwViewData['date'] = $fwDb->query($sql_5 );
