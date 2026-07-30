<?php

    $servername = "localhost";
    $username = "deckquotescom_deckquote";
    $password = "DOG&fI#QQ3g!";
    $dbname = "deckquotescom_deckquot8thFeb";
    
    // Create a new MySQLi instance
    $mysqli = new mysqli($servername, $username, $password, $dbname);
    
    // Check for connection errors
    if ($mysqli->connect_errno) {
        echo "Failed to connect to MySQL: " . $mysqli->connect_error;
        exit();
    }

     $postedData = $_REQUEST; 
     function update_qa_attachment($mysqli,$bsn_id,$qa_id,$filename)
     {
          $table_name = "wp_business_meta"; $key ='calendear_events';
          $query = "SELECT business_value FROM $table_name WHERE business_id = '".$bsn_id."' AND business_key = '".$key."'";
          $sub_result = $mysqli->query($query);
            if ($sub_result->num_rows > 0) {
                while ($sub_row = $sub_result->fetch_assoc()) {
                        $data = unserialize($sub_row['business_value']); 
                        
                        $key_index = 0;
                        foreach ($data['project_enquiry'] as $key => $value) {
                            $key_index = $key; break;
                        }
                    
                        foreach ($data['project_enquiry'][$key_index]['enquiry_questions'] as $key => $event) {
                        {
                           // echo "<pre>";print_r($event);
                            if($event['question_id'] == $qa_id)
                            {
                               $data['project_enquiry'][$key_index]['enquiry_questions'][$key]['attactment_name'] = $filename ;
                               
                               $business_value = serialize($data); 
                                $sql = "UPDATE wp_business_meta SET business_value = '".$business_value."' WHERE business_id = '".$bsn_id."' AND business_key = 'calendear_events'";
                                
                                if ($mysqli->query($sql) === TRUE) {
                                   // echo "Record updated successfully";
                                } else {
                                   // echo "Error updating record: " . $conn->error;
                                }
                                
                               // $mysqli->close();
                            }
                        }
                    }
                }
            }
     }

    //echo "<pre>"; print_r($postedData); exit;
    
    if(!empty($postedData['action']) && $postedData['action'] == "manage_upload_attachment" ) 
    { 
          if(!empty($_FILES['fileToUpload'])){ 
            $uploadedAttachments = $_FILES;   $qa_id = $postedData['q_id']; $bsn_id = $postedData['bsn_id'];
            $targetDir = getcwd()."/qa_uploads/";
            $fileName=$_FILES["fileToUpload"]["name"];
            $filename   = uniqid() . "_" . time()."_".$fileName; 
            $targetFilePath = $targetDir.$filename; 
            
            // Upload file to the server 
            if(move_uploaded_file($_FILES['fileToUpload']['tmp_name'], $targetFilePath)){ 
                upload($filename); update_qa_attachment($mysqli,$bsn_id,$qa_id,$filename);
                $result = ["status"=>"true","error"=>"","data"=>["file_name"=>$filename]];
            } 
            else
            {
                 $result = ["status"=>"false","error"=>"File upload process has been failed.","data"=>[]];
            }
        }
        else
        {
            $result = ["status"=>"false","error"=>"Please upload a file.","data"=>[]];
        }
    }
    
        if(!empty($postedData['action']) && $postedData['action'] == "delete_upload_attachment" ) 
    { 
          $table_name = "wp_business_meta"; $key ='calendear_events'; $qa_id = $postedData['q_id']; $bsn_id = $postedData['bsn_id'];
          $query = "SELECT business_value FROM $table_name WHERE business_id = '".$bsn_id."' AND business_key = '".$key."'";
          $sub_result = $mysqli->query($query);
            if ($sub_result->num_rows > 0) { 
                while ($sub_row = $sub_result->fetch_assoc()) {
                        $data = unserialize($sub_row['business_value']); //print_r($data);
                        $key_index = 0;
                        foreach ($data['project_enquiry'] as $key => $value) {
                            $key_index = $key; break;
                        }
                        foreach ($data['project_enquiry'][$key_index]['enquiry_questions'] as $key => $event) {
                        {
                            if($event['question_id'] == $qa_id)
                            {
                                $data['project_enquiry'][$key_index]['enquiry_questions'][$key]['attactment_name'] = "" ;
                                $business_value = serialize($data); 
                                $sql = "UPDATE wp_business_meta SET business_value = '".$business_value."' WHERE business_id = '".$bsn_id."' AND business_key = 'calendear_events'";
                                
                                $mysqli->query($sql);
                                $result = ["status"=>"true","error"=>"","data"=>[]];
                            }
                            else
                            {
                                $result = ["status"=>"false","error"=>"","data"=>[]];
                            }
                        }
                    }
                }
            }
            else
            {
                $result = ["status"=>"false","error"=>"","data"=>[]];
            }
            
        $mysqli->close();
    }
    header('Content-type: application/json');  echo json_encode($result);  exit();

?>