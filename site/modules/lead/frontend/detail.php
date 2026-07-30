<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$user_id = $_SESSION['user']['user_id'];
$tableDocuments = new Fw_Db_Table($TABLE);
$tabledoc = new Fw_Db_Table('cma_images');
$tableUsers = new Fw_Db_Table('users');
$tablestates= new Fw_Db_Table('states');
$tablesource= new Fw_Db_Table('enquirysource');
$this_id = $fwRequest->getParam($ID, '');
$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
	$this_id=$detail[$ID];
	unset($detail[$ID]);
	$detail['c_user_id'] = $user_id;
			$detail['c_date_listed']=changedate_y_m_d($detail['c_date_listed']);
			$detail['c_date_exchanged']=changedate_y_m_d($detail['c_date_exchanged']);
			$detail['c_date_sold']=changedate_y_m_d($detail['c_date_sold']);

	if($_FILES['docs']['name'])
		{
		$docfile = $_FILES['docs']['name'];
		$file_type = $_FILES['docs']['type'];
							
							$datetime = trim(date('d_m_Y_H_i_'),'0');
							$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
							$src = $_FILES['docs']['tmp_name'];
							$destination = BASE_DIR.FILE_PATH.'files/cma/'.$docfile;
										
							if (!move_uploaded_file($src, $destination))
								{
									echo "Possible file upload attack";
								}
							else
								{
									chmod($destination, 0664);
									$docs['cma_name']= $docfile;
	
								}
		}


			if($this_id)
				{
					$tableDocuments->setWhere($ID." = ".$this_id);
					$tableDocuments->updateRow($detail);	
					$docs['cma_id']= $this_id; 	
				}
			else
				{
				 	$this_id = $tableDocuments->insertRow($detail); 
					$docs['cma_id']= $this_id;         			
				}	
			
			
			if($docs['cma_name']){	$tabledoc->insertRow($docs);}

$fwViewData['opr'] = "Successs";	
}	

$detail = $fwRequest->getParam($TABLE, array());
if($detail)
	{
	if($detail['c_location'])
		$tablestates->setWhere("s_id = ".$detail['c_location']);
		$statedata = $tablestates->getRow();
	$tablestates->setWhere("s_parent_state = '".$statedata['s_shortcodes']."'");
	$tablestates->setOrderBy("s_name ASC");
	$fwViewData['cities'] = $tablestates->getRows();
	$fwViewData['detail'] = $detail;
	}
		 
if ($this_id > 0)
	{
	$sql1 = "SELECT ".$TABLE.".*, creusers.user_name as creator, business_interest.bi_title, busness_status.st_name, location.s_name as sname, city.s_name as cname, location.s_shortcodes as scode FROM ".$TABLE." 
	LEFT JOIN users as creusers ON creusers.user_id = ".$TABLE.".c_user_id 
	LEFT JOIN business_interest  ON business_interest.bi_id = ".$TABLE.".c_industry 
	LEFT JOIN busness_status ON busness_status.st_id = ".$TABLE.".c_status 
	LEFT JOIN states as location ON location.s_id = ".$TABLE.".c_location
	LEFT JOIN states as city ON city.s_id = ".$TABLE.".c_city WHERE ".$TABLE.".".$ID." = ".$this_id;
		
	$detail = $fwDb->queryOne($sql1);	
	$fwViewData['title'] = 'Edit Record';
	}else{ $fwViewData['title'] = 'Add Record';}

if($detail)
	{
	if($detail['c_location'])
		$tablestates->setWhere("s_id = ".$detail['c_location']);
		$statedata = $tablestates->getRow();
	$tablestates->setWhere("s_parent_state = '".$statedata['s_shortcodes']."'");
	$fwViewData['cities'] = $tablestates->getRows();
	$fwViewData['detail'] = $detail;
	}

$tablesource->setWhere("soe_status = 1");
$tablesource->setOrderBy("soe_name ASC");
$fwViewData['sources'] = $tablesource->getRows();