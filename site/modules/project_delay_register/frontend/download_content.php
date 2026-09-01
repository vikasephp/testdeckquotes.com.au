<?php
      $postedData = $_GET; //echo "<pre>"; print_r($postedData); 
      $folder_path = "";
      
      if( !empty($postedData['file_name']) && !empty($postedData['module_name']) )
      {
          
          if($postedData['module_name'] == "project_delay_register.home")
          {
              $folder_path = "files/uploads/";
          }
          
        $filetoinclude = $_SERVER['DOCUMENT_ROOT'].'/file_upload/server/s3/S3.php';
	    include_once $filetoinclude;
       $bucket_name  = BUCKET_NAME;  $object_name  = $postedData['file_name'];  $my_file_name = $postedData['file_name'];
         $s3 = new S3(ACCESS_KEY, SECRET_KEY);
        try {
        	$file_data = $s3->getObject($bucket_name, $folder_path.$object_name, $saveTo = false); 
        //	echo "<pre>";print_r($file_data);   echo "Content-Type: ".$file_data->headers['type']; exit('checking');
        	$file_raw_data = $file_data->body;

              
         
            $file = $my_file_name;
            $txt = fopen($_SERVER['DOCUMENT_ROOT'].'/download_files/'.$file, "w") or die("Unable to open file!");
            fwrite($txt, $file_raw_data);
            fclose($txt);

            /* view=1 => open in browser for review; otherwise force download */
            $viewInline = !empty($postedData['view']) && ($postedData['view'] == '1' || $postedData['view'] == 'inline');
            $disposition = $viewInline ? 'inline' : 'attachment';
            $safeName = str_replace(array('"', "\r", "\n"), '', basename($file));

            if (!$viewInline) {
                header('Content-Description: File Transfer');
            }
            header('Content-Disposition: ' . $disposition . '; filename="' . $safeName . '"');
            header('Expires: 0');
            header('Cache-Control: must-revalidate');
            header('Pragma: public');
            header('Content-Length: ' . filesize($_SERVER['DOCUMENT_ROOT'].'/download_files/'.$file));
           
            $contentType = !empty($file_data->headers['type']) ? $file_data->headers['type'] : 'application/octet-stream';
            /* Help browsers preview common letter types */
            if ($viewInline) {
                $ext = strtolower(pathinfo($safeName, PATHINFO_EXTENSION));
                if ($ext === 'pdf') {
                    $contentType = 'application/pdf';
                } elseif ($ext === 'png') {
                    $contentType = 'image/png';
                } elseif ($ext === 'jpg' || $ext === 'jpeg') {
                    $contentType = 'image/jpeg';
                } elseif ($ext === 'gif') {
                    $contentType = 'image/gif';
                } elseif ($ext === 'txt' || $ext === 'csv') {
                    $contentType = 'text/plain; charset=utf-8';
                } elseif ($ext === 'html' || $ext === 'htm') {
                    $contentType = 'text/html; charset=utf-8';
                }
            }
            header("Content-Type: ".$contentType); 
            readfile($_SERVER['DOCUMENT_ROOT'].'/download_files/'.$file); exit();
        	 
            } catch (ErrorException $ex) {
                //$this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
            echo $ex->getLine();
                return false;
            }
      }
      else
      {
          echo "file_name or module name is missing";
      }
      

?>
