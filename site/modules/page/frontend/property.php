<?php

$thisTable = new Fw_Db_Table($TABLE);
$adv_id = (int)$fwRequest->getparam('adv_id', 0);
$submit = $fwRequest->getparam('subAddDetail', '');
$thisTable_image = new Fw_Db_Table('adv_images1');
$tableFinance = new Fw_Db_Table('financial_new');

$tableFinanceHead = new Fw_Db_Table('fina_head');
$tableFinanceHead->setWhere("fh_adv_id = ".$adv_id);
$fwViewData['detail_head'] = $tableFinanceHead->getRow();

if($adv_id > 0)
{	
$sql = "SELECT advertisement1.*, states.*, industry.* FROM advertisement1
	LEFT JOIN  states ON advertisement1.adv_state = states.s_id
	LEFT JOIN industry ON advertisement1.adv_industry = industry.ind_id WHERE advertisement1.adv_id = ".$adv_id;

	$advData = $fwDb->queryOne($sql);
	$advData['adv_video'] = stripslashes($advData['adv_video']);
	
	$advData['adv_property_info'] = stripslashes($advData['adv_property_info']);
	$advData['adv_business_workforce'] = stripslashes($advData['adv_business_workforce']);

$fwViewData['ad_data'] = $advData;

if($fwViewData['ad_data']['adv_title'])
{
$ind_codes = $fwViewData['ad_data']['adv_industry_code'];

$ind_array = explode("/", $ind_codes);
	foreach($ind_array as $v){if($v){$k_data .=$v.", ";}}$k_data .= "0";
$sql2 = "SELECT bi_id, bi_title FROM business_interest WHERE bi_id IN ($k_data)";


$ind_data = $fwDb->query($sql2);
$end = end($ind_data);
foreach($ind_data as $k => $v)
		{	
			if($v != $end)
			{
			$ind_names .=$v['bi_title'].", <br>";  
			}else{$ind_names .=$v['bi_title'].".";}
		}
$fwViewData['adv_ind_names'] = $ind_names;


/////////////////////// images ///////////////////////

$thisTable_image->setWhere('adv_id = '.$adv_id);
$fwViewData['prop_images'] = $thisTable_image->getRows();

$tableFinance->setWhere('f_adv_id ='.$adv_id);
$fwViewData['fin_snapshot'] = $tableFinance->getRows();

$sqlA = "Select saleagent.*, advertisement1.adv_contact_name  from saleagent
         inner join advertisement1 on saleagent.sa_id = advertisement1.adv_contact_name WHERE advertisement1.adv_id = ".$adv_id;
		 
$fwViewData['agent_data'] = $fwDb->queryOne($sqlA);

/////////////////////// images ///////////////////////

if($submit)
{
	$detail = $fwRequest->getparam($TABLE, '');

		if($_SESSION['user'])
		{
			
			$detail['be_prop_id']=$adv_id;
			$fwViewData['add_buyer_enque'] = $thisTable->insertRow($detail);
			$to = SITE_EMAIL;
			
			//$to = "manojsoniephp@gmail.com";
			
			$subject = SITE_NAME. " ad enquiry from ".$_SESSION['user']['user_name']. " "." listing:, ".$fwViewData['ad_data']['adv_title'];
		 	$message = "
						<html>
						<head>
						  <title>Listing Detail</title>
						</head>
						<body>
						<p>You have successfully received an enqury from a ".SITE_NAME. " business seeker.</p>
							<p><u><strong>Listing Detail</strong></u><br>
								<span> Business Name: <b>".$fwViewData['ad_data']['adv_agency']."</b></span><br>	
								<span> Title: <b>".$fwViewData['ad_data']['adv_title']."</b></span><br>	
								<span> Internal Reference </span><br>	
								<span> Location: <b>".$fwViewData['ad_data']['adv_suburb'].", ".$fwViewData['ad_data']['s_name']."</b></span>		<br>	
								<span> Industry: <b>".$fwViewData['adv_ind_names']."</b></span><br>	
							</p>
							<p><u><strong>Business Seeker Details</strong></u><br>
								<span>  Name: ".$_SESSION['user']['user_name']."</span><br>
								
								<span> Email Address: ".$_SESSION['user']['user_email']."</span><br>
								
								<span> Time to call: Any time</span><br>
								<span> Business Name: ".$fwViewData['ad_data']['adv_title']."</span><br>
								<span> Comments: ".$detail['be_body']."</span><br>
							</p>
							<p>DID YOU KNOW? </p>
								<p>".SITE_NAME." is now on facebook. <br>Follow us <a href=''>here</a> to share information, tips and connect with people like you. </p>
									<p>Thanks for using ".SITE_NAME.". </p>
						</body>
						</html>
						";
		}
		else
		{
				
				$detail['be_prop_id']=$adv_id;
				$fwViewData['add_buyer_enque'] = $thisTable->insertRow($detail);
				$to = SITE_EMAIL;
				//$to = "manojsoniephp@gmail.com";
											
				$subject = SITE_NAME. " ad enquiry from ".$detail['be_fname']. " " .$detail['be_lname']." listing:, ".$fwViewData['ad_data']['adv_title'];
								 
				$message = "
						<html>
						<head>
						  <title>Listing Detail</title>
						</head>
						<body>
						<p>You have successfully received an enqury from a " .SITE_NAME." seeker.</p>
						<p><u><strong>Listing Detail</strong></u><br>
							<span> Business Name: <b>".$fwViewData['ad_data']['adv_agency']."</b></span><br>	
							<span> Title: <b>".$fwViewData['ad_data']['adv_title']."</b></span><br>	
							<span> Internal Reference </span><br>	
							<span> Location: <b>".$fwViewData['ad_data']['adv_suburb'].", ".$fwViewData['ad_data']['s_name']."</b></span><br>	
							<span> Industry: <b>".$fwViewData['adv_ind_names']."</b></span><br>	
						</p>
						<p><u><strong>Business Seeker Details</strong></u><br>
							<span> Name: ".$detail['be_fname']."</span><br>
							<span> Phone: ".$detail['be_phone']."</span><br>
							<span> Email Address: ".$detail['be_email']."</span><br>
							<span> Time to call: Any time</span><br>
							<span> Business Name: ".$fwViewData['ad_data']['adv_title']."</span><br>
							<span> Comments: ".$detail['be_body']."</span><br>
						</p>
						<p>DID YOU KNOW? </p>
							<p>".SITE_NAME." is now on facebook. <br>Follow us <a href=''>here</a> to share information, tips and connect with people like you. </p>
								<p>Thanks for using ".SITE_NAME.". </p>
					</body>
					</html>
					";
 			 }
  
		 // To send HTML mail, the Content-type header must be set
		$headers  = 'MIME-Version: 1.0' . "\r\n";
		$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
		
		// Additional headers
		$headers .= "From: ".$detail['be_fname']." ".$detail['be_fname']." <".$detail['be_email'].">" . "\r\n";
			  	
		send_email("Capitalcommercial", $to, $detail['be_fname'], $detail['be_email'], $subject, $message, $attachment='', $type='');
	
}

}else{Location(BASE_URL . $XFA['home']);}
}else{Location(BASE_URL . $XFA['home']);}