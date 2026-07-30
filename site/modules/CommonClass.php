<?php

require_once(LIB_DIR . 'Fw/Db.php');

class CommonClass
{
    public $fwDb;

    public function __construct()
    {
        $this->fwDb = new Fw_Db;
    }
}