<?php

/*

<fusedoc fuse="fbx_Settings.php">

	<responsibilities>

		I set up the enviroment settings for this circuit. If this settings file is being inherited, then you can set a variable outright to override a value set in a parent circuit or use if(!isset(...)) to accept a value set by a parent circuit

	</responsibilities>

</fusedoc>

*/



require_once(MODULES_DIR . 'frontend.init.php');

$fwAuthGroup->forceLogin();

// module names

$MODULE_SINGULAR = 'Email Template';

$MODULE_PLURAL = 'Email Template';

$fwViewData['MODULE_SINGULAR'] = $MODULE_SINGULAR;

$fwViewData['MODULE_PLURAL'] = $MODULE_PLURAL;



// module table and id

$TABLE = 'emaillibrary';

$ID = 'eml_id';

$fwViewData['TABLE'] = $TABLE;

$fwViewData['ID'] = $ID;



// fuseactions

$XFA['list'] = $Fusebox['circuit'] . '.list';

$XFA['detail'] = $Fusebox['circuit'] . '.detail';

$XFA['delete'] = $Fusebox['circuit'] . '.delete';

$XFA['home'] = $Fusebox['circuit'] . '.home';

$XFA['upload'] = $Fusebox['circuit'] . '.upload';

$XFA['docdelete'] = $Fusebox['circuit'] . '.docdelete';

  function get_file_data($object_name)
  {
      $filetoinclude = $_SERVER['DOCUMENT_ROOT'].'/file_upload/server/s3/S3.php';
      include_once $filetoinclude;  $folder_path = "files/document_check_list_files/";
       $bucket_name  = BUCKET_NAME;     $my_file_name = $object_name;
        $s3 = new S3(ACCESS_KEY, SECRET_KEY);
        try {
          $file_data = $s3->getObject($bucket_name, $folder_path.$object_name, $saveTo = false); 
        //  echo "<pre>";print_r($file_data);   echo "Content-Type: ".$file_data->headers['type']; exit('checking');
          $file_raw_data = $file_data->body;

            $file = $my_file_name;
            $txt = fopen($_SERVER['DOCUMENT_ROOT'].'/download_files/'.$file, "w") or die("Unable to open file!");
            fwrite($txt, $file_raw_data);
            fclose($txt);
            
           return $_SERVER['DOCUMENT_ROOT'].'/download_files/'.$file ;
           
            } catch (ErrorException $ex) {
                //$this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
            echo $ex->getLine();
                return false;
            }
  }

