<?php
$fwMainView = 'file:' . getcwd() . '/pm_onsite.tpl';
$where = " WHERE business_sellers.bs_cpr_hide = 0 ";
$ord =  "ORDER BY if(  business.bsn_starting_onsite_date = ' '
OR business.bsn_starting_onsite_date IS NULL , 1, 0 ) , STR_TO_DATE( business.bsn_starting_onsite_date, '%d-%m-%Y' ) ";

$sql = "SELECT  business_sellers.bs_business_id,   business.bsn_latest_csbd, business.bsn_starting_onsite_date,
        business.bsn_id, business.bsn_name, business.bsn_status, business.bsn_address from business_sellers 		
	Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where. " 
	And  ( business.bsn_status like '%|2|%' Or business.bsn_status like '%|5|%' Or business.bsn_status like '%|6|%' 
	Or business.bsn_addto_cpr = 1 Or business.bsn_showin_cpr = 1 ) 
	Group By business.bsn_id " .$ord ;


if($sql){$setData = $fwDb->query($sql);}

foreach($setData as $k => $v)
{
	$sqla = "Select document_check_list.doc_date_uploaded from document_check_list
	         where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 64";
	$data = $fwDb->queryOne($sqla);
	
	$setData[$k]['doc_date_uploaded'] = changedate_d_m_y($data['doc_date_uploaded']);
	
}

	foreach($setData as $m2 => $s2)
		{
			if(strlen($s2['doc_date_uploaded']) == 0) 
			{
				unset($setData[$m2]);	 
			}
		}


foreach($setData as $k => $v)
{
	if($v['bsn_starting_onsite_date']) 
	{
		$time=strtotime($v['bsn_starting_onsite_date']);
		$month=date("F",$time);
		$year=date("Y",$time);
		$count1=0;
	
		foreach($setData as $k2=>$v2)
		{
			$time2=strtotime($v2['bsn_starting_onsite_date']);
			$month2=date("F",$time2);
			$year2 =date("Y",$time2);
			
			if($month == $month2 && $year==$year2)
			{
				$count1++;
			}
		}
		
		
		
	 $setData[$k]['month']=$month." - ".$year;
	 $setData[$k]['onsite'] = $count1;
		
	}
}
function super_unique($array,$key)
    {
       
       foreach ($array as &$v) {
           if (!isset($temp_array[$v[$key]]))
           $temp_array[$v[$key]] =& $v;
       }
       $array = array_values($temp_array);
       return $array;

    }
    $setData = super_unique($setData,'month');
    
    foreach($setData as $idx => $row) {
    if (preg_grep('/^$/', $row)) {
        unset($setData[$idx]);
    }
}
    
	$fwViewData['list'] = $setData;

//db($setData);