<?php

$fwMainView = 'file:' . getcwd() . '/accept_quote_custom.tpl';
$tablePo = new Fw_Db_Table('purchase_order_custom');
$bus_id = $fwRequest->getparam('bus_id', 0);
$poid = $fwRequest -> getParamget('poid','');
$qid = $fwRequest -> getParamget('qid','');

$sql = "select * from purchase_order_custom where po_id = ".$poid;
$quotedata = $fwDb->queryOne($sql); 

$fwViewData['quote'] = $quotedata['po_quote1'];
$detail['supplier'] = $quotedata['po_supplier1'];
$detail['value'] = $quotedata['po_value1'];
$detail['po_type'] = $quotedata['po_type'];

$user = $_SESSION['user']['user_id'];
$fwViewData['detail'] = $detail;


//$submit_accept_save = $fwRequest->getParam('accept_save','');
//if(!empty($submit_accept_save))
//		{
//			$acceptdata = $fwRequest -> getParam('accept','');
//		
//			$tablePo->setWhere("po_id = ". $poid);
//			$acceptdata['po_acceptance_date'] =  date('d-m-Y');
//			$acceptdata['po_quote_accepted'] =  $qid;
//			$acceptdata['po_accepted_supplier'] = $acceptdata['po_supplier'];
//			$acceptdata['po_accepted_value']    = $acceptdata['po_value'];
//			$tablePo->updateRow($acceptdata);
//			
//		
//			$fwViewData['msg'] = "Quote Has Been Accepted...";
//		}
		

$submit = $fwRequest->getParam('save','');
if(!empty($submit))
{
	$quotedetail = $fwRequest -> getParam('accept','');
	
	if($_FILES['quote1']['error'] == 0)
				{
					$docfile = $_FILES['quote1']['name'];
					$file_type = $_FILES['quote1']['type'];
					
					$datetime = trim(date('d_m_Y_H_i_'),'0');
					$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
					$src = $_FILES['quote1']['tmp_name'];
					$destination = BASE_DIR.FILE_PATH. 'files/purchase_order_quote/'.$docfile;
					
			
								
					if (!move_uploaded_file($src, $destination))
					{
						echo "Possible file upload attack";
					}
					else
					{
					
						chmod($destination, 0664);
					}
				}
				
		

  
		if($_FILES['quote1']['tmp_name']) { $savedata['po_quote1']    = $docfile; }
		$savedata['po_supplier1'] = $quotedetail['po_supplier'];
		$savedata['po_value1']    = $quotedetail['po_value'];
	        $savedata['po_type']    = $quotedetail['po_type'];
	

		$tablePo->setWhere("po_id = ". $poid);
		$tablePo->updateRow($savedata);
}
		
	$sql = "select * from purchase_order_custom where po_id = ".$poid;
        $quotedata = $fwDb->queryOne($sql); 
	$qid = $fwRequest -> getParamget('qid','');
	

	
		$fwViewData['quote'] = $quotedata['po_quote1'];
		$detail['supplier'] = $quotedata['po_supplier1'];
		$detail['value'] = $quotedata['po_value1'];
		$detail['po_type'] = $quotedata['po_type'];
	
	$fwViewData['detail'] = $detail;
	
				
