<?php

require_once(MODULES_DIR . 'CommonClass.php');

require_once(LIB_DIR . 'Fw/Db.php');

class ServiceClass extends CommonClass
{
    public $warranty_form_table;
    public $warranty_form_attachments_table;

    public function __construct()
    {
        $this->warranty_form_table = new Fw_Db_Table('warranty_form');
        $this->warranty_form_attachments_table = new Fw_Db_Table('warranty_form_attachments');
    }

    public function setLogPhotosIdWise($id = 0)
    {
        $response = [];

        if($id > 0) {
            $this->warranty_form_table->setWhere('wf_id = ' . $id);
        }
        $result = $this->warranty_form_table->getRows();
        foreach($result as $row) {
            if(!isset($response[$row['wf_id']])) {
                $response[$row['wf_id']] = [];                
            }
            if ($row['wf_photo_1']) {
                $response[$row['wf_id']][] = [
                    'wf_photo' => 'wf_photo_1',
                    'file' => $row['wf_photo_1'],
                    'url' => ('/warranty_log_clearing_center.download_content?file_name=' . $row['wf_photo_1'] . '&module_name=warranty_log_clearing_center.home'),
                ];
            }
            if ($row['wf_photo_2']) {
                $response[$row['wf_id']][] = [
                    'wf_photo' => 'wf_photo_2',
                    'file' => $row['wf_photo_2'],
                    'url' => ('/warranty_log_clearing_center.download_content?file_name=' . $row['wf_photo_2'] . '&module_name=warranty_log_clearing_center.home'),
                ];
            }
            if ($row['wf_photo_3']) {
                $response[$row['wf_id']][] = [
                    'wf_photo' => 'wf_photo_3',
                    'file' => $row['wf_photo_3'],
                    'url' => ('/warranty_log_clearing_center.download_content?file_name=' . $row['wf_photo_3'] . '&module_name=warranty_log_clearing_center.home'),
                ];
            }
            if ($row['wf_photo_4']) {
                $response[$row['wf_id']][] = [
                    'wf_photo' => 'wf_photo_4',
                    'file' => $row['wf_photo_4'],
                    'url' => ('/warranty_log_clearing_center.download_content?file_name=' . $row['wf_photo_4'] . '&module_name=warranty_log_clearing_center.home'),
                ];
            }
            if ($row['wf_photo_5']) {
                $response[$row['wf_id']][] = [
                    'wf_photo' => 'wf_photo_5',
                    'file' => $row['wf_photo_5'],
                    'url' => ('/warranty_log_clearing_center.download_content?file_name=' . $row['wf_photo_5'] . '&module_name=warranty_log_clearing_center.home'),
                ];
            }
        }

        if($id > 0) {
            $this->warranty_form_attachments_table->setWhere('wfa_wf_id = ' . $id);
        }
        $this->warranty_form_attachments_table->setWhere('wfa_type = "photo"');
        $result = $this->warranty_form_attachments_table->getRows();
        foreach($result as $row) {
            if(!isset($response[$row['wfa_wf_id']])) {
                $response[$row['wfa_wf_id']] = [];                
            }
            $response[$row['wfa_wf_id']][] = [
                'wfa_id' => $row['wfa_id'],
                'file' => $row['wfa_file'],
                'url' => ('/warranty_log_clearing_center.download_content?file_name=' . $row['wfa_file'] . '&module_name=warranty_log_clearing_center.home'),
            ];
        }

        if($id > 0 && isset($response[$id])) {
            return $response[$id];
        }

        return $response;
    }

    public function setLogVideosIdWise($id = 0)
    {
        $response = [];

        if($id > 0) {
            $this->warranty_form_table->setWhere('wf_id = ' . $id);
        }
        $result = $this->warranty_form_table->getRows();
        foreach($result as $row) {
            if(!isset($response[$row['wf_id']])) {
                $response[$row['wf_id']] = [];                
            }
            if ($row['wf_video']) {
                $response[$row['wf_id']][] = [
                    'wf_photo' => 'wf_video',
                    'file' => $row['wf_video'],
                    'url' => ('/warranty_log_clearing_center.download_content?file_name=' . $row['wf_video'] . '&module_name=warranty_log_clearing_center.home'),
                ];
            }
        }

        if($id > 0) {
            $this->warranty_form_attachments_table->setWhere('wfa_wf_id = ' . $id);
        }
        $this->warranty_form_attachments_table->setWhere('wfa_type = "video"');
        $result = $this->warranty_form_attachments_table->getRows();
        foreach($result as $row) {
            if(!isset($response[$row['wfa_wf_id']])) {
                $response[$row['wfa_wf_id']] = [];                
            }
            $response[$row['wfa_wf_id']][] = [
                'wfa_id' => $row['wfa_id'],
                'file' => $row['wfa_file'],
                'url' => ('/warranty_log_clearing_center.download_content?file_name=' . $row['wfa_file'] . '&module_name=warranty_log_clearing_center.home'),
            ];
        }

        if($id > 0 && isset($response[$id])) {
            return $response[$id];
        }

        return $response;
    }

}