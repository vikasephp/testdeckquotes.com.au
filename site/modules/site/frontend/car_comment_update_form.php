<?php
 
function car_comment_unique_filename($originalName)
{
	static $seq = 0;
	$seq++;
	$originalName = preg_replace('/[^A-Z0-9._]/i', '_', (string) $originalName);
	$originalName = trim($originalName, '._');
	$ext = strtolower((string) pathinfo($originalName, PATHINFO_EXTENSION));
	$base = (string) pathinfo($originalName, PATHINFO_FILENAME);
	if ($base === '' || $base === '.') {
		$base = 'image';
	}
	$name = $base.'_'.date('d_m_Y_H_i_s').'_'.$seq;
	if ($ext !== '') {
		$name .= '.'.$ext;
	}
	return $name;
}

function car_comment_copy_to_s3($localPath, $fileName)
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

$table = new Fw_Db_Table("construction_alert_report");
$tableSU = new Fw_Db_Table("car_supplier_update");
$submit = $fwRequest->getParam('subAddDetail', '');
$car_id = $fwRequest->getParam('car_id', 0);

$matsql = "SELECT * from construction_alert_report where car_id = ".$car_id;
	   
$fwViewData['detail'] = $fwDb->queryOne($matsql);

if (
	isset($_SERVER['REQUEST_METHOD']) && $_SERVER['REQUEST_METHOD'] === 'POST'
	&& empty($_POST)
	&& !empty($_SERVER['CONTENT_LENGTH'])
	&& (int) $_SERVER['CONTENT_LENGTH'] > 0
) {
	$fwViewData['form_error'] = 'The photo is too large to upload from this phone. Please choose a smaller photo and submit again.';
}

if(!empty($submit))
{
	
	$cardetail = $fwRequest->getParam('car', array());
	$this_id = (int)$cardetail['car_id'];

	if (!isset($cardetail['cu_alert_resolved']) || ($cardetail['cu_alert_resolved'] !== '0' && $cardetail['cu_alert_resolved'] !== '1')) {
		$fwViewData['form_error'] = 'Please select Alert Resolved.';
	} else {
	$sudetail['cu_car_id'] = $car_id;
	$sudetail['cu_supplier_name'] = $cardetail['car_which_suplier'];
	$comment = isset($cardetail['car_comment']) ? (string) $cardetail['car_comment'] : '';
	$liveComment = isset($cardetail['car_comment_live']) ? (string) $cardetail['car_comment_live'] : '';
	$commentPlain = trim(preg_replace('/\s+/u', ' ', strip_tags(str_replace(array('&nbsp;', "\xc2\xa0"), ' ', $comment))));
	$livePlain = trim(preg_replace('/\s+/u', ' ', strip_tags(str_replace(array('&nbsp;', "\xc2\xa0"), ' ', $liveComment))));
	if ($livePlain !== '' && ($commentPlain === '' || strlen($livePlain) > strlen($commentPlain))) {
		$comment = $liveComment;
	}
	$sudetail['cu_update_text'] = $comment;
	$sudetail['cu_alert_resolved'] = $cardetail['cu_alert_resolved'];
	
	if($cardetail['cu_alert_resolved'] == 1) {
		$sqls = "Update construction_alert_report set  car_status  = 'Pending' where car_id = ".$car_id;	 
		$fwDb -> queryOne($sqls);	
	}
	
	
	if($_FILES['attach'])
		{
				$docfile_1 = $_FILES['attach']['name'];
				$file_type = $_FILES['attach']['type'];				
				
				$docfile_1 = car_comment_unique_filename($docfile_1);
				$src = $_FILES['attach']['tmp_name'];
				$destination = BASE_DIR.'files/uploads/'.$docfile_1;
				
					/*
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$sudetail['cu_attachment'] = $docfile_1;
								chmod($destination, 0664);
								car_comment_copy_to_s3($destination, $docfile_1);
							}
					*/

					if (is_uploaded_file($src) && car_comment_copy_to_s3($src, $docfile_1)) {
						$sudetail['cu_attachment'] = $docfile_1;
					}
													
		}
		
		if($_FILES['attach_2'])
		{
				$docfile_1 = $_FILES['attach_2']['name'];
				$file_type = $_FILES['attach_2']['type'];				
				
				$docfile_1 = car_comment_unique_filename($docfile_1);
				$src = $_FILES['attach_2']['tmp_name'];
				$destination = BASE_DIR.'files/uploads/'.$docfile_1;
				
					/*
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$sudetail['cu_attachment_2'] = $docfile_1;
								chmod($destination, 0664);
								car_comment_copy_to_s3($destination, $docfile_1);
							}
					*/

					if (is_uploaded_file($src) && car_comment_copy_to_s3($src, $docfile_1)) {
						$sudetail['cu_attachment_2'] = $docfile_1;
					}
													
		}
		
		if($_FILES['attach_3'])
		{
				$docfile_1 = $_FILES['attach_3']['name'];
				$file_type = $_FILES['attach_3']['type'];				
				
				$docfile_1 = car_comment_unique_filename($docfile_1);
				$src = $_FILES['attach_3']['tmp_name'];
				$destination = BASE_DIR.'files/uploads/'.$docfile_1;
				
					/*
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$sudetail['cu_attachment_3'] = $docfile_1;
								chmod($destination, 0664);
								car_comment_copy_to_s3($destination, $docfile_1);
							}
					*/

					if (is_uploaded_file($src) && car_comment_copy_to_s3($src, $docfile_1)) {
						$sudetail['cu_attachment_3'] = $docfile_1;
					}
													
		}
	
	
	if($_FILES['attach_4'])
		{
				$docfile_1 = $_FILES['attach_4']['name'];
				$file_type = $_FILES['attach_4']['type'];				
				
				$docfile_1 = car_comment_unique_filename($docfile_1);
				$src = $_FILES['attach_4']['tmp_name'];
				$destination = BASE_DIR.'files/uploads/'.$docfile_1;
				
					/*
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$sudetail['cu_attachment_4'] = $docfile_1;
								chmod($destination, 0664);
								car_comment_copy_to_s3($destination, $docfile_1);
							}
					*/

					if (is_uploaded_file($src) && car_comment_copy_to_s3($src, $docfile_1)) {
						$sudetail['cu_attachment_4'] = $docfile_1;
					}
													
		}
		
		if($_FILES['attach_5'])
		{
				$docfile_1 = $_FILES['attach_5']['name'];
				$file_type = $_FILES['attach_5']['type'];				
				
				$docfile_1 = car_comment_unique_filename($docfile_1);
				$src = $_FILES['attach_5']['tmp_name'];
				$destination = BASE_DIR.'files/uploads/'.$docfile_1;
				
					/*
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$sudetail['cu_attachment_5'] = $docfile_1;
								chmod($destination, 0664);
								car_comment_copy_to_s3($destination, $docfile_1);
							}
					*/

					if (is_uploaded_file($src) && car_comment_copy_to_s3($src, $docfile_1)) {
						$sudetail['cu_attachment_5'] = $docfile_1;
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
}

//$sql2 = "SELECT   companies.co_id, companies.co_company_name from  companies";	 
//$fwViewData['contactdetail'] = $fwDb->query($sql2);
//$sql2 = "SELECT   sa_supplier from  supplier_alert where sa_car_id = ".$car_id;

$sql2 = "SELECT   se_supplier, se_first_name, se_surname  from  supplier_email where se_car_id = ".$car_id;
$fwViewData['contactdetail'] = $fwDb->query($sql2);

