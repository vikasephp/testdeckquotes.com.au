<?php

define( 'DB_NAME', 'constructioncale_db' );
/** Database username */
define( 'DB_USER', 'constructioncale_dbnew' );

/** Database password */
define( 'DB_PASSWORD', ')KE88FLyPOI#' );


// $servername = "localhost";
// $username = "constructioncale_dbnew";
// $password = ")KE88FLyPOI#";
// $dbname = "constructioncale_db";
// $conn = new mysqli($servername, $username, $password,$dbname);

// Check connection
/*if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}*/
//echo "Connected successfully";

$table = new Fw_Db_Table('business_sellers');
$pagenum = $fwRequest->getparamget('pagenum',0);

//$ord =  " ORDER BY if( lb_date = ' '
//        OR lb_date IS  NULL , 0, 1 ) , STR_TO_DATE( lb_date, '%d-%m-%Y' ) DESC ";
	
$where = " WHERE business.bsn_status like '%|3|%' and business_sellers.bs_cdr_hide = 0 ";
//$where = " WHERE business.bsn_status like '%|3|%' ";

$hidden = $fwRequest->getParam('hidden', '');
	if(!empty($hidden)) {
	$where = " WHERE business.bsn_status like '%|3|%'";	
}

$hide = $fwRequest->getParam('hide', '');
if($hide)
{
	 $keys_2 = array_keys($hide);
	 $ky_2 = $keys_2[0];
	 $val_2 = $hide[$ky_2];
	
	  $detail['bs_cdr_hide'] = $val_2;
	  $table->setWhere("bs_business_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}

$keyword = $fwRequest->getParam('searchkey', '');
	
if($keyword):
$where .= " AND business.bsn_name LIKE '%".$keyword."%'";
	
	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword'] ):

	$where .= " AND business.bsn_name LIKE '%".$_SESSION['keyword']."%'";
	$fwViewData['keyword']=$_SESSION['keyword'];
endif;
	
$clearsearch = $fwRequest->getParam('clearsearch', '');
	
			if(!empty($clearsearch)) {
			unset($fwViewData['keyword']);
			unset($_SESSION['keyword']);	
			$where = " WHERE business.bsn_status like '%|3|%' and business_sellers.bs_cdr_hide = 0 ";	
		}
	
	   $callinked = $fwRequest->getParam('callinked', '');
	   
	   if($callinked): {
		    $where .= " AND business_sellers.bs_cdr_cal_linked   = ".$callinked;
		    $fwViewData['callinked']= $callinked;
			$_SESSION['callinked'] =  $callinked;
	    }
	   elseif($_SESSION['callinked'] ):

		$where .= " AND business_sellers.bs_cdr_cal_linked = " .$_SESSION['callinked'];
		$fwViewData['callinked']=$_SESSION['callinked'];
       endif;

		$clear = $fwRequest->getParam('clear', '');
			if(!empty($clear)) {
			unset($fwViewData['callinked']);
			unset($_SESSION['callinked']);	
			$where = " WHERE business.bsn_status like '%|3|%' and business_sellers.bs_cdr_hide = 0 ";	
		}


	 
	   
 $matsql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        bus_customers.bcust_misc_email1, bus_customers.bcust_misc_moble, business.bsn_id, business.bsn_name, bus_customers.bcust_id, 
		 business_sellers.bs_cdr_ss_link, business_sellers.bs_cdr_cc_link, business_sellers.bs_cdr_hide, business.bsn_status,
		 business_sellers.bs_cdr_cal_linked , business_sellers.bs_cdr_cal_lin_date, business_sellers.bs_cdr_cal_lin_user
		from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where. " 
		group by business_sellers.bs_business_id ";


if($matsql){$userData = $fwDb->query($matsql);}


if(!empty($userData))
{
if (!(isset($pagenum))){ $pagenum = 1; } 
    $rows = count($userData);
    $page_rows = 400;
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
    if($sql2){
        
        $lists= $fwDb->query($sql2); 

	//foreach ($lists as $key => $list) {
//	    $post_id = $list['bsn_id']; $list['ready_email_status'] = "NO";
//	    $sql = "SELECT * FROM wp_events_email_status where project_id = '".$post_id."'";
//        $result = $conn->query($sql);
//        
//        if ($result->num_rows > 0) {
//          // output data of each row
//          while($row = $result->fetch_assoc()) {
//            $email_status = $row["email_status"] ;
//            if( $email_status == 1 ){ $list['ready_email_status'] = "YES"; }
//          }
//        }
//
//		$listsnew[] = $list;
//     }
  }
}

foreach($lists as $k=>$v)
{
   		$status_string = "'".$v['bsn_status']."'";
		$status='';
		
		if(strpos($status_string, '|1|') > 0) { $status .= "Convert<br>" ; }
		if(strpos($status_string, '|2|') > 0) { $status .= "Planning Approvals<br>" ; }	
		if(strpos($status_string, '|3|') > 0) { $status .= "Construction<br>" ; }
		if(strpos($status_string, '|4|') > 0) { $status .= "Complete<br>" ; }
		if(strpos($status_string, '|5|') > 0) { $status .= "Inclusions<br>" ; }
		if(strpos($status_string, '|6|') > 0) { $status .= "Pre-construction<br>" ; }
	    if(strpos($status_string, '|12|') > 0) { $status .= "Design Phase<br>" ; }
		if(strpos($status_string, '|15|') > 0) { $status .= "Lost" ; }
	
	    $link = $BASE_URL. "business.detail/bsn_id/".$v['bs_business_id'];
	
		$lists[$k]['status'] =  $status;
		$lists[$k]['link'] =  $link;
		
		}

//echo "<pre>"; print_r($listsnew);
//$conn->close();

//$fwViewData['list'] = $listsnew;
$fwViewData['list'] = $lists;
$fwViewData['title'] = "Customer Details Report";


$sqlA = "select * from calendar_linked_admin";
$fwViewData['cal_linked'] = $fwDb->query($sqlA);

$sqlB = "select business_sellers.bs_business_id  from business_sellers
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
		WHERE business.bsn_status like '%|3|%' and business_sellers.bs_cdr_hide = 0  group by business_sellers.bs_business_id";
		
$totalC = $fwDb->query($sqlB);

$fwViewData['totalC'] = count($totalC); 

$sqlC = "select business_sellers.bs_business_id  from business_sellers
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
		WHERE business.bsn_status like '%|3|%' and business_sellers.bs_cdr_hide = 0  
		and business_sellers.bs_cdr_cal_linked =  1 group by business_sellers.bs_business_id
		";
		
$totalcl = $fwDb->query($sqlC);

$fwViewData['totalweb'] = count($totalcl); 


