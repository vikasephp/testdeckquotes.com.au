<?php
$this_id = $fwRequest->getparamget('po_id', '');
$doc =     $fwRequest->getparamget('doc', '');

if($this_id > 0)
	{

		$thisTable = new Fw_Db_Table('poincc3');
		$thisTable->setWhere("po_id = ".$this_id);
		
		if($doc == 1) {
			$delData['po_purchase_order_doc']='';
		}
		elseif($doc == 2) {
			$delData['po_invoice_doc']='';	
		}
		
		$thisTable->updateRow($delData);

	
echo "delete.";				
	}
exit;