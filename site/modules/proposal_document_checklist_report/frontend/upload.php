<?php
$fwMainView = 'file:' . getcwd() . '/upload.tpl';
$table = new Fw_Db_Table('document_check_list_mini');

$bsn_id = $fwRequest->getParam('bsn_id', 0);
$doc_id = $fwRequest->getParam('doc_id', 0);
$dpn = $fwRequest->getParam('dpn', 0);
$fwViewData['bsn_id'] = $bsn_id;
$fwViewData['doc_id'] = $doc_id;
$fwViewData['dpn'] = $dpn;

$sqldn = "Select admin_doc_name from admin_document_check_list_mini where admin_doc_id = ".$doc_id;
$nameData = $fwDb->queryOne($sqldn);
$fwViewData['doc_name'] = $nameData['admin_doc_name'];

$user_id = $_SESSION['user']['user_id'];

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('doc', array());
	
	$bsnid =  $detail['bsn_id'];
	$docid =  $detail['doc_id'];
	$dpn =  $detail['dpn'];
	if($detail['not_req'] == 'on' ) { $data['doc_not_required'] = 1; } else { $data['doc_not_required'] = 0; }
	
	
	$data['doc_date_uploaded']= date('Y-m-d h:m:s');
	$data['doc_user_name'] = $user_id;
	
	if($_FILES['prop_doc']['name'])
	{
		$docfile = $_FILES['prop_doc']['name'];
		$file_type = $_FILES['prop_doc']['type'];
		//$datetime = trim(date('d_m_Y_H_i_'),'0');
		//$docfile = $datetime.preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
		$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
		$src = $_FILES['prop_doc']['tmp_name'];
		//$destination = BASE_DIR.FILE_PATH.'files/document_check_list_files/'.$docfile;
		
	        upload($docfile, $src);
		$data['doc_file_name']= $docfile;
	
	       // if (!move_uploaded_file($src, $destination))
//		{
//			echo "Possible file upload attack";
//		}
//		else
//		{
//			$data['doc_file_name']= $docfile;
//			chmod($destination, 0664);
//		}
	}
	
	
        
             
     		 $table = new Fw_Db_Table('document_check_list_mini');		
     		 $table->setWhere("doc_bsn_id = ". $bsnid. " and doc_name_id = ". $docid. " and doc_checklist_number = ".$dpn);
	     	 $opr = $table->updateRow($data);   
    	
		
	
   	
	    $fwViewData['opr'] = $opr;			
}

$this_id = (int)$fwRequest->getParam('pr_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('pp_proposal_tt');
	$tableTask->setWhere("pr_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
