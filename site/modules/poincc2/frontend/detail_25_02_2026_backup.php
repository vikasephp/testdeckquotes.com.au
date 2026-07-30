<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableDocuments = new Fw_Db_Table($TABLE);
$po_id = $fwRequest->getParam($ID, '');
$ran =  rand(100000,999999);
$submit = $fwRequest->getParam('subAddDetail', '');
$fwViewData['po_id'] = $po_id;

if(!empty($submit))
{
    $detail = $fwRequest->getParam('poincc', array());
    $detail['po_supplier'] = stripslashes($detail['po_supplier']);
	
	$invnum = $detail['po_invoice_number'];
	//$supplier = "'".$detail['po_supplier']."'";
	$supplier = $detail['po_supplier'];
	
	if (!empty($detail['po_project_number']) && is_array($detail['po_project_number'])) {

		$addresses = array_filter($detail['po_project_number']); // remove empty fields

		if (!empty($addresses)) {
			$detail['po_project_number'] = implode(', ', $addresses);
		} else {
			$detail['po_project_number'] = '';
		}
	}

	
	if(!empty($po_id)) {
		
		$tableDocuments->setWhere("po_invoice_number = '".$invnum."'  And po_supplier = '".$supplier."' And po_id != ".$detail['po_id']);
	}else {
		
		$tableDocuments->setWhere("po_invoice_number = '".$invnum."' And po_supplier = '".$supplier."'");
	}
	
	if(!$tableDocuments->rowExists())
	{
	
	$this_id=$detail[$ID];
	unset($detail[$ID]);


		if($_FILES['docs_1']['name'])
		{
				$docfile_1 = $_FILES['docs_1']['name'];
				$file_type = $_FILES['docs_1']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$src = $_FILES['docs_1']['tmp_name'];
				$destination = BASE_DIR.'files/purchase_order_invoice/'.$docfile_1;
				
				$detail['po_purchase_order_doc'] = $docfile_1;
				upload($docfile_1, $src);
		}
		
		if($_FILES['docs_2']['name'])
		{
				$docfile_2 = $_FILES['docs_2']['name'];
				$file_type = $_FILES['docs_2']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_2 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
				$src2 = $_FILES['docs_2']['tmp_name'];
				
				$fn = explode(".",$docfile_2);
				$fn1 = $fn[0].'_'.$ran.'.'.$fn[1];
				
				$docfile_2 = $fn1;
				
				$detail['po_invoice_doc'] = $docfile_2;
				upload($docfile_2, $src2);
			}
		
		
			if($this_id)
				{
				
							$tableDocuments->setWhere($ID." = ".$this_id);
							$this_id = $tableDocuments->updateRow($detail);		
				}
			else
				{
							$sql = "select po_urn from poincc2 order by po_urn DESC limit 1";
							$urnData =  $fwDb->queryOne($sql);
							
							if(empty($urnData)) { $detail['po_urn'] = 41667; }
							else { 
							$detail['po_urn'] =  $urnData['po_urn'] + 1;
							}
							
													
				 			$this_id = $tableDocuments->insertRow($detail); 
							         			
				}		
	
		     if($this_id){$fwViewData['opr'] = "Success!"; $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;}
	}
	else 
	{	
		
		$fwViewData['po_invoice_no'] = $detail['po_invoice_number'];
		$fwViewData['po_supplier'] = $detail['po_supplier'];
		$fwViewData['duplicate'] = "Duplicate Supplier and Invoice number";
	}
			 
}	

if(!empty($po_id)) {
	
	$tableDocuments->setWhere($ID." = ".$po_id);
	$fwViewData['detail'] = $tableDocuments->getRow();
	
}
$fwViewData['title'] = "Purchase orders and invoice clearing centre";

$sql = "select co_company_name from companies order by co_company_name";
$fwViewData['companydetail'] = $fwDb->query($sql);

$sqlbus = "select bsn_address from business order by bsn_address";
$fwViewData['busdetail'] = $fwDb->query($sqlbus);

$sqlpo = "select distinct po_po_number from purchase_order order by po_po_number";
$fwViewData['podetail'] = $fwDb->query($sqlpo);