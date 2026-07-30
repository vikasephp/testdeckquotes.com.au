<!DOCTYPE html>
<html>
<body>

<form action="" method="post" enctype="multipart/form-data">
  Select image to upload:
  <input type="file" name="fileToUpload" id="fileToUpload">
  <input type="submit" value="Upload Image" name="submit">
</form>

</body>
</html>

<?php


if(isset($_FILES) && (!empty($_FILES))){



    $path = getcwd();
      $zipfile = $_FILES['fileToUpload']['name'];
    $resource_id = 1;
        $error_type = "File Uploading to AWS Bucket";

        header('Access-Control-Allow-Origin: *');


        $filetoinclude = $_SERVER['DOCUMENT_ROOT'].'/file_upload/server/s3/S3.php';
	include_once $filetoinclude;

        $date = date("Y-m-d H:i:s");
        		
        try {
            if(move_uploaded_file($_FILES['fileToUpload']['tmp_name'], $path .'/'.  basename( $_FILES["fileToUpload"]["name"])))
					{  
            $s3 = new S3('AKIA2AMNCYNN7O5EFUFK', 'VEZHhG7ktp6XuszgBHV/V4GESsxHNIsfVHzYlkzz');

            //print_r($s3);exit;
            
            $flag = 0;
            
            if ($s3->putObjectFile($path . "/" . $zipfile, 'deckquote', $zipfile, S3::ACL_PUBLIC_READ)) {
                $flag = 1; //die('in putobject');
            } else {
                sleep(10);
                if ($s3->putObjectFile($path . "/" . $zipfile, 'deckquote', $zipfile, S3::ACL_PUBLIC_READ))
					$flag = 1;
					//die('in putobject in 10');
            }

        }else{
            echo 'not moved';exit;
        }
        } catch (ErrorException $ex) {
            //$this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
        echo $ex->getLine();
            return false;
        }
    }

?>