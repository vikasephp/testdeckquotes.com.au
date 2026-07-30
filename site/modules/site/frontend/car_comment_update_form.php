<?php
 
$table = new Fw_Db_Table("construction_alert_report");
$tableSU = new Fw_Db_Table("car_supplier_update");
$submit = $fwRequest->getParam('subAddDetail', '');
$car_id = $fwRequest->getParam('car_id', 0);

$matsql = "SELECT * from construction_alert_report where car_id = ".$car_id;
	   
$fwViewData['detail'] = $fwDb->queryOne($matsql);

if(!empty($submit))
{
	
	$cardetail = $fwRequest->getParam('car', array());
	$this_id = (int)$cardetail['car_id'];
	
	
	$sudetail['cu_car_id'] = $car_id;
	$sudetail['cu_supplier_name'] = $cardetail['car_which_suplier'];
	$sudetail['cu_update_text'] = $cardetail['car_comment'];
	$sudetail['cu_alert_resolved'] = $cardetail['cu_alert_resolved'];
	
	if($cardetail['cu_alert_resolved'] == 1) {
		$sqls = "Update construction_alert_report set  car_status  = 'Pending' where car_id = ".$car_id;	 
		$fwDb -> queryOne($sqls);	
	}
	
	
	if($_FILES['attach'])
		{
				$docfile_1 = $_FILES['attach']['name'];
				$file_type = $_FILES['attach']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$src = $_FILES['attach']['tmp_name'];
				$destination = BASE_DIR.'files/uploads/'.$docfile_1;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$sudetail['cu_attachment'] = $docfile_1;
								chmod($destination, 0664);
							}
													
		}
		
		if($_FILES['attach_2'])
		{
				$docfile_1 = $_FILES['attach_2']['name'];
				$file_type = $_FILES['attach_2']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$src = $_FILES['attach_2']['tmp_name'];
				$destination = BASE_DIR.'files/uploads/'.$docfile_1;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$sudetail['cu_attachment_2'] = $docfile_1;
								chmod($destination, 0664);
							}
													
		}
		
		if($_FILES['attach_3'])
		{
				$docfile_1 = $_FILES['attach_3']['name'];
				$file_type = $_FILES['attach_3']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$src = $_FILES['attach_3']['tmp_name'];
				$destination = BASE_DIR.'files/uploads/'.$docfile_1;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$sudetail['cu_attachment_3'] = $docfile_1;
								chmod($destination, 0664);
							}
													
		}
	
	
	if($_FILES['attach_4'])
		{
				$docfile_1 = $_FILES['attach_4']['name'];
				$file_type = $_FILES['attach_4']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$src = $_FILES['attach_4']['tmp_name'];
				$destination = BASE_DIR.'files/uploads/'.$docfile_1;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$sudetail['cu_attachment_4'] = $docfile_1;
								chmod($destination, 0664);
							}
													
		}
		
		if($_FILES['attach_5'])
		{
				$docfile_1 = $_FILES['attach_5']['name'];
				$file_type = $_FILES['attach_5']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$src = $_FILES['attach_5']['tmp_name'];
				$destination = BASE_DIR.'files/uploads/'.$docfile_1;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$sudetail['cu_attachment_5'] = $docfile_1;
								chmod($destination, 0664);
							}
													
		}
	

	unset($cardetail['car_id']);
	
        if($this_id > 0)
    	{
       		 //$table->setWhere("car_id = $this_id");
	     	 $fwViewData['opr'] = $tableSU->insertRow($sudetail);
		 
		 
		 $stdetail['car_status'] = 'Pending';
		 
		 if($sudetail['cu_alert_resolved'] == 1)
		 {
			$table->setWhere("car_id = ". $sudetail['cu_car_id']);
			$table->updateRow($stdetail);
		 }
		 
		$sqlc = "Select ir_position, ir_email from include_resp_staff where ir_car_id = ".$car_id;
		$chkdata = $fwDb->query($sqlc);
		
		foreach($chkdata as $k=>$v)
		{
		$link =  "<a href = '".BASE_URL."construction_alert_report.home/car_id/$car_id' target='_blank'>Link</a>";	
		$html  = "<p>Hi ".$v['ir_position']."</p>";
		$html .= "<p>An update for the construction alert no." .$car_id. " has been submitted by " .$cardetail['car_which_suplier']."</p>"; 
		$html .= "<p>Please click this ". $link ." to review the update.<p><br>";
		$html .= "<p>Thank You </p>";
		$html .= "<p>CGFB Team</p>";	
		
		
		$to = $v['ir_email'];
		$to_name = $v['ir_position'];
		$from = "alert@cgfb.com.au";
		$from_name = "Construction Alert Team";
		$subject = "New update on alert ";
		
		//$to = "manojsoniephp@gmail.com";
		send_email($to_name, $to, $from_name, $from, $subject, $html, $attachment='');
		}
		 
     	}
		
		
		//Location(BASE_URL . $XFA['home']);
}

//$sql2 = "SELECT   companies.co_id, companies.co_company_name from  companies";	 
//$fwViewData['contactdetail'] = $fwDb->query($sql2);
//$sql2 = "SELECT   sa_supplier from  supplier_alert where sa_car_id = ".$car_id;

$sql2 = "SELECT   se_supplier, se_first_name, se_surname  from  supplier_email where se_car_id = ".$car_id;
$fwViewData['contactdetail'] = $fwDb->query($sql2);

