<?php

$fwMainView = 'file:' . getcwd() . '/upload.tpl';

$tableBusiness = new Fw_Db_Table($TABLE);

$tabledocs= new Fw_Db_Table('bip_offer_docs');

$bip_id = $fwRequest->getParam($ID, '');

$submit = $fwRequest->getParam('subAddDetail', '');

	

if(!empty($submit))

{

    $detail = $fwRequest->getParam('upload', array());

		if($_FILES['upload'])

			{

			$docfile = $_FILES['upload']['name'];

			$file_type = $_FILES['upload']['type'];

								

								$datetime = trim(date('d_m_Y_H_i_'),'0');

								$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);

								$src = $_FILES['upload']['tmp_name'];

								$destination = BASE_DIR.FILE_PATH.'files/template_documents_hub/'.$docfile;

											

								if (!move_uploaded_file($src, $destination))

								{

									//echo "Possible file upload attack";

								}

								else

								{

									$detail['bod_name']= $docfile;

									$detail['bod_type'] =$file_type;

									$detail['bod_size'] =$_FILES['upload']['size'];

									$detail['bod_insert_date'] = date('Y-m-d H:i');
									
									
								$docs['bod_name']= $docfile;
								$docs['bod_type'] =$file_type;
								$docs['bod_size'] =$_FILES['docs']['size'];
								$docs['bod_insert_date'] = date('Y-m-d H:i');

									chmod($destination, 0664);

								}

			}

	

	$detail['bod_bip_id'] =  $detail['bip_id'];

 	$tabledocs->insertRow($detail);             			

	$fwViewData['opr'] = " Data Successfully updated!";				

}	

if ($bip_id > 0)

	{

		$sql1 = "Select ".$TABLE.".* from ".$TABLE." where ".$TABLE.".bip_id = ". $bip_id;

		$detail = $fwDb->queryOne($sql1);			 

		$fwViewData['detail'] = $detail;

	

		$fwViewData['title'] = 'Upload File';

	}