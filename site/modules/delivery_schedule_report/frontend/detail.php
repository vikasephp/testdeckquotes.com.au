<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableDocuments = new Fw_Db_Table('delivery_schedule_report');
$ds_id = $fwRequest->getParam('ds_id', '');
$submit = $fwRequest->getParam('subAddDetail', '');
$fwViewData['ds_id'] = $ds_id ;

if(!empty($submit))
{
        $detail = $fwRequest->getParam('delivery', array());
	$this_id=$detail['ds_id'];
	unset($detail['ds_id']);

			if($_FILES['delivery_request']['name'])
			{
					
					$docfile_1 = $_FILES['delivery_request']['name'];
					$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
					$temp_name_1 = $_FILES['delivery_request']['tmp_name'];
					$detail['ds_delivery_request'] = $docfile_1;
					upload($docfile_1, $temp_name_1);
			}
			
			
			if($_FILES['dcf_pdf']['name'])
			{
					
					$docfile_2 = $_FILES['dcf_pdf']['name'];
					$docfile_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
					$temp_name_2 = $_FILES['dcf_pdf']['tmp_name'];
					$detail['ds_dcf_pdf_file'] = $docfile_2;
					upload($docfile_2, $temp_name_2);
			}
		
		
			if($this_id)
				{
					$tableDocuments->setWhere("ds_id = ".$this_id);
					$this_id = $tableDocuments->updateRow($detail);		
				}
			else
				{
					$sqlu = "Select max(ds_uidd) as ds_uidd from delivery_schedule_report";
					$uidddata = $fwDb->queryOne($sqlu);
					
					
					if(!empty($uidddata['ds_uidd'])) {
						$ui = $uidddata['ds_uidd'] + 1;
						$detail['ds_uidd'] = $ui;
							
					} else {
						$detail['ds_uidd'] = 10000;
						
					}
					
						
					$nop = $detail['ds_num_of_po'];	
					$sn=1;
					for($i=1; $i<=$nop;$i++) {
						$detail['ds_sub_number'] = $sn;
						$this_id = $tableDocuments->insertRow($detail); 
						$sn++;
					}
				}		
	
			$fwViewData['opr'] = "Success!"; 
			$fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}	

if($ds_id > 0) {
	
	$tableDocuments->setWhere("ds_id = ".$ds_id);
	
	$data =  $tableDocuments->getRow();
	$fwViewData['detail'] = $data;


}
$fwViewData['title'] = "Add / Edit Delivery Schedule Report";

$sql = "SELECT business.bsn_id, business.bsn_name from business ";
$fwViewData['projdetail'] = $fwDb->query($sql);

$sqlc = "SELECT *  from quote_builder_component order by qb_component";
$fwViewData['compdetail'] = $fwDb->query($sqlc);

$sql_st = "SELECT  * from delivery_schedule_status";
$fwViewData['stdetail'] = $fwDb->query($sql_st);

$sql_sup = "SELECT  co_company_name from companies order by co_company_name";
$fwViewData['supdetail'] = $fwDb->query($sql_sup);		


