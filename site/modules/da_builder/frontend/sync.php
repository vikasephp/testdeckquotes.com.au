<?php

$this_id = (int)$fwRequest->getparam('rt_id', 0);
$bsn_id = (int)$fwRequest->getparam('bsn_id', 0);

    $sql2 = "Select * from report_builder_admin order by ra_id";
	$admindata = $fwDb->query($sql2);
	
	$tablemain = new Fw_Db_Table('report_table_main');
	
	foreach($admindata as $k=>$v)
	{
		
		$tablemain->setWhere("mr_admin_id  = ".$v['ra_id']. " and  mr_report_id = ".$this_id);
		
		if(!$tablemain->rowExists())  {
		 
			$detail2['mr_admin_id'] = $v['ra_id'];
			$detail2['mr_report_id'] = $this_id;
			$detail2['mr_bus_id'] = $bsn_id;
			$detail2['mr_order'] = $v['ra_order'];
			$detail2['mr_specification'] = $v['ra_specification'];
			$detail2['mr_status'] = $v['ra_status'];
			$detail2['mr_criteria'] = $v['ra_criteria'];
			$detail2['mr_statement'] = $v['ra_statement'];
			
			$opr2 = $tablemain->insertRow($detail2);
		}
		
	}
Location(BASE_URL . 'da_builder.home');