<?php
$fwMainView = 'file:' . getcwd() . '/print_pdf.tpl';
$table = new Fw_Db_Table('procedure_panel_watchlist');

$fwViewData['dt_id'] = (int)$fwRequest->getParam('dt_id', 0);

$user_id = $_SESSION['user']['user_id'];

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$from = $fwRequest->getParam('from', 0);
	$to = $fwRequest->getParam('to', 0);
	$days = $fwRequest->getParam('days', 0);
	
	if($to >=1) {
		$where = " and business.bsn_rating BETWEEN ".$from . " AND ".$to;
	}
	
	if(!empty($days)) {
		
		
	}
	
	$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, 
	bus_customers.bcust_lname, bus_customers.bcust_misc_email1,bus_customers.bcust_misc_moble,bus_customers.bcust_misc_business,
	bus_customers.bcust_misc_home,  business.bsn_id, business.bsn_name, business.bsn_rating,
	business.bsn_status_sys_date, business.bsn_address , business.bsn_rating, 
	business_sellers.bs_wlr_latest_css, business_sellers.bs_wlr_latest_css_user
	from business_sellers 		
	Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
	where business.bsn_watch_list = 1 ". $where. " order by business.bsn_status_sys_date DESC";
	
	

	$userData = $fwDb->query($sql);
	
	foreach($userData as $k => $v)
	{
		$ccdate = $v['bsn_status_sys_date'];
		$Statusdate = changedate_y_m_d($ccdate);
		$curdate_y_m_d = date('Y-m-d');
		$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
		$userData[$k]['days'] = $dayscount;
	}
	
	
	$heading = "Watch List Report";
	
	$html = "<html>";
	$html .= '<table cellpadding="10">';
	$html .= '<tr>';
	$html .= '<th style="width:35%;">Address</th><th style="width:10%;">Rating</th>
	          <th style="width:10%;">Days</th><th style="width:15%;">Last Spoke</th><th style="width:15%;">Customer Name</th>
		  <th style="width:15%;">Mobile</th>';
	$html .= '</tr>';
	
	foreach($userData as $k=>$v)
	{
		
		if(!empty($days)) {
			
			if($v['days'] <= $days) {
				$html .= '<tr nobr="true">';	
				$html .= '<td>' . $v['bcust_fname']. ' '.$v['bcust_lname'].'<br>'. $v['bsn_name'].'</td>';
				$html .= '<td>' . $v['bsn_rating']. '</td>';
				$html .= '<td>' . $v['days']. '</td>';
				$html .= '<td>' . $v['bs_wlr_latest_css']. '</td>';
				$html .= '<td>' . $v['bcust_fname']. ' '.$v['bcust_lname']. '</td>';
				$html .= '<td>' . $v['bcust_misc_moble']. '</td>';
				$html .= '</tr>';
			}
			
		} else {
			$html .= '<tr nobr="true">';	
			$html .= '<td>' . $v['bcust_fname']. ' '.$v['bcust_lname'].'<br>'. $v['bsn_name'].'</td>';
			$html .= '<td>' . $v['bsn_rating']. '</td>';
			$html .= '<td>' . $v['days']. '</td>';
			$html .= '<td>' . $v['bs_wlr_latest_css']. '</td>';
			$html .= '<td>' . $v['bcust_fname']. ' '.$v['bcust_lname']. '</td>';
			$html .= '<td>' . $v['bcust_misc_moble']. '</td>';
			$html .= '</tr>';
		}
	}
	
	
	$html .= '</table></html>'; 
	$fname = "Test";
	create_watch_pdf($heading, $html, $fname);
	$fwViewData['opr'] = $opr;
			
}

	
