<?php
/*
<fusedoc fuse="compose_letter.php">
	<responsibilities>
		I display the letter composition form for sending emails
	</responsibilities>
</fusedoc>
*/

// Get the record ID from URL parameters
$recordId = $fwRequest->getParam($ID, 0);

// Initialize variables
$to_email = '';
$subject = '';
$email_content = '';

// If record ID exists, we can pre-populate some data
if ($recordId > 0) {
   
    // Fetch record data from central_letter_database table
    $letterTable = new Fw_Db_Table('central_letter_database');
    $letterTable->setWhere('cld_id = ' . $recordId);
    $recordData = $letterTable->getRow();
    
    // Get typedata using same approach as home.php
    $thisTable = new Fw_Db_Table($ATTRIBUTES['type']['table']);
    $fwViewData['typedata'] = $typedata = $thisTable->getAllRows();
    
    // Get letter type text using foreach
    $letterType = '';
    if (!empty($recordData['cld_letter_type_id'])) {
        foreach ($typedata as $typeRow) {
            if ($typeRow['cld_id'] == $recordData['cld_letter_type_id']) {
                $letterType = $typeRow['cld_type']; // Same as {{ $row.$option_col }}
                break;
            }
        }
    }
    
    // Load email library data for template matching
    $emailLibTable = new Fw_Db_Table('emaillibrary');
    $emailTemplates = $emailLibTable->getAllRows();
    
    // Function to find matching email template by letter type
    function findEmailTemplateByLetterType($letterType, $emailTemplates) {
        if (empty($letterType) || empty($emailTemplates)) {
            return null;
        }

       
        
        // Exact match first using eml_subject
        foreach ($emailTemplates as $email) {
            if($letterType == 'Construction Report Update Letter' && $email['eml_code'] == "MS-0338"){
                return $email;
            }
            if($letterType == 'Planning Approvals Only Update Letter' && $email['eml_code'] == "MS-0363"){
                return $email;
            }
            if (isset($email['eml_subject']) && strtolower($email['eml_subject']) === strtolower($letterType)) {
                return $email;
            }
        }
        
        // Partial match (letter type contained in email subject or vice versa)
        foreach ($emailTemplates as $email) {
            if (isset($email['eml_subject'])) {
                if (stripos($email['eml_subject'], $letterType) !== false || 
                    stripos($letterType, $email['eml_subject']) !== false) {
                    return $email;
                }
            }
        }
        
        return null;
    }
    
    // Find matching email template
    $matchingTemplate = findEmailTemplateByLetterType($letterType, $emailTemplates);
    
    $custsql = "Select business_sellers.bs_business_id, bus_customers.bcust_id, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_email1, bus_customers.bcust_misc_email2, bus_customers.bcust_misc_email3, bus_customers.bcust_misc_email4, bus_customers.bcust_misc_email5, bus_customers.bcust_misc_send_market_email from business_sellers LEFT JOIN bus_customers on business_sellers.bs_customers_id = bus_customers.bcust_id";
    $custdetail  = $fwDb->query($custsql);
    $clientArr = [];
    $allEmails = [];
    $seenEmails = [];
    $customerNames = [];
    $emailNameMap = [];
    $emailColumns = ['bcust_misc_email1', 'bcust_misc_email2', 'bcust_misc_email3', 'bcust_misc_email4', 'bcust_misc_email5', 'bcust_misc_send_market_email'];
    foreach ($custdetail as $cust) {
        // Collect emails from every client linked to this project (cld_bsn_id)
        if ($cust['bs_business_id'] == $recordData['cld_bsn_id']) {
            $fullName = trim(($cust['bcust_fname'] ?? '') . ' ' . ($cust['bcust_lname'] ?? ''));
            if ($fullName !== '') {
                $customerNames[] = $fullName;
            }
            foreach ($emailColumns as $column) {
                if (!empty($cust[$column])) {
                    $email = trim($cust[$column]);
                    $emailKey = strtolower($email);
                    if ($email !== '' && !isset($seenEmails[$emailKey])) {
                        $seenEmails[$emailKey] = true;
                        $allEmails[] = $email;
                        // Each email keeps its own customer's name (not the joined list)
                        $emailNameMap[$emailKey] = $fullName;
                    }
                }
            }
        }
    }
    $customerEmails = implode(',', $allEmails);
    $customerName = implode(' and ', $customerNames);
    $fwViewData['clientArr'] = $clientArr;
    $fwViewData['customerName'] = $customerName;
    $fwViewData['toNameMap'] = $emailNameMap;
     // Get business name for dropdown
    $sql = "SELECT bsn_id, bsn_name, bsn_address FROM business WHERE bsn_id = " . $recordData['cld_bsn_id'];
    $businessDetail = $fwDb->query($sql);
    $businessName = !empty($businessDetail[0]['bsn_name']) ? $businessDetail[0]['bsn_name'] : '';
    $fwViewData['businessName'] = $businessName;
    $fwViewData['businessId'] = $recordData['cld_bsn_id'];

   

    // Get existing uploaded file
    $existingFile = '';
    if (!empty($recordData['cld_file_name'])) {
        $existingFile = $recordData['cld_file_name'];
    }
    $fwViewData['existing_file'] = $existingFile;
    // Get additional uploaded files for this letter
    $additionalFilesArr = [];
    if (!empty($recordData['cld_id'])) {
        $sql = 'SELECT * FROM central_letter_database_files WHERE cldf_cld_id = ' . $recordData['cld_id'];
        $res = $fwDb->query($sql);
        foreach ($res as $row) {
            $additionalFilesArr[] = $row['cldf_file'];
        }
    }
    $fwViewData['additionalFiles'] = $additionalFilesArr;
    
    $subject = $letterType;
    $to_email = isset($customerEmails) ? $customerEmails : '';
    $email_content = '';
    
    // Append email content if matching template found
    if ($matchingTemplate && isset($matchingTemplate['eml_email_content'])) {
        $email_content = $matchingTemplate['eml_email_content'];
        
        // Replace [first name] placeholder with customer full name
        if (isset($customerName) && !empty($customerName)) {
            $email_content = str_replace('[first name]', $customerName, $email_content);
            $email_content = str_replace('[last name]', "", $email_content);

        }
    }
}

