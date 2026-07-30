<?php

require_once(MODULES_DIR . 'CommonClass.php');

require_once(LIB_DIR . 'Fw/Db.php');
require_once(LIB_DIR . 'EmailClass.php');
require_once(LIB_DIR . 'SmsClass.php');

class ServiceClass extends CommonClass
{
    public $fwDb;
    public $warranty_log_table;
    public $warranty_log_attachments_table;
    public $warranty_log_inspection_attachments_table;

    public function __construct()
    {
        $this->fwDb = new Fw_Db;
        $this->warranty_log_table = new Fw_Db_Table('warranty_log');
        $this->warranty_log_attachments_table = new Fw_Db_Table('warranty_log_attachments');
        $this->warranty_log_inspection_attachments_table = new Fw_Db_Table('warranty_log_inspection_attachments');
    }

    public function setLogPhotosIdWise($id = 0)
    {
        $response = [];

        if ($id > 0) {
            $this->warranty_log_table->setWhere('wa_id = ' . $id);
        }
        $result = $this->warranty_log_table->getRows();
        foreach ($result as $row) {
            if (!isset($response[$row['wa_id']])) {
                $response[$row['wa_id']] = [];
            }
            if ($row['wa_image_1']) {
                $response[$row['wa_id']][] = [
                    'wa_image' => 'wa_image_1',
                    'file' => $row['wa_image_1'],
                    'url' => ('/warranty_log.download_content?file_name=' . $row['wa_image_1'] . '&module_name=warranty_log.home'),
                ];
            }
            if ($row['wa_image_2']) {
                $response[$row['wa_id']][] = [
                    'wa_image' => 'wa_image_2',
                    'file' => $row['wa_image_2'],
                    'url' => ('/warranty_log.download_content?file_name=' . $row['wa_image_2'] . '&module_name=warranty_log.home'),
                ];
            }
            if ($row['wa_image_3']) {
                $response[$row['wa_id']][] = [
                    'wa_image' => 'wa_image_3',
                    'file' => $row['wa_image_3'],
                    'url' => ('/warranty_log.download_content?file_name=' . $row['wa_image_3'] . '&module_name=warranty_log.home'),
                ];
            }
            if ($row['wa_image_4']) {
                $response[$row['wa_id']][] = [
                    'wa_image' => 'wa_image_4',
                    'file' => $row['wa_image_4'],
                    'url' => ('/warranty_log.download_content?file_name=' . $row['wa_image_4'] . '&module_name=warranty_log.home'),
                ];
            }
            if ($row['wa_image_5']) {
                $response[$row['wa_id']][] = [
                    'wa_image' => 'wa_image_5',
                    'file' => $row['wa_image_5'],
                    'url' => ('/warranty_log.download_content?file_name=' . $row['wa_image_5'] . '&module_name=warranty_log.home'),
                ];
            }
        }

        if ($id > 0) {
            $this->warranty_log_attachments_table->setWhere('wla_wa_id = ' . $id);
        }
        $this->warranty_log_attachments_table->setWhere('wla_type = "photo"');
        $result = $this->warranty_log_attachments_table->getRows();
        foreach ($result as $row) {
            if (!isset($response[$row['wla_wa_id']])) {
                $response[$row['wla_wa_id']] = [];
            }
            $response[$row['wla_wa_id']][] = [
                'wla_id' => $row['wla_id'],
                'file' => $row['wla_file'],
                'url' => ('/warranty_log.download_content?file_name=' . $row['wla_file'] . '&module_name=warranty_log.home'),
            ];
        }

        if ($id > 0 && isset($response[$id])) {
            return $response[$id];
        }

        return $response;
    }

    public function setLogVideosIdWise($id = 0)
    {
        $response = [];

        if ($id > 0) {
            $this->warranty_log_table->setWhere('wa_id = ' . $id);
        }
        $result = $this->warranty_log_table->getRows();
        foreach ($result as $row) {
            if (!isset($response[$row['wa_id']])) {
                $response[$row['wa_id']] = [];
            }
            if ($row['wa_video']) {
                $response[$row['wa_id']][] = [
                    'wa_image' => 'wa_video',
                    'file' => $row['wa_video'],
                    'url' => ('/warranty_log.download_content?file_name=' . $row['wa_video'] . '&module_name=warranty_log.home'),
                ];
            }
        }

        if ($id > 0) {
            $this->warranty_log_attachments_table->setWhere('wla_wa_id = ' . $id);
        }
        $this->warranty_log_attachments_table->setWhere('wla_type = "video"');
        $result = $this->warranty_log_attachments_table->getRows();
        foreach ($result as $row) {
            if (!isset($response[$row['wla_wa_id']])) {
                $response[$row['wla_wa_id']] = [];
            }
            $response[$row['wla_wa_id']][] = [
                'wla_id' => $row['wla_id'],
                'file' => $row['wla_file'],
                'url' => ('/warranty_log.download_content?file_name=' . $row['wla_file'] . '&module_name=warranty_log.home'),
            ];
        }

        if ($id > 0 && isset($response[$id])) {
            return $response[$id];
        }

        return $response;
    }

