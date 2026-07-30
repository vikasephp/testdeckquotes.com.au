<?php
$fwMainView = 'file:' . getcwd() . '/businessematches_list.tpl';
$pagenum = $fwRequest->
getparamget('pagenum','');
$bsn_id = $fwRequest->getparamget('bsn_id',0);
$fwViewData['bsn_id'] = $bsn_id;
$table = new Fw_Db_Table($TABLE);
$export = $fwRequest->getParam('export', 0);
$bprice = $fwRequest->getParam('bprice','');
$bsearch = $fwRequest->getParam('bsearch','');


$search = $fwRequest->getParam('search', '');

if($search){unset($_SESSION['search_data']);}
if(empty($bprice) && empty($pagenum) && empty($bsearch)){unset($_SESSION['search_data']);}

if($_SESSION['search_data']['bsearch'] && empty($bsearch)){ $bsearch = $_SESSION['search_data']['bsearch'];}
if($_SESSION['search_data']['bprice'] && empty($bprice)){ $bprice = $_SESSION['search_data']['bprice'];}

if($bsearch){ $bsq = "(byer_matches.bm_description LIKE '%".trim($bsearch)."%' OR byer_matches.bm_note LIKE '%".trim($bsearch)."%')";}
if($bprice){ $psq = "byer_matches.bm_from_price <= '".$bprice."' AND byer_matches.bm_to_price >= '".$bprice."'";
 $bsq = " AND ".$bsq;
}

if($bsn_id > 0){

	if($psq || $bsq)
		{
	$sql = "SELECT byer_matches.*, bus_customers.bcust_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
	        bus_customers.bcust_misc_email1,bus_customers.bcust_misc_email2, bus_customers.bcust_gendec_sent_date 
			FROM byer_matches
			LEFT JOIN bus_customers ON byer_matches.bm_cust_id = bus_customers.bcust_id 
			WHERE ".$psq.$bsq;
		}else{
			$bsn_sql = "SELECT bsn_interest, bsn_suburb_id, bsn_state FROM business WHERE bsn_id = ".$bsn_id;
			$busdata = 	$fwDb->queryOne($bsn_sql);
			$bsnintrest = trim($busdata['bsn_interest']);
			$bsnstate = trim($busdata['bsn_state']);
			
			
			$statesql = "SELECT s_id, s_postal_code, s_district FROM states WHERE s_shortcodes = '".$bsnstate."'";
			$statedata = $fwDb->queryOne($statesql);
			$state_id = $statedata['s_id'];
	
	
	$sql = "SELECT byer_matches.*, bus_customers.bcust_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
	        bus_customers.bcust_misc_email1,bus_customers.bcust_misc_email2, bus_customers.bcust_gendec_sent_date 
			FROM byer_matches
			LEFT JOIN bus_customers ON byer_matches.bm_cust_id = bus_customers.bcust_id
			WHERE byer_matches.bm_interest LIKE '%/".$bsnintrest."/%' OR byer_matches.bm_states LIKE '%/".$state_id."/%'";
		}								
$userData = $fwDb->query($sql);
if($sql){$userData = $fwDb->query($sql);}
$_SESSION['sql'] = $sql;

$_SESSION['search_data']['bprice'] = $bprice;
$_SESSION['search_data']['bsearch'] = $bsearch;
	if(!empty($userData))
	{
	if (!(isset($pagenum)))
		{
			$pagenum = 1;
		} 
	
		$rows = count($userData);
		
		$page_rows = 2;
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
		
		$sql2 =  $sql." ".$max;
	
	
		if($sql2){$fwViewData['list']= $fwDb->query($sql2);}
		$filterdata = $fwDb->query($sql2);
		
		if($filterdata)
			{
				foreach($filterdata as $k => $v)
						{
							
							$ints = explode("/", $v['bm_interest']);
							$state = explode("/", $v['bm_states']);
						if($ints)	
							{	
								$in = " WHERE bi_id IN (";
								foreach($ints as $k1 => $v1){if($v1){$in .=$v1.", ";}}
								$ins = rtrim($in, ", ");
								$ins .=")";	
								$intsnamesql = "SELECT bi_title FROM business_interest ".$ins;	
								$intsnames = $fwDb->query($intsnamesql);
								if($intsnames){foreach($intsnames as $k2 => $v2){$intnames .= $v2['bi_title']."<br>";}}
								$v['intrests'] = $intnames;		
							}
				
						if($state)
							{
								$states1 = " WHERE s_id IN (";
								foreach($state as $k1 => $v1){if($v1){$states1 .=$v1.", ";}}
								$states2 = rtrim($states1, ", ");
								$states2 .=")";	
								$statesql = "SELECT s_name,s_shortcodes FROM states ".$states2;
								$statenames = $fwDb->query($statesql);						
								if($statenames){foreach($statenames as $k2 => $v2){$stnames .= $v2['s_shortcodes']."<br>";}}
								$v['states'] = $stnames;			
							}
									
				$newdata[] = $v;				
				unset($intsnames);	
				unset($stnames);				
						}
			}
	
		
		$fwViewData['list'] = $newdata;

      }
	  else{$fwViewData['message'] = "Recard not found.";}
	
	$fwViewData['bprice'] = $_SESSION['search_data']['bprice']; 
	$fwViewData['bsearch'] = $_SESSION['search_data']['bsearch'];  
	}



/*if($bsn_id > 0 )
	{
	$sql_surform = "SELECT business.bsn_interest, business.bsn_suburb, business.bsn_state, business.bsn_pcode, business_interest.bi_title FROM business LEFT JOIN business_interest ON business_interest.bi_id = business.bsn_interest 
					WHERE business.bsn_id = ".$bsn_id;
	$busdata = $fwDb->queryOne($sql_surform);

	if($busdata)
		{
		$para = 'Yes';
		$sql_surform = "SELECT * FROM survey_data WHERE (res_column_name REGEXP '".$busdata['bi_title']."' OR res_column_value REGEXP '".$busdata['bsn_state']."' OR res_column_value REGEXP '".$busdata['bsn_suburb']."') AND res_column_value != '' GROUP BY res_respondent_id";

		$listdata = $fwDb->query($sql_surform);
	

		if($listdata)
			{
				foreach($listdata as $k => $v)	
						{
							$sql = "SELECT * from survey_data WHERE res_respondent_id = ".$v['res_respondent_id'];		
							$buyerdata = $fwDb->query($sql);	
							
							if($buyerdata)
								{
									foreach($buyerdata as $k1 => $v1)
											{
											if($v1['res_column_value'])
												{
												$data[replace_string($v1['res_column_name'])] = $v1['res_column_value'];
												
												}
											}
								}
						$sdata[] = $data;					
					
						}
			}
		

		
		
		
		}
	
	}
	$fwViewData['sdata'] = $sdata;
	//DB($fwViewData['sdata']);

	
//DB($fwViewData['list']);*/