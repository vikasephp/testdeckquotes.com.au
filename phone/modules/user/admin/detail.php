<?php
$thisTable = new Fw_Db_Table($TABLE);
$tableUsers = new Fw_Db_Table('users');
$tableCustomer = new Fw_Db_Table('customers');
$tableUsersGroups = new Fw_Db_Table('users_groups');
$user_id = (int)$fwRequest->getparam($ID, 0);
$submit = $fwRequest->getparam('subAddDetail', '');
$detail = $fwRequest->getparam($TABLE, '');
$tableUserdocs = new Fw_Db_Table('users_docs');

if(!empty($submit))
{
		$data = array();
		$datail= array();
		$data['user_id'] = $_REQUEST['user_id'];	
		$data['user_name'] = $_REQUEST['user_name'];
        $data['user_email'] = $_REQUEST['user_email'];
		$data['user_username'] = $_REQUEST['user_username'];

		if($_REQUEST['user_password'] && !empty($_REQUEST['user_password'])){
		$data['user_password'] =md5($_REQUEST['user_password']);
			}
		$user_id=$data['user_id'];
		$usergroup['group_id'] = (int)$_REQUEST['user_group'];
		unset($data['user_id']);
		$gdata['group_id']=$usergroup['group_id'];
			
	if($detail['customer_dob']){$detail['customer_dob'] = changedate_y_m_d($detail['customer_dob']); }
	if($detail['user_positions']){$detail['customer_positions'] = implode("|", $detail['user_positions']); }


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
		$detail['customer_white_card_attached'] = $docfile;
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
			$tableUsersGroups->setWhere("user_id = $user_id");
			if($tableUsersGroups->rowExists())
				{
				$tableUsersGroups->updateRow($gdata);
				}else{
				$gdata['user_id'] = $user_id;
				$tableUsersGroups->insertRow($gdata);
				}
			$detail['customer_name'] = $data['user_name'];
			$detail['customer_email'] = $data['user_email'];	
			$tableCustomer->setWhere("user_id = $user_id");	
			
			
			if($tableCustomer->rowExists())
				{
				$tableCustomer->updateRow($detail);
				}else{
				$detail['user_id'] = $user_id;
				$tableCustomer->insertRow($detail);
				}
			
			
					
			$tableCustomer->updateRow($detail);
		}
		else
		{
			if($data['user_id'] <= 0)
			{
				$thisTable->setWhere("user_email=". $fwDb->escape($data['user_email']));
				$userexist=$thisTable->getRows();
				
					if(empty($userexist))
					{
						unset($data['user_id']);
						$user_id = $tableUsers->insertRow($data);             
						$data1 = array();
						
						$data1['user_id'] = $user_id;
						$data1['group_id'] = $usergroup['group_id'];
						$tableUsersGroups->insertRow($data1);		
							
						$detail['user_id'] = $user_id;
						$detail['customer_name'] = $data['user_name'];
						$detail['customer_email'] = $data['user_email'];
						$tableCustomer->insertRow($detail);
						
					}
					else
					{	
						$fwViewData['msg'] = "This User already present";
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
	
		if(!$fwViewData['msg'])
		{
	
		if($usergroup['group_id'] == 2)
			{
		Location(BASE_URL . $XFA['customers']);
			}else{
		Location(BASE_URL . $XFA['list']);	
			}
		}
}	
if($user_id > 0)
	{
	$sql="SELECT customers.*, users.*, users_groups.user_id , users_groups.group_id
	FROM users LEFT JOIN users_groups ON users.user_id = users_groups.user_id 
	LEFT JOIN customers ON users.user_id = customers.user_id
	WHERE users.user_id= $user_id 
	"; 
	  $pages = $fwDb->queryOne($sql); 
	  if(!empty($pages['customer_positions'])){$pages['customer_positions'] = explode("|", $pages['customer_positions']);}
		$fwViewData['detail'] = $pages;
		$fwViewData['title'] = 'Edit User';
	}
else
	{
		$fwViewData['title'] = 'Add User';
	}
$thisTable = new Fw_Db_Table("groups");
$fwViewData['list'] = $thisTable->getAllRows();  
$thisTable = new Fw_Db_Table("positions");
$fwViewData['positions'] = $thisTable->getAllRows();  