<?php
if (!function_exists('compose_attachment_upload_to_bucket')) {
function compose_attachment_upload_to_bucket($originalName, $tmpName)
{
	static $seq = 0;

	if (!defined('ACCESS_KEY') || !defined('SECRET_KEY') || !defined('BUCKET_NAME') || !is_uploaded_file($tmpName)) {
		return false;
	}
	$originalName = preg_replace('/[^A-Z0-9._-]/i', '_', (string) $originalName);
	$originalName = trim((string) $originalName, '._-');
	$extension = strtolower((string) pathinfo($originalName, PATHINFO_EXTENSION));
	if (in_array($extension, array('php', 'phtml', 'phar', 'php3', 'php4', 'php5', 'php7', 'exe', 'bat', 'cmd', 'sh', 'js', 'htm', 'html', 'svg'), true)) {
		return false;
	}
	$base = (string) pathinfo($originalName, PATHINFO_FILENAME);
	if ($base === '' || $base === '.' || $base === '..') {
		$base = 'file';
	}
	$seq++;
	$savedName = $base . '_' . date('d_m_Y_H_i_s') . '_' . $seq . mt_rand(100, 999);
	if ($extension !== '') {
		$savedName .= '.' . $extension;
	}

	include_once $_SERVER['DOCUMENT_ROOT'] . '/file_upload/server/s3/S3.php';
	$s3 = new S3(ACCESS_KEY, SECRET_KEY);
	if ($s3->putObjectFile($tmpName, BUCKET_NAME, 'files/template_files/' . $savedName, S3::ACL_PRIVATE)) {
		return $savedName;
	}
	return false;
}
}

$fwMainView = 'file:' . getcwd() . '/email_attachment.tpl';
$request = $fwRequest->getParamget('a_req', '');
if($request)
	{
	switch ($request)
		{
			case 'list':
			$atta_list = unserialize($_SESSION['attach']['file_name']);
			if($atta_list)
				{
			$temp = "<ul>";
			foreach($atta_list as $k => $v){$temp .='<li><img src="'.$BASE_URL.'images/email_attach.png" width="20">&nbsp;&nbsp;'.$v.'&nbsp;&nbsp;&nbsp;<a href="javascript:requestattach_del('.$k.');">Remove</a></li>';}
			$temp .="</ul>";
			echo $temp;
			}
			exit;
			break;
			
			case 'del':
			$atta_list = unserialize($_SESSION['attach']['file_name']);
			$del_key = trim($fwRequest->getParamget('key', ''));
			if($atta_list)
				{
					unset($atta_list[$del_key]);
			$_SESSION['attach']['file_name'] = 	serialize($atta_list);	
			echo $del_key;
			}
			exit;
			break;
		}
	}


$old_attachments = $_SESSION['attach']['file_name'];
$logged_usename = $_SESSION['user']['user_name'];
$load_temp = $fwRequest->getParam('load_temp', 	'');
$attachment = $fwRequest->getParam('attachment', '');
if($attachment)
	{
	if($_FILES['attachment']['error'] == 0)
					{
						$file_type = $_FILES['attachment']['type'];
						$src = $_FILES['attachment']['tmp_name'];
						$docfile = compose_attachment_upload_to_bucket($_FILES['attachment']['name'], $src);
									
							if (!$docfile)
							{
								echo "File could not be uploaded.";
								}
								else
								{
								if($_SESSION['attach']['file_name'])
									{
										$olddata = unserialize($_SESSION['attach']['file_name']);
										array_push($olddata, $docfile);
										$_SESSION['attach']['file_name'] = serialize($olddata);
									}else{
									if($docfile)
										{
									$newdoc[]=$docfile;
									$_SESSION['attach']['file_name'] = serialize($newdoc);
									}
									}
								//$_SESSION['attach']['file_name'] = $docfile;
								$_SESSION['attach']['type'] = $file_type;
								$_SESSION['attach']['size'] =  $_FILES['attachment']['size'];
							}
					}
	}