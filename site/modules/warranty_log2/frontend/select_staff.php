<?php
$fwMainView = 'file:' . getcwd() . '/select_staff.tpl';
$table = new Fw_Db_Table('warranty_log');
$tableStaff = new Fw_Db_Table('include_resp_staff_warranty');
$submit = $fwRequest->getParam('subAddDetail', '');
$wa_id = $fwRequest->getParam('wa_id', '');
	
	$matsql = "SELECT contacts.* , companies.co_company_name, type_options.to_option  from contacts 
         	  Inner join companies ON contacts.cs_company = companies.co_id
	 	  Left join type_options on contacts.cs_position = type_options.to_id
		  where companies.co_id = 2 group by cs_primary_email order by contacts.cs_is_primary desc ";
		  
	 $list = $fwDb->query($matsql);
	 foreach($list as $ck=>$vc)
	 {
		
		$sqlc = "Select * from include_resp_staff_warranty where ir_email = '".$vc['cs_primary_email']."' and ir_wa_id = ".$wa_id;
		$chkdata = $fwDb->queryOne($sqlc);
		
		if(!empty($chkdata['ir_email'])) {
			$list[$ck]['chk'] = 'checked="checked"';
				
		} else {
			$list[$ck]['chk'] = "";
		}
		
		$sqlcom = "Select cs_first_name, cs_surname from contacts 
		           Inner join companies ON contacts.cs_company = companies.co_id
			   where companies.co_id = 2 and cs_primary_email = '".$vc['cs_primary_email']."'";
		
		$comData = $fwDb->query($sqlcom);
		
		if(count($comData) >=2 ) {
		$name1="";
		foreach($comData as $n => $m)
		{
		$name1  .= implode(" ",$m) ."<br>";
		}
		
		$list[$ck]['cs_first_name'] = $name1;
		$list[$ck]['cs_surname'] = '';
		}
	 }
	
	$fwViewData['list'] = $list;
	
	$sqlCl = "Select car_status from construction_alert_report where wa_id = ".$wa_id;
	$clData = $fwDb->queryOne($sqlCl);
		
$add_emails = $fwRequest->getParam('add_emails', '');
if(!empty($add_emails))
{
	$emails = $fwRequest->getParam('emails', '');
	
	$name2 ="";
	$email2="";
	$csid="";
	
	$poseml ='';
	foreach($emails as $k => $v)
	{
		
		$sql_3 = "select	cs_id, cs_position, cs_first_name, cs_surname, cs_primary_email from contacts where cs_id = ".$k;
		$data = $fwDb->queryOne($sql_3);
		
		$email = $data['cs_primary_email'];
		$email2 .= $email.",";
		
		$c_id = $data['cs_id'];
		$csid .= $c_id.",";
		
		if($v =='on') {
			$poseml = $data['cs_position'] . ' - '.$data['cs_primary_email'];
			$poseml2 .= $poseml."<br><br>";
		}
		
		 $tableStaff->setWhere("ir_email = '".$email."' and ir_wa_id =".$wa_id);
	 	 if(!$tableStaff->rowExists())
	         {
			if($v == 'on') {
				$irDetail['ir_wa_id'] = $wa_id;
				$irDetail['ir_position'] = $data['cs_position'];
				$irDetail['ir_first_name'] = $data['cs_first_name'];
				$irDetail['ir_surname'] = $data['cs_surname'];
				$irDetail['ir_email'] = $email;
				$irDetail['ir_no_of_alerts'] = 1;
				$this_id2 = $tableStaff->insertRow($irDetail);
				}
	        } elseif ($v == 'off') {
			 	$tableStaff->deleteRow();
			 }
	}
	
	
	 $detail['wa_resp_staff'] = $poseml2;
	 $table->setWhere("wa_id = ".$wa_id);
	
	 if($table->rowExists())
	 {
		 $detail['wa_resp_staff'] = $poseml2;
		 $this_id = $table->updateRow($detail);
	 }
	 
	
	$fwViewData['opr'] = "Saved...";		
}
