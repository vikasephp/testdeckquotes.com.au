<?php

require_once(LIB_DIR . 'Fw/Db.php');

class CommonClass
{
    public $fwDb;

    public function __construct()
    {
        $this->fwDb = new Fw_Db;
    }

    public function formatProjectStatus($projectStatus)
    {
        $projectStatusIDs = explode('|', $projectStatus);

        foreach($projectStatusIDs as $key => $value) {
            if($value == '') {
                unset($projectStatusIDs[$key]);
            }
        }

        $sql = 'SELECT GROUP_CONCAT(st_name SEPARATOR "<br>") AS project_status FROM `busness_status` WHERE st_id IN (' . implode(',', $projectStatusIDs) . ')';
        $result = $this->fwDb->queryOne($sql);

        if(empty($result) || !isset($result['project_status'])) {
            return '';
        }

        return $result['project_status'];
    }
}