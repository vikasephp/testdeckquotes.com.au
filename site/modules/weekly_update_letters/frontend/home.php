<?php

$tableBusiness = new Fw_Db_Table('business');
$tableBusiness->setOrderBy('bsn_id'.' ASC');
$fwViewData['projdetail'] =  $tableBusiness->getRows();

$submit = $fwRequest->getParam('prosub', '');
$submit2 = $fwRequest->getParam('upload', '');


if(!empty($submit))
{

	$prda = $fwRequest->getParam('projname', 0);

	$s = explode('|',$prda);
	$bsn_id  = $s[0];

	db($bsn_id);
	$fwViewData['bsn_id'] = $bsn_id;
	$fwViewData['p_c_name'] = $prda;
	

	$fwViewData['tid'] = $id;

        $fwViewData['msg'] = "submitted";
	
}

if(!empty($submit2))
{
	$detail = $fwRequest->getParam('uploaddata', 0);
	db($detail);
	

	
	
	if(!empty($_FILES['docs1']['name']))
	{
		$file_name1 = $_FILES['docs1']['name'];
		$src1 = $_FILES['docs1']['tmp_name'];
		$destination1 = BASE_DIR.'files/email_attachment/'.$file_name1;
		move_uploaded_file($src1, $destination1);
		
	}
	
	if($_FILES['docs2']['name'])
	{
		$file_name2 = $_FILES['docs2']['name'];
		$src2 = $_FILES['docs2']['tmp_name'];
		$destination2 = BASE_DIR.'files/email_attachment/'.$file_name2;
		move_uploaded_file($src2, $destination2);
		
	}
	
	if($_FILES['docs3']['name'])
	{
		$file_name3 = $_FILES['docs3']['name'];
		$src3 = $_FILES['docs3']['tmp_name'];
		$destination3 = BASE_DIR.'files/email_attachment/'.$file_name3;
		move_uploaded_file($src3, $destination3);
		
	}
	
	if($_FILES['image1']['name'])
	{
		$file_name3 = $_FILES['image1']['name'];
		$src3 = $_FILES['image1']['tmp_name'];
		$destination3 = BASE_DIR.'files/email_attachment/'.$file_name3;
		move_uploaded_file($src3, $destination3);
		
	}
	
	
		
	$sql2  = "Select bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_email1, 
		  bcust_misc_email2 from business_sellers 
		  Inner Join bus_customers on business_sellers.bs_customers_id  = bus_customers.bcust_id 
		  where bs_business_id  = " .$bsn_id;
	$custdata = $fwDb->queryOne($sql2);
	

	
}