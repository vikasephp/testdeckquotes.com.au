<?php 

$fwMainView = 'file:' . getcwd() . '/email_attachment.tpl';

$request = $fwRequest->getParamget('a_req', '');

//db("Testing");
//exit;

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

$attachment = $fwRequest->getParam('attachmentbutton', '');

if($attachment)
	{


	if($_FILES['attachment']['error'] == 0)

					{

						$docfile = $_FILES['attachment']['name'];

						$file_type = $_FILES['attachment']['type'];

						

						//$datetime = trim(date('d_m_Y_H_i_'),'0');

						$docfile = $datetime.preg_replace('/[^A-Z0-9._]/i', '_', $docfile);

						$src = $_FILES['attachment']['tmp_name'];

						$destination = BASE_DIR.FILE_PATH.'files/design_interface_emails/'.$docfile;

									

							if (!move_uploaded_file($src, $destination))

							{

								echo "Possible file upload attack";

								}

								else

								{

								chmod($destination, 0664);

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