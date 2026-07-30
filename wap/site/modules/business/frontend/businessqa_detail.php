<?php
$fwMainView = 'file:' . getcwd() . '/businessqa_detail.tpl';
$tableqa = new Fw_Db_Table('business_qa');
$user_id = $_SESSION['user']['user_id'];
$bsn_id = $fwRequest->getParam('bsn_id', '');
$bqa_id = $fwRequest->getParam('bqa_id', '');
if($bsn_id){
$sql3="SELECT business.bsn_id, business.bsn_name FROM business WHERE business.bsn_id = ".$bsn_id;
$data= $fwDb->queryOne($sql3);
$fwViewData['business_name'] = $data['bsn_name'];
$fwViewData['bsn_id'] = $data['bsn_id'];
}

$fwViewData['qabutton'] = "Add";
$submit = $fwRequest->getParam('add_QA', '');

if($submit)
{
 	$detail = $fwRequest->getParam($TABLE, array());
 
	$table_id =  (int)$detail['bqa_id'];
	//$detail['bqa_que'] = htmlentities(addslashes($detail['bqa_que']));
	//$detail['bqa_ans'] = htmlentities(addslashes($detail['bqa_ans']));
			
	if($detail['bqa_status']){$detail['bqa_status'] = 1;}else{$detail['bqa_status'] = 0;}
	//if($detail['bqa_ans']){$detail['bqa_ans_date'] = date("Y-m-d H:i:s"); $detail['bqa_ans_user_id'] = $user_id; }
	
					unset($detail['bqa_id']);
						if($table_id > 0)
						{
							$tableqa->setWhere("bqa_id=".$table_id);
							$detail['bqa_ans_plain'] = trim(strip_tags($detail['bqa_ans']));
							
							 if(!empty($detail['bqa_ans_plain'])) {
								 $detail['bqa_ans_date'] = date("Y-m-d H:i:s");
								 $detail['bqa_ans_user_id'] = $user_id;
						     }
							
							$id= $tableqa->updateRow($detail);
						}
						else
						{	
						
						 $usql = "SELECT bqa_unique_id from business_qa order by bqa_id DESC limit 1"; 
						 $udata = $fwDb->queryOne($usql);
						 $detail['bqa_que_user_id']=$user_id; 
					 	 $detail['bqa_ans_plain'] = trim(strip_tags($detail['bqa_ans']));
						 
							 if(!empty($detail['bqa_ans_plain'])) {
								 $detail['bqa_ans_date'] = date("Y-m-d H:i:s");
								 $detail['bqa_ans_user_id'] = $user_id;
							 }
						 
						 $id = $tableqa->insertRow($detail);
						 
						 $udata['bqa_unique_id'] = $udata['bqa_unique_id'] + 1;
						 $tableqa->setWhere("bqa_id=".$id);
						 $id1= $tableqa->updateRow($udata);
						}
					 
					if(trim($detail['bqa_ans']))
						{	
						//send_vender_email_qa($detail['bqa_bsn_id'], $table_id, $detail['bqa_cust_id']);
						}

$fwViewData['msg'] = $id;
}
if($bqa_id)
	{
	
	$bsn_id = $fwRequest->getParam('id', '');
			
	$sqld="SELECT business_qa.*, bus_customers.bcust_fname, bus_customers.bcust_lname FROM business_qa
	LEFT JOIN bus_customers ON bus_customers.bcust_id = business_qa.bqa_cust_id
	WHERE business_qa.bqa_id = ".$bqa_id;

	$detail= $fwDb->queryOne($sqld);
	$detail['bqa_que'] = stripslashes($detail['bqa_que']);
	$detail['bqa_ans'] = stripslashes($detail['bqa_ans']);
	

	$fwViewData['detail'] = $detail;
	
	//db($detail['bqa_ans_date']);
	
	//$date1 = date("Y-m-d H:i:s");
	//db($date1);
	//$date1 = "2018-11-07 05:49:23";
	//$date2 = $detail['bqa_ans_date'];
	//$seconds = strtotime($date1) - strtotime($date2);
	//$hours = $seconds / 60 /  60;
	
	//db($hours);
	
	//exit;
	
	$fwViewData['qabutton'] = "Edit";
	
	$sqlc = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status_sys_date from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
		where business.bsn_id = ". $bsn_id;
		
		$cData = $fwDb->queryOne($sqlc);
		
		$fwViewData['cname'] = $cData['bcust_fname'].' '. $cData['bcust_lname'];
				
	    $fwViewData['cid'] = $cData['bs_customers_id'];
	
	}


$sqlc = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status_sys_date from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
		where business.bsn_id = ". $bsn_id;
		
		$cData = $fwDb->queryOne($sqlc);
		$fwViewData['cname'] = $cData['bcust_fname'].' '. $cData['bcust_lname'];
	    $fwViewData['cid'] = $cData['bs_customers_id'];
		

$sql="SELECT u.user_id,u.user_name,ug.group_id, g.group_name
      FROM users u, groups g, users_groups ug
      WHERE u.user_id=ug.user_id AND ug.group_id=g.group_id AND g.group_id != 2 AND u.user_id != 1 
	  ORDER BY g.group_id ASC, u.user_name ASC"; 
$fwViewData['users'] = $fwDb->query($sql);		


$sqlpos = "SELECT * from positions"; 
$fwViewData['pos'] = $fwDb->query($sqlpos);

$srnosql = "SELECT * from business_qa"; 
$srnodata = $fwDb->query($srnosql);


//$data['bqa_unique_id'] = 10001;
//foreach($srnodata as $k => $v)
//{
//	$tableqa->setWhere("bqa_id=".$v['bqa_id']);	
//	$id= $tableqa->updateRow($data);
//	$data['bqa_unique_id'] = $data['bqa_unique_id'] + 1;	
//}

