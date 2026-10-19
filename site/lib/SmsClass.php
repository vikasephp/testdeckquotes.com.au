<?php

require_once(LIB_DIR . 'Fw/Db.php');

class SmsClass
{
    public $recipient;
    public $message;
    public $sender;
    protected $url;
    protected $postData;
    protected $configError;

    public function __construct($recipient, $message, $sender = null)
    {
        $this->recipient = preg_replace('/\D/', '', (string)$recipient);
        $this->message = $message;
        $this->configError = '';
        $this->url = '';
        $this->postData = '';
        $this->sender = $sender;

        $config = self::getConfig();
        if (empty($config)) {
            $this->configError = 'SMS API credentials are not configured.';
            return;
        }

        if ($this->sender === null || $this->sender === '') {
            $this->sender = $config['sac_sender_id'];
        }

        $this->url = $config['sac_api_url'];
        $this->postData = http_build_query([
            'username' => $config['sac_username'],
            'password' => $config['sac_password'],
            'message' => $this->message,
            'type' => $config['sac_message_type'],
            'senderid' => $this->sender,
            'to' => $this->recipient,
        ]);
    }

    protected static function secureUrl($url)
    {
        return preg_replace('#^http://api\.directsms\.com\.au/s3/http/#i', 'https://api.directsms.com.au/s3/https/', $url);
    }

    protected function post($url)
    {
        $context = stream_context_create([
            'http' => [
                'method' => 'POST',
                'header' => "Content-Type: application/x-www-form-urlencoded\r\n",
                'content' => $this->postData,
                'timeout' => 30,
            ],
        ]);
        return @file($url, 0, $context);
    }

    public static function getConfig()
    {
        $db = Fw_Db::getInstance();
        $row = $db->queryOne(
            "SELECT sac_username, sac_password, sac_sender_id, sac_message_type, sac_api_url
             FROM sms_api_config
             WHERE sac_is_active = 1
             ORDER BY sac_id DESC
             LIMIT 1"
        );

        if (empty($row) || empty($row['sac_username']) || !isset($row['sac_password']) || $row['sac_password'] === '') {
            return null;
        }

        if (empty($row['sac_api_url'])) {
            $row['sac_api_url'] = 'https://api.directsms.com.au/s3/https/send_message';
        }
        if (empty($row['sac_sender_id'])) {
            $row['sac_sender_id'] = 'CGFB';
        }
        if (empty($row['sac_message_type'])) {
            $row['sac_message_type'] = '1-way';
        }

        return $row;
    }

    public function send()
    {
        $response = [
            'success' => true,
            'message' => 'Sms sent successfully'
        ];

        try {
            if ($this->configError !== '') {
                throw new Exception($this->configError);
            }
            if ($this->recipient === '') {
                throw new Exception('SMS recipient is missing.');
            }

            $secureUrl = self::secureUrl($this->url);
            $output = $this->post($secureUrl);
            if ($output === false && $secureUrl !== $this->url) {
                error_log('SmsClass: HTTPS request to SMS gateway failed, retrying over HTTP.');
                $output = $this->post($this->url);
            }
            if ($output === false || empty($output[0])) {
                throw new Exception('SMS Error');
            }

            $result = explode(":", $output[0]);
            if ($result[0] != "id") {
                throw new Exception(isset($result[1]) ? $result[1] : 'SMS Error');
            }
        } catch (Exception $e) {
            $response['success'] = false;
            $response['message'] = $e->getMessage();
        }

        return $response;
    }

    public function log($response, $metaData = [])
    {
        $data = [
            'module_name' => isset($metaData['module_name']) ? $metaData['module_name'] : '',
            'table_name' => isset($metaData['table_name']) ? $metaData['table_name'] : '',
            'column_name' => isset($metaData['column_name']) ? $metaData['column_name'] : '',
            'column_id' => isset($metaData['column_id']) ? $metaData['column_id'] : 0,
            'email_to' => json_encode(isset($metaData['to']) ? $metaData['to'] : []),
            'email_message' => $this->message,
            'response_success' => $response['success'],
            'response_message' => $response['message'],
        ];
        $table = new Fw_Db_Table('sms_log');
        $table->insertRow($data);
    }
}
