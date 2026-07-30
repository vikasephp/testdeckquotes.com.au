<?php
$matsql = "SELECT ".$TABLE.".*, materials.mr_name, suppliers.sp_name, suppliers.sp_logo, brands.br_name, brands.br_logo FROM ".$TABLE." 
		   LEFT JOIN materials ON materials.mr_id = ".$TABLE.".mr_id 
		   LEFT JOIN suppliers ON suppliers.sp_id = ".$TABLE.".sp_id 
		   LEFT JOIN brands ON brands.br_id = ".$TABLE.".br_id Order By materials.mr_name ASC";
$matdata = $fwDb->query($matsql);	
$fwViewData['list'] = $matdata; 
$fwViewData['title'] = $MODULE_PLURAL;