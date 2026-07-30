<?php

$fwMainView = 'file:' . getcwd() . '/phone_log_frame.tpl';
$bsn_id = $fwRequest->getParam('bsn_id', 0);

$pagenum = $fwRequest->getparamget('pagenum',0);
$phone_log_table = new Fw_Db_Table('phone_log');
$where .= " phone_log.ph_bsn_id = ".$bsn_id;

$open = $fwRequest->getParam('open', '');
if($open)
{
	 $keys_1 = array_keys($open);
	 $ky_1 = $keys_1[0];
	 $val_1 = $open[$ky_1];
	
	  $detail['ph_open'] = $val_1;
	  $phone_log_table->setWhere("ph_id = ".$ky_1);
	  if($phone_log_table->rowExists())
	  {
		$this_id = $phone_log_table->updateRow($detail);
	  }
}

$matsql = "SELECT phone_log.* FROM phone_log where ".$where. " Order by ph_id DESC";

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

		$listsnew[] = $list;
	endforeach;
	
	$fwViewData['list'] = $listsnew;
  }
}


$fwViewData['title'] = $MODULE_PLURAL;

$sqls = "select co_id, co_company_name from companies";
$fwViewData['supdetail'] = $fwDb->query($sqls);

$sqlti = "Select tm_id from type_master where tm_type = 'Urgency Rating'";
$type_id = $fwDb->queryOne($sqlti); 
 		
$sqlto = "Select to_id, to_option from type_options where to_type_id  = ". $type_id['tm_id'];
$fwViewData['urgency'] = $fwDb->query($sqlto); 

$sql_2 = "select * from phone_log_actioned_admin";
$fwViewData['actioned'] = $fwDb->query($sql_2);

$sql_3 = "select tm_id from type_master where tm_type = 'Construction Alert Report Team' " ;
$tmdata = $fwDb->queryOne($sql_3); 

$sql_4 = "select to_option from type_options where to_type_id = ". $tmdata['tm_id'] ;
$fwViewData['who'] = $fwDb->query($sql_4); 

$sql_5 = "select distinct apd_comp_date from action_plan_step_detail";
$fwViewData['date'] = $fwDb->query($sql_5 );

$sql_6 = "select * from phone_log_whofor_admin";
$fwViewData['whofor'] = $fwDb->query($sql_6);
