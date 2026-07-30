<?php

$sql = "SELECT business.bsn_id from business";

$paData = $fwDb->query($sql);

//db($paData);
//exit;
$table = new Fw_Db_Table('bus_automated_reports');

	foreach($paData as $k => $v)
	{
			$detail['bar_bsn_id'] = $v['bsn_id'];
			$detail['bar_ar_id'] = 1;
			$detail['bar_report_name'] = 'Planning Assessment Report';
			$detail['bar_report_yesno'] = 1;
			
			$table->insertRow($detail);
			
			$detail2['bar_bsn_id'] = $v['bsn_id'];
			$detail2['bar_ar_id'] = 2;
			$detail2['bar_report_name'] = 'Design Agreement Report';
			$detail2['bar_report_yesno'] = 1;
			
			$table->insertRow($detail2);
    }

exit;
	