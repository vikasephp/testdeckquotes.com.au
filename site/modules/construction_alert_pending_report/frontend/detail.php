<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table($TABLE);
$fwViewData['wa_id'] = (int)$fwRequest->getParam('wa_id', 0);
$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
    	$detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail[$ID];

	unset($detail[$ID]);
	
		if($_FILES['image1'])
		{
				$docfile_1 = $_FILES['image1']['name'];
				$file_type = $_FILES['image1']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$src = $_FILES['image1']['tmp_name'];
				$destination = BASE_DIR.'files/uploads/'.$docfile_1;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['car_image1'] = $docfile_1;
								chmod($destination, 0664);
							}						
		}
		
		if($_FILES['image2'])
		{
				$docfile_2 = $_FILES['image2']['name'];
				$file_type = $_FILES['image2']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_2 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
				$src = $_FILES['image2']['tmp_name'];
				$destination = BASE_DIR.'files/uploads/'.$docfile_2;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['car_image2'] = $docfile_2;
								chmod($destination, 0664);
							}						
		}
	
		if($_FILES['image3'])
		{
				$docfile_3 = $_FILES['image3']['name'];
				$file_type = $_FILES['image3']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_3 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_3);
				$src = $_FILES['image3']['tmp_name'];
				$destination = BASE_DIR.'files/uploads/'.$docfile_3;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['car_image3'] = $docfile_3;
								chmod($destination, 0664);
							}						
		}

	
		if($_FILES['image4'])
		{
				$docfile_4 = $_FILES['image4']['name'];
				$file_type = $_FILES['image4']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_4 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_4);
				$src = $_FILES['image4']['tmp_name'];
				$destination = BASE_DIR.'files/uploads/'.$docfile_4;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['car_image4'] = $docfile_4;
								chmod($destination, 0664);
							}						
		}
		
		if($_FILES['image5'])
		{
				$docfile_5 = $_FILES['image5']['name'];
				$file_type = $_FILES['image5']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_5 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_5);
				$src = $_FILES['image5']['tmp_name'];
				$destination = BASE_DIR.'files/uploads/'.$docfile_5;
				
					if(!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
							}
					else
							{
								$detail['car_image5'] = $docfile_5;
								chmod($destination, 0664);
							}						
		}
	
	
    if($this_id > 0)
    	{
       		 $tableqa->setWhere("$ID = $this_id");
		 if($detail['car_status']  == 'Closed') {
		 	$detail['car_include_cust'] = 'No';
		 }
		 
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

$sql = "SELECT  business.* from business";
$fwViewData['projdetail'] = $fwDb->query($sql);

$sqls = "select co_id, co_company_name from companies";
$fwViewData['supdetail'] = $fwDb->query($sqls);
	
$sqlti = "Select tm_id from type_master where tm_type = 'Urgency Rating'";
$type_id = $fwDb->queryOne($sqlti); 
 		
$sqlto = "Select * from car_priority";
$fwViewData['todetail'] = $fwDb->query($sqlto); 	
	
$sqltype = "Select * from car_type";
$fwViewData['typedetail'] = $fwDb->query($sqltype); 	
	
$sql2= "select tm_id from type_master where tm_type = 'Construction Alert Report Team' " ;
$tmdata = $fwDb->queryOne($sql2); 

$sql2= "select to_option from type_options where to_type_id = ". $tmdata['tm_id'] ;
$fwViewData['who'] = $fwDb->query($sql2); 

$sql_s1= "select tm_id from type_master where tm_type = 'Alert Status' " ;
$tmdata = $fwDb->queryOne($sql_s1); 

$sql_s2= "select to_option from type_options where to_type_id = ". $tmdata['tm_id'] ;
$fwViewData['statusdata'] = $fwDb->query($sql_s2); 	

$sqlcb = "SELECT contacts.cs_position, contacts.cs_first_name, contacts.cs_surname, contacts.cs_primary_email from contacts 
          Inner join companies ON contacts.cs_company = companies.co_id 
	  where companies.co_company_name = 'Canberra Granny Flat Builders and Fixed Price Extensions'";
	  
$cbdata = $fwDb->query($sqlcb); 

foreach($cbdata as $k1=>$v1)
{
	$cbdata[$k1]['po_name_eml'] = $v1['cs_position'] .' - '.$v1['cs_first_name'] .' '.$v1['cs_surname'] .' - '.$v1['cs_primary_email'];	
}
$fwViewData['cbdata'] = $cbdata; 
