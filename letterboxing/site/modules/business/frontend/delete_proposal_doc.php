<?php
$bsn_id = $fwRequest->getparam('bsn_id', 0);
$doc_id = $fwRequest->getparam('doc_id', 0);
if ($doc_id > 0)
{
		
    $thisTable = new Fw_Db_Table('document_check_list_mini');
    $thisTable->setWhere("doc_id = $doc_id");
    $thisTable->deleteRow();
	
}

	//header('Location: '.$_SERVER['REQUEST_URI']);
	Location(BASE_URL . $XFA['detail'] .'/bsn_id/'.$bsn_id);
