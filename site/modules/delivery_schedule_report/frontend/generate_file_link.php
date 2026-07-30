<?php

 $filetoinclude = $_SERVER['DOCUMENT_ROOT'].'/file_upload/server/s3/S3.php'; include_once $filetoinclude; 
      
$fileName = $fwRequest->getparam('fileName','');
$moduleName = $fwRequest->getParam('moduleName', ''); 
$file_path = "";

if(!empty($fileName) && !empty($moduleName))
{
    
    if($moduleName == "delivery_schedule_report.home")
      {
          $folder_path = "files/uploads_2023/";
      }
    if($moduleName == "delivery_schedule_report.home.purchase_order_quote")
    {
      $folder_path = "files/purchase_order_quote/";
    }

    $bucket_name  = "deckquote";    $my_file_name = $fileName;
   $s3 = new S3(ACCESS_KEY, SECRET_KEY);
    try {
      $file_data = $s3->getObject($bucket_name, $folder_path.$fileName, $saveTo = false); 
    //  echo "<pre>";print_r($file_data);   echo "Content-Type: ".$file_data->headers['type']; exit('checking');
      $file_raw_data = $file_data->body;
    
        $file = rand()."_".$my_file_name;
        $txt = fopen($_SERVER['DOCUMENT_ROOT'].'/email_links/3/months/files/'.$file, "w") or die("Unable to open file!");
        fwrite($txt, $file_raw_data);
        fclose($txt);
        
       $file_path = BASE_URL.'email_links/3/months/files/'.$file ;
       
       $response = ["status"=> true,"error"=>"", "data"=>["file_path"=> $file_path] ]; 
       $next_due_date = date('Y-m-d H:i:s', strtotime("+90 days"));
       $tableTask = new Fw_Db_Table('delivery_schedule_report_3m'); $detail = ["file_name"=>$file,"created_at"=>$next_due_date];
       $result = $tableTask->insertRow($detail); 
       
        } catch (ErrorException $ex) {
            //$this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
          $error= $ex->getLine();
          $response = ["status"=> false,"error"=>$error, "data"=>["file_path"=> $file_path] ];
           
        }
            
}
else
{
    $error = "Please send correct values";
    $response = ["status"=> false,"error"=>$error, "data"=>["file_path"=> $file_path] ];
}

header('Content-Type: application/json; charset=utf-8'); echo json_encode($response); exit();
?>