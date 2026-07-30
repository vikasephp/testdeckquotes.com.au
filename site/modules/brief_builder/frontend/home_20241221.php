<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$wdoc = $fwRequest->getParam('wdoc', '');
$where = "WHERE 1=1 ";
$search = $fwRequest->getParam('search', '');
$showall = $fwRequest->getParam('showall', '');

function get_image_raw_data($zipfile)
{

  $filetoinclude = $_SERVER['DOCUMENT_ROOT'].'/file_upload/server/s3/S3.php';
    include_once $filetoinclude;
     $s3 = new S3('AKIA2AMNCYNNR3C7ELXP', 'ut4HuWX5HovWcxoCaU8gSSE27/RBxidTIh3SqYe2');
    	 try {
    $bucket_name  = "deckquote";
	$file_data = $s3->getObject($bucket_name,'files/brief_builder/'.$zipfile, $saveTo = false); 
//	echo "<pre>";print_r($file_data);  
	$file_data = $file_data->body;
	$type = pathinfo($zipfile, PATHINFO_EXTENSION);
    return $raw_data = 'data:image/' . $type . ';base64,' . base64_encode($file_data);
	 
    } catch (ErrorException $ex) {
        //$this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
    echo $ex->getLine();
        return false;
    }
}

function get_img_raw_data($folder_path,$object_name)
{
       $zipfile = $postedData['file_name'];
       $filetoinclude = $_SERVER['DOCUMENT_ROOT'].'/file_upload/server/s3/S3.php';
        include_once $filetoinclude; $raw_data = "";
         $s3 = new S3('AKIA2AMNCYNNR3C7ELXP', 'ut4HuWX5HovWcxoCaU8gSSE27/RBxidTIh3SqYe2');
        	 try {
        $bucket_name  = "deckquote";
    	$file_data = $s3->getObject($bucket_name,$folder_path.$object_name, $saveTo = false); 
    //	echo "<pre>";print_r($file_data);  
    	$file_data = $file_data->body;
    	$type = pathinfo($zipfile, PATHINFO_EXTENSION);
        return $raw_data = 'data:image/' . $type . ';base64,' . base64_encode($file_data);
        
       
    	 
        } catch (ErrorException $ex) {
            //$this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
            echo $ex->getLine();
           
        }
}
 
if($search)
{
	$cat = $fwRequest->getParam('cat', '');
	$where = " where bb_catergory2 = '".$cat."'";
	$fwViewData['cat'] = $cat;
}

if($showall)
{
	$where = "WHERE 1=1 ";
}

if($wdoc)
{
	$bb_data = $fwRequest->getParam('brief', array());
	
	$ids = '(';
	
	foreach($bb_data as $k=>$v)
	{
		$ids .= $k . ",";	
	}
	$ids .= '0)';
	
	$sql = "select * from brief_builder where bb_id in " .$ids; 
       	$imageData = $fwDb->query($sql);
	
	
	foreach($imageData as $k1 => $v1)
	{
	    $folder_path = "files/brief_builder/"; $object_name = $v1['bb_image'];
	    $file_path = get_file_raw_data($folder_path,$object_name);
	  //  $file_path = get_img_raw_data($folder_path,$object_name);
	   
    	$html .=  "<p>" .$v1['bb_label']. "</p>"; 	
    	//$html .= '<p><img src ="'. BASE_URL.'files/brief_builder/'.$v1['bb_image']. '" style="width:300px;"></p>';
    	//$html .= '<p><img src ="https://deckquote.s3.amazonaws.com/files/brief_builder/'.$v1['bb_image']. '" style="width:200px;"></p>';
    //	$html .= '<p><img src ="'.$file_path. '" style="width:200px;"></p>';
    	$html .= '<p><img src ="'.$file_path. '" width="600" height="300"></p>';
    	$html .=  "<p>" .$v1['bb_text']. "</p>";
    	$html .= "<br clear=all style='page-break-before:always'>";
	}
	
	  //db($html); exit;
	  header("Content-type: application/vnd.ms-word.doc");
	  header("Content-Disposition: attachment;Filename=brief_builder.doc");    
	  echo "<html>";
	  echo "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=Windows-1252\">";
	  echo "<body>";
	  echo "<div style='font-family:calibri;'>";
	  echo $html;
	  echo "</div>";
	  echo "</body>";
	  echo "</html>";
	  exit;		
}



  
//$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where." ORDER BY ".$TABLE.".".$ID." ASC";	

$matsql = "SELECT brief_builder.* , brief_builder_catergory.*
	   FROM brief_builder
	   INNER JOIN brief_builder_catergory ON brief_builder.bb_catergory2 = brief_builder_catergory.bbc_id " .$where . 
	   " order by bb_label";

//db($matsql);

if($matsql){$userData = $fwDb->query($matsql);}

$fwViewData['imagelist'] = $userData;

$fwViewData['title'] = $MODULE_PLURAL;

$sqlcat = "Select * from brief_builder_catergory order by bbc_text";
$fwViewData['catData'] = $fwDb->query($sqlcat);

