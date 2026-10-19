<?php

require_once(LIB_DIR . '/phpmailer/class.phpmailer.php');
require_once(LIB_DIR . 'Fw/Db.php');

class EmailClass
{
    public $subject;
    public $message;
    public $from;
    public $replyTo;
    public $to;
    public $cc;
    public $bcc;
    public $attachments;
    public $mail;

    public function __construct()
    {
        $this->mail = new PHPMailer(true);
        $this->from = []; // array with index email and name
        $this->replyTo = []; // array with index email and name
        $this->to = []; // array of arrays with index email and name
        $this->cc = []; // array of arrays with index email and name
        $this->bcc = []; // array of arrays with index email and name

        // Adding default bcc
        $bcc_name = 'CGFB';
        $bcc_email = 'emailbackup@cgfb.com.au';
        $this->mail->AddBCC(
            $bcc_email,
            $bcc_name
        );
        $this->bcc[] = [
            'email' => $bcc_email,
            'name' => $bcc_name
        ];

        $this->attachments = [];
    }

    public function sendEmail()
    {
        $response = [
            'success' => true,
            'message' => 'Email sent successfully'
        ];
        try {
			
			/* $forceFail = true;
			if ($forceFail) {
				throw new Exception("Forced email failure (testing)");
			} */
			
            $this->mail->IsSMTP();

            $this->mail->SMTPDebug  = 1;                     // enables SMTP debug information (for testing)
            $this->mail->SMTPAuth   = "TRUE";
            $this->mail->SMTPSecure = "TLS";                   // enable SMTP authentication
            //// $mail->SMTPSecure = "SSL";                 // sets the prefix to the servier
            $this->mail->Host       = "mail.smtp2go.com";      // sets GMAIL as the SMTP server
            $this->mail->Port       = "2525";
            // $mail->Port       = "587";                  // set the SMTP port for the GMAIL server
            $this->mail->Username   = SMTP_USER;  // GMAIL username
            $this->mail->Password   = SMTP_PASS;

            if (empty($this->from)) {
                throw new Exception("Sender email address is missing", 1);
            }

            if (empty($this->replyTo)) {
                $this->addReplyTo(
                    $this->from['email'],
                    $this->from['name']
                );
            }

            if (empty($this->to)) {
                throw new Exception("Receiver email address is missing", 1);
            }

            if ($this->message) {
                $this->message = stripslashes($this->message);
                // CKEditor 5 tables use CSS classes / <figure>; mail clients need inline borders
                $this->message = $this->makeEmailSafeHtml($this->message);
            }
            $newpathattach = [];
            if (!empty($this->attachments)) {
                $attached = $this->attachments;
                if (is_array($attached)) {
                    foreach ($attached as $k => $v) {
                        $npath = str_replace(BASE_URL, "", $v);
                        $newpathattach[] = BASE_DIR . $npath;
                    }
                }
            }

            $this->mail->Subject = $this->subject;
            $this->mail->AltBody = 'To view the message, please use an HTML compatible email viewer!'; // optional - MsgHTML will create an alternate automatically
            $this->mail->MsgHTML('<html>' . $this->message . '</html>');

            if ($newpathattach && is_array($newpathattach)) {
                foreach ($newpathattach as $val) {
                    $this->mail->AddAttachment($val);      // attachment
                }
            }
            $this->mail->Send();
        } catch (phpmailerException $e) {
            //echo $e->errorMessage(); //Pretty error messages from PHPMailer
            $response['success'] = false;
            $response['message'] = $e->errorMessage();
        } catch (Exception $e) {
            //echo $e->getMessage(); //Boring error messages from anything else!
            $response['success'] = false;
            $response['message'] = $e->getMessage();
        }

        return $response;
    }

    public function addEmailRecords($email, $name, $type)
    {
        if ($type == 'to') {
            if(!in_array($email, ['Frances@home'])) {
                $this->mail->AddAddress(
                    $email,
                    $name
                );
            }
            $this->to[] = [
                'name' => $name,
                'email' => $email
            ];
        } else if ($type == 'cc') {
            $this->mail->AddCC(
                $email,
                $name
            );
            $this->cc[] = [
                'name' => $name,
                'email' => $email
            ];
        } else if ($type == 'bcc') {
            $this->mail->AddBCC(
                $email,
                $name
            );
            $this->bcc[] = [
                'name' => $name,
                'email' => $email
            ];
        } else if ($type == 'from') {
            $this->mail->SetFrom(
                $email,
                $name
            );
            $this->from = [
                'name' => $name,
                'email' => $email
            ];
        } else if ($type == 'reply_to') {
            $this->mail->AddReplyTo(
                $email,
                $name
            );
            $this->replyTo = [
                'name' => $name,
                'email' => $email
            ];
        }
    }

