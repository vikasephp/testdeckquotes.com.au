<?php
$this_id = $fwRequest->getparamget('id', '');
$doc_id = $fwRequest->getparamget('doc_id', '');		

if($this_id > 0)
	{


		$thisTable = new Fw_Db_Table('quote_builder');
		$thisTable->setWhere("qb_id = ".$this_id);
		$data =  $thisTable->getRow();
		$data1 = $data['qb_proj_docs'];
		$newdata = str_replace("|".$doc_id."|","|",$data1);
		
		$delData['qb_proj_docs']=$newdata;	
		
		
		$thisTable->updateRow($delData);

		Location(BASE_URL . $XFA['detail'].'/qb_id/'.$this_id);
	}
exit;