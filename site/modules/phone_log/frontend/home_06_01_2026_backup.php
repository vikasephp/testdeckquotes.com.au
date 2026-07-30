<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('phone_log');
$where = " WHERE ph_open  = 1";

$mess = $fwRequest->getParam('message', '');
if(!empty($mess)) {
	$pid = $fwRequest->getParam('phid', '');	
	
	$sqlm = "select ph_name, ph_phone, ph_email, ph_company, ph_message from phone_log where ph_id = ".$pid;
	$detail = $fwDb->queryOne($sqlm);
	
	if($detail['ph_phone']) {
	   
	  $username = "manojsoniephp";
 	  $password = "jaimatadi108";
      
	  //$message =  "Name:".$detail['ph_name'].' '. "Email:".$detail['ph_email'].' '. "Message:".$detail['ph_message'];
	  $message = "Hi " . $detail['ph_name'] . ",\n";
	  $message .= "Thanks for reaching out to Canberra Granny Flat Builders and Fixed Price Extensions.\n";
	  $message .= "We have tried returning your call but have been unable to reach you.\n";
	  $message .= "If your matter is unresolved, please call back when you are next available.\n";
	  $message .= "Alternatively, please email us at info@cgfb.com.au and we will see how we can help!\n\n";
	  $message .= "Kind Regards,\n";
	  $message .= "CGFB and FPE Team";
	   
	  if(!empty($detail['ph_company'])) {
		  //$message =  "Name:".$detail['ph_name'].' '. "Email:".$detail['ph_email']. ' '. "Company:".$detail['ph_company'].' '. "Message:".$detail['ph_message']; 
		  $message = "Hi " . $detail['ph_name'] . ",\n";
		  $message .= "Thanks for reaching out to Canberra Granny Flat Builders and Fixed Price Extensions.\n";
		  $message .= "We have tried returning your call but have been unable to reach you.\n";
		  $message .= "If your matter is unresolved, please call back when you are next available.\n";
		  $message .= "Alternatively, please email us at info@cgfb.com.au and we will see how we can help!\n";
		  $message .= "Kind Regards,\n";
		  $message .= "CGFB and FPE Team";
	  }
	
	  $type     = "1-way";
	  $senderid = "CGFB"; 
	  $to = $detail['ph_phone'];
	 
	  //$to = "919823868963";	
	  //$to = "919765084623";
	
	  $url = "http://api.directsms.com.au/s3/http/send_message?" .
			 "username=" . $username . "&" .
			 "password=" . $password . "&" .
			 "message="  . urlencode($message) . "&" .
			 "type="     . $type . "&" .
			 "senderid=" . urlencode($senderid) . "&" .
			 "to="       . $to;

		  $output = file($url);
		
		  $result = explode(":", $output[0]);
		
		  if($result[0] == "id") 
		  {
			echo("Message sent\n");
			$fwViewData['msg'] = "Text Message Has Been Successfully Sent";
			
		  }
		  else
		  {
			echo("Error :- " . $result[1] . "\n");
		  }	
		
	}		
	
}


$showopen = $fwRequest->getParam('showopen', '');
if($showopen) {
	
	unset($_SESSION['showall']);
	$where = " WHERE ph_open  = 1";
}

$showall = $fwRequest->getParam('showall', '');
if($showall || isset($_SESSION['showall']))
{
	$where = " WHERE 1 = 1 ";
	$_SESSION['showall']=true;
}



$open = $fwRequest->getParam('open', '');
if($open)
{
	 $keys_1 = array_keys($open);
	 $ky_1 = $keys_1[0];
	 $val_1 = $open[$ky_1];
	
	  $detail['ph_open'] = $val_1;
	  $table->setWhere("ph_id = ".$ky_1);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }
}

$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where. " Order by ph_id DESC";	



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

//$sqlp = "SELECT  business.* from business";
//$fwViewData['projdetail'] = $fwDb->query($sqlp);

$sqls = "select co_id, co_company_name from companies";
$fwViewData['supdetail'] = $fwDb->query($sqls);

//$sql_1 = "select distinct car_project from construction_alert_report";
//$fwViewData['project_data'] = $fwDb->query($sql_1 );

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
