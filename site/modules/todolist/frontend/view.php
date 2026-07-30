<?php
$fwMainView = 'file:' . getcwd() . '/view.tpl';
$user_id = $_SESSION['user']['user_id'];
$tableDocuments = new Fw_Db_Table($TABLE);
$tabledoc = new Fw_Db_Table('business_to_do_list_docs');
$tableUsers = new Fw_Db_Table('users');
$tableemail_template = new Fw_Db_Table('email_template');

$dh_id = $fwRequest->getParam($ID, '');
$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
    $detail = $fwRequest->getParam('bm_listing', array());
	$this_id=$detail[$ID];
	unset($detail[$ID]);

			$detail['btdl_create_date']=changedate_y_m_d($detail['btdl_create_date']);
			$detail['btdl_due_date']=changedate_y_m_d($detail['btdl_due_date']);

	if($_FILES['docs']['name'])
		{
		$docfile = $_FILES['docs']['name'];
		$file_type = $_FILES['docs']['type'];
							
							$datetime = trim(date('d_m_Y_H_i_'),'0');
							$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
							$src = $_FILES['docs']['tmp_name'];
							$destination = BASE_DIR.FILE_PATH.'files/business_todo_documents/'.$docfile;
										
							if (!move_uploaded_file($src, $destination))
								{
									echo "Possible file upload attack";
								}
							else
								{
									chmod($destination, 0664);
									$docs['btdl_docs_path']= $docfile;
									$docs['btdl_docs_name']= $docfile;							
									$docs['btdl_docs_type']= $file_type;	
								}
		}


			if($this_id)
				{
							$tableDocuments->setWhere($ID." = ".$this_id);
							$tableDocuments->updateRow($detail);	
							$docs['btdl_list_id']= $this_id; 	
				}
			else
				{
					$detail['btdl_creator_id']= $user_id;
		
				 			$this_id = $tableDocuments->insertRow($detail); 
							$docs['btdl_list_id']= $this_id;         			
				}	
			
			
			if($docs['btdl_docs_path'])
				{
				$tabledoc->insertRow($docs);
				}
if($this_id){	
$userid = $detail['btdl_responcible_id'];
$tableUsers->setWhere("user_id = ".$userid);
$userdata = $tableUsers->getRow();

	if($userdata)
		{
							
							
							switch ($detail['btdl_urgency'])
								{
									case 1:
									$urgency = "Extreme";
									break;
									
									case 2:
									$urgency = "High";
									break;
									
									case 3:
									$urgency = "Moderate";
									break;
									
									case 4:
									$urgency = "Low";
									break;
									
								
								}
								
							$to = trim($userdata['user_email']);
							$toname = ucwords($userdata['user_name']);
							$btdl_desc = $detail['btdl_desc'];
							$btdl_create_date = $detail['btdl_create_date'];
							$btdl_due_date = $detail['btdl_due_date'];
							$btdl_notes = $detail['btdl_notes'];
							
							$tableemail_template->setWhere("et_section = 10 AND et_status = 1");
							$tempdata = $tableemail_template->getRow();
							if($tempdata)
								{
							$email_subject = SITE_NAME." - ".$tempdata['et_subject']." - ".$detail['btdl_title'].".";
							$tempdata = str_replace("{{username}}", ucwords(strtolower($userdata['user_name'])), $tempdata['et_body']);
							$updatetempdata = str_replace("{{description}}", ucwords(strtolower($btdl_desc)), $tempdata);
							$updatetempdata = str_replace("{{notes}}", ucwords(strtolower($btdl_notes)), $updatetempdata);
							$updatetempdata = str_replace("{{createdate}}", changedate_d_m_Y($btdl_create_date), $updatetempdata);
							$updatetempdata = str_replace("{{urgency}}", $urgency, $updatetempdata);
							$email_body  = str_replace("{{duedate}}", changedate_d_m_Y($btdl_due_date), $updatetempdata);
								}
							$attdocs[] = BASE_URL.FILE_PATH.'files/business_todo_documents/'.$docfile;
						
							//$to = "dhirephp@gmail.com";
							//$to = "frank@businessbuys.com.au";
							
					$attachment = serialize($attdocs);
				
					if(send_email($toname, $to, FROM_NAME, SITE_EMAIL_SEND, $email_subject, $email_body,$attachment))
						{
						email_tracking($toname, $to, FROM_NAME, SITE_EMAIL_SEND, $email_subject, $email_body,$attachment, 10);
						}
		
		}

$fwViewData['opr'] = "Success!"; $fwViewData['title'] = 'Edit Business Document';}
}	
$staffsql = "SELECT users.user_id, users.user_name, users_groups.group_id FROM users LEFT JOIN users_groups ON users_groups.user_id = users.user_id WHERE users_groups.group_id IN (1,3) && users.user_id != 2";
$fwViewData['staff_list'] = $fwDb->query($staffsql);			 
if ($dh_id > 0)
	{
		$sql1 = "Select ".$TABLE.".* from ".$TABLE." where ".$TABLE.".".$ID." = ". $dh_id;
		$fwViewData['detail'] = $fwDb->queryOne($sql1);			 
		$fwViewData['title'] = 'View To Do List';
	}
else
	{
		$fwViewData['title'] = 'Add To Do List';
	}

