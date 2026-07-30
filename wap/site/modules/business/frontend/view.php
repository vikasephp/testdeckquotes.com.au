<?php
$fwMainView = 'file:' . getcwd() . '/view.tpl';
$bsn_id = $fwRequest->getParam('bsn_id', 0); 

$fwViewData['bsn_id'] = $bsn_id;
if($bsn_id > 0)
	{
$sql3 = "Select business.*, business_interest.bi_id, business_interest.bi_title, busness_status.st_id, busness_status.st_name From business 
LEFT Join business_interest On business.bsn_interest = business_interest.bi_id
LEFT Join busness_status On business.bsn_status = busness_status.st_id where business.bsn_id = ". $bsn_id ;
$userData1= $fwDb->queryOne($sql3);
$fwViewData['detail'] = $userData1;

$sql4="Select business_sellers.bs_business_id,business_sellers.bs_customers_id, business.bsn_id, bus_customers.bcust_id, bus_customers.bcust_fname, bus_customers.bcust_lname
 From business_sellers
LEFT JOIN business ON business_sellers.bs_business_id = business.bsn_id
LEFT JOIN bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id Where business_sellers.bs_business_id = ".$bsn_id ;

$userData2= $fwDb->query($sql4);
$fwViewData['detail1'] = $userData2;

$string="";
foreach($userData2 as $k1=>$v1)
{
   $string[] = $v1['bcust_fname']." ".$v1['bcust_lname'];
}
if($string)
{$fwViewData['string1'] = implode(",",$string);}
	}
else
	{
		Location(BASE_URL . $XFA['list']);
	}	