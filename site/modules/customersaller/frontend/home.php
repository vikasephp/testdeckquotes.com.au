<?php
$fwMainView = 'file:' . getcwd() . '/home.tpl';
$submit = $fwRequest->getParam('subAddDetail', '');
$fwViewData['cust_id'] = $fwRequest->getParam('cust_id', '');
$bsn_name = $fwRequest->getparamget('bsn_name', 0);
$tablebyerenquiry = new Fw_Db_Table('buyer_business_for_sale');
$bbfs_id = $fwRequest->getparam('bbfs_id', 0); 
if($bsn_name){
$sql="SELECT business.bsn_id, business.bsn_name FROM business WHERE business.bsn_name LIKE '%".trim($bsn_name)."%'";
$userData= $fwDb->query($sql);
$fwViewData['detail'] = $userData;}
$fwViewData['msg'] =0;
$fwViewData['button'] = "Add";	

if($bbfs_id > 0)
	{
		$sql2="SELECT * FROM buyer_business_for_sale WHERE bbfs_id = ".$bbfs_id;
		$userData= $fwDb->queryOne($sql2);
		$fwViewData['detail'] = $userData;
		$fwViewData['button'] = "Edit";
		$fwViewData['cust_id'] = $userData['bbfs_cust_id'];
	}	
if($submit)
{
						$detail = $fwRequest->getParam($TABLE, array());
						$table_id = (int)$detail['bbfs_id'];
						$bbfs_cust_id = (int)$detail['bbfs_cust_id'];
						$bbfs_bus_id = (int)$detail['bbfs_bus_id'];
						unset($detail['bbfs_id']);
						if($table_id > 0)
							{
							$tablebyerenquiry->setWhere("bbfs_id = ".$table_id);
							$id= $tablebyerenquiry->updateRow($detail);
							}
						else
							{
								$tablebyerenquiry->setWhere("bbfs_cust_id = ".$bbfs_cust_id." AND bbfs_bus_id = ".$bbfs_bus_id);
								if(!$tablebyerenquiry->rowExists())
									{
										$id=$tablebyerenquiry->insertRow($detail);
									}
							}
$fwViewData['msg'] = $id;
}
if(empty($fwViewData['cust_id']))
{$fwViewData['cust_id'] = $_SESSION['cust_id'];}