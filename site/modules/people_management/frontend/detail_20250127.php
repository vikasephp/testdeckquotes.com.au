<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$thisTable = new Fw_Db_Table($TABLE);
$tableUsers = new Fw_Db_Table('users');
$tableCustomer = new Fw_Db_Table('customers');
$tableUsersGroups = new Fw_Db_Table('users_groups');
$user_id = (int)$fwRequest->getparam($ID, 0);
$submit = $fwRequest->getparam('subAddDetail', '');
$tableUserdocs = new Fw_Db_Table('users_docs');
if(!empty($submit))
	{
			$detail = $fwRequest->getparam($TABLE, '');
			$data = array();
			$data['user_id'] = $_REQUEST['user_id'];	
			$data['user_name'] = $_REQUEST['user_name'];
			$data['user_email'] = $_REQUEST['user_email'];
			$data['user_username'] = $_REQUEST['user_username'];
			if($_REQUEST['user_password'] && !empty($_REQUEST['user_password'])){
			$data['user_password'] = md5($_REQUEST['user_password']);
	}
		$user_id=$data['user_id'];
		unset($data['user_id']);
	
	if($detail['user_positions']){$detail['customer_positions'] = implode("|", $detail['user_positions']); }	
	if($detail['customer_dob']){$detail['customer_dob'] = changedate_y_m_d($detail['customer_dob']); }
	
	
		if($_FILES['cdoc']['size'] > 0)
		{	
			$datetime = trim(date('d_m_Y_H_i_'),'0');
			$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $_FILES['cdoc']['name']);
			$path = BASE_DIR.'files/user_docs/'.$docfile;
			
			if(move_uploaded_file($_FILES['cdoc']['tmp_name'],$path)){
					//print("Done! File saved...");
			}else{
					die("Error on uploading!");
			}	
		$detail['customer_document'] = $docfile;
		}
	
	
	if($_FILES['acfile']['size'] > 0)
		{	
			$datetime = trim(date('d_m_Y_H_i_'),'0');
			$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $_FILES['acfile']['name']);
			$path = BASE_DIR.'files/user_docs/'.$docfile;
			
			if(move_uploaded_file($_FILES['acfile']['tmp_name'],$path)){
					//print("Done! File saved...");
			}else{
					die("Error on uploading!");
			}	
		$detail['customer_auscitizen_attached'] = $docfile;
		}

	if($_FILES['wfile']['size'] > 0)
		{	
			$datetime = trim(date('d_m_Y_H_i_'),'0');
			$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $_FILES['wfile']['name']);
			$path = BASE_DIR.'files/user_docs/'.$docfile;
		
			if(move_uploaded_file($_FILES['wfile']['tmp_name'],$path)){
					//print("Done! File saved...");
			}else{
					die("Error on uploading!");
			}	
		$detail['customer_white_card_attached'] =$docfile;
		}
		
			
	if($_FILES['dfile']['size'] > 0)
		{		
			$datetime = trim(date('d_m_Y_H_i_'),'0');
			$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $_FILES['dfile']['name']);
			$path = BASE_DIR.'files/user_docs/'.$docfile;
		
			if(move_uploaded_file($_FILES['dfile']['tmp_name'],$path)){
					//print("Done! File saved...");
			}else{
					die("Error on uploading!");
			}	
		$detail['customer_dld_attached'] = $docfile;
		}	

		if($_FILES['fqfile']['size'] > 0)
		{	
		
		$datetime = trim(date('d_m_Y_H_i_'),'0');
			$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $_FILES['fqfile']['name']);
			$path = BASE_DIR.'files/user_docs/'.$docfile;
	
			if(move_uploaded_file($_FILES['fqfile']['tmp_name'],$path)){
					//print("Done! File saved...");
			}else{
					die("Error on uploading!");
			}	
		$detail['customer_formail_qua'] = $docfile;
		}

	if ($user_id > 0)
		{
			$tableUsers->setWhere("user_id = $user_id");
			$tableUsers->updateRow($data);
			$detail['customer_name'] = $data['user_name'];
			$detail['customer_email'] = $data['user_email'];	
			$tableCustomer->setWhere("user_id = $user_id");
			
	
			$tableCustomer->updateRow($detail);
			$fwViewData['opr'] = "Employee update successfully.";
		}
		else
		{
			if($data['user_id'] <= 0)
			{
				$thisTable->setWhere("user_email=". $fwDb->escape($data['user_email']) ." || user_username = ". $fwDb->escape($data['user_username']));			
					if(!$thisTable->rowExists())
						{
							unset($data['user_id']);
							$user_id = $tableUsers->insertRow($data);             
							$data1 = array();
							$data1['user_id'] = $user_id;
							$data1['group_id'] = GROUP_EMPLOYEES;
							$tableUsersGroups->insertRow($data1);			
							$detail['user_id'] = $user_id;
							$detail['customer_name'] = $data['user_name'];
							$detail['customer_email'] = $data['user_email'];
							$tableCustomer->insertRow($detail);
							$fwViewData['opr'] = "Employee added successfully.";	
						}
					else
						{	
							$fwViewData['msg'] = "This User already present. Email/Username in use.";	
							$fwViewData['detail'] = $detail;
							
						}
			}					
		}
	if($_FILES['ufile']['size'] > 0)
		{
		$path = BASE_DIR."files/user_docs/".$_FILES['ufile']['name'];

if(move_uploaded_file($_FILES['ufile']['tmp_name'],$path)){
        //print("Done! File saved...");
}else{
        die("Error on uploading!");
}	
$datanew['ud_name'] = $_FILES['ufile']['name'];
$datanew['ud_title'] = $_POST['ufile_name'];
$datanew['ud_user_id'] = $user_id;
$tableUserdocs->insertRow($datanew);
		}
}	
if($user_id > 0)
	{
	$sql="SELECT customers.*, users.*, users_groups.user_id , users_groups.group_id
	FROM users LEFT JOIN users_groups ON users.user_id = users_groups.user_id 
	LEFT JOIN customers ON users.user_id = customers.user_id
	WHERE users.user_id= $user_id"; 
	$pages = $fwDb->queryOne($sql);
	  if(!empty($pages['customer_positions'])){$pages['customer_positions'] = explode("|", $pages['customer_positions']);}
		$fwViewData['detail'] = $pages;
		$fwViewData['title'] = 'Edit Employee';
	}
else
	{
		$fwViewData['title'] = 'Add Employee';
	}
$thisTable = new Fw_Db_Table("positions");
$fwViewData['positions'] = $thisTable->getAllRows();  