// Handle form submission
$send = $fwRequest->getParam('send', '');
$draft = $fwRequest->getParam('draft', '');

if ($send || $draft) {
    // Get recordId from form submission
    $recordId = $fwRequest->getParam('recordId', 0);
    
    // Get form data
    $to_email = $fwRequest->getParam('to_email', '');
    $cc_email = $fwRequest->getParam('cc_email', '');
    $bcc_email = $fwRequest->getParam('bcc_email', 'emailbackup@cgfb.com.au');
    $subject = $fwRequest->getParam('subject', '');
    $content = $fwRequest->getParam('content', '');
    $formRecordId = $fwRequest->getParam('recordId', 0);
    $signatureId = $fwRequest->getParam('signatureId', '');
    $form_business_id = $fwRequest->getParam('formBusinessId', $recordData['cld_bsn_id']);
    $business_name = $fwRequest->getParam('businessName', $businessName);
    $eml_code = $fwRequest->getParam('emlCode', "");
    $toName = $fwRequest->getParam('toName', "");
    $toNameMapRaw = $fwRequest->getParam('toNameMap', '');
    $toNameMap = [];
    if (!empty($toNameMapRaw)) {
        $decodedMap = json_decode(html_entity_decode($toNameMapRaw, ENT_QUOTES), true);
        if (is_array($decodedMap)) {
            $toNameMap = $decodedMap;
        }
    }

    // Handle file upload if any
    $uploaded_file = '';

    
    if ($send) {
        // Handle attachments for 3 separate files
        $attachmentFiles = [];
        $mainFile='';
        $additionalFiles = [];
        // Add existing file if exists
        $allAttachments = [];
       
        $mainFile = $fwRequest->getParam('existing_file', '');
        
        // Add additional uploaded files from database
        $additionalFiles = $fwRequest->getParam('additional_files', []);
        
        // Handle new file uploads (3 separate fields)
        $newFiles = ['attachment_file1', 'attachment_file2', 'attachment_file3'];
        foreach ($newFiles as $fileField) {
            if (isset($_FILES[$fileField]) && $_FILES[$fileField]['error'] == 0) {
                $uploaded_file = $_FILES[$fileField]['name'];
                // Replace spaces/special chars so S3, download and email attach do not break.
                $uploaded_file = preg_replace('/[^A-Z0-9._-]/i', '_', basename((string)$uploaded_file));
                $uploaded_file = preg_replace('/_+/', '_', $uploaded_file);
                $uploaded_file = trim($uploaded_file, '._');
                $temp_name = $_FILES[$fileField]['tmp_name'];
                $fileUploaded = upload($uploaded_file, $temp_name);
                if ($fileUploaded) {
                    $attachmentFiles[] = $fileUploaded;
                }
            }
        }
        
        // Send email with attachments
        $to = $to_email;
        $cc = !empty($cc_email) ? $cc_email : '';
        $bcc = !empty($bcc_email) ? $bcc_email : 'emailbackup@cgfb.com.au';
        $sqlSign = "Select * from email_signature where es_id = " . $signatureId;
        $signatureInfo = $fwDb->query($sqlSign);

        $es_logo = '';
        if (!empty($signatureInfo)) {
            $signature =  $signatureInfo[0]['es_signature'];
            $from = $signatureInfo[0]['es_reply_to'];
            $fromname = $signatureInfo[0]['es_name'];
            $es_logo = !empty($signatureInfo[0]['es_logo']) ? $signatureInfo[0]['es_logo'] : '';
        } else {
            // Handle case where signature not found
            $signature = '';
            $from = 'clientservices@cgfb.com.au';
            $fromname = 'Frank Walmsley - Client Service Manager';
        }       // ✅ Access first row

        /**
         * Remove empty HTML blocks from the start or end of a string.
         */
        $composeStripEmptyHtml = function ($html, $fromEnd = false) {
            $html = (string)$html;
            $chunk = '(?:\s|&nbsp;|&#160;|<br\s*\/?>|<(?:p|div|span|strong|em|b|i|font)(?:\s[^>]*)?>\s*(?:&nbsp;|&#160;|\s|<br\s*\/?>|<(?:span|strong|em|b|i|font)(?:\s[^>]*)?>\s*(?:&nbsp;|&#160;|\s)*<\/(?:span|strong|em|b|i|font)>)*\s*<\/(?:p|div|span|strong|em|b|i|font)>)';
            for ($i = 0; $i < 30; $i++) {
                $before = $html;
                if ($fromEnd) {
                    $html = preg_replace('/' . $chunk . '+$/iu', '', $html);
                } else {
                    $html = preg_replace('/^' . $chunk . '+/iu', '', $html);
                }
                if ($html === $before) {
                    break;
                }
            }
            return $fromEnd ? rtrim($html) : ltrim($html);
        };

        /**
         * Keep letter text only up to "Kind regards," and drop blank lines after it.
         */
        $composeTrimAfterKindRegards = function ($html) use ($composeStripEmptyHtml) {
            $html = (string)$html;
            if (preg_match('/^(.*)(Kind\s+regards\s*,)(.*)$/is', $html, $m)) {
                $kept = $m[1] . $m[2];
                $after = $m[3];
                // Keep only immediate closing tags so HTML stays valid (e.g. </p></div>)
                if (preg_match('/^((?:\s*<\/[a-z0-9]+>)*)/i', $after, $closeTags)) {
                    $kept .= $closeTags[1];
                }
                return $kept;
            }
            return $composeStripEmptyHtml($html, true);
        };

        /**
         * Kill top margin/padding on first signature blocks (common cause of email gap).
         */
        $composeZeroSignatureTopSpace = function ($html) {
            $html = (string)$html;
            $html = preg_replace_callback(
                '/^(\s*<(?:p|div|table|tr|td|span|font)(?:\s[^>]*)?>)/i',
                function ($m) {
                    $tag = $m[1];
                    if (stripos($tag, 'style=') !== false) {
                        $tag = preg_replace('/\s*(margin|padding)(-(top|bottom))?\s*:\s*[^;"\']+;?/i', ' ', $tag);
                        $tag = preg_replace('/style=(["\'])/i', 'style=$1margin:0;padding:0;', $tag, 1);
                    } else {
                        $tag = preg_replace('/>$/', ' style="margin:0;padding:0;">', $tag);
                    }
                    return $tag;
                },
                $html,
                1
            );
            // Also neutralize common spacer patterns at the very top
            $html = preg_replace('/^(\s*<(?:p|div)[^>]*>\s*(?:<br\s*\/?>|&nbsp;|&#160;|\s)*<\/(?:p|div)>)+/i', '', $html);
            return $html;
        };

        $content = $composeTrimAfterKindRegards((string)$content);
        $signature = $composeStripEmptyHtml((string)$signature, false);
        $signature = $composeZeroSignatureTopSpace($signature);
        $signature = $composeStripEmptyHtml($signature, false);

        $subject = $subject;
        if (trim(strip_tags($content)) === '') {
            // Empty body: Kind regards, then one normal line space, then signature.
            $email_body = '<div style="margin:0;padding:0;line-height:normal;">Kind regards,</div><br />'
                . '<div style="margin:0;padding:0;line-height:normal;">' . $signature . '</div>';
        } else {
            // No extra blank line between "Kind regards," and signature.
            $email_body = $content
                . '<div style="margin:0;padding:0;line-height:normal;">' . $signature . '</div>';
        }

        // Append signature logo in email body (same as email library compose).
        if (!empty($es_logo)) {
            $email_body .= "<br /><img src='" . BASE_URL . "files/email_library/" . $es_logo . "' style='margin-top:8px;display:block;'>";
        }
        

        // Combine all attachments
        $allAttachments = array_merge($attachmentFiles, $additionalFiles);
        $allAttachments[] = $fwRequest->getParam('existing_file');
        $attachmentsend = [];

        foreach ($allAttachments as $attachment) {
            if (!empty($attachment)) {
				$source = get_file_data($attachment);
				if (empty($source) || !is_file($source)) {
					continue;
				}
				// Use sanitized local filename for email attach path (spaces/special chars break mail).
				$safeName = preg_replace('/[^A-Z0-9._-]/i', '_', basename((string)$attachment));
				$safeName = preg_replace('/_+/', '_', $safeName);
				$safeName = trim($safeName, '._');
				if ($safeName === '') {
					$safeName = 'attachment_' . date('Ymd_His');
				}
				$destinationDir = $_SERVER['DOCUMENT_ROOT'] . '/files/central_letter_database/';
				if (!is_dir($destinationDir)) {
					@mkdir($destinationDir, 0777, true);
				}
				$destination = $destinationDir . $safeName;
				@copy($source, $destination);
				$attachmentsend[] = $destination;
            }
        }
    
        // Serialize the attachments array before sending
        $serializedAttachments = serialize($attachmentsend);
        // Pass email=>name map so each To address uses its own customer name
        $sentMailStatus = send_email_letter($toNameMap ? json_encode($toNameMap) : $toName, $to, $cc, $fromname, $from, $subject, $email_body, $serializedAttachments);

        
        // Generate custom auto ID
        $lastLogId = $fwDb->query("SELECT MAX(custom_id) as max_custom_id FROM letter_email_log WHERE custom_id LIKE 'AL%'");
        $nextId = 1;
        
        if (!empty($lastLogId[0]['max_custom_id'])) {
            // Extract number from AL00001 format
            $lastId = preg_replace('/[^0-9]/', '', $lastLogId[0]['max_custom_id']);
            $nextId = intval($lastId) + 1;
        }
        
        // Fixed 5-digit padding for AL00001 format
        $customId = 'AL' . str_pad($nextId, 5, '0', STR_PAD_LEFT);
        
        $senderData = [];
        $toArray = explode(',', $to);
        foreach($toArray as $toEmail){
           $toEmail = trim($toEmail);
           if ($toEmail === '') {
               continue;
           }
           $emailKey = strtolower($toEmail);
           $senderData[] = [
               'name' => isset($toNameMap[$emailKey]) ? $toNameMap[$emailKey] : $toName,
               'email' => $toEmail
           ];
        }

        $ccData = [];
        $ccArray = explode(',', $cc);
        foreach($ccArray as $ccEmail){
           $ccData[] = [
               'email' => $ccEmail
           ];
        }

        // Log email to database
        $logData = [
            'custom_id' => $customId,
            'cld_id' => $formRecordId,
            'elog_date' => date('Y-m-d H:i:s'),
            'elog_eml_code' => $eml_code, // Template code
            'elog_from' => $fromname."<br>".$from, // Sender name
            'elog_to' => json_encode($senderData),
            'elog_to_secondary' => '', // Additional recipient 2
            'elog_to_email3' => '', // Additional recipient 3
            'elog_to_email4' => '', // Additional recipient 4
            'elog_to_email5' => '', // Additional recipient 5
            'elog_cc' => json_encode($ccData),
            'bcc_recipients' => $bcc,
            'elog_business' => $business_name, // Business name
            'elog_bsn_id' => $form_business_id, // Business ID
            'elog_subject' => $subject,
            'elog_email_body' => $email_body,
            'main_file_name' => !empty($mainFile) ? $mainFile : NULL,
            'additional_files' => implode(', ', $additionalFiles),
            'attachments' => implode(', ', $attachmentFiles),
            'elog_doc_attached' => !empty($mainFile) ? $mainFile : NULL,
            'elog_temp_attached' => implode(', ', $additionalFiles),
            'elog_image' => '', // Image attachments
            'elog_attachment1' => isset($attachmentFiles[0]) ? $attachmentFiles[0] : '',
            'elog_attachment2' => isset($attachmentFiles[1]) ? $attachmentFiles[1] : '',
            'elog_attachment3' => isset($attachmentFiles[2]) ? $attachmentFiles[2] : '',
            'sent_by' => $from,
            'status' => $sentMailStatus ? 'Sent' : 'Failed'
        ];
        
        // Insert log entry in letter_email_log
        $logTable = new Fw_Db_Table('letter_email_log');
        $logTable->insertRow($logData);

        $emailLogData = [
            'custom_id' => $customId,
            'elog_date' => date('Y-m-d H:i:s'),
            'elog_eml_code' => $eml_code, // Template code
            'elog_to' => json_encode($senderData),
            'elog_from' => $fromname."<br>".$from, // Sender name
            'elog_to_secondary' => '', // Additional recipient 2
            'elog_to_email3' => '', // Additional recipient 3
            'elog_to_email4' => '', // Additional recipient 4
            'elog_to_email5' => '', // Additional recipient 5
            'elog_cc' => json_encode($ccData),
            'elog_business' => $business_name, // Business name
            'elog_bsn_id' => $form_business_id, // Business ID
            'elog_subject' => $subject,
            'elog_email_body' => $email_body,
            'elog_doc_attached' => !empty($mainFile) ? $mainFile : NULL,
            'elog_temp_attached' => implode(', ', $additionalFiles),
            'elog_image' => '', // Image attachments
            'elog_attachment1' => isset($attachmentFiles[0]) ? $attachmentFiles[0] : '',
            'elog_attachment2' => isset($attachmentFiles[1]) ? $attachmentFiles[1] : '',
            'elog_attachment3' => isset($attachmentFiles[2]) ? $attachmentFiles[2] : '',
        ];
        
        // Insert log entry in email_log as well
        $emailLogTable = new Fw_Db_Table('email_log');
        $emailLogResult = $emailLogTable->insertRow($emailLogData);
        
        // Check if email_log entry was actually inserted
        if ($emailLogResult) {
            $fwViewData['message'] = 'Letter sent successfully and logged in both tables';

        } else {
            $fwViewData['message'] = 'Letter sent but email_log insertion failed';
        }
        ?>
        <script>
            parent.jQuery.fancybox.close();
        </script>
        <?php
       
    } elseif ($draft) {
        // Save draft logic here
        $fwViewData['message'] = 'Draft saved successfully!';
        ?>
        <script>
            parent.jQuery.fancybox.close();
        </script>
        <?php
    } else {
        // Handle any other exceptions or errors
        $fwViewData['message'] = 'An error occurred. Please try again.';
        ?>
        <script>
            parent.jQuery.fancybox.close();
        </script>
        <?php
    }
}

