<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$listdata = $fwRequest->getParam($TABLE, array());
$table_dt = new Fw_Db_Table('designer_tracker');
$keyword = $listdata['keyword'];
$keyword2 = $listdata['keyword2'];
$user_name= $_SESSION['user']['user_name'];


$where = " Where dt_assignee like  '%".$user_name."%' OR dt_cust_designer like '%".$user_name."%'";

$hidecomplete = $fwRequest->getParam('hidecomplete', '');
if(!empty($hidecomplete))
{
	$where = " Where (dt_assignee like  '%".$user_name."%' OR dt_cust_designer like '%".$user_name."%') AND dt_complete = 1 ";
	$fwViewData['val'] = 1;			
} else {
	$where = "  Where dt_assignee like  '%".$user_name."%' OR dt_cust_designer like '%".$user_name."%' ";
}



$table_toplink = new Fw_Db_Table('top_links');

$update_link = $fwRequest->getParam('update_link', '');
if(!empty($update_link)){
	$proc = $fwRequest->getParam('proc', '');
        $tlDetail['tl_link'] = $proc;

	$table_toplink->setWhere("tl_slug = 'designer_tracker'");
	$table_toplink->updateRow($tlDetail);

}

// Complete starts


$completed = $fwRequest->getParam('completed', '');
if($completed)
{
	 $keys_2 = array_keys($completed);
	 $ky_2 = $keys_2[0];
	 $val_2 = $completed[$ky_2];
	
	  $detail['dt_complete'] = $val_2;
	  $table_dt->setWhere("dt_id = ".$ky_2);
	  if($table_dt->rowExists())
	  {
		 $this_id = $table_dt->updateRow($detail);
	  }	  	
}

// Complete Ends

if($keyword):

	$where .= "AND designer_tracker.dt_checklist_no LIKE '%".$keyword."%' OR designer_tracker.dt_assignee LIKE '%".$keyword."%' OR 
		   designer_tracker.dt_cust_designer LIKE '%".$keyword."%'   ";
		
		  $_SESSION['keyword'] = $keyword;
		  $fwViewData['keyword']=$_SESSION['keyword'];
	
	elseif($_SESSION['keyword'] && $pagenum > 0):
	
	$where .= "AND designer_tracker.dt_checklist_no LIKE '%".$_SESSION['keyword']."%'
	           OR designer_tracker.dt_assignee LIKE '%".$_SESSION['keyword']."%' 
		   OR designer_tracker.dt_cust_designer LIKE '%".$_SESSION['keyword']."%' ";	
		
		$fwViewData['keyword']=$_SESSION['keyword'];
endif; 
  
$matsql = "SELECT * from designer_tracker ".$where;	

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

if($listsnew)
{

foreach($listsnew as $k => $v2)
{

   $sql_b = "select dpn_bsn_id from document_proposal_name where dpn_unique_id = '".$v2['dt_checklist_no']."'";
   $ppt = $fwDb->queryOne($sql_b);
   
   $bsn_id =  $ppt['dpn_bsn_id'];
   
   if(empty($bsn_id)) {
	 $sql_b = "select dpn_bsn_id from document_renovation_name where dpn_unique_id = '".$v2['dt_checklist_no']."'";
   $ppt = $fwDb->queryOne($sql_b);
   
   $bsn_id =  $ppt['dpn_bsn_id'];   
   }
   
   
    if(!empty($keyword2)) { 
   $sq12 = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
           bus_customers.bcust_misc_moble, business.bsn_name
	   from business_sellers 		
	   Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	   Inner Join business ON business_sellers.bs_business_id = business.bsn_id where business.bsn_id = " .$bsn_id
	   . " And business.bsn_name like '%".$keyword2."%'"; 
   } else {
	 
    $sq12 = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname,
	    bus_customers.bcust_lname, bus_customers.bcust_misc_moble, business.bsn_name
	    from business_sellers 		
	    Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	    Inner Join business ON business_sellers.bs_business_id = business.bsn_id where business.bsn_id = " .$bsn_id ;
   }

   
   //$sq12= "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
//           bus_customers.bcust_misc_moble, business.bsn_name
//	   from business_sellers 		
//	   Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
//	   Inner Join business ON business_sellers.bs_business_id = business.bsn_id where business.bsn_id = " .$bsn_id;  
	
	  $data = $fwDb->queryOne($sq12);
 	
	
	$Statusdate = changedate_y_m_d($v2['dt_date_submitted']);
		
		if(!empty($Statusdate))
		{
			$curdate_y_m_d = date('Y-m-d');
			$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
		}
	
	$sql_outs = "Select count(*) as out_c from task_designer_tracker where tdt_dt_id 	 = ".$v2['dt_id']. " AND tdt_status <> 'COMPLETE' ";
	$outdata = $fwDb->queryOne($sql_outs);
	 
	  if(!empty($data['bsn_name']) ) {
		 $setdata2[$k]['dt_id'] = $v2['dt_id'];
		 $setdata2[$k]['dt_project_name'] = $data['bsn_name'];
		 $setdata2[$k]['dt_checklist_no'] = $v2['dt_checklist_no'];
		 $setdata2[$k]['dt_status'] = $v2['dt_status'];
		 $setdata2[$k]['bcust_fname'] = $data['bcust_fname'];
		 $setdata2[$k]['bcust_lname'] = $data['bcust_lname'];
		 $setdata2[$k]['dt_date_submitted'] = changedate_d_m_y($v2['dt_date_submitted']);
		 $setdata2[$k]['dt_due_date'] = $v2['dt_due_date'];
		 $setdata2[$k]['day_open'] = $dayscount;
		 $setdata2[$k]['dt_cust_designer'] = $v2['dt_cust_designer'];
		 $setdata2[$k]['dt_assignee'] = $v2['dt_assignee'];
		 $setdata2[$k]['o_task'] = $outdata['out_c'];
		 $setdata2[$k]['count'] = count($chknodata);
		 $setdata2[$k]['dt_priority'] = $v2['dt_priority'];
		 $setdata2[$k]['dt_complete'] = $v2['dt_complete'];
	  }
	 
}
}
$fwViewData['list'] = $setdata2;
$fwViewData['title'] = $MODULE_PLURAL;
$table_toplink->setWhere("tl_slug = 'designer_tracker'");
$fwViewData['proc_detail'] = $table_toplink->getRow();

$sqlpr = "Select * from design_tracker_priority";
$fwViewData['prdetail'] = $fwDb->query($sqlpr); 