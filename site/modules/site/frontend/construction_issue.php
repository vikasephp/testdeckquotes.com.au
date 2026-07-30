<?php

$bsn_id = $fwRequest->getParam('bsn_id', '');

if(isset($_SESSION['email'])) 
{

       $sql_1 = "Select bsn_name from business where bsn_id = ".$bsn_id;
	   $bsndetail = $fwDb->queryOne($sql_1);
			 
		
	$sql2 = "Select * from construction_alert_report where ( car_status = 'Open' or car_status = 'Pending' ) and car_project = '".$bsndetail['bsn_name']."'";
		$logs = $fwDb->query($sql2);
		 
		  
		  foreach($logs as $k=>$v)
		  {
					$dayscount='';
					$ccdate = $v['car_date'];
					if(!empty($ccdate)) {
						$Statusdate = changedate_y_m_d($ccdate);
						$curdate_y_m_d = date('Y-m-d');
						$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
					} 
		  		    $logs[$k]['dayscount'] = $dayscount;
		  }
			
				$fwViewData['issues'] = $logs; 
			
}
else {
	Location(BASE_URL ."site.home/error/1" );		
}
