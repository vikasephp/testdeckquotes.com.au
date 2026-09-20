<?php 
$fwMainView = 'file:' . getcwd() . '/delivery_detail.tpl';
$delivery = new Fw_Db_Table('delivery');
$submit = $fwRequest->getParam('subAddDetail', '');

$bsn_id = $fwRequest->getParam('bsn_id', '');
$buse_id = $fwRequest->getparam('buse_id', 0); 


if(empty($bsn_id))
{
$bsn_id = $fwRequest->getParam('bsns_id', '');
}

if(empty($bsn_id))
{
if($buse_id){$bsn_id = $buse_id;}
}

$fwViewData['bsn_id'] = $bsn_id;
if($bsn_id){
$sql3="SELECT business.bsn_id, business.bsn_name FROM business WHERE business.bsn_id = ".$bsn_id;
$data= $fwDb->queryOne($sql3);
$fwViewData['business_name'] = $data['bsn_name'];
$fwViewData['bsn_id'] = $data['bsn_id'];
}
$action = $fwRequest->getParam('action', '');


if($buse_id > 0)
	{

	$sql2="SELECT delivery.* from delivery WHERE delivery.de_id = ".$buse_id;
	
	
	$userData= $fwDb->queryOne($sql2);
	$fwViewData['detail'] = $userData;
	
	$fwViewData['button'] = "Edit";
	}else{$fwViewData['msg'] =0;
	$fwViewData['button'] = "Add";
}	

if($bsn_id){
$sql3="SELECT business.bsn_id, business.bsn_name,business.bsn_cd_enquiry_source FROM business WHERE business.bsn_id = ".$bsn_id;
$data= $fwDb->queryOne($sql3);
$fwViewData['business_name'] = $data['bsn_name'];
$fwViewData['bsn_cd_enquiry_source'] = $data['bsn_cd_enquiry_source'];
$fwViewData['bsn_id'] = $data['bsn_id'];
}


if($submit)
{
        $detail = $fwRequest->getParam('delivery', array());
 
 	if($_FILES['delconfir']['name'])
	 {
			 $filename1 = $_FILES['delconfir']['name'];
			 $filename1 = preg_replace('/[^A-Z0-9._]/i', '_', $filename1);
			 $tmp1 = $_FILES['delconfir']['tmp_name'];
			 $destination = BASE_DIR.'files/uploads/'.$filename1;
			 $detail['de_delivery_conf'] = $filename1;
			 upload($filename1, $tmp1);	
			 $fwViewData['msg'] = "Please wait file is uploading";
			
				
					//if(!move_uploaded_file($tmp1, $destination))
//							{
//								//echo "Possible file upload attack";
//							}
//					else
//							{
//								$detail['de_delivery_conf'] = $filename;
//								chmod($destination, 0664);
//							}	
			 
	}
	 
	if($_FILES['photos']['name'])
	 {
			 $filename2 = $_FILES['photos']['name'];
			 $filename2 = preg_replace('/[^A-Z0-9._]/i', '_', $filename2);
			 $tmp2 = $_FILES['photos']['tmp_name'];
			 $destination = BASE_DIR.'files/uploads/'.$filename2;
			 $detail['de_photos'] = $filename2;
			 upload($filename2, $tmp2);	
			 
			 $fwViewData['msg'] = "Please wait file is uploading";
				
					//if(!move_uploaded_file($tmp2, $destination))
//							{
//								//echo "Possible file upload attack";
//							}
//					else
//							{
//								$detail['de_photos'] = $filename2;
//								chmod($destination, 0664);
//							}	
//			 
	} 
  
	$table_id =  (int)$detail['de_id'];
	unset($detail['de_id']);

						if($table_id > 0)
							{
								
								$delivery->setWhere("de_id=".$table_id);
								$table_id= $delivery->updateRow($detail);
								
							}
						else
							{			

								$table_id=$delivery->insertRow($detail);
							}
$fwViewData['msg'] = $table_id;
}