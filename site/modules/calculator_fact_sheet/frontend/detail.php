<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableDocuments = new Fw_Db_Table('calculator_fact_sheet_doc');
$doc_id = $fwRequest->getParam($ID, '');
$submit = $fwRequest->getParam('subAddDetail', '');
$fwViewData['doc_id'] = $doc_id;


$docid = $fwRequest->getParam('docid', '');
if(!empty($docid) && empty($submit))
{
				
		$tableDocuments->setWhere("doc_id = ".$docid);
		$deldetail['doc_image'] = '';
    
		$opr = $tableDocuments->updateRow($deldetail);
		$fwViewData['doc_id'] = $docid;
		unset($docid);
			//$fwViewData['opr'] = "Success!";
}

if(!empty($submit))
{
        $detail = $fwRequest->getParam('fs', array());
	$this_id=$detail[$ID];
	unset($detail[$ID]);
		
		if($_FILES['docs_p']['name'])
		{
				$docfile_p = $_FILES['docs_p']['name'];
				$file_type = $_FILES['docs_p']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_p = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_p);
				$src = $_FILES['docs_p']['tmp_name'];
				
				upload($docfile_p, $src);
				$detail['doc_file_name'] = $docfile_p;
				
//				$destination = BASE_DIR.'files/design_fact_sheet_doc/'.$docfile_p;
//				
//					if(!move_uploaded_file($src, $destination))
//							{
//								//echo "Possible file upload attack";
//							}
//					else
//							{
//								$detail['doc_file_name'] = $docfile_p;
//								chmod($destination, 0664);
//							}						
		}	
		
		if($_FILES['docs_img']['name'])
		{
				$docfile_img = $_FILES['docs_img']['name'];
				$file_type = $_FILES['docs_img']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_img = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_img);
				$src = $_FILES['docs_img']['tmp_name'];
				
				upload($docfile_img, $src);
				$detail['doc_image'] = $docfile_img;
				
//				$destination = BASE_DIR.'files/design_fact_sheet_doc/'.$docfile_img;
//				
//					if(!move_uploaded_file($src, $destination))
//							{
//								//echo "Possible file upload attack";
//							}
//					else
//							{
//								$detail['doc_image'] = $docfile_img;
//								chmod($destination, 0664);
//							}						
		}	
		
		
		
			if($this_id)
				{
							$tableDocuments->setWhere($ID." = ".$this_id);
							$this_id = $tableDocuments->updateRow($detail);		
				}
			else
				{
							$this_id = $tableDocuments->insertRow($detail); 
							         			
				}		
	
		if($this_id){$fwViewData['opr'] = "Success!"; $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;}
}	

if(!empty($doc_id)) {
	
	$tableDocuments->setWhere($ID." = ".$doc_id);
	$fwViewData['detail'] = $tableDocuments->getRow();
}
$fwViewData['title'] = "Add / Edit Calculator Fact Sheet";