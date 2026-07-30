<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableDocuments = new Fw_Db_Table('purchase_order');
$po_id = $fwRequest->getParam('po_id', '');
$submit = $fwRequest->getParam('subAddDetail', '');
$fwViewData['po_id'] = $po_id ;

if(!empty($submit))
{
        $detail = $fwRequest->getParam('purchse_order', array());
	$ponum = $detail['po_po_number'];

	
	$sqls = "select po_id, po_po_number from purchase_order where po_po_number = '".$ponum."'";
	$ponData = $fwDb->queryOne($sqls);
	
	$this_id=$detail['po_id'];
	unset($detail['po_id']);
	
	$bsn = explode("|",$detail['project_name']);
	$detail['po_bsn_id'] = $bsn[0];
	if($_FILES['po']['name'])
		{
				
				$docfile_1 = $_FILES['po']['name'];
				$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$temp_name_1 = $_FILES['po']['tmp_name'];
				$detail['po_purchase_order'] = $docfile_1;
				upload($docfile_1, $temp_name_1);
						
		}
		
		
		if($_FILES['lq']['name'])
		{
				
				$docfile_2 = $_FILES['lq']['name'];
				$docfile_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
				$temp_name_2 = $_FILES['lq']['tmp_name'];
				$detail['po_linked_quote'] = $docfile_2;
				upload($docfile_2, $temp_name_2);
		}
		
			if($this_id)
				{
					$tableDocuments->setWhere("po_id = ".$this_id);
					$this_id = $tableDocuments->updateRow($detail);		
				}
			else
				{
					if(empty($ponData['po_po_number'])) {
						$this_id = $tableDocuments->insertRow($detail); 
					}else {
						 $fwViewData['msg'] = "Purchase Order Number Already Exists";
						 $fwViewData['detail'] = $detail;
						 $fwViewData['projname']= $detail['project_name'];
					}
							         			
				}		
	
		if($this_id){$fwViewData['opr'] = "Success!"; $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;}
}	

if($po_id > 0) {
	
	$tableDocuments->setWhere("po_id = ".$po_id);
	
	$data =  $tableDocuments->getRow();
	$fwViewData['detail'] = $data;

	$sqled = "SELECT business.bsn_id, business.bsn_name from business where  business.bsn_id = ".$data['po_bsn_id'];
	$eddata = $fwDb->queryOne($sqled);
	
	if($eddata['bsn_id'] == 0 ) {
		
		$fwViewData['projname'] = "000 | Non-project/Others";
		
	} else {
	
		$fwViewData['projname'] = $eddata['bsn_id']. " | ". $eddata['bsn_name'];
	}
	
}
$fwViewData['title'] = "Add / Edit Street Sign";

$sql = "SELECT business.bsn_id, business.bsn_name from business ";
$fwViewData['projdetail'] = $fwDb->query($sql);

$sqlc = "SELECT *  from poincc_component ";
$fwViewData['compdetail'] = $fwDb->query($sqlc);

$sql_as1 = "SELECT  * from type_master where tm_type like '%Approval Status%'";
$as_id = $fwDb->queryOne($sql_as1);		

$sql_as2 = "SELECT  * from type_options where to_type_id  =  ".$as_id['tm_id'] . " order by to_option desc";
$asdata = $fwDb->query($sql_as2);

$fwViewData['asdetail'] = $asdata ;

