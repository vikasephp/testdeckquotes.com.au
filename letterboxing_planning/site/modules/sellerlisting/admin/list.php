<?php
	$sql = "Select seller_listing.*, business.bsn_id, business.bsn_name, enquirysource.soe_id, enquirysource.soe_name from seller_listing
	         Left join business on seller_listing.sl_business_id = business.bsn_id
			 Left join enquirysource on seller_listing.sl_website_id = enquirysource.soe_id";
			 
    $catdata = $fwDb->query($sql);	
	

		
$fwViewData['list'] = $catdata; 
$fwViewData['title'] = "Seller Listings";
