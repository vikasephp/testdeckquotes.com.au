<?php



$this_id = (int)$fwRequest->getparam('es_id', 0);



if ($this_id > 0)

{

    $thisTable = new Fw_Db_Table('email_signature');

    $thisTable->setWhere("es_id = $this_id");

    $thisTable->deleteRow();

}



Location(BASE_URL . $XFA['list']);