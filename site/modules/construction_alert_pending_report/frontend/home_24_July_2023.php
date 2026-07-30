<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('construction_alert_report');
$tableic = new Fw_Db_Table('include_customers');
$tableSU = new Fw_Db_Table("car_supplier_update");

$app_save = $fwRequest->getParam('app_save', '');
if($app_save) {
	$car_id = $fwRequest->getParam('car_id', '');
	$car_approve = $fwRequest->getParam('car_approve', '');
	$appDetail['car_approve'] = $car_approve;
	if($car_approve == 'Approve') {
		$appDetail['car_status'] = 'Closed';
		$appDetail['car_approve'] = '';
	} else if ($car_approve == 'Not Approve') {
		$appDetail['car_status'] = 'Open';
		$appDetail['car_approve'] = '';
	}
	
	$table->setWhere("car_id = $car_id");
	$table->updateRow($appDetail);
	
	$arDetail['cu_alert_resolved'] = 0;
	$tableSU->setWhere("cu_car_id = $car_id");
	$tableSU->updateRow($arDetail);

}

$clear = $fwRequest->getParam('clear', '');
if($clear) {
	 $fwViewData['due_date']='';
	 unset($_SESSION['project']);
	 unset($_SESSION['urgency']);
	 unset($_SESSION['supplier']);
	 unset($_SESSION['res_staff']);
	 unset($_SESSION['first_name']);
	 unset($_SESSION['last_name']);
	 unset($_SESSION['type']);
}

$hidden = $fwRequest->getParam('hidden', '');

if(!empty($hidden)) {
	$where = " WHERE 1 = 1  ";
	$_SESSION['closed'] = 'True';
} else {
	$where = " WHERE car_status = 'Open' ";
}

if($_SESSION['closed'] == 'True')
{
	$where = " WHERE 1 = 1  ";	
}

$email_report = $fwRequest->getParam('email_report', '');

if($email_report)
{
	 
	 $keys = array_keys($email_report);
	 $ky = $keys[0];
	 $val = $email_report[$ky];
	 
	 $detail['car_email_report'] = $val;
	 $table->setWhere('car_id = '.$ky);
	 if($table->rowExists())
	 {
		$this_id = $table->updateRow($detail);
	 }
}

