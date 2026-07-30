<?php 
$fwMainView = 'file:' . getcwd() . '/view.tpl';
$c_id = $fwRequest->getParam('c_id', 0);
$user_id = $_SESSION['user']['user_id'];
$tablecma = new Fw_Db_Table($TABLE);
$tableUsers = new Fw_Db_Table('users');
$tableBus = new Fw_Db_Table('business');
$tableseller_listing= new Fw_Db_Table('seller_listing');
$tableRanges = new Fw_Db_Table('bus_price_ranges');
$submit = $fwRequest->getParam('add', 0);
if($submit)
	{
if($c_id > 0)
	{
		$tablecma->setWhere($ID." = ".$c_id);
		$cdata = $tablecma->getRow();
		
		
		$tableBus->setWhere("bsn_name = '".$cdata['c_business_name']."'");
			if($tableBus->rowExists())
				{
					$busdata = $tableBus->getRow();	
					$listingdata['sl_business_id'] = $busdata['bsn_id'];
					$listingdata['sl_adv_name'] = $cdata['c_business_name'];
					$listingdata['sl_listing_type'] = 1;
					$listingdata['sl_current_price'] = $cdata['c_price'];
					$listingdata['sl_current_status'] = 1;
					$listingdata['sl_notes'] = $cdata['c_long_description'];
					$listingdata['sl_website_id'] = $cdata['c_soe_id'];
					$listingdata['sl_website_type'] = $cdata['c_location'];
					$listingdata['sl_update_date'] = $cdata['c_date_listed'];
					$listingdata['sl_link'] = $cdata['c_data_source'];
					$listingdata['sl_status'] = 1;	
					$listingdata['sl_enhance_type'] = 0;
					$id = $tableseller_listing->insertRow($listingdata);
					$fwViewData['added'] = $id;
							
			$pricedata['bpr_bus_id'] =  $busdata['bsn_id'];
			$pricedata['bpr_adv_id'] = $id;
			$pricedata['bpr_price'] = $cdata['c_price'];
			$pricedata['bpr_name'] =  $cdata['c_business_name'];
			$pricedata['bpr_status'] = 1;
			$tableRanges->insertRow($pricedata);	
					
					
				}else{
				
				$fwViewData['error'] = 1; 
				}
	}
}