<?php
$tableBusiness = new Fw_Db_Table('seller_listing');
$tableSource = new Fw_Db_Table('enquirysource');
$tableStates = new Fw_Db_Table('states');
$sl_id = $fwRequest->getParam('sl_id', '');
$submit = $fwRequest->getParam('subAddDetail', '');
	
if(!empty($submit))
{
    $detail = $fwRequest->getParam('seller_listing', array());
	$detail['sl_update_date'] = changedate_y_m_d($detail['sl_update_date']);
	$detail['sl_link'] = addslashes($detail['sl_link']);
	
			if($detail['sl_id']>0)
			{
					
						$tableBusiness->setWhere("sl_id = ".$detail['sl_id']);
						$tableBusiness->updateRow($detail);
						Location(BASE_URL . $XFA['list']);
			}
	
			else
			{
				$tableBusiness->setWhere("sl_id = ".$detail['sl_id']);
	
				if(!$tableBusiness->rowExists())
				{
			
						$sl_id = $tableBusiness->insertRow($detail);             
				}
				else
				{	
					$fwViewData['msg'] = "This Listing Already Present";
				}
			}					
			if(!$fwViewData['msg'])
			{
				Location(BASE_URL . $XFA['list']);
			}
}	



if ($sl_id > 0)
{
	$sql1 = "Select seller_listing.*, business.bsn_id, business.bsn_name from seller_listing
	         Left Join business on seller_listing.sl_business_id = business.bsn_id where seller_listing.sl_id = ". $sl_id;
    $detail = $fwDb->queryOne($sql1);			 
	$detail['sl_link'] = stripslashes($detail['sl_link']);
	$fwViewData['detail'] = $detail;
	$fwViewData['title'] = 'Edit Seller Listing';
	
}
else
{
    $fwViewData['title'] = 'Add Seller Listing';
	
}

	$tableStates->setWhere("s_parent_state = '0' ");
	$states = $tableStates->getRows();
	$fwViewData['states'] = $states;
	

	$source = $tableSource->getRows();
	$fwViewData['source'] = $source;