// Pass variables to template
$fwViewData['to_email'] = $to_email;
$fwViewData['subject'] = $subject;
$fwViewData['email_content'] = $email_content;
$fwViewData['recordId'] = $recordId;
$fwViewData['eml_code'] = $matchingTemplate['eml_code'] ? $matchingTemplate['eml_code'] : '';
if (!isset($fwViewData['toNameMap']) || !is_array($fwViewData['toNameMap'])) {
    $fwViewData['toNameMap'] = [];
}
$fwViewData['toNameMapJson'] = htmlspecialchars(json_encode($fwViewData['toNameMap']), ENT_QUOTES, 'UTF-8');

 // Get all signatures from database
    $sqlSign = "Select * from email_signature";
    $allSignatures = $fwDb->query($sqlSign);
    
    // Filter to only show mapped signatures
    $filteredSignatures = [];
    $signatureMappings = [
        'Planning Approvals Update Letter' => [
            'name' => 'Henry J. Edquiban Jr. - Planning Manager',
            'email' => 'Planning@cgfb.com.au'
        ],
        'Planning Approvals Only Update Letter' => [
            'name' => 'Henry J. Edquiban Jr. - Planning Manager', 
            'email' => 'Planning@cgfb.com.au'
        ],
        'Your Weekly Construction Calendar Update and Letter' => [
            'name' => 'Construction Scheduling Team',
            'email' => 'construction@cgfb.com.au'
        ],
        'Construction Report Update Letter' => [
            'name' => 'Construction Scheduling Team',
            'email' => 'construction@cgfb.com.au'
        ],
        'Inclusions Progress Update Letter' => [
            'name' => 'Inclusions Teams',
            'email' => 'inclusions@cgfb.com.au'
        ],
        'Customer Design Update Letter' => [
            'name' => 'Frank Walmsley - Client Service Manager',
            'email' => 'clientservices@cgfb.com.au'
        ]
    ];
    foreach ($allSignatures as $index => $sig) {
        foreach ($signatureMappings as $key => $value) {
            if (trim($key) == trim($subject) && trim($sig['es_name']) == trim($value['name'])) {
                $allSignatures[$index]['selected'] = true;  // ✅ Use correct index
                break 2;  // ✅ Break both loops
            }
        }
    }
