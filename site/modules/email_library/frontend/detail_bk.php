<?php

$fwMainView = 'file:' . getcwd() . '/detail.tpl';

$tableOffer = new Fw_Db_Table($TABLE);
$bip_id = $fwRequest->getParam($ID, '');

$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
    $detail = $fwRequest->getParam('bip_section', array());

	$this_id=$detail[$ID];
	unset($detail[$ID]);


	if($_FILES['wfile'])
		{

		$wordfile = $_FILES['wfile']['name'];
		$file_type = $_FILES['wfile']['type'];
		//$userfile_extn = explode(".", strtolower($_FILES['wfile']['name']));
		
							$datetime = trim(date('d_m_Y_H_i_'),'0');
							$wordfile = preg_replace('/[^A-Z0-9._]/i', '_', $wordfile);
							$src = $_FILES['wfile']['tmp_name'];
							$destination = BASE_DIR.FILE_PATH.'files/template_documents_hub/'.$wordfile;

							if (!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}

							else
							{
								$detail['bip_word_file'] = $wordfile;
								chmod($destination, 0664);
							}
		}
		
		
		if($_FILES['pfile'])
		{

		$pdffile = $_FILES['pfile']['name'];
		$file_type = $_FILES['pfile']['type'];
		//$userfile_extn = explode(".", strtolower($_FILES['wfile']['name']));
		
							$datetime = trim(date('d_m_Y_H_i_'),'0');
							$pdffile = preg_replace('/[^A-Z0-9._]/i', '_', $pdffile);
							$src = $_FILES['pfile']['tmp_name'];
							$destination = BASE_DIR.FILE_PATH.'files/template_documents_hub/'.$pdffile;

							if (!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}

							else
							{
								$detail['bip_pdf_file'] = $pdffile;
								chmod($destination, 0664);
							}
		}

			if($this_id)
				{
							$tableOffer->setWhere($ID." = ".$this_id);
							$this_id = $tableOffer->updateRow($detail);		
				}

			else
				{
							$this_id = $tableOffer->insertRow($detail); 
				}	

if($this_id){$fwViewData['opr'] = "Success!"; $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;}
}	

if ($bip_id > 0)
	{
		$sql1 = "Select ".$TABLE.".* from ".$TABLE." where ".$TABLE.".bip_id = ". $bip_id;
		$fwViewData['detail'] = $fwDb->queryOne($sql1);			 
		$fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
	}

else
	{
		$fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
	}
$tableintrest = new Fw_Db_Table('business_interest');	
$tableintrest -> setWhere('bi_parent != 0');
$tableintrest->setOrderBy('bi_title'.' ASC');
$fwViewData['business_interest']=$tableintrest->getAllRows();