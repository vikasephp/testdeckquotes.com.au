<?php
$fwMainView = 'file:' . getcwd() . '/project_panel.tpl';

//$sql = "Select  bsn_id from business  where business.bsn_status like '%|2|%' ";
$sql = "Select  bs_id  from business
        Inner Join business_sellers on business.bsn_id = business_sellers.bs_business_id
         where business.bsn_status like '%|2|%' group by business.bsn_id ";
$bsnData = $fwDb->query($sql);
//db($bsnData);

$indata ="(";
foreach($bsnData as $k => $v)
{
	$indata .= $v['bs_id']. ",";	
}

$indata .= "0)";

   $sql = " SELECT bs_ptt_sub_status, pst_status, count(*) as tot, pst_id, pst_ave_days  FROM business_sellers 
            inner join ptt_sub_type on  business_sellers.bs_ptt_sub_status = ptt_sub_type.pst_id
	    WHERE bs_ptt_sub_status > 0 and business_sellers.bs_id in ".$indata." Group by bs_ptt_sub_status " ;
	
		
	$datastatus= $fwDb->query($sql);
	
	$fwViewData['datastatus'] =  $datastatus;

