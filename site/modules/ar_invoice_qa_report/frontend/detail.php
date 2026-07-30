<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail[$ID];
    $detail['ar_user'] = $_SESSION['user']['user_name'];
	unset($detail[$ID]);
	
	
	if($_FILES['invoice']['name'])
	{
				$docfile = $_FILES['invoice']['name'];
				
				$file_type = $_FILES['invoice']['type'];
				$docfile = strtolower(preg_replace('/[^A-Z0-9._]/i', '_', $docfile));
				$src = $_FILES['invoice']['tmp_name'];
				
				upload($docfile, $src);
				$detail['ar_invoice_link'] = $docfile;
								
//				$destination = BASE_DIR.FILE_PATH.'files/ar_invoice_qa_report/'.$docfile;
//				
//					if (!move_uploaded_file($src, $destination))
//						{
//							echo "Possible file upload attack";
//						}
//					else
//						{
//							$detail['ar_invoice_link'] = $docfile;
//		
//							chmod($destination, 0664);
//						}
					
	}
	
	
	if($_FILES['screen_shot']['name'])
	{
				$docfile2 = $_FILES['screen_shot']['name'];
				
				$file_type = $_FILES['screen_shot']['type'];
				$docfile2 = strtolower(preg_replace('/[^A-Z0-9._]/i', '_', $docfile2));
				$src2 = $_FILES['screen_shot']['tmp_name'];	
				
				upload($docfile2, $src2);
				$detail['ar_screen_shot'] = $docfile2;
							
//				$destination2 = BASE_DIR.FILE_PATH.'files/ar_invoice_qa_report/'.$docfile2;
//				
//					if (!move_uploaded_file($src2, $destination2))
//						{
//							echo "Possible file upload attack";
//						}
//					else
//						{
//							$detail['ar_screen_shot'] = $docfile2;
//		
//							chmod($destination, 0664);
//						}
					
	}
	
	
	
	
	   if($this_id > 0)
    	{
		
       		 $tableqa->setWhere("$ID = $this_id");
	     	 $opr = $tableqa->updateRow($detail);
    	}
	else
	{	
		 $opr = $tableqa->insertRow($detail); 
	}    	
    
    $fwViewData['opr'] = $opr;
		
		//Location(BASE_URL . $XFA['home']);
}

$this_id = (int)$fwRequest->getParam($ID, 0);
if ($this_id > 0)
{
	
	$tableqa = new Fw_Db_Table($TABLE);
	$tableqa->setWhere("$ID = $this_id");
    $detail = $tableqa->getRow();
	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;	
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}

$sql = "SELECT  bsn_name from business where bsn_sub_status ='Open'";
$fwViewData['projdetail'] = $fwDb->query($sql);

$sql = "SELECT  * from ar_invoice_report_status";
$fwViewData['statusdetail'] = $fwDb->query($sql);