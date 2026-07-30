<?php
$fwMainView = 'file:' . getcwd() . '/add_comment.tpl';

$tableTask = new Fw_Db_Table('task_comment');
$fwViewData['tc_id'] = (int)$fwRequest->getParam('tc_id', 0);
$fwViewData['tc_task_id'] = (int)$fwRequest->getParam('tc_task_id', 0);
$dt_id = (int)$fwRequest->getParam('dt_id', 0);
$fwViewData['dt_id'] = $dt_id;

$tdt_dt_id = $fwRequest->getParam('tdt_dt_id', '');

$bsn_id = (int)$fwRequest->getParam('bsn_id', 0);
		

$fwViewData['tdt_dt_id'] = $tdt_dt_id;
$fwViewData['dt_id'] = $dt_id;
$fwViewData['bsn_id'] = $bsn_id;
$fwViewData['user_name'] = $_SESSION['user']['user_name'];

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('comment', array());
	$fwViewData['tc_task_id'] = $detail['tc_task_id'];
	$fwViewData['tdt_dt_id'] = $detail['tdt_dt_id'];
	$this_id = (int)$detail['tc_id'];
	unset($detail['tc_id']);
	
	if($_FILES['docatt']['name'])
		{
				$docfile_1 = $_FILES['docatt']['name'];
				$file_type = $_FILES['docatt']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$src = $_FILES['docatt']['tmp_name'];
				
				$detail['tc_doc_attachment'] = $docfile_1;
				upload($docfile_1, $src);
				
				//$destination = BASE_DIR.'files/uploads/'.$docfile_1;
//					if(!move_uploaded_file($src, $destination))
//							{
//								//echo "Possible file upload attack";
//							}
//					else
//							{
//								$detail['tc_doc_attachment'] = $docfile_1;
//								chmod($destination, 0664);
//							}						
		}
		
		
	     if($_FILES['imgatt']['name'])
		{
				$docfile_1 = $_FILES['imgatt']['name'];
				$file_type = $_FILES['imgatt']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$src = $_FILES['imgatt']['tmp_name'];
				
				$detail['tc_image_attachment'] = $docfile_1;
				upload($docfile_1, $src);
				
				//$destination = BASE_DIR.'files/uploads/'.$docfile_1;
//				
//				
//				
//					if(!move_uploaded_file($src, $destination))
//							{
//								//echo "Possible file upload attack";
//							}
//					else
//							{
//								$detail['tc_image_attachment'] = $docfile_1;
//								chmod($destination, 0664);
//							}						
		}	
	
	
    if($this_id > 0)
    	{
             $fwViewData['dt_id'] = $detail['tdt_dt_id'];
      		 unset($detail['tc_task_id']);
       		 $tableTask->setWhere("tc_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
		 
		 $sql = "Select tdt_task_assignee from task_designer_tracker where tdt_id = ".$detail['tc_task_id'];
		 $ass = $fwDb->queryOne($sql);
		 $sql2 = "Select de_email from design_team where de_name = '".$ass['tdt_task_assignee']."'";
		 $ass_email = $fwDb->queryOne($sql2);
		
		 $sql3 = "select bsn_name from business where bsn_id = ".$detail['bsn_id'];
  		 $bname = $fwDb->queryOne($sql3);
		
		 $sql4 = "Select dt_checklist_no from designer_tracker where dt_id = ".$detail['dt_id'];
		 $chkdata = $fwDb->queryOne($sql4);
		 
		 $to = $ass_email['de_email'];
		 $to_name = $ass['tdt_task_assignee'];
		 $from_name = "Cgfb";
		 $from = "cgfb@deckquotes.com.au";
		 $subject ='New comment added';
		 
		 $html = "<html><body>";
		 $html .= "<p>Hello ".$ass['tdt_task_assignee'].",</p><br>";
		 $html .= "<p>A new comment has been added. Please see the comment below</p>";
		 $html .= "<p>Business Name :".$bname['bsn_name']."</p>";
		 $html .= "<p>Checklist Number :".$chkdata['dt_checklist_no']."</p>";
		 $html .= "<p>Commennt :".$detail['tc_comment']."</p>";
		 $html .= "<p>Thanks,<br>CGFB Team";
		 $html .= "</body></html>";
		 
		
		 send_email($to_name, $to, $from_name, $from, $subject, $html, $attachment='');
		 
	}    	
	         $fwViewData['opr'] = $opr;
		
		//Location(BASE_URL . $XFA['home']);
}

$this_id = (int)$fwRequest->getParam('tc_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('task_comment');
	$tableTask->setWhere("tc_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
