<?php

require_once(LIB_DIR . 'Fw/Db.php');

class ServiceClass
{
    public $fwDb;
    public $primary_table;
    public $inspection_warranty_log_records_table;

    public function __construct()
    {
        $this->fwDb = new Fw_Db;
        $this->primary_table = new Fw_Db_Table('inspection_warranty_log');
        $this->inspection_warranty_log_records_table = new Fw_Db_Table('inspection_warranty_log_records');
    }

    public function getRecord(array $data)
    {
        $inspection_warranty_log = [];
        if (isset($data['bsn_id']) && isset($data['bcust_id'])) {
            $this->primary_table->setWhere('iwl_bsn_id = ' . $data['bsn_id'] . ' AND iwl_bcust_id = ' . $data['bcust_id']);
            $inspection_warranty_log = $this->primary_table->getRow();
        }

        return $inspection_warranty_log;
    }

    private function createRecord(array $data)
    {
        return $this->primary_table->insertRow($data);
    }

    public function findOrCreateRecord(array $data)
    {
        $inspection_warranty_log = $this->getRecord($data);

        if (empty($inspection_warranty_log)) {
            $inspection_warranty_log = [
                'iwl_bsn_id' => $data['bsn_id'],
                'iwl_bcust_id' => $data['bcust_id'],
            ];
            $iwl_id = $this->createRecord($inspection_warranty_log);
            $inspection_warranty_log['iwl_id'] = $iwl_id;
        }

        return $inspection_warranty_log;
    }

    public function getInspectionRecord(array $data, $query = false)
    {
        $inspection_warranty_log_records = [];
        if (isset($data['iwl_id']) && isset($data['wa_id'])) {
            $this->inspection_warranty_log_records_table->setWhere('iwlr_iwl_id = ' . $data['iwl_id'] . ' AND iwlr_wa_id = ' . $data['wa_id']);
            if($query) {
                return $this->inspection_warranty_log_records_table;
            }
            $inspection_warranty_log_records = $this->inspection_warranty_log_records_table->getRow();
        }
        return $inspection_warranty_log_records;
    }

    public function createInspectionRecord(array $data)
    {
        return $this->inspection_warranty_log_records_table->insertRow($data);
    }

    public function findOrCreateInspectionRecord(array $data)
    {
        $inspection_warranty_log = $this->findOrCreateRecord($data);

        $inspection_warranty_log_records = $this->getInspectionRecord([
            'iwl_id' => $inspection_warranty_log['iwl_id'],
            'wa_id' => $data['wa_id'],
        ]);

        if (empty($inspection_warranty_log_records)) {
            $inspection_warranty_log_records = [
                'iwlr_iwl_id' => $inspection_warranty_log['iwl_id'],
                'iwlr_wa_id' => $data['wa_id'],
            ];
            $iwlr_id = $this->createInspectionRecord($inspection_warranty_log_records);
            $inspection_warranty_log_records['iwlr_id'] = $iwlr_id;
        }

        return $inspection_warranty_log_records;
    }

    public function deleteInspectionRecord(array $data)
    {
        if(isset($data['wa_id'])) {
            $this->inspection_warranty_log_records_table->setWhere('iwlr_wa_id = ' . $data['wa_id']);
            $this->inspection_warranty_log_records_table->deleteRow();
        }
    }
}
