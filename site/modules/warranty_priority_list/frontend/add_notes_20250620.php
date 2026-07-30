<?php
$fwMainView = 'file:' . getcwd() . '/add_notes.tpl';
$tableTask = new Fw_Db_Table('warranty_log_notes');
$wa_id = (int)$fwRequest->getParam('wa_id', 0);
$fwViewData['wa_id'] = $wa_id;

$user = $_SESSION['user']['user_name'];
$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('notes', array());
	$this_id = (int)$detail['wn_id'];
	unset($detail['wn_id']);
	
	$detail['wn_date'] = date('d-m-Y');
	$detail['wn_wa_id'] = $wa_id;
	$detail['wn_added_by'] = $user;
	
	if($_FILES['supp_attach'])
		{
				$docfile_1 = $_FILES['supp_attach']['name'];
				$file_type = $_FILES['supp_attach']['type'];				
				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$src = $_FILES['supp_attach']['tmp_name'];
				$destination = BASE_DIR.'files/uploads/'.$docfile_1;
				
	
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['wn_attachment'] = $docfile_1;
								chmod($destination, 0664);
								
							}
													
		}
	
	

	
    if($this_id > 0)
    	{
      		 unset($detail['wn_id']);
       		 $tableTask->setWhere("wn_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
		 //db($detail);
		
		 
		 $sql = "select wa_project, wa_incl_supp_email, wa_resp_staff, wa_problem from warranty_log where wa_id = ".$detail['wn_wa_id'];
		 $data = $fwDb->queryOne($sql);
		
		 
		 $emails = explode(',',$data['wa_incl_supp_email']);
		  $emails = array_filter($emails);
		
		 
		 $data2 = explode('<br>',$data['wa_resp_staff']);
		
		 $data2 = array_filter($data2);
		 
		 
		  $subject = "A new note has been added";
		  
		  foreach($emails as $k1=>$v1)
		  {
		  	 $sql2 = "select cs_first_name, cs_surname from contacts where cs_primary_email = '".$v1."'";
		 	 $namedata = $fwDb->queryOne($sql2);
		  
		     $to = trim($v1);
			 $toname = $namedata['cs_first_name'];
			 
							  
		 	 $html = "<p>Hi, ".$namedata['cs_first_name']."</p><br>";
			 $html .="<p>A new note/comment has been added to a warranty issue which is related to you and your company. Please see the below details: </p>";
		 	 $html .= "<p><strong>Warranty ID</strong> :".$detail['wn_wa_id']."</p>";
		 	 $html .= "<p><strong>Project Address :</strong> ". $data['wa_project']."</p>";
		     $html .= "<p><strong>Problem : </strong>". $data['wa_problem']."</p>";
			 $html .= "<p><strong>New Note : </strong>". $detail['wn_notes']."</p>";
			 
			 $html .= "<p>Regards,</p>";
			 $html .= "<p>CGFB Warranty Team</p>";
			 send_email($toname, $to, 'CGFB', 'warranty@cgfb.com.au', $subject, $html, $attachmentsend='');
		  }
		  
		  foreach($data2 as $k2=>$v2)
		  {
			$m =  explode('-',$v2); 
			
			
			 $sql2 = "select cs_first_name, cs_surname from contacts where cs_primary_email = '".trim($to)."'";
		 	 $namedata = $fwDb->queryOne($sql2);
		  
		     $to = end($m);
			 $toname = $namedata['cs_first_name'];;
		  
           	     		  
		 	 $html = "<p>Hi, ".$namedata['cs_first_name']."</p><br>";
			 $html .="<p>A new note/comment has been added to a warranty issue which is related to you and your company. Please see the below details: </p>";
		 	 $html .= "<p><strong>Warranty ID :</strong>".$detail['wn_wa_id']."</p>";
		 	 $html .= "<p><strong>Project Address :</strong>". $data['wa_project']."</p>";
		     $html .= "<p><strong>Problem :</strong>". $data['wa_problem']."</p>";
			 $html .= "<p><strong>New Note :</strong>". $detail['wn_notes']."</p>";
			 
			 $html .= "<p>Regards,</p>";
			 $html .= "<p>CGFB Warranty Team</p>";
			 
			 send_email($toname, $to, 'CGFB', 'warranty@cgfb.com.au', $subject, $html, $attachmentsend='');
		  }
		   
	}    	
	    $fwViewData['opr'] = $opr;
			
}

$this_id = (int)$fwRequest->getParam('wn_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('warranty_log_notes');
	$tableTask->setWhere("wn_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
     $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
