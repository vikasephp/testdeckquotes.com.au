<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableDocuments = new Fw_Db_Table($TABLE);
$ri_id = $fwRequest->getParam($ID, '');
$ran =  rand(100000,999999);
$submit = $fwRequest->getParam('subAddDetail', '');
$fwViewData['ri_id'] = $ri_id;

if(!empty($submit))
{
    $detail = $fwRequest->getParam('rejected', array());
//    $detail['po_supplier'] = stripslashes($detail['po_supplier']);
//	
//	$invnum = $detail['po_invoice_number'];
//
//	$supplier = $detail['po_supplier'];
//	
//	if(!empty($ri_id)) {
//		
//		$tableDocuments->setWhere("po_invoice_number = '".$invnum."'  And po_supplier = '".$supplier."' And ri_id != ".$detail['ri_id']);
//	}else {
//		
//		$tableDocuments->setWhere("po_invoice_number = '".$invnum."' And po_supplier = '".$supplier."'");
//	}
	
	//if(!$tableDocuments->rowExists())
	//{
	
	$this_id=$detail[$ID];
	unset($detail[$ID]);

		
			if($this_id)
				{
				
							$tableDocuments->setWhere($ID." = ".$this_id);
							$this_id = $tableDocuments->updateRow($detail);		
				}
			else
				{
							$sql = "select ri_rid from rejected_invoice order by ri_rid DESC limit 1";
							$urnData =  $fwDb->queryOne($sql);
							
							if(empty($urnData)) { $detail['ri_rid'] = 0; }
							else { 
							$detail['ri_rid'] =  $urnData['ri_rid'] + 1;
							}
							
													
				 			$this_id = $tableDocuments->insertRow($detail); 
							         			
				}		
	
		     if($this_id){$fwViewData['opr'] = "Success!"; $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;}
	//}
	//else 
	//{	
		
	//	$fwViewData['po_invoice_no'] = $detail['po_invoice_number'];
	//	$fwViewData['po_supplier'] = $detail['po_supplier'];
	//	$fwViewData['duplicate'] = "Duplicate Supplier and Invoice number";
	//}
			 
}	

if(!empty($ri_id)) {
	
	$tableDocuments->setWhere($ID." = ".$ri_id);
	$fwViewData['detail'] = $tableDocuments->getRow();
	
}
$fwViewData['title'] = "Rejected Invoice Report";

$sql = "select co_company_name from companies order by co_company_name";
$fwViewData['companydetail'] = $fwDb->query($sql);

$sqlbus = "select bsn_address from business order by bsn_address";
$fwViewData['busdetail'] = $fwDb->query($sqlbus);

$sqlpo = "select distinct po_po_number from purchase_order order by po_po_number";
$fwViewData['podetail'] = $fwDb->query($sqlpo);