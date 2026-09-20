<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table($TABLE);
$user_id = $_SESSION['user']['user_id'];

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail[$ID];

	unset($detail[$ID]);
	$detail['qa_uid'] = $_SESSION['user']['user_id'];
	$detail['qa_last_updated'] = date('d/m/Y');
	
		if($_FILES['docs'])
		{
		$docfile = $_FILES['docs']['name'];
		$file_type = $_FILES['docs']['type'];
		
							$datetime = trim(date('d_m_Y_H_i_'),'0');
							$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
							$src = $_FILES['docs']['tmp_name'];
							$destination = BASE_DIR.'files/question_answer_doc/'.$docfile;
							
																
							if (!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
							else
							{
								$detail['qa_attachment']= $docfile;
							
								chmod($destination, 0664);
							}						
	
		}
		
    if($this_id > 0)
    	{
        $tableqa->setWhere("$ID = $this_id");
		
		$tableusers = new Fw_Db_Table('users');
		$tableusers->setWhere("user_id = $user_id");
		$usrdetail = $tableusers->getRow();
		$detail['qa_last_updated_by'] = $usrdetail['user_name'];
        $opr = $tableqa->updateRow($detail);   
    	}
		else
		{
			 $opr = $tableqa->insertRow($detail); 
		}    	
	$fwViewData['opr'] = $opr;
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

	$tableusers = new Fw_Db_Table('users');
	$tableusers->setWhere("user_id = $user_id");
	$usrdetail = $tableusers->getRow();
	$fwViewData['username'] = $usrdetail['user_name'];
	