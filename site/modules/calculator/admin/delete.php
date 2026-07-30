<?php
$cd_id  = (int)$fwRequest->getparam('cd_id', 0);
$cw_id  = (int)$fwRequest->getparam('cw_id', 0);
$csf_id = (int)$fwRequest->getparam('csf_id', 0);
$chr_id = (int)$fwRequest->getparam('chr_id', 0);

if ($cd_id > 0)
{
    $thisTable = new Fw_Db_Table('calculator_decking');
    $thisTable->setWhere("cd_id = $cd_id");
    $thisTable->deleteRow();
	Location(BASE_URL . $XFA['list']);
}

if ($cw_id  > 0)
{
    $thisTable = new Fw_Db_Table('calculator_wrapping');
    $thisTable->setWhere("cw_id = $cw_id");
    $thisTable->deleteRow();
	Location(BASE_URL . $XFA['list_wrapping']);
}

if ($csf_id  > 0)
{
    $thisTable = new Fw_Db_Table('calculator_subframe');
    $thisTable->setWhere("csf_id = $csf_id");
    $thisTable->deleteRow();
	Location(BASE_URL . $XFA['list_subframe']);
}

if ($chr_id  > 0)
{
    $thisTable = new Fw_Db_Table('calculator_handrail');
    $thisTable->setWhere("chr_id = $chr_id");
    $thisTable->deleteRow();
	Location(BASE_URL . $XFA['list_handrail']);
}