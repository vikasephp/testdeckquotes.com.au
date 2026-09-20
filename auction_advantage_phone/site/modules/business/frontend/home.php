<?php
$fwMainView = 'file:' . getcwd() . '/home.tpl';
$submit = $fwRequest->getParam('subAddDetail', '');
$fwViewData['bsn_id'] = $fwRequest->getParam('bsn_id', '');
$tablebusinessseller = new Fw_Db_Table('business_sellers');
$bs_id = $fwRequest->getParam('bs_id', 0); 
if($bs_id > 0)
	{
//$sql2="SELECT * FROM business_sellers WHERE bs_id = ".$bs_id;
$sellersql = "SELECT business_sellers.*, bus_customers.bcust_fname, bus_customers.bcust_lname FROM business_sellers 
LEFT JOIN bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id WHERE business_sellers.bs_id = ".$bs_id;
$userData= $fwDb->queryOne($sellersql);

$fwViewData['detail'] = $userData;
$fwViewData['button'] = "Edit";
$fwViewData['bs_customers_id'] = $userData['bs_customers_id'];
}else{$fwViewData['msg'] =0;
$fwViewData['button'] = "Add";	}	
if($submit)
{
 $detail = $fwRequest->getParam($TABLE, array());

$table_id = (int)$detail['bs_id'];
$bs_customers_id = (int)$detail['bs_customers_id'];
$bs_business_id = (int)$detail['bs_business_id'];
$_SESSION['bsn_id'] = $bs_business_id;
unset($detail['bs_id']);

if(!$detail['bs_qanotification']){$detail['bs_qanotification'] = 0;}		

						if($table_id > 0)
							{
								$tablebusinessseller->setWhere("bs_id = ".$table_id);
								$id = $tablebusinessseller->updateRow($detail);
							}
						else
							{
								$tablebusinessseller->setWhere("bs_customers_id = ".$bs_customers_id." AND bs_business_id = ".$bs_business_id);
									if(!$tablebusinessseller->rowExists())
										{
											$id=$tablebusinessseller->insertRow($detail);
										}
							}
$fwViewData['msg'] = $id;
}
if(empty($fwViewData['bsn_id']))
{$fwViewData['bsn_id'] = $_SESSION['bsn_id'];}