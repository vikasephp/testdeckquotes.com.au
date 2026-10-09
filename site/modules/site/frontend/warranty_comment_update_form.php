<?php

function warranty_comment_copy_to_s3($localPath, $fileName)
{
	if (!is_file($localPath) || !defined('ACCESS_KEY') || !defined('SECRET_KEY') || !defined('BUCKET_NAME') || BUCKET_NAME === '') {
		return false;
	}
	$s3File = $_SERVER['DOCUMENT_ROOT'].'/file_upload/server/s3/S3.php';
	if (!is_file($s3File)) {
		return false;
	}
	include_once $s3File;
	if (!class_exists('S3')) {
		return false;
	}
	$s3 = new S3(ACCESS_KEY, SECRET_KEY);
	return (bool) $s3->putObjectFile($localPath, BUCKET_NAME, 'files/uploads/'.$fileName, S3::ACL_PRIVATE);
}

$table = new Fw_Db_Table("warranty_log");
$tableSU = new Fw_Db_Table("warranty_supplier_update");
$submit = $fwRequest->getParam('subAddDetail', '');
$wa_id = $fwRequest->getParam('wa_id', 0);

$matsql = "SELECT * from warranty_log where wa_id = ".$wa_id;
	   
$fwViewData['detail'] = $fwDb->queryOne($matsql);

if(!empty($submit))
{
	
	$cardetail = $fwRequest->getParam('warranty', array());
	$this_id = (int)$cardetail['wa_id'];
	
	$sudetail['ws_wa_id'] = $wa_id;
	$sudetail['ws_supplier_name'] = $cardetail['warranty_which_suplier'];
	$sudetail['ws_update_text'] = $cardetail['wa_comment'];
	$sudetail['ws_alert_resolved'] = $cardetail['ws_alert_resolved'];
	
	if($cardetail['ws_alert_resolved'] == 1) {
		
	$sqls = "Update warranty_log set  wa_status  = 'Pending' where wa_id = ".$wa_id;	 
	$fwDb -> queryOne($sqls);	
	}
	
	
	if($_FILES['supp_attach'])
		{
				$docfile_1 = $_FILES['supp_attach']['name'];
				$file_type = $_FILES['supp_attach']['type'];				
				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$src = $_FILES['supp_attach']['tmp_name'];
				$destination = BASE_DIR.'files/uploads/'.$docfile_1;

					/*
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$sudetail['ws_attachment'] = $docfile_1;
								chmod($destination, 0664);
							}
					*/

					if (is_uploaded_file($src) && warranty_comment_copy_to_s3($src, $docfile_1)) {
						$sudetail['ws_attachment'] = $docfile_1;
					}
													
		}
	
	
	
	if($_FILES['supp_attach_2'])
		{
				$docfile_2 = $_FILES['supp_attach_2']['name'];
				$file_type = $_FILES['supp_attach_2']['type'];				
				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_2 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
				$src = $_FILES['supp_attach_2']['tmp_name'];
				$destination = BASE_DIR.'files/uploads/'.$docfile_2;

					/*
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$sudetail['ws_attachment_2'] = $docfile_2;
								chmod($destination, 0664);
							}
					*/

					if (is_uploaded_file($src) && warranty_comment_copy_to_s3($src, $docfile_2)) {
						$sudetail['ws_attachment_2'] = $docfile_2;
					}
													
		}
		
		
	   if($_FILES['supp_attach_3'])
		{
				$docfile_3 = $_FILES['supp_attach_3']['name'];
				$file_type = $_FILES['supp_attach_3']['type'];				
				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_3 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_3);
				$src = $_FILES['supp_attach_3']['tmp_name'];
				$destination = BASE_DIR.'files/uploads/'.$docfile_3;

					/*
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$sudetail['ws_attachment_3'] = $docfile_3;
								chmod($destination, 0664);
							}
					*/

					if (is_uploaded_file($src) && warranty_comment_copy_to_s3($src, $docfile_3)) {
						$sudetail['ws_attachment_3'] = $docfile_3;
					}
													
		}
		
		
		
	if($_FILES['supp_attach_4'])
		{
				$docfile_4 = $_FILES['supp_attach_4']['name'];
				$file_type = $_FILES['supp_attach_4']['type'];				
				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_4 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_4);
				$src = $_FILES['supp_attach_4']['tmp_name'];
				$destination = BASE_DIR.'files/uploads/'.$docfile_4;

					/*
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$sudetail['ws_attachment_4'] = $docfile_4;
								chmod($destination, 0664);
							}
					*/

					if (is_uploaded_file($src) && warranty_comment_copy_to_s3($src, $docfile_4)) {
						$sudetail['ws_attachment_4'] = $docfile_4;
					}
													
		}
		
			
	if($_FILES['supp_attach_5'])
		{
				$docfile_5 = $_FILES['supp_attach_5']['name'];
				$file_type = $_FILES['supp_attach_5']['type'];				
				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_5 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_5);
				$src = $_FILES['supp_attach_5']['tmp_name'];
				$destination = BASE_DIR.'files/uploads/'.$docfile_5;

					/*
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$sudetail['ws_attachment_5'] = $docfile_5;
								chmod($destination, 0664);
							}
					*/

					if (is_uploaded_file($src) && warranty_comment_copy_to_s3($src, $docfile_5)) {
						$sudetail['ws_attachment_5'] = $docfile_5;
					}
													
		}
		

	unset($cardetail['wa_id']);
	
        if($this_id > 0)
    	{
     		
			 $fwViewData['opr'] = $tableSU->insertRow($sudetail);
		 
		 
		$sqlc = "Select ir_position, ir_email from include_resp_staff_warranty where ir_wa_id = ".$wa_id;
		$chkdata = $fwDb->query($sqlc);
		
		foreach($chkdata as $k=>$v)
		{
		$link =  "<a href = 'https://www.deckquotes.com.au/warranty_log.home/wa_id/$wa_id' target='_blank'>Link</a>";	
		$html  = "<p>Hi ".$v['ir_position']."</p>";
		$html .= "<p>An update for the warranty issue no." .$wa_id. " has been submitted by " .$cardetail['warranty_which_suplier']."</p>"; 
		$html .= "<p>Please click this ". $link ." to review the update.<p><br>";
		$html .= "<p>Thank You </p>";
		$html .= "<p>CGFB Team</p>";	
		
		
		$to = $v['ir_email'];
		$to_name = $v['ir_position'];
		$from = "alert@cgfb.com.au";
		$from_name = "Warranty Log Team";
		$subject = "New update on Warranty ";
		
		   // $to = "manojsoniephp@gmail.com";
			send_email($to_name, $to, $from_name, $from, $subject, $html, $attachment='');
		}
		 
     	}
		
		
		//Location(BASE_URL . $XFA['home']);
}

//$sql2 = "SELECT   companies.co_id, companies.co_company_name from  companies";	 
//$fwViewData['contactdetail'] = $fwDb->query($sql2);
//$sql2 = "SELECT   sa_supplier from  supplier_alert where sa_wa_id = ".$wa_id;

$sql2 = "SELECT   se_supplier, se_first_name, se_surname  from  supplier_email_warranty where se_wa_id = ".$wa_id;
$fwViewData['contactdetail'] = $fwDb->query($sql2);

