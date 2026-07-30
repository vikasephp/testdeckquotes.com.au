<?php
//$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table($TABLE);
$tablewi = new Fw_Db_Table('warranty_issue');
$fwViewData['wa_id'] = (int)$fwRequest->getParam('wa_id', 0);
$submit = $fwRequest->getParam('subAddDetail', '');


$submitissue = $fwRequest->getParam('update_issue', '');
if(!empty($submitissue))
{
	$detail_wi = $fwRequest->getParam('warranty_issue', array());
	foreach($detail_wi as $ki => $vi)
	{
		 $tablewi->setWhere("wi_id = ".$vi['wi_id']);
		 unset($vi['wi_id']);
	     	 $opr = $tablewi->updateRow($vi); 
	}	
}
	
$add_issue = $fwRequest->getParam('add_issue', '');	
if(!empty($add_issue)) {
	$fwViewData['flag'] = 'True';
	$detail_new = $fwRequest->getParam('new_issue', array());
	if(!empty($detail_new)) {
		$opr3 = $tablewi->insertRow($detail_new);
	}		
}

$save_new = $fwRequest->getParam('save_new', '');	
if(!empty($save_new)) {
	//$fwViewData['flag'] = 'True';
	$detail_new = $fwRequest->getParam('new_issue', array());
	if(!empty($detail_new)) {
		$opr3 = $tablewi->insertRow($detail_new);
	}		
}

if(!empty($submit))
{
    	$detail = $fwRequest->getParam($TABLE, array());
	$detail_wi = $fwRequest->getParam('new_issue', array());
	
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
	
	//db($detail);
	//db($detail_wi);
	//exit;
	
	unset($detail[$ID]);
	
		if($_FILES['cc_letter']['name'])
		{
				$docfile_1 = $_FILES['cc_letter']['name'];
				$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$temp_name_1 = $_FILES['cc_letter']['tmp_name'];
				$detail['wa_cc_letter'] = $docfile_1;
				upload($docfile_1, $temp_name_1);
		}
//		
//		if($_FILES['img1']['name'])
//		{
//				$image_1 = $_FILES['img1']['name'];
//				$image_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $image_1);
//				$temp_name_1 = $_FILES['img1']['tmp_name'];
//				$detail['wa_img1'] = $image_1;
//				upload($image_1, $temp_name_1);
//		}
//		
//		if($_FILES['img2']['name'])
//		{
//				$image_2 = $_FILES['img2']['name'];
//				$image_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $image_2);
//				$temp_name_2 = $_FILES['img2']['tmp_name'];
//				$detail['wa_img2'] = $image_2;
//				upload($image_2, $temp_name_2);
//		}
//		
//		if($_FILES['img3']['name'])
//		{
//				$image_3 = $_FILES['img3']['name'];
//				$image_3 =  preg_replace('/[^A-Z0-9._]/i', '_', $image_3);
//				$temp_name_3 = $_FILES['img3']['tmp_name'];
//				$detail['wa_img3'] = $image_3;
//				upload($image_3, $temp_name_3);
//		}
//		
//		if($_FILES['img4']['name'])
//		{
//				$image_4 = $_FILES['img4']['name'];
//				$image_4 =  preg_replace('/[^A-Z0-9._]/i', '_', $image_4);
//				$temp_name_4 = $_FILES['img4']['tmp_name'];
//				$detail['wa_img4'] = $image_4;
//				upload($image_4, $temp_name_4);
//		}
//		
//		if($_FILES['img5']['name'])
//		{
//				$image_5 = $_FILES['img5']['name'];
//				$image_5 =  preg_replace('/[^A-Z0-9._]/i', '_', $image_5);
//				$temp_name_5 = $_FILES['img5']['tmp_name'];
//				$detail['wa_img5'] = $image_5;
//				upload($image_5, $temp_name_5);
//		}
		

	
    if($this_id > 0)
    	{
       		 $tableqa->setWhere("$ID = $this_id");
	     	 $opr = $tableqa->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableqa->insertRow($detail); 
		 $detail_wi['wi_wa_id'] = $opr;
		 $opr2 = $tablewi->insertRow($detail_wi);
		
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

$wa_id = (int)$fwRequest->getParam('wa_id', 0);

$sqlw = "SELECT * from warranty_issue where wi_wa_id = ".$wa_id;
$fwViewData['issueDetail'] = $fwDb->query($sqlw);

$fwViewData['number'] = 1;