    /**
     * Make CKEditor / editor HTML safe for Gmail/Outlook (tables especially).
     */
    public function makeEmailSafeHtml($html)
    {
        if ($html === null || $html === '') {
            return $html;
        }

        // Unwrap CK5 <figure class="table">...</figure> → keep inner <table>
        $html = preg_replace(
            '/<figure[^>]*\bclass\s*=\s*(["\'])[^"\']*\btable\b[^"\']*\1[^>]*>(.*?)<\/figure>/is',
            '$2',
            $html
        );
        $html = preg_replace(
            '/<figure[^>]*\bclass\s*=\s*table\b[^>]*>(.*?)<\/figure>/is',
            '$1',
            $html
        );

        // Ensure <table> has email-visible borders
        $html = preg_replace_callback(
            '/<table(\s[^>]*)?>/i',
            function ($m) {
                $attrs = isset($m[1]) ? $m[1] : '';
                if (stripos($attrs, 'border=') === false) {
                    $attrs .= ' border="1"';
                }
                if (stripos($attrs, 'cellpadding=') === false) {
                    $attrs .= ' cellpadding="4"';
                }
                if (stripos($attrs, 'cellspacing=') === false) {
                    $attrs .= ' cellspacing="0"';
                }
                if (stripos($attrs, 'style=') === false) {
                    $attrs .= ' style="border-collapse:collapse;width:100%;border:1px solid #000;"';
                } elseif (stripos($attrs, 'border-collapse') === false || stripos($attrs, 'border:') === false) {
                    $attrs = preg_replace_callback(
                        '/style\s*=\s*(["\'])(.*?)\1/i',
                        function ($sm) {
                            $style = rtrim($sm[2], ';');
                            if (stripos($style, 'border-collapse') === false) {
                                $style .= ';border-collapse:collapse';
                            }
                            if (stripos($style, 'border:') === false && stripos($style, 'border-width') === false) {
                                $style .= ';border:1px solid #000';
                            }
                            return 'style=' . $sm[1] . $style . ';' . $sm[1];
                        },
                        $attrs
                    );
                }
                return '<table' . $attrs . '>';
            },
            $html
        );

        // Ensure cells have visible borders (Outlook often needs this)
        $html = preg_replace_callback(
            '/<(td|th)(\s[^>]*)?>/i',
            function ($m) {
                $tag = $m[1];
                $attrs = isset($m[2]) ? $m[2] : '';
                $cellStyle = 'border:1px solid #000;padding:4px;';
                if (stripos($attrs, 'style=') === false) {
                    $attrs .= ' style="' . $cellStyle . '"';
                } elseif (stripos($attrs, 'border:') === false && stripos($attrs, 'border-width') === false) {
                    $attrs = preg_replace_callback(
                        '/style\s*=\s*(["\'])(.*?)\1/i',
                        function ($sm) use ($cellStyle) {
                            $style = rtrim($sm[2], ';') . ';' . $cellStyle;
                            return 'style=' . $sm[1] . $style . $sm[1];
                        },
                        $attrs
                    );
                }
                return '<' . $tag . $attrs . '>';
            },
            $html
        );

        return $html;
    }

    public function addFrom($email, $name)
    {
        $this->addEmailRecords($email, $name, 'from');
    }

    public function addReplyTo($email, $name)
    {
        $this->addEmailRecords($email, $name, 'reply_to');
    }

    public function addTo($email, $name)
    {
        $this->addEmailRecords($email, $name, 'to');
    }

    public function addCC($email, $name)
    {
        $this->addEmailRecords($email, $name, 'cc');
    }

    public function addBCC($email, $name)
    {
        $this->addEmailRecords($email, $name, 'bcc');
    }

    public function logSendEmail($response, $extraData)
    {
        $data = [
            'module_name' => $extraData['module_name'],
            'table_name' => $extraData['table_name'],
            'column_name' => $extraData['column_name'],
            'column_id' => $extraData['column_id'],
            'email_from' => implode('<br>', $this->from),
            'email_reply_to' => implode('<br>', $this->replyTo),
            'email_to' => json_encode($this->to),
            'email_cc' => json_encode($this->cc),
            'email_bcc' => json_encode($this->bcc),
            'email_subject' => stripslashes($this->subject),
            'email_message' => $this->message,
            'email_attachments' => implode(', ', $this->attachments),
            'response_success' => $response['success'],
            'response_message' => $response['message'],
        ];
        $table = new Fw_Db_Table('email_log_new');
        $table->insertRow($data);
    }
}
