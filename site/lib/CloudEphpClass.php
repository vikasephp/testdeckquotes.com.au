<?php

require_once(LIB_DIR . 'Fw/Db.php');
// require_once(LIB_DIR . 'BackblazeClass.php');
// require_once(LIB_DIR . 'GoogleClass.php');

class CloudEphpClass
{
    public $location;
    public $cloudService;

    public function __construct(string $module, string $cloudService = '')
    {
        $this->location = $this->getLocationByModule($module);
        $this->cloudService = $cloudService ? $cloudService : BUCKET_SERVICE;
    }

    public function getCloudKeys()
    {
        $fwDb = Fw_Db::getInstance();
        if ($this->cloudService == 's3') {
            $sql = "SELECT * FROM s3bucket WHERE s_id = 1";
            $res = $fwDb->queryOne($sql);
            return [
                'ACCESS_KEY' => $res['s_acc_k'],
                'SECRET_KEY' => $res['s_sec_k'],
                'BUCKET_NAME' => $res['s_bucket_name'],
            ];
        }

        if ($this->cloudService == 'gcs') {
            $sql = "SELECT * FROM bucket_gcs WHERE id = 1";
            $res = $fwDb->queryOne($sql);
            // db($res);
            return [
                'GOOGLE_JSON_FILE' => $res['json_path'],
                'BUCKET_NAME' => $res['bucket'],
                'DOWNLOAD_DURATION' => $res['download_duration'],
            ];
        }

        if ($this->cloudService == 'b2') {
            // $sql = "SELECT * FROM bucket_b2 WHERE id = 1";
            // $res = $fwDb->queryOne($sql);
            // return [
            //     'BUCKET_NAME' => $res['application_key_id'],
            //     'BUCKET_NAME' => $res['application_key'],
            //     'BUCKET_NAME' => $res['application_key'],
            //     'BUCKET_NAME' => $res['master_key_id'],
            //     'BUCKET_NAME' => $res['bucket_id'],
            //     'BUCKET_NAME' => $res['bucket_name'],
            //     'BUCKET_NAME' => $res['download_duration'],
            // ];
        }
    }

