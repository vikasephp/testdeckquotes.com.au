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
$MODULE_SINGULAR = 'POINCC';
$MODULE_PLURAL = 'POINCC';
$fwViewData['MODULE_SINGULAR'] = $MODULE_SINGULAR;
$fwViewData['MODULE_PLURAL'] = $MODULE_PLURAL;

// module table and id
$TABLE = 'poincc3';
$ID = 'po_id';
$fwViewData['TABLE'] = $TABLE;
$fwViewData['ID'] = $ID;

// fuseactions
//$XFA['list'] = $Fusebox['circuit'] . '.list';
$XFA['detail'] = $Fusebox['circuit'] . '.detail';
$XFA['delete'] = $Fusebox['circuit'] . '.delete';
$XFA['home'] = $Fusebox['circuit'] . '.home';
$XFA['upload'] = $Fusebox['circuit'] . '.upload';
$XFA['docdelete'] = $Fusebox['circuit'] . '.docdelete';
$XFA['open'] = $Fusebox['circuit'] . '.open';

$XFA['tprint'] = $Fusebox['circuit'] . '.tprint';
$XFA['tdprint'] = $Fusebox['circuit'] . '.tdprint';


function upload($filename, $tmpname)
{
	
	$path = getcwd();
	$zipfile = $filename;
	
        $resource_id = 1;
        $error_type = "File Uploading to AWS Bucket";

        header('Access-Control-Allow-Origin: *');

        $filetoinclude = $_SERVER['DOCUMENT_ROOT'].'/file_upload/server/s3/S3.php';
	include_once $filetoinclude;

        $date = date("Y-m-d H:i:s");
        		
        try {
            if(move_uploaded_file($tmpname, $path .'/'.  basename($zipfile)))
					{  
           $s3 = new S3(ACCESS_KEY, SECRET_KEY);
            $flag = 0;
            
            if ($s3->putObjectFile($path . "/" . $zipfile, BUCKET_NAME, 'files/purchase_order_invoice/'.$zipfile, S3::ACL_PRIVATE)) {
                $flag = 1; //die('in putobject');
            } else {
                sleep(10);
            if ($s3->putObjectFile($path . "/" . $zipfile, BUCKET_NAME,  'files/purchase_order_invoice/'.$zipfile, S3::ACL_PRIVATE))
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
				
	
	$rem = $path .'/'.  basename( $filename);
	unlink($rem);	
	
}

function fetch_file_raw_data($folder_path,$object_name)
{
    $filetoinclude = $_SERVER['DOCUMENT_ROOT'].'/file_upload/server/s3/S3.php'; include_once $filetoinclude;
    $bucket_name  = "deckquote";   
	
	$s3 = new S3(ACCESS_KEY, SECRET_KEY);
    try {
            $file_data = $s3->getObject($bucket_name, $folder_path.$object_name, $saveTo = false); 
            //	echo "<pre>";print_r($file_data);   echo "Content-Type: ".$file_data->headers['type']; exit('checking');
            $file_raw_data = $file_data->body;
			
            $file = $object_name;
           // $txt = fopen($_SERVER['DOCUMENT_ROOT'].'/download_files/'.$file, "a") or die("Unable to open file!");
           //  fwrite($txt, $file_raw_data);
           // fclose($txt);
           file_put_contents($_SERVER['DOCUMENT_ROOT'].'/download_files/'.$file, $file_raw_data);
            
         return $file_path = $_SERVER['DOCUMENT_ROOT'].'/download_files/'.$file;
     
    } catch (ErrorException $ex) {
        //$this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
       echo $ex->getLine();
        return false;
    }
}

function fetch_file_raw_data2($folder_path,$object_name)
{
    $filetoinclude = $_SERVER['DOCUMENT_ROOT'].'/file_upload/server/s3/S3.php'; include_once $filetoinclude;
    $bucket_name  = "deckquote";   
	
	$s3 = new S3(ACCESS_KEY, SECRET_KEY);
    try {
            $file_data = $s3->getObject($bucket_name, $folder_path.$object_name, $saveTo = false); 
            //	echo "<pre>";print_r($file_data);   echo "Content-Type: ".$file_data->headers['type']; exit('checking');
            $file_raw_data = $file_data->body;
			
            $file = $object_name;
           // $txt = fopen($_SERVER['DOCUMENT_ROOT'].'/download_files/'.$file, "a") or die("Unable to open file!");
           //  fwrite($txt, $file_raw_data);
           // fclose($txt);
           file_put_contents($_SERVER['DOCUMENT_ROOT'].'/files/poincc3/po_files_list/'.$file, $file_raw_data);
            
         return $file_path = $_SERVER['DOCUMENT_ROOT'].'/files/poincc3/po_files_list/'.$file;
     
    } catch (ErrorException $ex) {
        $this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
       echo $ex->getLine();
        return false;
    }
}

function assign_po_number_to_pdf($po_invoice_doc_name,$print_text)
{
    $curl = curl_init();

            //"url": "testdeckquotes.com.au/download_files/'.$po_invoice_doc_name.'",
            curl_setopt_array($curl, array(
            	CURLOPT_URL => 'https://api.pdf.co/v1/pdf/edit/add',
            	CURLOPT_RETURNTRANSFER => true,
            	CURLOPT_ENCODING => '',
            	CURLOPT_MAXREDIRS => 10,
            	CURLOPT_TIMEOUT => 0,
            	CURLOPT_FOLLOWLOCATION => true,
            	CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            	CURLOPT_CUSTOMREQUEST => 'POST',
            	CURLOPT_POSTFIELDS =>'{
                "async": false,
                "encrypt": false,
                "inline": true,
                "name": "'.$po_invoice_doc_name.'", 
                "url": "testdeckquotes.com.au/files/poincc3/po_files_list/'.$po_invoice_doc_name.'",
                "annotationsString": "430;5;0-;'.$print_text.';12+bold;Arial;FF0000;",
                "imagesString": "",
                "fieldsString": ""
            }',
            	CURLOPT_HTTPHEADER => array(
            		'Content-Type: application/json',
            	//	'x-api-key: jas@ephpsolutions.com_0ToXDV947604O3rujXINSpYo90C7DQ96tNckjc1lIGaGWG03mSSq2072yjLCH4VB'
            	'x-api-key: vickygondia1@gmail.com_a5DbQRX6qNN6LQ001ZTNghW6Uo0qceSo5GYiyJQp8b3z8324pZmmXzWm4SD3ROvA'
            	),
            ));
            
            $response = json_decode(curl_exec($curl)); curl_close($curl);  
            //print_r($response);
            return $response;
}
function get_credits()
{
    $curl = curl_init();

            curl_setopt_array($curl, array(
            	CURLOPT_URL => 'https://api.pdf.co/v1/account/credit/balance',
            	CURLOPT_RETURNTRANSFER => true,
            	CURLOPT_ENCODING => '',
            	CURLOPT_MAXREDIRS => 10,
            	CURLOPT_TIMEOUT => 0,
            	CURLOPT_FOLLOWLOCATION => true,
            	CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            	CURLOPT_CUSTOMREQUEST => 'GET',
            	CURLOPT_HTTPHEADER => array(
            		'Content-Type: application/json',
            	'x-api-key: vickygondia1@gmail.com_a5DbQRX6qNN6LQ001ZTNghW6Uo0qceSo5GYiyJQp8b3z8324pZmmXzWm4SD3ROvA'
            	),
            ));
            
            $response = json_decode(curl_exec($curl)); curl_close($curl);
            return $response;
}




