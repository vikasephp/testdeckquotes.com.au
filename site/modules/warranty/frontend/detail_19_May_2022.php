<?php
//$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table($TABLE);
$fwViewData['wa_id'] = (int)$fwRequest->getParam('wa_id', 0);
$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
    	$detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail[$ID];
	
	$bsn_name = $detail['wa_project'];
	

	
	$sql_1 = "select bsn_id from business where bsn_name like '%".$bsn_name."%'";
	$id = $fwDb->queryOne($sql_1);
	

	$sql_2 = "SELECT  bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_email1
	from business_sellers 		
	Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	Inner Join business ON business_sellers.bs_business_id = business.bsn_id where business_sellers.bs_business_id = ".$id['bsn_id'];
	$data = $fwDb->queryOne($sql_2);
	
	$contactinfo = $data['bcust_fname'] . ' '.$data['bcust_lname']. ' - '.$data['bcust_misc_email1'];

	$detail['wa_contact_info'] = $contactinfo;
	
	unset($detail[$ID]);
	
		if($_FILES['cc_letter']['name'])
		{
				$docfile_1 = $_FILES['cc_letter']['name'];
				$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$temp_name_1 = $_FILES['cc_letter']['tmp_name'];
				$detail['wa_cc_letter'] = $docfile_1;
				upload($docfile_1, $temp_name_1);
		}
		
		if($_FILES['img1']['name'])
		{
				$image_1 = $_FILES['img1']['name'];
				$image_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $image_1);
				$temp_name_1 = $_FILES['img1']['tmp_name'];
				$detail['wa_img1'] = $image_1;
				upload($image_1, $temp_name_1);
		}
		
		if($_FILES['img2']['name'])
		{
				$image_2 = $_FILES['img2']['name'];
				$image_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $image_2);
				$temp_name_2 = $_FILES['img2']['tmp_name'];
				$detail['wa_img2'] = $image_2;
				upload($image_2, $temp_name_2);
		}
		
		if($_FILES['img3']['name'])
		{
				$image_3 = $_FILES['img3']['name'];
				$image_3 =  preg_replace('/[^A-Z0-9._]/i', '_', $image_3);
				$temp_name_3 = $_FILES['img3']['tmp_name'];
				$detail['wa_img3'] = $image_3;
				upload($image_3, $temp_name_3);
		}
		
		if($_FILES['img4']['name'])
		{
				$image_4 = $_FILES['img4']['name'];
				$image_4 =  preg_replace('/[^A-Z0-9._]/i', '_', $image_4);
				$temp_name_4 = $_FILES['img4']['tmp_name'];
				$detail['wa_img4'] = $image_4;
				upload($image_4, $temp_name_4);
		}
		
		if($_FILES['img5']['name'])
		{
				$image_5 = $_FILES['img5']['name'];
				$image_5 =  preg_replace('/[^A-Z0-9._]/i', '_', $image_5);
				$temp_name_5 = $_FILES['img5']['tmp_name'];
				$detail['wa_img5'] = $image_5;
				upload($image_5, $temp_name_5);
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
		
		Location(BASE_URL . $XFA['home']);
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
 		
$sqlto = "Select to_id, to_option from type_options where to_type_id  = ". $type_id['tm_id'];

$fwViewData['todetail'] = $fwDb->query($sqlto); 	
	
$sql2= "select tm_id from type_master where tm_type = 'Construction Alert Report Team' " ;
$tmdata = $fwDb->queryOne($sql2); 

$sql2= "select to_option from type_options where to_type_id = ". $tmdata['tm_id'] ;
$fwViewData['who'] = $fwDb->query($sql2); 

$sql_s1= "select tm_id from type_master where tm_type = 'Alert Status' " ;
$tmdata = $fwDb->queryOne($sql_s1); 

$sql_s2= "select to_option from type_options where to_type_id = ". $tmdata['tm_id'] ;
$fwViewData['statusdata'] = $fwDb->query($sql_s2); 	