    public function getLocationByModule(string $module)
    {
        if(in_array($module, ['lateletter_report.home'])) {
            return 'files/progress_payment_doc/';
        }
        if (in_array($module, ['site.design_plan'])) {
            return 'files/designplan_doc/';
        }
        if (in_array($module, ['emaillibrary.home', 'last_meeting_minutes.home', 'lastest_meeting_minutes.home', 'latest_merge_plan.home', 'site.design_doc', 'site.email_log', 'site.SDUploadeddocuments', 'business.home', 'business.detail'])) {
            return 'files/document_check_list_files/';
        }
        if (in_array($module, ['business_qa.home'])) {
            return 'files/business_qa/';
        }
        if (in_array($module, ['poincc.home', 'poincc2.home', 'poincc3.home', 'rejected_invoice_report.home'])) {
            return 'files/purchase_order_invoice/';
        }
        if (in_array($module, ['site.proposal_site_scope'])) {
            return 'files/special_conditions_doc/';
        }
        if (in_array($module, ['site.email_log.template_attachment'])) {
            return 'files/templates_document_hub/';
        }
        if (in_array($module, ['30_days_rec_report.home', 'design_report.home_active', 'designer_tracker.home', 'site.latest_client_letter'])) {
            return 'files/uploads/';
        }
        if (in_array($module, ['asset_list.home'])) {
            return 'files/asset_list/';
        }
        if (in_array($module, ['prospect_list.home'])) {
            return 'files/prospect_list/';
        }
        if (in_array($module, ['calculator_qa.home'])) {
            return 'files/design_qa_doc/';
        }
        if (in_array($module, ['edc.home'])) {
            return 'files/employee_documents/';
        }
        if (in_array($module, ['design_qa.home'])) {
            return 'files/design_qa_doc/';
        }
        if (in_array($module, ['datracker.home'])) {
            return 'files/meeting_minutes_doc/';
        }
        if (in_array($module, ['gcon_guide.home', 'mistake_log.home'])) {
            return 'files/mistake_log/';
        }
        if (in_array($module, ['letter_database.home'])) {
            return 'files/scanned_letters/';
        }
        if (in_array($module, ['meeting_minutes.home'])) {
            return 'files/meeting_minutes_doc/';
        }
        if (in_array($module, ['availability_list.home'])) {
            return 'files/meeting_minutes_doc/';
        }
        if (in_array($module, ['development_log.home'])) {
            return 'files/development_log/';
        }
        if (in_array($module, ['position_matrix.home'])) {
            return 'files/meeting_minutes_doc/';
        }
        if (in_array($module, ['sales_document_explained.home'])) {
            return 'files/sales_document_explained/';
        }
        if (in_array($module, ['sales_process_explained.home'])) {
            return 'files/sales_process_explained/';
        }
        if (in_array($module, ['design_documents.home'])) {
            return 'files/design_documents/';
        }
        if (in_array($module, ['planning_documents.home'])) {
            return 'files/planning_documents/';
        }
        if (in_array($module, ['sample_project_guidance.home'])) {
            return 'files/sample_project_guidance/';
        }
        if (in_array($module, ['site_progress_report.home'])) {
            return 'files/site_progress_report/';
        }
        if (in_array($module, ['proposal_documents.home'])) {
            return 'files/proposal_documents/';
        }
        if(in_array($module, ['construction_invoice_disputes.home'])) {
            return 'files/construction_invoice_disputes/';
        }
        if (in_array($module, ['design_timeline.home'])) {
            return 'files/design_timeline/';
        }
        if (in_array($module, ['inclusion_timeline.home'])) {
            return 'files/inclusion_timeline/';
        }
        if (in_array($module, ['proposal_timeline.home'])) {
            return 'files/proposal_timeline/';
        }
        if (in_array($module, ['planning_approval_common_questions.home'])) {
            return 'files/planning_approval_common_questions/';
        }
        if(in_array($module, ['warranty_log.home', 'site.warranty_issue', 'warranty_log_clearing_center.home'])) {
            return 'files/warranty_log/';
        }
        if (in_array($module, ['inspection_warranty_log.acknowledgement_statement'])) {
            return 'files/warranty_log/acknowledgement_statements/';
        }
        if(in_array($module, ['warranty_log.notes'])) {
            return 'files/warranty_log/notes/';
        }
        if (in_array($module, ['warranty_log.inspection'])) {
            return 'files/warranty_log/inspections/';
        }
		if (in_array($module, ['inclusions_calculation_report.home'])) {
            return 'files/inclusions_calculation_report/';
        }
		if (in_array($module, ['delivery_schedule_report.feedback'])) {
            return 'files/delivery_schedule_report_feedback/';
        }
		if (in_array($module, ['insurance_manager.home'])) {
            return 'files/insurance_manager/';
        }
		if (in_array($module, ['planning_knowledge_library.home'])) {
            return 'files/planning_knowledge_library/';
        }
		if (in_array($module, ['planning_legislation_register.home'])) {
            return 'files/planning_legislation_register/';
        }
        return 'files/uploads/';
    }

    public function getHeaders($headerText)
    {
        $headers = [];
        foreach (explode("\r\n", $headerText) as $i => $line) {
            if ($i === 0) {
                $headers['http_code'] = $line;
            } else {
                list($key, $value) = explode(': ', $line);

                $headers[$key] = $value;
            }
        }
        return $headers;
    }

