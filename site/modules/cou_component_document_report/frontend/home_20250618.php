<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$table = new Fw_Db_Table('business_sellers');

$fwViewData['ran'] =  rand(100000,999999);
$where = ' where business_sellers.bs_cou_hide = 0';

$unhide = $fwRequest->getParam('unhide', '');
if(!empty($unhide)) {
$where = ' where 1 = 1 ';	
}

$clear_search = $fwRequest->getParam('clear_search', '');
if(!empty($clear_search)) {
	unset($_SESSION['keyword']);
	unset($keyword);
	$fwViewData['keyword']='';
	unset($status);
	unset($_SESSION['status']);
	unset($substatus);	
	unset($_SESSION['substatus']);
}

$status = $fwRequest->getParam('status', '');
if($status):
		$where .= " AND  business.bsn_status LIKE '%|".$status."|%'";
        $_SESSION['status'] = $status;
elseif($_SESSION['status']):
		$where .= " AND business.bsn_status LIKE '%|".$_SESSION['status']."|%' ";	
endif;



$substatus = $fwRequest->getParam('substatus', '');
if($substatus):
		$where .= " AND  business_sellers.bs_cou_sub_status = ".$substatus;
        $_SESSION['substatus'] = $substatus;
elseif($_SESSION['substatus']):
		$where .= " AND business_sellers.bs_cou_sub_status = ".$_SESSION['substatus'];	
endif;

$save_weekly = $fwRequest->getParam('save_weekly', '');
if($save_weekly) 
{ 
		if($_FILES['weekly']['name'])
		{

			$docfile_12 = $_FILES['weekly']['name'];
			$docfile_12 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_12);
			$temp_name_12 = $_FILES['weekly']['tmp_name'];
			$clData['bs_cou_weekly'] = $docfile_12;
			
			$clData['bs_cou_weekly_user'] = $_SESSION['user']['user_name'];
			$clData['bs_cou_weekly_date'] = date('d-m-Y');
			
			upload($docfile_12, $temp_name_12);
			
			$bs_business_id = $fwRequest->getParam('bs_business_id', '');
				
				$table->setWhere('bs_business_id = '.$bs_business_id);
				if($table->rowExists())
				{
				
					$detail = $table->updateRow($clData);	
				}		
		}	
}

///

$save_compliance = $fwRequest->getParam('save_compliance', '');
if($save_compliance) 
{ 
		if($_FILES['compliance']['name'])
		{

			$docfile_15 = $_FILES['compliance']['name'];
			$docfile_15 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_15);
			$temp_name_15 = $_FILES['compliance']['tmp_name'];
			$comData['bs_cou_comp_advice'] = $docfile_15;
			
			$comData['bs_cou_comp_user'] = $_SESSION['user']['user_name'];
			$comData['bs_cou_comp_date'] = date('d-m-Y');
			
			upload($docfile_15, $temp_name_15);
			
			$bs_business_id = $fwRequest->getParam('bs_business_id', '');
				
				$table->setWhere('bs_business_id = '.$bs_business_id);
				if($table->rowExists())
				{
				
					$detail = $table->updateRow($comData);	
				}		
		}	
}


$ord=' order by business_sellers.bs_cou_sub_status DESC';

$sub_status = $fwRequest->getParam('sub_status', '');
if(!empty($sub_status)) {
 	 $keys_1 = array_keys($sub_status);
	 $ky_1 = $keys_1[0];
	 $val_1 = $sub_status[$ky_1];
	 $detail['bs_cou_sub_status'] = $val_1;
	 $detail['bs_cou_sub_sta_date'] = date('d-m-Y');
	  
	  $table->setWhere("bs_business_id = ".$ky_1);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	
}


$user = $_SESSION['user']['user_name'];
$dt = date('d-m-Y');


