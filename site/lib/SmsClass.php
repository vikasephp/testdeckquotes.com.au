<?php

require_once(LIB_DIR . 'Fw/Db.php');

class SmsClass
{
    public $recipient;
    public $message;
    public $sender;
    protected $url;

    public function __construct($recipient, $message)
    {
        $this->sender = 'CGFB';
        $this->recipient = $recipient;
        $this->message = $message;
        $this->url = "http://api.directsms.com.au/s3/http/send_message?username=manojsoniephp&password=jaimatadi108&message=" . urlencode($message) . "&type=1-way&senderid=" . urlencode($this->sender) . "&to=" . $recipient;
    }

    public function send()
    {
        $response = [
            'success' => true,
            'message' => 'Sms sent successfully'
        ];
        try {
            $output = file($this->url);
            $result = explode(":", $output[0]);
            if ($result[0] != "id") {
                throw(new Exception($result[1] ?? 'SMS Error'));
            }
        }
         catch (Exception $e) {
            //echo $e->getMessage(); //Boring error messages from anything else!
            $response['success'] = false;
            $response['message'] = $e->getMessage();
        }

        return $response;
    }

    public function log($response, $metaData = [])
    {
        $data = [
            'module_name' => $metaData['module_name'],
            'table_name' => $metaData['table_name'],
            'column_name' => $metaData['column_name'],
            'column_id' => $metaData['column_id'],
            'email_to' => json_encode($metaData['to']),
            'email_message' => $this->message,
            'response_success' => $response['success'],
            'response_message' => $response['message'],
        ];
        $table = new Fw_Db_Table('sms_log');
        $table->insertRow($data);
    }
}