    function handleCloudDownload($file, $isDownload)
    {
        $location = $this->location;
        if ($this->cloudService == 's3') {
            $cloudKeys = $this->getCloudKeys();
            $filetoinclude = $_SERVER['DOCUMENT_ROOT'] . '/file_upload/server/s3/S3.php';
            include_once $filetoinclude;
            $s3 = new S3($cloudKeys['ACCESS_KEY'], $cloudKeys['SECRET_KEY']);
            $file_data = $s3->getObject($cloudKeys['BUCKET_NAME'], urlencode($location . $file), $saveTo = false);
            	// echo "<pre>";print_r($file_data);   echo "Content-Type: ".$file_data->headers['type'];
            $file_raw_data = $file_data->body;
            $fileWithPath = $_SERVER['DOCUMENT_ROOT'] . '/download_files/' . $file;
            $txt = fopen($fileWithPath, "w") or die("Unable to open file!");
            fwrite($txt, $file_raw_data);
            fclose($txt);
            if (!$isDownload) {
                return BASE_URL . 'download_files/' . $file;
            }
            header('Content-Description: File Transfer');
            header('Content-Disposition: attachment; filename=' . basename($fileWithPath));
            header('Expires: 0');
            header('Cache-Control: must-revalidate');
            header('Pragma: public');
            header('Content-Length: ' . filesize($fileWithPath));
            header("Content-Type: " . $file_data->headers['type']);
            readfile($fileWithPath);
            return;
        }

        if ($this->cloudService == 'gcs') {
            $cloudKeys = $this->getCloudKeys();
            $googleObj = new GoogleClass($cloudKeys);
            if ($isDownload) {
                return $googleObj->download($location, $file);
            }
            return $googleObj->getDownloadUrl($location, $file);
        }

        if ($this->cloudService == 'b2') {
            $backblazeObj = new BackblazeClass;
            if ($isDownload) {
                $response = $backblazeObj->downloadFileByName($this->location, $file);
                list($headerText, $content) = explode("\r\n\r\n", $response, 2);
                // db($headerText, 'headerText');
                $headers = $this->getHeaders($headerText);
                // db($headers, 'headers');
                // exit;
                $fileWithPath = $_SERVER['DOCUMENT_ROOT'] . '/download_files/' . $file;
                $txt = fopen($fileWithPath, "w") or die("Unable to open file!");
                fwrite($txt, $content);
                fclose($txt);
                header('Content-Description: File Transfer');
                header('Content-Disposition: attachment; filename=' . basename($fileWithPath));
                header('Expires: 0');
                header('Cache-Control: must-revalidate');
                header('Pragma: public');
                // header('Content-Length: ' . filesize($fileWithPath));
                header('Content-Length: ' . $headers['Content-Length']);
                header("Content-Type: " . $headers['Content-Type']);
                readfile($fileWithPath);
                return;
            }
            return $backblazeObj->getDownloadUrl($this->location, $file);
        }
    }

    public function download($file, $isDownload = true)
    {
        try {
            return $this->handleCloudDownload($file, $isDownload);
        } catch (ErrorException $ex) {
            //$this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
            echo $ex->getLine();
            return false;
        }
    }

    public function handleCloudUpload($filename, $tmpname)
    {
        $location = $this->location;
        if ($this->cloudService == 's3') {
            $cloudKeys = $this->getCloudKeys();
            $filetoinclude = $_SERVER['DOCUMENT_ROOT'] . '/file_upload/server/s3/S3.php';
            include_once $filetoinclude;
            $s3 = new S3($cloudKeys['ACCESS_KEY'], $cloudKeys['SECRET_KEY']);

            header('Access-Control-Allow-Origin: *');
            $date = date("Y-m-d H:i:s");

            $path = getcwd();
            $rem = $path . '/' .  basename($filename);
            if (move_uploaded_file($tmpname, $rem)) {
                $flag = false;
                if ($s3->putObjectFile($rem, $cloudKeys['BUCKET_NAME'], $location . $filename, S3::ACL_PRIVATE)) {
                    $flag = true;
                } else {
                    sleep(10);
                    if ($s3->putObjectFile($rem, $cloudKeys['BUCKET_NAME'],  $location . $filename, S3::ACL_PRIVATE))
                        $flag = true;
                }
            }

            unlink($rem);
            return $flag;
        }

        if ($this->cloudService == 'gcs') {
            $cloudKeys = $this->getCloudKeys();
            $googleObj = new GoogleClass($cloudKeys);
            $googleObj->uploadFile(
                $location,
                [
                    'tmp_name' => $tmpname,
                    'name' => $filename
                ]
            );
            return true;
        }

        if ($this->cloudService == 'b2') {
            $backblazeObj = new BackblazeClass;
            $file = [
                'name' => $filename,
                'tmp_name' => $tmpname
            ];
            // db($file);
            $backblazeObj->uploadFile($file, $this->location);
            return true;
        }
    }

    public function upload($filename, $tmpname)
    {
        try {
            return $this->handleCloudUpload($filename, $tmpname);
        } catch (ErrorException $ex) {
            //$this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
            return $ex->getLine();
        }
    }
}
