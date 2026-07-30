<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$listdata = $fwRequest->getParam($TABLE, array());
$table = new Fw_Db_Table('business');

$where = " and bsn_ccf_hide = 0 ";

$hide = $fwRequest->getParam('hide', '');
if($hide)
{
	 $keys_1 = array_keys($hide);
	 $ky_1 = $keys_1[0];
	 $val_1 = $hide[$ky_1];
	 $detail['bsn_ccf_hide'] = $val_1;
	 $table->setWhere("bsn_id = ".$ky_1);
	 if($table->rowExists())
	 {
		 $this_id = $table->updateRow($detail);
	 }	  	
}
 


$app_book = $fwRequest->getParam('app_book', '');
if($app_book)
{
	 $keys_2 = array_keys($app_book);
	 $ky_2 = $keys_2[0];
	 $val_2 = $app_book[$ky_2];
	 $detail['bsn_ccf_app_booked'] = $val_2;
	 $table->setWhere("bsn_id = ".$ky_2);
	 if($table->rowExists())
	 {
		 $this_id = $table->updateRow($detail);
	 }	  	
}
  
 $hidden = $fwRequest->getParam('hidden', '');
 if(!empty($hidden)) {
	$where = " and 1 = 1";	
}
  
$save_mr = $fwRequest->getParam('save_mr', '');
if($save_mr) 
{ 
		if($_FILES['meeting_result']['name'])
		{

			$docfile_12 = $_FILES['meeting_result']['name'];
			$docfile_12 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_12);
			$temp_name_12 = $_FILES['meeting_result']['tmp_name'];
			$irData['bsn_ccf_meet_result'] = $docfile_12;
	
			upload($docfile_12, $temp_name_12);
			
			$bsn_id = $fwRequest->getParam('bsn_id', '');
				
				$table->setWhere('bsn_id = '.$bsn_id);
				if($table->rowExists())
				{
				
					$detail = $table->updateRow($irData);	
				}		
		}	
}

 

  
    
$search = $fwRequest->getParam('search', '');
if(!empty($search))
{
  $search_project = $fwRequest->getParam('project_name', '');

  if($search_project):
 	
       $where .= " AND dc_project  LIKE '%".$search_project."%'  ";
       $_SESSION['search_project'] = $search_project;
       $fwViewData['search_project']=$_SESSION['search_project'];

  elseif($_SESSION['search_project'] && $pagenum > 0):
		
       $where .= " AND dc_project LIKE  '%".$_SESSION['search_project']."%' ";
       $fwViewData['search_project']=$_SESSION['search_project'];
	
  endif;
  
    $_SESSION['where'] = $where; 
}  
   

   
   
$clear = $fwRequest->getParam('clear', '');
if($clear) {
	unset($_SESSION['search_project']);
	unset($_SESSION['search_status']);
	unset($_SESSION['where']);
	unset($search_status);
}

 if(isset($_SESSION['where'])) { $where = $_SESSION['where']; }
 
$ord =  " ORDER BY if( bsn_ccf_handover_date <> ' '
        OR bsn_ccf_handover_date IS NOT NULL , 0, 1 ) , STR_TO_DATE( bsn_ccf_handover_date, '%d-%m-%Y' ) DESC "; 
		
    
//$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where. " ".$ord ;	

$matsql = "SELECT bsn_id, bsn_name, bsn_ccf_handover_date, bsn_ccf_app_booked, bsn_ccf_app_date, bsn_ccf_meet_result, bsn_ccf_hide
           from business where bsn_status like '%|4|%'" . ' '. $where . ' '.$ord ;

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
	
	//$fwViewData['list'] = $listsnew;
  }
}

foreach($listsnew as $k=>$v)
{
	$sq12= "SELECT  business_sellers.bs_business_id,  bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_email1,
         	bus_customers.bcust_misc_moble from business_sellers 		
	 	Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id where business.bsn_name = '".$v['cc_project']."'";  
	
	$data = $fwDb->queryOne($sq12);
	$listsnew[$k]['bcust_fname'] = $data['bcust_fname'];
	$listsnew[$k]['bcust_lname'] = $data['bcust_lname'];
	$listsnew[$k]['bcust_misc_email1'] = $data['bcust_misc_email1'];
	$listsnew[$k]['bcust_misc_moble'] = $data['bcust_misc_moble'];
	
	$dayscount='';
	$hod = changedate_y_m_d($v['bsn_ccf_handover_date']);
		
		if(!empty($hod))
		{
			$curdate_y_m_d = date('y-m-d');
			$dayscount = daysDifference($curdate_y_m_d, $hod);
			
			if($dayscount < 0) {$dayscount = 0; } 
			
		}
	$listsnew[$k]['dayscount'] = $dayscount;
	
}

$fwViewData['list'] = $listsnew;
$fwViewData['title'] = $MODULE_PLURAL;
		