$include = $fwRequest->getParam('include', '');
if($include)
{
	 $keys_2 = array_keys($include);
	 $ky_2 = $keys_2[0];
	 $val_2 = $include[$ky_2];

	  $detail['car_include_cust'] = $val_2;
	  $table->setWhere("car_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
		
	  }
	  
	  $sqlp = "select car_project, car_status from construction_alert_report where car_id = ".$ky_2; 
	  $projData = $fwDb->queryOne($sqlp);
	 
	 
	 if($projData['car_status'] == 'Open' ) 
	 {
	 
	  $sq1cust = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, 
		  bus_customers.bcust_lname, bus_customers.bcust_misc_moble,  	bcust_misc_email1 from business_sellers 		
		  Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		  Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
		  where business.bsn_name = '".$projData['car_project']."'" ;  
		
	  $custdata = $fwDb->queryOne($sq1cust);
	  $cemail = $custdata['bcust_misc_email1'];
	
	  
	  $tableic->setWhere("ic_email = '".$cemail."'");
	  if(!$tableic->rowExists() && $val_2 == 'Yes')
	  {
		
		$icDetail['ic_project'] = $projData['car_project'];
		$icDetail['ic_name'] = $custdata['bcust_fname'].' '. $custdata['bcust_lname'];
		$icDetail['ic_phone'] = $custdata['bcust_misc_moble'];
		$icDetail['ic_email'] = $cemail;
		$icDetail['ic_no_of_alerts'] = 1;
		$this_id2 = $tableic->insertRow($icDetail);	  
	  } else {
		   if($val_2 == 'Yes')
		   {
			 
			 $sqlA = "select ic_no_of_alerts from include_customers where ic_email = '".$cemail."'";
			 $al = $fwDb->queryOne($sqlA);
			 $icDetail['ic_no_of_alerts'] = $al['ic_no_of_alerts'] + 1;  
			 $this_id2 = $tableic->updateRow($icDetail);
		   }
		   else {
			 
			  $sqlA = "select ic_no_of_alerts from include_customers where ic_email = '".$cemail."'";
			  $al = $fwDb->queryOne($sqlA); 
			  	
				if($al['ic_no_of_alerts'] > 1 ) {
					
			
				  $icDetail['ic_no_of_alerts'] = $al['ic_no_of_alerts'] - 1;  
				  $this_id2 = $tableic->updateRow($icDetail);
				  
			 	 } else {
					
			   		$tableic->deleteRow();
			  	}
			  
		       }
		  
	  }
	 }
	  //
} 


	$project = $fwRequest->getParam('pf', '');
	$type = $fwRequest->getParam('type', '');
	$urgency = $fwRequest->getParam('urgency', '');
	$supplier = $fwRequest->getParam('supplier', '');
	$res_staff = $fwRequest->getParam('res_staff', '');
	
	
	if($project):
	
	       $where .= " AND  construction_alert_report.car_project  LIKE '%".$project."%'  " ;
	       $_SESSION['project'] = $project;
	       $fwViewData['project']=$_SESSION['project'];

  	elseif($_SESSION['project'] && $pagenum >= 0):
		
	       $where .= " AND  construction_alert_report.car_project LIKE  '%".$_SESSION['project']."%'   ";
	       $fwViewData['project']=$_SESSION['project'];
	       
	endif;	

 	
	if($urgency):
	
	       $where .= " AND  construction_alert_report.car_urgency  LIKE '%".$urgency."%'  " ;
	       $_SESSION['urgency'] = $urgency;
	       $fwViewData['urgency']=$_SESSION['urgency'];

  	elseif($_SESSION['urgency'] && $pagenum >= 0):
		
	       $where .= " AND  construction_alert_report.car_urgency LIKE  '%".$_SESSION['urgency']."%'   ";
	       $fwViewData['urgency']=$_SESSION['urgency'];
	       
	endif;
	
	
	if($type):
	
	       $where .= " AND  construction_alert_report.car_type  LIKE '%".$type."%'  " ;
	       $_SESSION['type'] = $type;
	       $fwViewData['type']=$_SESSION['type'];

  	elseif($_SESSION['type'] && $pagenum >= 0):
		
	       $where .= " AND  construction_alert_report.car_type LIKE  '%".$_SESSION['type']."%'   ";
	       $fwViewData['type']=$_SESSION['type'];
	       
	endif;
	
	if($supplier):
	
	       $where .= " AND  construction_alert_report.car_include_supplier  LIKE '%".$supplier."%'  " ;
	       $_SESSION['supplier'] = $supplier;
	       $fwViewData['supplier']=$_SESSION['supplier'];

  	elseif($_SESSION['supplier'] && $pagenum >= 0):
		
	       $where .= " AND  construction_alert_report.car_include_supplier LIKE  '%".$_SESSION['supplier']."%'   ";
	       $fwViewData['supplier']=$_SESSION['supplier'];
	       
	endif;
	
	
	
	if($res_staff):
	
	       $where .= " AND  construction_alert_report.car_resp_staff  LIKE '%".$res_staff."%'  " ;
	       $_SESSION['res_staff'] = $res_staff;
	       $fwViewData['res_staff']=$_SESSION['res_staff'];

  	elseif($_SESSION['res_staff'] && $pagenum >= 0):
		
	       $where .= " AND  construction_alert_report.car_resp_staff LIKE  '%".$_SESSION['res_staff']."%'   ";
	       $fwViewData['res_staff']=$_SESSION['res_staff'];
	       
	endif;
   

$ord =  " ORDER BY if(  construction_alert_report.car_date = ' '
         OR construction_alert_report.car_date IS NULL , 1, 0 ) , STR_TO_DATE( construction_alert_report.car_date, '%d-%m-%Y' ) DESC";

$sort = $fwRequest->getParam('sort', '');
if(!empty($sort))
{
	$sortby = $fwRequest->getParam('sortby', '');
	
	if($sortby == 1)  {
		$ord =  " ORDER BY  construction_alert_report.car_id "; 
	}
	
	if($sortby == 2)  {
		$ord =  " ORDER BY  construction_alert_report.car_project "; 
	}
	
	if($sortby == 3) {
		$ord =  " ORDER BY if( construction_alert_report.car_date = ' '
       	        OR construction_alert_report.car_date IS NULL , 1, 0 ) , STR_TO_DATE( construction_alert_report.car_date, '%d-%m-%Y' )";
	}
	
	if($sortby == 4)  {
		$ord =  " ORDER BY  construction_alert_report.car_supplier "; 
	}
	
	if($sortby == 5)  {
		$ord =  " ORDER BY  construction_alert_report.car_urgency "; 
	}
	
	$fwViewData['sortby'] = $sortby;
}

$sql_open = "Select count(*) as tot_open from construction_alert_report where car_status = 'Open' "; 
$fwViewData['openData'] = $fwDb->queryOne($sql_open);

$sql_24 = "SELECT count(*) as tf FROM construction_alert_report 
	   WHERE STR_TO_DATE(car_date , '%d-%m-%Y' ) > CURDATE( ) - INTERVAL 1 DAY ";
$fwViewData['tot_tf'] = $fwDb->queryOne($sql_24);

$sql_7 = "SELECT count(*) as seven FROM construction_alert_report 
	  WHERE STR_TO_DATE(car_date , '%d-%m-%Y' ) > CURDATE( ) - INTERVAL 7 DAY ";
