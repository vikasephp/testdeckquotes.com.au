<?php
$fwMainView = 'file:' . getcwd() . '/businessqa_list.tpl';
$pagenum = $fwRequest->getparamget('pagenum','');
$bus_id = $fwRequest->getparamget('bs_id', 0);
if($bus_id > 0){
			
//$sql = "SELECT business_qa.*, business.bsn_id, business.bsn_name, bus_customers.bcust_fname, bus_customers.bcust_lname, users.user_name FROM business_qa
//				LEFT JOIN business ON business_qa.bqa_bsn_id = business.bsn_id
//				LEFT JOIN bus_customers ON bus_customers.bcust_id = business_qa.bqa_cust_id
//				LEFT JOIN users On users.user_id = business_qa.bqa_que_user_id
//				WHERE business_qa.bqa_bsn_id = ".$bus_id. " ORDER BY bus_customers.bcust_id ASC";	
				
$sql = "SELECT business_qa.*, business.bsn_id, business.bsn_name, bus_customers.bcust_fname, bus_customers.bcust_lname, users.user_name FROM business_qa
				LEFT JOIN business ON business_qa.bqa_bsn_id = business.bsn_id
				LEFT JOIN bus_customers ON bus_customers.bcust_id = business_qa.bqa_cust_id
				LEFT JOIN users On users.user_id = business_qa.bqa_que_user_id
				WHERE business_qa.bqa_bsn_id = ".$bus_id . " ORDER BY business_qa.bqa_ans IS NULL DESC, business_qa.bqa_created_date ASC";
									
if($sql){$userData = $fwDb->query($sql);}
$busq = "SELECT business.bsn_id, business.bsn_name FROM business WHERE business.bsn_id = ".$bus_id;
$busData = $fwDb->queryOne($busq);

$_SESSION['expdata'] = $userData;
	if(!empty($userData))
	{
	if (!(isset($pagenum)))
		{$pagenum = 1;} 
	
		$rows = count($userData);
		
		$page_rows = 250;
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
	
	$list_data = $fwDb->query($sql2);
	foreach($list_data as $key => $value)
			{
			$value['bqa_que'] = stripslashes($value['bqa_que']);
			$value['bqa_ans'] = stripslashes($value['bqa_ans']);
			
			$data[] = $value;
			}
	if($sql2){$fwViewData['list']= $data;}
	}
}
$fwViewData['bus_id'] = $bus_id;
$fwViewData['bus_name'] = $busData['bsn_name'];
////////////////////// export to xls ///////////////////////