$rem_war = $fwRequest->getParam('rem_war', '');
if($rem_war)
{
	 $keys_3 = array_keys($rem_war);
	 $ky_3 = $keys_3[0];
	 $val_3 = $rem_war[$ky_3];
	 $detail['bs_cou_remove_warranty'] = $val_3;
	  
	 $table->setWhere("bs_business_id = ".$ky_3);
	 if($table->rowExists())
	 {
	      $this_id = $table->updateRow($detail);
	 }	  	
}


$hide = $fwRequest->getParam('hide', '');
if($hide)
{
	 $keys_3 = array_keys($hide);
	 $ky_3 = $keys_3[0];
	 $val_3 = $hide[$ky_3];
	
	  $detail['bs_cou_hide'] = $val_3;
	  
	  $table->setWhere("bs_business_id = ".$ky_3);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}

$application = $fwRequest->getParam('application', '');
if($application)
{
	 $keys_2 = array_keys($application);
	 $ky_2 = $keys_2[0];
	 $val_2 = $application[$ky_2];
	
	  $detail['bs_cou_application'] = $val_2;
	  $detail['bs_cou_appl_user'] = $user;
	  $detail['bs_cou_appl_date'] = $dt;
	  
	  $table->setWhere("bs_business_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}


$letter_tobe = $fwRequest->getParam('letter_tobe', '');
if($letter_tobe)
{
	 $keys_3 = array_keys($letter_tobe);
	 $ky_3 = $keys_3[0];
	 $val_3 = $letter_tobe[$ky_3];
	
	  $detail['bs_cou_letter_tobe'] = $val_3;
	  
	  $table->setWhere("bs_business_id = ".$ky_3);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}

$occupancy = $fwRequest->getParam('occupancy', '');
if($occupancy)
{
	 $keys_3 = array_keys($occupancy);
	 $ky_3 = $keys_3[0];
	 $val_3 = $occupancy[$ky_3];
	
	  $detail['bs_cou_cust_occupancy'] = $val_3;
	  
	  $table->setWhere("bs_business_id = ".$ky_3);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}

$keyword = $fwRequest->getParam('keyword', '');
if($keyword):
		$where .= " AND  business.bsn_name LIKE '%".$keyword."%'";
            	
	    $_SESSION['keyword'] = $keyword;
	    //$fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword']):

		$where .= " AND business.bsn_name LIKE '%".$_SESSION['keyword']."%' ";	
       // $fwViewData['keyword']=$_SESSION['keyword'];
endif;

$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status, business.bsn_address, bus_customers.bcust_id,
	    business_sellers.bs_cou_traffic_light, business_sellers.bs_cou_application, business_sellers.bs_cou_appl_user,
	    business_sellers.bs_cou_appl_date, business_sellers.bs_cou_hide, business_sellers.bs_cou_sub_status, business.bsn_cd_block,
	    business.bsn_cd_section , business_sellers.bs_cou_remove_warranty, business_sellers.bs_cou_notes, business_sellers.bs_cou_notes_user, 
		business_sellers.bs_cou_notes_date, business_sellers.bs_cou_sub_sta_date, business_sellers.bs_what_is_holding, business_sellers.bs_holding_user,
		business_sellers.bs_holding_date, business_sellers.bs_cou_weekly, business_sellers.bs_cou_weekly_user, business_sellers.bs_cou_weekly_date,
		business_sellers.bs_cou_letter_tobe, business_sellers.bs_cou_letter_text, business_sellers.bs_cou_letter_text_date, 
		business_sellers.bs_cou_comp_advice, business_sellers.bs_cou_comp_user, business_sellers.bs_cou_comp_date, business_sellers.bs_cou_cust_occupancy,
		business_sellers.bs_cou_letter_text_user, business_sellers.bs_cou_tl_user, business_sellers.bs_cou_tl_date
	    from business_sellers 		
	    Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	    Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where. " 
	    And   business.bsn_status like '%|3|%' 
	    Group By business.bsn_id " .$ord ;


if($sql){$userData = $fwDb->query($sql);}
$total2 = sizeof($userData);
$fwViewData['active'] =  $total2;

$fwViewData['total'] = sizeof($userData);

if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

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

if($sql2)
{  

 $setdata2 = $fwDb->query($sql2);
 
foreach($setdata2 as $k => $v)
{
		
		$status_string = "'".$v['bsn_status']."'";
		$status='';
		
		//if(strpos($status_string, '|3|') > 0) { $status .= "Construction<br>" ; }
	
		if(strpos($status_string, '|1|') > 0) { $status .= "Convert<br>" ; }
		if(strpos($status_string, '|2|') > 0) { $status .= "Planning Approvals<br>" ; }	
		if(strpos($status_string, '|3|') > 0) { $status .= "Construction<br>" ; }
		if(strpos($status_string, '|4|') > 0) { $status .= "Complete<br>" ; }
		if(strpos($status_string, '|5|') > 0) { $status .= "Inclusions<br>" ; }
		if(strpos($status_string, '|6|') > 0) { $status .= "Pre-construction<br>" ; }
	    if(strpos($status_string, '|12|') > 0) { $status .= "Design Phase<br>" ; }
		if(strpos($status_string, '|15|') > 0) { $status .= "Lost" ; }
		
		
		$sql155 = "Select document_check_list.doc_file_name , document_check_list.doc_not_required from document_check_list
			 where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 155";
		$data155 = $fwDb->queryOne($sql155);
		
		$sql295 = "Select document_check_list.doc_file_name ,document_check_list.doc_not_required from document_check_list
			   where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 295";
		$data295 = $fwDb->queryOne($sql295);
		
		$sql413 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required  from document_check_list
			   where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 413";
		$data413 = $fwDb->queryOne($sql413);
		
		$sql156 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			   where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 156";
		$data156 = $fwDb->queryOne($sql156);

		$sql289 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			   where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 289";
		$data289 = $fwDb->queryOne($sql289);
		
		$sql173 = "Select document_check_list.doc_file_name, document_check_list.doc_date_uploaded from document_check_list
			   where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 173";
		$data173 = $fwDb->queryOne($sql173);
			
		$sql162 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			   where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 162";
		$data162 = $fwDb->queryOne($sql162);

		$sql163 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			   where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 163";
		$data163 = $fwDb->queryOne($sql163);

		$sql296 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			   where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 296";
		$data296 = $fwDb->queryOne($sql296);

		$sql167 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			   where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 167";
		$data167 = $fwDb->queryOne($sql167);

		$sql294 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			   where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 294";
		$data294 = $fwDb->queryOne($sql294);
		
		$sql172 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			   where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 172";
		$data172 = $fwDb->queryOne($sql172);

		
		$sql261 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			   where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 261";
		$data261 = $fwDb->queryOne($sql261);
		
		
		$sql274 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			   where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 274";
		$data274 = $fwDb->queryOne($sql274);
		
		$sql169 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			   where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 169";
		$data169 = $fwDb->queryOne($sql169);

		$sql152 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			   where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 152";
		$data152 = $fwDb->queryOne($sql152);
		
		$sql231 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			   where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 231";
		$data231 = $fwDb->queryOne($sql231);
		
		$sql491 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			   where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 491";
		$data491 = $fwDb->queryOne($sql491);
		
		$sql149 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			   where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 149";
		$data149 = $fwDb->queryOne($sql149);
		
		$sql232 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			       where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 232";
		$data232 = $fwDb->queryOne($sql232);
		
		$sql235 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required from document_check_list
			       where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 235";
		$data235 = $fwDb->queryOne($sql235);
		
		
		$sql64 = "Select document_check_list.doc_date_uploaded from document_check_list
			       where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 64";
		$data64 = $fwDb->queryOne($sql64);
		
		
		$sql691 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required  from document_check_list
			       where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 691";
		$data691 = $fwDb->queryOne($sql691);
		
		
		$sql637 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required  from document_check_list
			       where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 637";
		$data637 = $fwDb->queryOne($sql637);
		
		$sql735 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required  from document_check_list
			       where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 735";
		$data735 = $fwDb->queryOne($sql735);
		
		$sql736 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required  from document_check_list
			       where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 736";
		$data736 = $fwDb->queryOne($sql736);
		
		$sql737 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required  from document_check_list
			       where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 737";
		$data737 = $fwDb->queryOne($sql737);
		
		$sql738 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required  from document_check_list
			       where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 738";
		$data738 = $fwDb->queryOne($sql738);
		
		$sql713 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required  from document_check_list
			       where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 713";
		$data713 = $fwDb->queryOne($sql713);
		
		$sql714 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required  from document_check_list
			       where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 714";
		$data714 = $fwDb->queryOne($sql714);
		
		
		$sql626 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required  from document_check_list
			       where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 626";
		$data626 = $fwDb->queryOne($sql626);
		
		$sql739 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required  from document_check_list
			       where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 739";
		$data739 = $fwDb->queryOne($sql739);
		
		$sql749 = "Select document_check_list.doc_file_name, document_check_list.doc_not_required  from document_check_list
			       where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 749";
		$data749 = $fwDb->queryOne($sql749);
		
		$dt = changedate_d_m_y($data64['doc_date_uploaded']);
		
		$dayscount='';
		if(!empty($dt))
		{
			$currdt = date('Y-m-d');
			$dayscount = daysDifference($currdt, $dt);
		}

		
		$link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$v['bsn_id'];	
		
		$setdata2[$k]['bsn_id'] = $v['bsn_id'];
		$setdata2[$k]['bs_business_id'] = $v['bs_business_id'];
		$setdata2[$k]['bs_customers_id'] = $v['bs_customers_id'];
		$setdata2[$k]['bcust_id'] = $v['bcust_id'];
		$setdata2[$k]['bsn_address'] = $v['bsn_address'];
		$setdata2[$k]['bs_cou_application'] = $v['bs_cou_application'];
		$setdata2[$k]['link'] = $link;
		$setdata2[$k]['bs_cou_remove_warranty'] = $v['bs_cou_remove_warranty'];
		$setdata2[$k]['bs_cou_notes'] = $v['bs_cou_notes'];
		
		//$setdata2[$k]['doc_date_uploaded'] = changedate_d_m_y($data['doc_date_uploaded']);
		$setdata2[$k]['status'] = $status;
		$setdata2[$k]['doc_file_name_155'] = $data155['doc_file_name'];
		$setdata2[$k]['doc_file_name_295'] = $data295['doc_file_name'];
		$setdata2[$k]['doc_file_name_413'] = $data413['doc_file_name'];
		$setdata2[$k]['doc_file_name_156'] = $data156['doc_file_name'];
		$setdata2[$k]['doc_file_name_289'] = $data289['doc_file_name'];
		//$setdata2[$k]['doc_file_name_158'] = $data158['doc_file_name'];
		$setdata2[$k]['doc_file_name_162'] = $data162['doc_file_name'];
		$setdata2[$k]['doc_file_name_163'] = $data163['doc_file_name'];
		$setdata2[$k]['doc_file_name_296'] = $data296['doc_file_name'];
		$setdata2[$k]['doc_file_name_167'] = $data167['doc_file_name'];
		$setdata2[$k]['doc_file_name_294'] = $data294['doc_file_name'];
		$setdata2[$k]['doc_file_name_172'] = $data172['doc_file_name'];
		$setdata2[$k]['doc_file_name_261'] = $data261['doc_file_name'];
		$setdata2[$k]['doc_file_name_274'] = $data274['doc_file_name'];
		$setdata2[$k]['doc_file_name_169'] = $data169['doc_file_name'];
		$setdata2[$k]['doc_file_name_152'] = $data152['doc_file_name'];
		$setdata2[$k]['doc_file_name_231'] = $data231['doc_file_name'];
		$setdata2[$k]['doc_file_name_491'] = $data491['doc_file_name'];
		$setdata2[$k]['doc_file_name_149'] = $data149['doc_file_name'];
		$setdata2[$k]['doc_file_name_691'] = $data691['doc_file_name'];
		$setdata2[$k]['doc_file_name_637'] = $data637['doc_file_name'];
		$setdata2[$k]['doc_file_name_735'] = $data735['doc_file_name'];
		$setdata2[$k]['doc_file_name_736'] = $data736['doc_file_name'];
		
		$setdata2[$k]['doc_file_name_737'] = $data737['doc_file_name'];
		$setdata2[$k]['doc_file_name_738'] = $data738['doc_file_name'];
		$setdata2[$k]['doc_file_name_713'] = $data713['doc_file_name'];
		$setdata2[$k]['doc_file_name_714'] = $data714['doc_file_name'];
		
		$setdata2[$k]['doc_file_name_626'] = $data626['doc_file_name'];
		
		$setdata2[$k]['doc_not_required_155'] = $data155['doc_not_required'];
		$setdata2[$k]['doc_not_required_295'] = $data295['doc_not_required'];
		$setdata2[$k]['doc_not_required_413'] = $data413['doc_not_required'];
		$setdata2[$k]['doc_not_required_156'] = $data156['doc_not_required'];
		$setdata2[$k]['doc_not_required_289'] = $data289['doc_not_required'];
		//$setdata2[$k]['doc_not_required_158'] = $data158['doc_not_required'];
		$setdata2[$k]['doc_not_required_162'] = $data162['doc_not_required'];
		$setdata2[$k]['doc_not_required_163'] = $data163['doc_not_required'];
		$setdata2[$k]['doc_not_required_296'] = $data296['doc_not_required'];
		$setdata2[$k]['doc_not_required_167'] = $data167['doc_not_required'];
		$setdata2[$k]['doc_not_required_294'] = $data294['doc_not_required'];
		$setdata2[$k]['doc_not_required_172'] = $data172['doc_not_required'];
		$setdata2[$k]['doc_not_required_261'] = $data261['doc_not_required'];
		$setdata2[$k]['doc_not_required_274'] = $data274['doc_not_required'];
		$setdata2[$k]['doc_not_required_169'] = $data169['doc_not_required'];
		$setdata2[$k]['doc_not_required_152'] = $data152['doc_not_required'];
		$setdata2[$k]['doc_not_required_231'] = $data231['doc_not_required'];
		$setdata2[$k]['doc_not_required_491'] = $data491['doc_not_required'];
		$setdata2[$k]['doc_not_required_149'] = $data149['doc_not_required'];
		$setdata2[$k]['doc_not_required_691'] = $data691['doc_not_required'];
		$setdata2[$k]['doc_not_required_637'] = $data637['doc_not_required'];
		$setdata2[$k]['doc_not_required_735'] = $data735['doc_not_required'];
		
		$setdata2[$k]['doc_not_required_736'] = $data736['doc_not_required'];
		
		$setdata2[$k]['doc_not_required_737'] = $data737['doc_not_required'];
		$setdata2[$k]['doc_not_required_738'] = $data738['doc_not_required'];
		
		$setdata2[$k]['doc_not_required_713'] = $data713['doc_not_required'];
		
		$setdata2[$k]['doc_not_required_714'] = $data714['doc_not_required'];
		
		$setdata2[$k]['doc_file_name_232'] = $data232['doc_file_name'];
		$setdata2[$k]['doc_not_required_232'] = $data232['doc_not_required'];
		
		$setdata2[$k]['doc_file_name_235'] = $data235['doc_file_name'];
		$setdata2[$k]['doc_not_required_235'] = $data235['doc_not_required'];
		
		$setdata2[$k]['doc_not_required_626'] = $data626['doc_not_required'];
		
		$setdata2[$k]['doc_file_name_173'] = $data173['doc_file_name'];
		$setdata2[$k]['doc_date_uploaded_173'] = changedate_d_m_y($data173['doc_date_uploaded']);
		
		$setdata2[$k]['doc_file_name_739'] = $data739['doc_file_name'];
		$setdata2[$k]['doc_not_required_739'] = $data739['doc_not_required'];
		
		$setdata2[$k]['doc_file_name_749'] = $data749['doc_file_name'];
		$setdata2[$k]['doc_not_required_749'] = $data749['doc_not_required'];
		
		$setdata2[$k]['status'] = $status;
		$setdata2[$k]['dayscount'] = $dayscount;
						
}
 
 	$filter_comp = $fwRequest->getParam('filter_comp', '');
	if(!empty($filter_comp)) {
		foreach($setdata2 as $m1 => $s1)
		{
			$pos = strpos($s1['status'] , 'Complete' ,0 ) ;
			if(!is_numeric($pos)) {
				unset($setdata2[$m1]);	 
			}
		}
	}
	
	$filter_const = $fwRequest->getParam('filter_const', '');
	if(!empty($filter_const)) {
		foreach($setdata2 as $m1 => $s1)
		{
			$pos = strpos($s1['status'] , 'Construction' ,0 ) ;
			if(!is_numeric($pos)) {
				unset($setdata2[$m1]);	 
			}
		}
	}
	
 
 	//function array_sort_by_column(&$arr, $col, $dir = SORT_DESC) {
//	    $sort_col = array();
//	    foreach ($arr as $key => $row) {
//		$sort_col[$key] = $row[$col];
//	    }
//	
//	    array_multisort($sort_col, $dir, $arr);
//	}
//
//       array_sort_by_column($setdata2, 'doc_file_name_172');
 
  	$fwViewData['list'] =  $setdata2;
			
 }
}

$sqlst = "select * from cou_comp_status";
$fwViewData['statusData'] = $fwDb->query($sqlst);

$sql_lt = "select * from letter_text_cou";
$fwViewData['letterData'] = $fwDb->query($sql_lt);

$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "COU Component Document Report";


 
$submit = $fwRequest->getParam('print', '');
if(!empty($submit))
{
 	
	$heading = "COU Component Document Report";
 
 	$html = '';	
	$html .= '<table border="1" width="98%" cellpadding="7">';
	$last_key = end(array_keys($setdata2));
		
	set_time_limit(0);
	ini_set('memory_limit', '2048M');
	foreach($setdata2 as $lk => $lv)
	{
		
		if($lv['bs_cou_letter_tobe'] == 1) { $tobe = "Yes" ; } else {$tobe = 'No'; }
 		
		$sqlst = "select st_option from cou_comp_status where st_id = ".$lv['bs_cou_sub_status'];
		$stdata = $fwDb->queryOne($sqlst);
		
		$html .= '<tr><td style="width:35%;">Project Address</td><td style="width:65%;">'.$lv["bsn_name"].'</td></tr>';
		
		$html .= '<tr><td>Block</td><td>'.$lv["bsn_cd_block"].'</td></tr>';
		$html .= '<tr><td>Section</td><td>'.$lv["bsn_cd_section"].'</td></tr>';
	
		$html .= '<tr><td>Status</td><td>'.$lv["status"].'</td></tr>';
		$html .= '<tr><td>Sub Status</td><td>'.$stdata['st_option'].'</td></tr>';
		$html .= '<tr><td>What is holding up your COO</td><td>'.$lv["bs_what_is_holding"].'</td></tr>';
		$html .= '<tr><td>Weekly Letter </td><td>'.$tobe.'</td></tr>';
		$html .= '<tr><td>Notes </td><td>'.$lv['bs_cou_notes'].'</td></tr>';
		
		
		if ($lk <> $last_key) {
			
			$html .= '<br pagebreak="true" />';
		}
	}
	$html .= '</table>';	
	
	create_cou_report($heading,$html);
		
}



$sqlst = "select * from busness_status";
$fwViewData['stfilter'] = $fwDb->query($sqlst);