$fwViewData['tot_seven'] = $fwDb->queryOne($sql_7);

$ecar_id = $fwRequest->getParam('ecar_id', '');
if(!empty($ecar_id)) {
$where = "where car_id  = ".$ecar_id;	
}
 
 $car_id = $fwRequest->getParam('car_id', '');
if(!empty($car_id)) {
$where = " where car_id  = ".$car_id;	
}
     
//$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where .' ' .$ord;

$matsql = "SELECT construction_alert_report.*  FROM construction_alert_report 
           Left Join car_supplier_update on construction_alert_report.car_id = car_supplier_update.cu_car_id 
           where car_supplier_update.cu_alert_resolved = 1 and construction_alert_report.car_approve = ''" .$ord;	


if($matsql){$userData = $fwDb->query($matsql);}

if(!empty($userData))
{
if (!(isset($pagenum))){ $pagenum = 1; } 
    $rows = count($userData);
    $page_rows = 500;
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


if(!empty($listsnew)) {
	
	foreach($listsnew as $k => $v2)
	{
	 
		  
	 $sq122 = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, 
		  bus_customers.bcust_lname, bus_customers.bcust_misc_moble from business_sellers 		
		  Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		  Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
		  where business.bsn_name = '".$v2['car_project']."'";  
	
	$data = $fwDb->queryOne($sq122);
		
	$sql3 = "select apd_res_staff from action_plan_step_detail where apd_car_id = ".$v2['car_id'];
	$respdata = $fwDb->query($sql3);	

	$sql4 = "select count(*) as tot from car_supplier_update where 	cu_car_id = ".$v2['car_id'];
	$cudata = $fwDb->queryOne($sql4);	

	if($cudata['tot']> 0 ) {
		 $listsnew[$k]['supplier_upadate'] = true;	
	}


	$rs='';
	foreach($respdata as $k3 => $v3)
	{
		$rs .= $v3['apd_res_staff']. ", ";
	}

	$rs = substr($rs, 0, -2);
	
		  $listsnew[$k]['car_project'] = stripslashes($v2['car_project']);
	
		  $sqlu = "select * from car_priority where pr_id = " .$v2['car_urgency'];
		  $u = $fwDb->queryOne($sqlu); 
	         
		  
		  $sqlcsu = "Select cu_alert_resolved from car_supplier_update where cu_car_id = ".$v2['car_id']. " and cu_alert_resolved = 1";
		  $cuar = $fwDb->query($sqlcsu);
		  		
		  $listsnew[$k]['bcust_fname'] = $data['bcust_fname'];
		  $listsnew[$k]['bcust_lname'] = $data['bcust_lname'];
		  $listsnew[$k]['bcust_misc_moble'] = $data['bcust_misc_moble'];
		  $listsnew[$k]['rs'] = $rs;
		  $listsnew[$k]['urgency'] = $u['pr_priority'];
		  
		  if(count($cuar) >= 1) {
			   $listsnew[$k]['resolved'] = 1;
		  } else {
			  $listsnew[$k]['resolved'] = 0;
		  }
		  
		  if(empty($data['bcust_fname']) && !empty($where2)) {  unset($listsnew[$k]); }
		  if(empty($data['bcust_lname']) && !empty($where2)) {  unset($listsnew[$k]); }
		 
	}
}


$fwViewData['list'] = $listsnew;
$fwViewData['title'] = $MODULE_PLURAL;

$sqlp = "SELECT  business.* from business";
$fwViewData['projdetail'] = $fwDb->query($sqlp);

$sqls = "select co_id, co_company_name from companies";
$fwViewData['supdetail'] = $fwDb->query($sqls);

$sql_1 = "select distinct car_project from construction_alert_report";
$fwViewData['project_data'] = $fwDb->query($sql_1 );

$sqltype = "Select * from car_type";
$fwViewData['typedetail'] = $fwDb->query($sqltype); 

$sqlto = "Select * from car_priority";
$fwViewData['ugencyData'] = $fwDb->query($sqlto);

$sql_2 = "select distinct car_supplier from construction_alert_report";
$fwViewData['supplier'] = $fwDb->query($sql_2);

$sql_3 = "select tm_id from type_master where tm_type = 'Construction Alert Report Team' " ;
$tmdata = $fwDb->queryOne($sql_3); 

$sql_4 = "SELECT distinct contacts.cs_position   from contacts 
          	  Inner join companies ON contacts.cs_company = companies.co_id
	  	  where companies.co_id = 2  order by contacts.cs_position " ;
		  
$fwViewData['who'] = $fwDb->query($sql_4); 

$sql_5 = "select distinct apd_comp_date from action_plan_step_detail";
$fwViewData['date'] = $fwDb->query($sql_5 );

$sql2 = "SELECT  contacts.*, companies.co_company_name from contacts
         Inner join companies on contacts.cs_company = companies.co_id";
$fwViewData['contactdetail'] = $fwDb->query($sql2);

$sqlti = "Select tm_id from type_master where tm_type = 'Urgency Rating'";
$type_id = $fwDb->queryOne($sqlti); 
 		
$sqlto = "Select * from car_priority";
$fwViewData['todetail'] = $fwDb->query($sqlto); 


 $submit = $fwRequest->getParam('print', '');
if(!empty($submit))
{
 	
	$heading = "Construction Alert Report";
 
 	$html = '';	
	$html .= '<table border="1" width="98%" cellpadding="7">';
	$last_key = end(array_keys($listsnew));
		
	set_time_limit(0);
	ini_set('memory_limit', '2048M');
	foreach($listsnew as $lk => $lv)
	{
		
		$ext1 =  getext($lv["car_image1"]);
		if(!empty($lv["car_image1"]) && $ext1 == true) {
			$img1 = '<img src="https://www.deckquotes.com.au/files/uploads/'.$lv["car_image1"].'" height="150">';
		} else {
		        $img1 = '';	
		}
		
		$ext2 =  getext($lv["car_image2"]);
		if(!empty($lv["car_image2"]) && $ext2 == true) {
			$img2 = '<img src="https://www.deckquotes.com.au/files/uploads/'.$lv["car_image2"].'" height="150">';
		} else {
		        $img2 = '';	
		}
		
		$ext3 =  getext($lv["car_image3"]);
		if(!empty($lv["car_image3"]) && $ext3 == true) {
			$img3 = '<img src="https://www.deckquotes.com.au/files/uploads/'.$lv["car_image3"].'" height="150">';
		} else {
		        $img3 = '';	
		}
		
		$ext4 =  getext($lv["car_image4"]);
		if(!empty($lv["car_image4"]) && $ext4 == true) {
			$img4 = '<img src="https://www.deckquotes.com.au/files/uploads/'.$lv["car_image4"].'" height="150">';
		} else {
		        $img4 = '';	
		}
	
		$ext5 =  getext($lv["car_image5"]);
		if(!empty($lv["car_image5"]) && $ext5 == true) {
			$img5 = '<img src="https://www.deckquotes.com.au/files/uploads/'.$lv["car_image5"].'" height="150">';
		} else {
		        $img5 = '';	
		}
		
		
		$is = preg_replace("#<a.*?>(.*?)</a>#i", "\1", $lv["car_include_supplier"]);
 		$html .= '<tr style="background-color:#FF0; text-align:center;">';
		$html .= '<th  colspan="2">Rec. No. '.$lv["car_id"].' </th>';
		$html .= '</tr>';
		$html .= '<tr><td style="width:35%;">Project</td><td style="width:65%;">'.$lv["car_project"].'</td></tr>';
		
		$html .= '<tr><td>Contact Info</td><td>'.$lv["bcust_fname"].' '.$lv["bcust_lname"].'</td></tr>';
		
		if(!empty($lv["car_status"])) {
			$html .= '<tr><td>Status</td><td>'.$lv["car_status"].'</td></tr>';
		}
		
		if(!empty($lv["car_date"])) {
			$html .= '<tr><td>Date</td><td>'.$lv["car_date"].'</td></tr>';
		}
		
		if(!empty($lv["car_new_date"])) {
			$html .= '<tr><td>Due Date</td><td>'.$lv["car_new_date"].'</td></tr>';
		}
		
		if(!empty($lv["car_type"])) {
			$html .= '<tr><td>Type</td><td>'.$lv["car_type"].'</td></tr>';
		}
		
		if(!empty($lv["urgency"])) {
			$html .= '<tr><td>Urgency</td><td>'.$lv["urgency"].'</td></tr>';
		}
		if(!empty($lv["rs"])) {
			$html .= '<tr><td>Responsible Staff</td><td>'.$lv["rs"].'</td></tr>';
		}
		
		if(!empty($lv["car_alert"])) {
			$html .= '<tr><td>Alert Message</td><td>'.$lv["car_alert"].'</td></tr>';
		}
		
		$html .= '<tr>';
		$html .= '<td colspan="2">'.$img1.'  '.$img2.' '.$img3.' '.$img4.' '.$img5.'</td>';
		$html .= '</tr>';
		if ($lk <> $last_key) {
			
			$html .= '<br pagebreak="true" />';
		}
	}
	$html .= '</table>';	
	
	create_car($heading,$html);
		
}

function getext($imgfile)
{
	$file_extension = explode('.',$imgfile);
	$file_extension = strtolower(end($file_extension));
	$accepted_formate = array('jpeg','jpg','png');
	if(in_array($file_extension,$accepted_formate)) {           
	 return true;
	} else {
	  return false;
	}		
}