$fwViewData['signature'] = $allSignatures;

// CGFB company contacts for CC suggestions (companies.home).
// Company name: "Canberra Granny Flat Builders and Fixed Price Extensions"
// View-only: send still uses comma-separated cc_email as before.
$ccContacts = [];
$ccContactSql = "SELECT contacts.cs_id, contacts.cs_first_name, contacts.cs_surname,
        contacts.cs_primary_email, companies.co_company_name
    FROM contacts
    INNER JOIN companies ON contacts.cs_company = companies.co_id
    WHERE companies.co_active = 1
      AND companies.co_company_name = 'Canberra Granny Flat Builders and Fixed Price Extensions'
      AND contacts.cs_primary_email IS NOT NULL
      AND TRIM(contacts.cs_primary_email) <> ''
      AND contacts.cs_primary_email LIKE '%@%'
    ORDER BY contacts.cs_first_name ASC, contacts.cs_surname ASC";
$ccContactRows = $fwDb->query($ccContactSql);
if (!empty($ccContactRows) && is_array($ccContactRows)) {
    $seenEmails = [];
    foreach ($ccContactRows as $row) {
        $email = trim((string)$row['cs_primary_email']);
        $emailKey = strtolower($email);
        if ($email === '' || isset($seenEmails[$emailKey])) {
            continue;
        }
        $seenEmails[$emailKey] = true;
        $name = trim(trim((string)$row['cs_first_name']) . ' ' . trim((string)$row['cs_surname']));
        if ($name === '') {
            $name = $email;
        }
        $ccContacts[] = [
            'email' => $email,
            'name' => $name,
            'label' => $name . ' - ' . $email,
            'company' => $row['co_company_name'],
        ];
    }
}
$fwViewData['cc_contacts'] = $ccContacts;
if (!isset($fwViewData['cc_email'])) {
    $fwViewData['cc_email'] = '';
}

// Set page title
$fwViewData['title'] = 'Compose Letter Email';

// Use fwMainView pattern for future table name management
$fwMainView = 'file:' . getcwd() . '/compose_letter.tpl';
?>
