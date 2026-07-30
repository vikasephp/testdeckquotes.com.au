<?php
$fwMainView = 'file:' . getcwd() . '/show-contacts.tpl';
$table = new Fw_Db_Table('project_progress_report');
$tableSupplier = new Fw_Db_Table('supplier_project_progress');
$tableSupemail = new Fw_Db_Table('supplier_email_pp');
$submit = $fwRequest->getParam('subAddDetail', '');
$co_id = $fwRequest->getParam('co_id', 0);
$fwViewData['co_id'] = $co_id;
$pp_id = $fwRequest->getParam('pp_id', '');

	
 $matsql = "SELECT contacts.* , companies.co_company_name, type_options.to_option  from contacts 
          	  Inner join companies ON contacts.cs_company = companies.co_id
	  	      Left join type_options on contacts.cs_position = type_options.to_id
	  	      where companies.co_id = ".$co_id ." AND length(cs_primary_email) > 0 group by cs_primary_email order by contacts.cs_is_primary desc ";
	   
	   
	 $list = $fwDb->query($matsql);  
	 
	  foreach($list as $ck=>$vc)
	  {
		
		$sqlc = "Select * from supplier_email_pp where se_email = '".$vc['cs_primary_email']."' and se_pp_id = ".$pp_id;
		$chkdata = $fwDb->queryOne($sqlc);
		
		if(!empty($chkdata['se_email'])) {
			$list[$ck]['chk'] = 'checked="checked"';
				
		} else {
			$list[$ck]['chk'] = "";
		}
		
		
		$sqlcom = "Select cs_first_name, cs_surname from contacts where cs_primary_email = '".$vc['cs_primary_email']."'";
		
		$comData = $fwDb->query($sqlcom);
		
		if(count($comData) >=2 ) {
		$name1="";
		foreach($comData as $n => $m)
		{
		$name1  .= implode(" ",$m) .",";
		}
		
		$list[$ck]['cs_first_name'] = $name1;
		$list[$ck]['cs_surname'] = '';
		}
	 }
	 
	 $fwViewData['list'] = $list;
	
	
	//$sqlCl = "Select car_status from construction_alert_report where pp_id = ".$pp_id;
	//$clData = $fwDb->queryOne($sqlCl);
	
	
$add_emails = $fwRequest->getParam('add_emails', '');
if(!empty($add_emails))
{
	$emails = $fwRequest->getParam('emails', '');
	

	$name2 ="";
	$email2="";
	$csid="";
	foreach($emails as $k => $v)
	{
		$sql_3 = "select	cs_id, cs_first_name, cs_surname, cs_primary_email from contacts where cs_id = ".$k;
		$data = $fwDb->queryOne($sql_3);
		
		if($v=='on') {
			$name = $data['cs_first_name'] ." ".$data['cs_surname'];
			$name2 .= $name.", ";
		
			$email = $data['cs_primary_email'];
			$email2 .= $email.",";
		
			$c_id = $data['cs_id'];
			$csid .= $c_id.",";
		}
		
		$emailA = $data['cs_primary_email'];
		//if($clData['car_status'] == 'Open')
		// {
			 $tableSupemail->setWhere("se_email = '".$emailA."' and se_pp_id =".$pp_id);
			 if(!$tableSupemail->rowExists())
			 {
				if($v == 'on') {
					$irDetail['se_pp_id'] = $pp_id;
					$irDetail['se_co_id'] = $co_id;
					$irDetail['se_supplier'] = $list[0]['co_company_name'];
					$irDetail['se_first_name'] = $data['cs_first_name'];
					$irDetail['se_surname'] = $data['cs_surname'];
					$irDetail['se_email'] = $emailA;
					$irDetail['se_no_of_alerts'] = 1;
					$this_id2 = $tableSupemail->insertRow($irDetail);
					}
			} elseif ($v == 'off') {
					$tableSupemail->deleteRow();
			     
				
			// }
		 }
		
	}
	
	
	$sqlAdd = "Select se_email from supplier_email_pp where se_pp_id = ".$pp_id;
	$addData = $fwDb->query($sqlAdd);
	$em = " ";
	foreach($addData as $a => $b)
	{
		$em = $b['se_email'];
		$em2 .= $em1 .",". $em;
	}
	

	$detail['pp_incl_supp_email'] = $em2;
	$table->setWhere("pp_id = ".$pp_id);
	$this_id = $table->updateRow($detail);
	
	
	 $tableSupplier->setWhere("sp_pp_id = ".$pp_id. " and sa_co_id = ".$co_id);
	 if($tableSupplier->rowExists())
	 {
		 $row1 = $tableSupplier->getRow();
		  $detail2['sp_supplier_email'] = $email2;
		  $detail2['sp_cs_id'] = $csid;
		 
		 $uniqueDep2 = implode(',', array_unique(explode(',', $detail2['sp_supplier_email'])));
		 $uniqueDep3 = implode(',', array_unique(explode(',', $detail2['sp_cs_id'])));
		 
		 $supemaildetail['sp_supplier_email'] = $uniqueDep2;
		 $supemaildetail['sp_cs_id'] = $uniqueDep3;
		 
		 $this_id = $tableSupplier->updateRow($supemaildetail);
	 }
	
	
	$fwViewData['opr'] = "Saved...";	
}
