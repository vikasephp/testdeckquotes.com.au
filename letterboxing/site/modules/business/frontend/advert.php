<?php
$fwMainView = 'file:' . getcwd() . '/advert.tpl';
$tableBusiness = new Fw_Db_Table('seller_listing');
$tableSource = new Fw_Db_Table('enquirysource');
$tableStates = new Fw_Db_Table('states');
$tableRanges = new Fw_Db_Table('bus_price_ranges');
$sl_id = $fwRequest->getParam('sl_id', '');
$fwViewData['bsn_id'] = $fwRequest->getParam('bsn_id', 0);

$submit = $fwRequest->getParam('subAddDetail', '');
	
if(!empty($submit))
{
    $detail = $fwRequest->getParam('seller_listing', array());
	$detail['sl_update_date'] = changedate_y_m_d($detail['sl_update_date']);
	$detail['sl_link'] = addslashes($detail['sl_link']);
	$sl_id = $detail['sl_id'];
		
			if($detail['sl_id']>0)
				{
							unset($detail['sl_id']);
							$tableBusiness->setWhere("sl_id = ".$sl_id);
							$tableBusiness->updateRow($detail);	
							$fwViewData['msg'] =  1;    		
				}
			else
				{
					$tableBusiness->setWhere("sl_id = ".$detail['sl_id']);
		
					if(!$tableBusiness->rowExists())
						{
							$sl_id = $tableBusiness->insertRow($detail);  
						 	$fwViewData['msg'] =  1;         
						}
					else
						{	
							$fwViewData['msg'] = "This Listing Already Present";
						}
				}		
		
			$pricedata['bpr_bus_id'] = $detail['sl_business_id'];
			$pricedata['bpr_adv_id'] = $sl_id;
			$pricedata['bpr_price'] = $detail['sl_current_price'];
			$pricedata['bpr_name'] = $detail['sl_adv_name'];
			$pricedata['bpr_status'] = 1;
			$tableRanges->insertRow($pricedata);			
}	



if ($sl_id > 0)
{
	$sql1 = "Select seller_listing.*, business.bsn_id, business.bsn_name from seller_listing
	         Left Join business on seller_listing.sl_business_id = business.bsn_id where seller_listing.sl_id = ". $sl_id;
    $detail = $fwDb->queryOne($sql1);			 
	$detail['sl_link'] = stripslashes($detail['sl_link']);
	$fwViewData['detail'] = $detail;
	
}

	$tableStates->setWhere("s_parent_state = '0' ");
	$states = $tableStates->getRows();
	$fwViewData['states'] = $states;
	

	$source = $tableSource->getRows();
	$fwViewData['source'] = $source;