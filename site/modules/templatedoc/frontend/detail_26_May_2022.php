<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$user_id = $_SESSION['user']['user_id'];
$tableDocuments = new Fw_Db_Table($TABLE);
$tabledoc = new Fw_Db_Table('template_hub_docs');
$dh_id = $fwRequest->getParam($ID, '');
$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
    $detail = $fwRequest->getParam('bm_listing', array());
	
	$this_id=$detail[$ID];
	unset($detail[$ID]);
	$detail['dh_author']= $user_id;

	if($_FILES['docs'])
		{
				$docfile = $_FILES['docs']['name'];
				$file_type = $_FILES['docs']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
				$src = $_FILES['docs']['tmp_name'];
											
				$destination = BASE_DIR.'files/template_documents_hub/'.$docfile;
						
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								//$docs['dhd_name'] = $docfile;
								$docs['dhd_name2'] = $docfile;
								$docs['dhd_type'] = $file_type;
								$docs['dhd_size'] = $_FILES['docs']['size'];
								$docs['dhd_insert_date'] = date('Y-m-d H:i');
								chmod($destination, 0664);
							}						
		}
			if($this_id)
				{
					
							$docs['dhd_dh_id']= $this_id;
							
							$detail['dh_last_update'] = date('Y-m-d H:i');
							
							$tableDocuments->setWhere($ID." = ".$this_id);
							$this_id = $tableDocuments->updateRow($detail);		
				}
			else
				{
							$detail['dh_insert_date'] = date('Y-m-d H:i');
							
							if(!$detail['dh_uid'])
							{
								$sql = "SELECT auto_increment
										FROM INFORMATION_SCHEMA.TABLES
										WHERE table_schema = '" . DB_NAME . "' AND table_name = 'template_docs'";
									
										$row = $fwDb->queryOne($sql);
										$detail['dh_uid'] = $row['auto_increment'];
							}
							
				 			$this_id = $tableDocuments->insertRow($detail); 
							$docs['dhd_dh_id']= $this_id;         			
				}		
		if($docfile)
		{
			
			$m = explode('.', $docs['dhd_name2']);
						
			$didid = $docs['dhd_dh_id'];
			$docfile2 = 'DID'.$didid.'.'.$m[1];
			$docs['dhd_name2'] =  $docfile2;	
			
			if (file_exists($docfile2)) { unlink ($docfile2); }
						
			rename(BASE_DIR.'files/template_documents_hub/'.$docfile, BASE_DIR.'files/template_documents_hub/'.$docfile2);
			 
			 $tabledoc->setWhere("dhd_name2 = '".$docfile2."'");
			 //$tabledoc->setWhere("dhd_name = '".$docfile."'");
		     if($tabledoc->rowExists())
			 {
				  $tabledoc->updateRow($docs); 
			 } 
			 else 
			 {	$tabledoc->insertRow($docs); 
			 }
	  }
		
		
		if($this_id){$fwViewData['opr'] = "Success!"; $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;}
}	
	if($dh_id > 0){	$sql1 = "Select ".$TABLE.".* from ".$TABLE." where ".$TABLE.".dh_id = ". $dh_id;
		$fwViewData['detail'] = $fwDb->queryOne($sql1);			 
		$fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
		}else{ $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;}