    public function setLogInspectionPhotoIdWise($id = 0)
    {
        $response = [];

        if ($id > 0) {
            $this->warranty_log_inspection_attachments_table->setWhere('wlia_wa_id = ' . $id);
        }
        $result = $this->warranty_log_inspection_attachments_table->getRows();
        foreach($result as $row) {
            if(!isset($response[$row['wlia_wa_id']])) {
                $response[$row['wlia_wa_id']] = [];
            }
            $response[$row['wlia_wa_id']][] = [
                'wlia_id' => $row['wlia_id'],
                'file' => $row['wlia_file'],
                'url' => ('/warranty_log.download_content?file_name=' . $row['wlia_file'] . '&module_name=warranty_log.inspection'),
            ];
        }

        if ($id > 0 && isset($response[$id])) {
            return $response[$id];
        }

        return $response;
    }

    public function sendImmediateEmailAndSms($warrantyLog, $row = [])
    {
        if(empty($row)) {
            $query = 'SELECT WL.wa_id, WL.wa_project, WL.wa_problem, WL.wa_is_inspection_fee_required, WL.wa_is_inspection_fee_required_accepted, B.bsn_name, B.bsn_id, BC.bcust_fname, BC.bcust_lname, BC.bcust_misc_email1, BC.bcust_misc_moble FROM warranty_log AS WL LEFT JOIN business AS B ON B.bsn_name = WL.wa_project INNER JOIN business_sellers AS BS ON BS.bs_business_id = B.bsn_id INNER JOIN bus_customers AS BC ON BC.bcust_id = BS.bs_customers_id WHERE WL.wa_id = ' . $warrantyLog['wa_id'] . ';';
            $row = $this->fwDb->queryOne($query);
        }

        $loginLink = 'https://warrantyreport.com.au/login';
        if(!empty($row)) {
            $customerName = $row['bcust_fname'] . ' ' . $row['bcust_lname'];
            $customerEmail = $row['bcust_misc_email1'];
            $customerMobile = $row['bcust_misc_moble'];

            $html = '';
            $html .= '<p>Dear ' . $customerName . ',</p>';
            $html .= '<p>We hope you are doing well.</p>';
            $html .= '<p>This email is to inform you that there are one or more items currently pending in the <strong>Customer Action Required</strong> section of your account. These items need your attention in order for us to proceed without delays.</p>';
            $html .= '<p>Please log in and review the required actions at your earliest convenience using the link below:<br><a href="' . $loginLink . '" target="_blank">Portal Login Link</a></p>';
            $html .= '<p>Once the required actions are completed, our team will be able to move forward with the next steps of your project.</p>';
            $html .= '<p>If you have already taken care of these items, please disregard this message. If you have any questions or need assistance, feel free to reply to this email - we\'re happy to help.</p>';
            $html .= '<p>Thank you for your prompt attention and cooperation.</p>';
            $html .= '<p>Kind regards,<br>CGFB Warranty Team</p>';

            $emailObj = new EmailClass;

            $emailObj->subject = 'You have a new action to complete';
            $emailObj->message = $html;
            $emailObj->addFrom('warranty@cgfb.com.au', 'CGFB Warranty');
            // $emailObj->addTo($customerEmail, $customerName);
            $emailObj->addTo('rahul@ephpsolutions.com', 'Rahul');
            $emailObj->addTo('designer@ephpsolutions.com', 'Vivek');
            $emailObj->addTo('amans@ephpsolutions.com', 'Aman');
            $emailObj->addTo('coo@cgfb.com.au', 'COO');
            $emailObj->attachments = [];

            $response = $emailObj->sendEmail();
            $metaData = [
                'module_name' => 'inspection_warranty_log.view_log_detail',
                'table_name' => 'warranty_log',
                'column_name' => 'wa_id',
                'column_id' => $row['wa_id'],
            ];
            $emailObj->logSendEmail($response, $metaData);

            $message = 'You have a new action to complete';
            // $to = $customerMobile;
            // $smsObj = new SmsClass($to, $message);
            // $response = $smsObj->send();
            // $metaData['to'] = [
            //     [
            //         'email' => $to,
            //         'name' => $customerName,
            //     ]
            // ];
            // $smsObj->log($response, $metaData);

            $to = '+918602488442';
            $smsObj = new SmsClass($to, $message);
            $response = $smsObj->send();
            $metaData['to'] = [
                [
                    'email' => $to,
                    'name' => 'Aman',
                ]
            ];
            $smsObj->log($response, $metaData);
            $to = '+919960963552';
            $smsObj = new SmsClass($to, $message);
            $response = $smsObj->send();
            $metaData['to'] = [
                [
                    'email' => $to,
                    'name' => 'Rahul',
                ]
            ];
            $smsObj->log($response, $metaData);
            $to = '+918390556196';
            $smsObj = new SmsClass($to, $message);
            $response = $smsObj->send();
            $metaData['to'] = [
                [
                    'email' => $to,
                    'name' => 'Vivek',
                ]
            ];
            $smsObj->log($response, $metaData);

        }
    }
}
