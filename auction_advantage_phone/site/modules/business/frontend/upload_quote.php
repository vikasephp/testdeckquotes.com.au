<?php

$fwMainView = 'file:' . getcwd() . '/upload_quote.tpl';
$tablePo = new Fw_Db_Table('purchase_order');
$bus_id = $fwRequest->getparam('bus_id', 0);
$poid = $fwRequest -> getParamget('poid','');
$qid = $fwRequest -> getParamget('qid','');

$sql = "select po_quote1, po_quote2, po_quote3 from purchase_order where po_id = ".$poid;
$quotedata = $fwDb->queryOne($sql); 


if($qid == 1) {
	$fwViewData['quote'] = $quotedata['po_quote1'];
} elseif ($qid == 2) {
	$fwViewData['quote'] = $quotedata['po_quote2'];
} elseif ($qid == 3) {
	$fwViewData['quote'] = $quotedata['po_quote3'];
}

$user = $_SESSION['user']['user_id'];


$submit = $fwRequest->getParam('save','');
if(!empty($submit))
{
	$quotedetail = $fwRequest -> getParam('quote','');

	
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
				
		

        if($qid == 1) {
		if($_FILES['quote1']['tmp_name']) { $savedata['po_quote1']    = $docfile; }
		//$savedata['po_quote1']    = $docfile;
		$savedata['po_supplier1'] = $quotedetail['po_supplier'];
		$savedata['po_value1']    = $quotedetail['po_value'];
		
	} elseif ($qid == 2) {
		//$savedata['po_quote2']    = $docfile;
		$savedata['po_supplier2'] = $quotedetail['po_supplier'];
		$savedata['po_value2']    = $quotedetail['po_value'];
	} elseif ($qid == 3) {
		//$savedata['po_quote3']    = $docfile;
		$savedata['po_supplier3'] = $quotedetail['po_supplier'];
		$savedata['po_value3']    = $quotedetail['po_value'];
	}
	$savedata['po_type']    = $quotedetail['po_type'];

	$tablePo->setWhere("po_id = ". $poid);
	//$savedata['po_acceptance_date'] =  date('d-m-Y');
	//$savedata['po_quote_accepted'] =  $qid;
	$tablePo->updateRow($savedata);
	
			//Location(BASE_URL . "business.taskdetail/bsn_id/".$bus_id."/uid/".$taskId);	
}

$sql = "select * from purchase_order where po_id = ".$poid;
        $quotedata = $fwDb->queryOne($sql); 
	$qid = $fwRequest -> getParamget('qid','');
	

	if($qid == 1) {
		$fwViewData['quote'] = $quotedata['po_quote1'];
		$detail['supplier'] = $quotedata['po_supplier1'];
		$detail['value'] = $quotedata['po_value1'];
	} elseif ($qid == 2) {
		$fwViewData['quote'] = $quotedata['po_quote2'];
		$detail['supplier'] = $quotedata['po_supplier2'];
		$detail['value'] = $quotedata['po_value2'];
	} elseif ($qid == 3) {
		$fwViewData['quote'] = $quotedata['po_quote3'];
		$detail['supplier'] = $quotedata['po_supplier3'];
		$detail['value'] = $quotedata['po_value3'];
	}
	$detail['po_type'] = $quotedata['po_type'];
	$fwViewData['detail'] = $detail;
	