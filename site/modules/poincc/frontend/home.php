<?php

$pagenum = $fwRequest->getparam('pagenum','');
$tablePages = new Fw_Db_Table($TABLE);
$export = $fwRequest->getParam('export', 0);
$short = $fwRequest->getParam('s', '');

$fwViewData['ran'] =  rand(100000,999999);
$user_name = $_SESSION['user']['user_name'];
$date = date("d-m-Y");

	require_once(MODULES_DIR . 'PDFMerger.php');
	
	use PDFMerger\PDFMerger;

$where = " WHERE 1=1 ";	


// Set date for Entered in Myob
$sub_myob = $fwRequest->getParam('po_enter_myob', '');
if(!empty($sub_myob)) {
	$savetorm1 = $fwRequest->getParam('po_enter_myob', '');
	foreach($savetorm1 as $k=>$v)
	{
		$rmDetail['po_myob_date'] = $v;
		$tablerm = new Fw_Db_Table('poincc');
		$tablerm->setWhere('po_id = '.$k);
		$detail = $tablerm->updateRow($rmDetail);		
	}
}
//

$sub_podate = $fwRequest->getParam('po_app_date', '');
if(!empty($sub_podate)) {
	$savetorm2 = $fwRequest->getParam('po_app_date', '');
	foreach($savetorm2 as $k=>$v)
	{
		$rmDetail['po_appoved_date'] = $v;
		$tablerm = new Fw_Db_Table('poincc');
		$tablerm->setWhere('po_id = '.$k);
		$detail = $tablerm->updateRow($rmDetail);		
	}
}

//

$sub_poinvdate = $fwRequest->getParam('po_invoice_date', '');
if(!empty($sub_poinvdate)) {
	$savetorm3 = $fwRequest->getParam('po_invoice_date', '');
	foreach($savetorm3 as $k=>$v)
	{
		$rmDetail['po_in_payed_date'] = $v;
		$tablerm = new Fw_Db_Table('poincc');
		$tablerm->setWhere('po_id = '.$k);
		$detail = $tablerm->updateRow($rmDetail);		
	}
}


$submitrm = $fwRequest->getParam('savetorm', '');
if(!empty($submitrm)) {
	$savetorm = $fwRequest->getParam('savetorm', '');
		
	foreach($savetorm as $k=>$v)
	{
		$rmDetail['po_enter_in_myob'] = $v;
		$rmDetail['po_myob_user'] = $user_name;
		$tablerm = new Fw_Db_Table('poincc');
		$tablerm->setWhere('po_id = '.$k);
		$detail = $tablerm->updateRow($rmDetail);		
	}
}

$submitrm2 = $fwRequest->getParam('savetorm2', '');
if(!empty($submitrm2)) {
	$savetorm2 = $fwRequest->getParam('savetorm2', '');
		
	foreach($savetorm2 as $k=>$v)
	{
		$apDetail['po_in_approved_payment'] = $v;
		$apDetail['po_approved_user'] = $user_name;
		$tablerm = new Fw_Db_Table('poincc');
		$tablerm->setWhere('po_id = '.$k);
		$detail = $tablerm->updateRow($apDetail);		
	}

}


$submitrm3 = $fwRequest->getParam('savetorm3', '');
if(!empty($submitrm3)) {
	$savetorm3 = $fwRequest->getParam('savetorm3', '');
		
	foreach($savetorm3 as $k=>$v)
	{
		$apDetail['po_invoice_payed'] = $v;
		$apDetail['po_in_payed_user'] = $user_name;
		$tablerm = new Fw_Db_Table('poincc');
		$tablerm->setWhere('po_id = '.$k);
		$detail = $tablerm->updateRow($apDetail);		
	}

}

$sub_firstqa = $fwRequest->getParam('po_first_qa', '');
if(!empty($sub_firstqa)) {
	$firstqa = $fwRequest->getParam('po_first_qa', '');
	foreach($firstqa as $k=>$v)
	{
		$rmDetail['po_first_qa'] = $v;
		$tablerm = new Fw_Db_Table('poincc');
		$tablerm->setWhere('po_id = '.$k);
		$detail = $tablerm->updateRow($rmDetail);		
	}
}


$approvedpay = $fwRequest->getParam('po_in_approved_payment', '');
if(!empty($approvedpay)) {
	$appdata = $fwRequest->getParam('po_in_approved_payment', '');
	foreach($appdata as $k=>$v)
	{
		$rmDetail['po_in_approved_payment'] = $v;
		$rmDetail['po_approved_user'] = $user_name;
		$tablerm = new Fw_Db_Table('poincc');
		$tablerm->setWhere('po_id = '.$k);
		$detail = $tablerm->updateRow($rmDetail);		
	}
}




$sub_po_pornp = $fwRequest->getParam('po_pornp', '');
if(!empty($sub_po_pornp)) {
	$pornp = $fwRequest->getParam('po_pornp', '');
	foreach($pornp as $k=>$v)
	{
		$pnpDetail['po_pornp'] = $v;
		$tablerm = new Fw_Db_Table('poincc');
		$tablerm->setWhere('po_id = '.$k);
		$detail = $tablerm->updateRow($pnpDetail);		
	}
}

$submit_coacc = $fwRequest->getParam('po_chartof_acc', '');
if(!empty($submit_coacc)) {
	$chartof_acc = $fwRequest->getParam('po_chartof_acc', '');
		
	foreach($chartof_acc as $k=>$v)
	{
		$coaDetail['po_chartof_acc'] = $v;
		$tablerm = new Fw_Db_Table('poincc');
		$tablerm->setWhere('po_id = '.$k);
		$detail = $tablerm->updateRow($coaDetail);		
	}
}


$submit_1 = $fwRequest->getParam('notpayed', '');
$submit_2 = $fwRequest->getParam('notapproved', '');
$submit_3 = $fwRequest->getParam('showall', '');
$submit_4 = $fwRequest->getParam('myobabne', '');
$submit_5 = $fwRequest->getParam('rejected', '');

$search = $fwRequest->getParam('search', '');


//$search_project = $fwRequest->getParam('search_project', '');
//$search_myboid = $fwRequest->getParam('search_myboid', '');
//$search_type = $fwRequest->getParam('search_type', '');

$clearall = $fwRequest->getParam('clearall', '');
$showalert = $fwRequest->getParam('showalert', '');
//$myobidsearch = $fwRequest->getParam('myobidsearch', '');



$sqlvar = 0;
	
if($submit_1):
	
	$_SESSION['notpayed'] = 'True';
	
	if(isset($_SESSION['keyword'])) {
	    $where .= "  AND poincc.po_supplier like '".$_SESSION['keyword']."%' AND ".$TABLE.".po_invoice_payed = 0 AND ".$TABLE.".po_in_approved_payment = 1";
	} elseif(isset($_SESSION['type'])) {
		$where .= "  AND ".$TABLE.".po_type IN (".$_SESSION['type'] .") AND ".$TABLE.".po_invoice_payed = 0 AND ".$TABLE.".po_in_approved_payment = 1";
	} else {
		$where .= "  AND ".$TABLE.".po_invoice_payed = 0 AND ".$TABLE.".po_in_approved_payment = 1";	
	}
	$fwViewData['class1'] = 'style="background:#F00!important"';  
	$sqlvar = 1; 

elseif($_SESSION['notpayed']) :
	
	if(isset($_SESSION['keyword'])) {
	    $where .= "  AND poincc.po_supplier like '".$_SESSION['keyword']."%' AND ".$TABLE.".po_invoice_payed = 0 AND ".$TABLE.".po_in_approved_payment = 1";
	} elseif(isset($_SESSION['type'])) {
		$where .= "  AND ".$TABLE.".po_type IN (".$_SESSION['type'] .") AND ".$TABLE.".po_invoice_payed = 0 AND ".$TABLE.".po_in_approved_payment = 1";
	} else {
		$where .= "  AND ".$TABLE.".po_invoice_payed = 0 AND ".$TABLE.".po_in_approved_payment = 1";	
	}
	$fwViewData['class1'] = 'style="background:#F00!important"';  
	$sqlvar = 1; 
	
endif;

if($submit_2):
	//$where .= "AND ".$TABLE.".po_in_approved_payment = 0 ";
	if(isset($_SESSION['keyword'])) {
		$where .= " AND poincc.po_supplier like '".$_SESSION['keyword']."%' AND ".$TABLE.".po_in_approved_payment = 0 ";
	} elseif(isset($_SESSION['type'])) {
		$where .= " AND ".$TABLE.".po_type IN (".$_SESSION['type'] .") AND ".$TABLE.".po_in_approved_payment = 0 ";	
	} else {
		$where .= " AND ".$TABLE.".po_in_approved_payment = 0 ";	
	}
	$fwViewData['class2'] = 'style="background:#F00!important"'; 
	$sqlvar = 1;  
	
	//db($where);
endif;
  
if($submit_3):
	unset($_SESSION['keyword']);
	unset($_SESSION['type']);
	$where = " WHERE 1=1 ";
	$fwViewData['class3'] = 'style="background:#F00!important"';  
	$fwViewData['class1'] = '';  
	$sqlvar = 1; 
endif;
 
 if($submit_4):
	//$where .= " AND ".$TABLE.".po_first_qa = 'Approved for MYOB' AND ".$TABLE.".po_enter_in_myob = 0";
	if(isset($_SESSION['keyword'])) {
	$where .= "  AND poincc.po_supplier like '".$_SESSION['keyword']."%' AND ".$TABLE.".po_first_qa = 'Approved for MYOB' AND ".$TABLE.".po_enter_in_myob = 0";
	}elseif (isset($_SESSION['type'])) {
	$where .= "  AND ".$TABLE.".po_type IN (".$_SESSION['type'] .") AND ".$TABLE.".po_first_qa = 'Approved for MYOB' AND ".$TABLE.".po_enter_in_myob = 0";	
	} else {
	$where .= " AND ".$TABLE.".po_first_qa = 'Approved for MYOB' AND ".$TABLE.".po_enter_in_myob = 0";	
	}
	$fwViewData['class4'] = 'style="background:#F00!important"';  
	$sqlvar = 1; 
endif;
 
 
 if($submit_5):
	
	$where .= " AND ".$TABLE.".po_first_qa = 'Rejected' ";	
	
	$fwViewData['class13'] = 'style="background:#F00!important"';  
	$sqlvar = 1; 
endif;
 
 
 if($clearall):
	$where = " WHERE 1=1 ";
	$fwViewData['class9'] = 'style="background:#F00!important"';  
	$fwViewData['class1'] = ''; 
	$sqlvar = 1; 
	unset( $_SESSION['supplier']);
	unset( $_SESSION['project']);
	unset( $_SESSION['type']);
	unset($_SESSION['myobid']);
	unset($_SESSION['myobid_broad']);
	
endif;
 
 
 if($showalert):
	//$where .= "AND length(".$TABLE.".po_alert_text) > 0";
	$where .= "  AND poincc.po_supplier like '".$_SESSION['keyword']."%' AND length(".$TABLE.".po_alert_text) > 0";
	$fwViewData['class11'] = 'style="background:#F00!important"'; 
	$sqlvar = 1;  
endif;
  
  
  
  $supplier = $fwRequest->getParam('supplier_search', '');

  if(!empty($supplier)):
        
       $where .= " AND po_supplier  LIKE '%".$supplier."%'  ";
       $_SESSION['supplier'] = $supplier;
       $fwViewData['supplier']=$_SESSION['supplier'];

  elseif($_SESSION['supplier']):
		
       $where .= " AND po_supplier LIKE  '%".$_SESSION['supplier']."%' ";
       $fwViewData['supplier']=$_SESSION['supplier'];
	
  endif;
  
    $_SESSION['where'] = $where; 

 

$project = $fwRequest->getParam('project', '');
if(!empty($project)) :
	$sqlvar = 1; 
	//$project = $fwRequest->getParam('project', '');
	$_SESSION['project'] = $project;
	$data='';
	foreach($project as $k => $v)
	{
		$data .= "'".$v."'". ",";
		$data3 .= $v .",";
	}
	
	$fwViewData['data3'] = $data3;	
	$data .= "'" .'X' ."'";
	
	$where .= "AND ".$TABLE.".po_project_number IN (".$data .")";
	$fwViewData['class7'] = 'style="background:#F00!important"'; 
	
	$ord =    " ORDER BY poincc.po_urn DESC";

 elseif($_SESSION['project']):
 
    $project = $_SESSION['project'];


	$data='';
	foreach($project as $k => $v)
	{
		$data .= "'".$v."'". ",";
		$data3 .= $v .",";
	}
	
	$fwViewData['data3'] = $data3;	
	$data .= "'" .'X' ."'";
	
	$where .= " AND ".$TABLE.".po_project_number IN (".$data .")";
	$fwViewData['class7'] = 'style="background:#F00!important"'; 
	
	$ord =    " ORDER BY poincc.po_urn DESC";
 
 else :
	 $ord =    " ORDER BY STR_TO_DATE(poincc.po_invoice_date,'%d-%m-%Y') DESC";  	
endif;

$myboid = $fwRequest->getParam('myboid', '');
if(!empty($myboid)) :
	$sqlvar = 1; 
	
	$data='';
	foreach($myboid as $k => $v)
	{
		$data .= "'".$v."'". ",";
		$data4 .= $v .",";
	}
	
	$fwViewData['data4'] = $data4;	
	$data .= "'" .'X' ."'";
	
	$where .= " AND ".$TABLE.".po_myobid IN (".$data .")";
	$fwViewData['class8'] = 'style="background:#F00!important"'; 
	
	$ord =    " ORDER BY poincc.po_urn DESC";

else :
	 $ord =    " ORDER BY STR_TO_DATE(poincc.po_invoice_date,'%d-%m-%Y') DESC";  	
endif;

  $myobid_broad = $fwRequest->getParam('myobid_broad_search', '');

  if(!empty($myobid_broad)):
        
       $where .= " AND po_myobid  LIKE '%".$myobid_broad."%'  ";
       $_SESSION['myobid_broad'] = $myobid_broad;
       $fwViewData['myobid_broad']=$_SESSION['myobid_broad'];

  elseif($_SESSION['myobid_broad']):
		
       $where .= " AND po_myobid  LIKE  '%".$_SESSION['myobid_broad']."%' ";
       $fwViewData['myobid_broad']=$_SESSION['myobid_broad'];
	
  endif;
  
    $_SESSION['where'] = $where; 



$type = $fwRequest->getParam('type', '');
if(!empty($type)) :
	$sqlvar = 1; 
	//$type = $fwRequest->getParam('type', '');
	$data='';
	foreach($type as $k => $v)
	{
		$data .= "'".$v."'". ",";
		$data5 .= $v .",";
	}
	
	$fwViewData['data5'] = $data5;	
	$data .= "'" .'X' ."'";
	
	unset($_SESSION['keyword']);
	$_SESSION['type'] = $type;
	
	$where .= "AND ".$TABLE.".po_type IN (".$data .")";
	$fwViewData['class10'] = 'style="background:#F00!important"'; 
	
	$ord =    " ORDER BY poincc.po_urn DESC";
	
elseif($_SESSION['type']):
 
    $type = $_SESSION['type'];


	$data='';
	foreach($type as $k => $v)
	{
		$data .= "'".$v."'". ",";
		$data5 .= $v .",";
	}
	
	$fwViewData['data5'] = $data5;	
	$data .= "'" .'X' ."'";
	
	$where .= " AND ".$TABLE.".po_type IN (".$data .")";
	$fwViewData['class7'] = 'style="background:#F00!important"'; 
	
	$ord =    " ORDER BY poincc.po_urn DESC";


else :
	 $ord =    " ORDER BY STR_TO_DATE(poincc.po_invoice_date,'%d-%m-%Y') DESC";  	
endif;


//$invoice_no = $fwRequest->getParam('invoice_no', '');
//if(!empty($invoice_no)) :
//	$sqlvar = 1; 
//	
//	$data='';
//	foreach($invoice_no as $k => $v)
//	{
//		$data .= "'".$v."'". ",";
//		$data6 .= $v .",";
//	}
//	
//	$fwViewData['data6'] = $data6;	
//	$data .= "'" .'X' ."'";
//	
//	$where .= " AND ".$TABLE.".po_invoice_number  IN (".$data .")";
//	$fwViewData['class8'] = 'style="background:#F00!important"'; 
//	
//	$ord =    " ORDER BY poincc.po_urn DESC";
//
//else :
//	 $ord =    " ORDER BY STR_TO_DATE(poincc.po_invoice_date,'%d-%m-%Y') DESC";  	
//endif;
  
    $invoice_no = $fwRequest->getParam('inv_no', '');

  if(!empty($invoice_no)):
        
       $where .= " AND po_invoice_number  = '".$invoice_no."'  ";
       $_SESSION['invoice_no'] = $myobid;
       $fwViewData['invoice_no']=$_SESSION['myobid'];

  elseif($_SESSION['invoice_no']):
		
       $where .= " AND po_invoice_number  =  '".$_SESSION['invoice_no']."' ";
       $fwViewData['invoice_no']=$_SESSION['invoice_no'];
	
  endif;
  
    $_SESSION['where'] = $where;
  
  
  
  
 //$ord =    " ORDER BY STR_TO_DATE(poincc.po_invoice_date,'%d-%m-%Y') DESC"; 
 //$sql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where . $ord;	
 

 
 // Change on 9 Oct
// $lsql = $fwRequest->getParam('sql', '');
// if(!empty($lsql) && $sqlvar == 0) {
//	 	$sql = stripslashes($lsql);
//		} else {
//		 $sql = "SELECT SQL_CALC_FOUND_ROWS null as row_name, ".$TABLE.".* FROM ".$TABLE." ".$where . $ord;	
// }
//
//$fwViewData['sql'] = $sql;
// Change end 9 oct


$sql = "SELECT SQL_CALC_FOUND_ROWS null as row_name, ".$TABLE.".* FROM ".$TABLE." ".$where . $ord;	
$fwViewData['sql'] = $sql;


if ($sql) {
	if (!(isset($pagenum))) {
		$pagenum = 1;
	}elseif ($pagenum <= 1) {
		$pagenum = 1;
	}
	$page_rows = 20;
	$max = 'limit ' . ($pagenum - 1) * $page_rows . ',' . $page_rows;

$sql2 =  $sql . " " . $max; 

	//DB($sql2);

	if ($sql2) {
		$setdata = $fwDb->query($sql2);
	}
	$userData = $setdata;
	$total_rows = $fwDb->query('SELECT FOUND_ROWS() as `rows`');
	$total_rows = $total_rows[0]['rows'];
	//$rows = count($userData);
	$rows = $total_rows;
}


if(!empty($setdata))
{
    $last = ceil($rows/$page_rows); 

    if ($pagenum <= 1)
    {
        $pagenum = 1;
    }
    elseif ($pagenum > $last)
    {
        $pagenum = $last;
    }
	$numstartvounter =  $page_rows * ($pagenum-1) + 1;
	$fwViewData['numstartvounter'] = $numstartvounter;
		
    $fwViewData['last'] = $last;
    $fwViewData['lastone'] = $last-1;
	$fwViewData['lasttow'] = $last-2;
    $fwViewData['pagenum'] = $pagenum;
	$pagenatedatanext = $pagenum;
	$pagenatedataprev = $pagenum;
	for($i=0; $i<9; $i++)
		{
		$paginate[$pagenatedatanext] = $pagenatedatanext;
		$pagenatedatanext ++;
		}
		$fwViewData['paginatenext'] = $paginate;
	$pagenatedataprev = $pagenum;	
	for($i=0; $i<9; $i++)
		{
		$paginateprev[$pagenatedataprev] = $pagenatedataprev;
		$pagenatedataprev --;
		}
	$fwViewData['paginateprev'] = array_reverse($paginateprev);
	
    
$fwViewData['list'] =  $setdata;
}

$_SESSION['last_sql'] = $sql;
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Purchase orders and invoice clearing centre";

$sql2 = "SELECT distinct po_supplier from poincc order by po_supplier " ;	
if($sql2){$fwViewData['suplist'] = $fwDb->query($sql2);}

$sql3 = "SELECT distinct po_project_number from poincc order by po_project_number " ;	
if($sql3){$fwViewData['projlist'] = $fwDb->query($sql3);}

$sql4 = "SELECT distinct po_myobid from poincc order by po_myobid " ;	
if($sql4){$fwViewData['myobidlist'] = $fwDb->query($sql4);}

$sql5 = "SELECT distinct po_type from poincc order by po_myobid " ;	
if($sql5){$fwViewData['typelist'] = $fwDb->query($sql5);}

$sql6 = "SELECT  po_invoice_number  from poincc order by po_invoice_number  " ;	
if($sql6){$fwViewData['invoicelist'] = $fwDb->query($sql6);}

$mergesub = $fwRequest->getParam('merge', '');
if(!empty($mergesub))
{
	$lsql = $fwRequest->getParam('sql', '');
	$detail = $fwRequest->getParam('docs', array());
	$fwViewData['wait'] = 'true';
	$fwViewData['download'] = 'true';
	require_once(MODULES_DIR . 'PDFMerger.php');
	$pdf = new PDFMerger;
	$fn = "merged_poincc.pdf";
	$fwViewData['download'] ='false';

  	$sqlmerge = stripslashes($lsql);
	$data = $fwDb->query($sqlmerge);
	//db($data); exit;
	
	foreach($data as $k => $v)
	{
		// $docfile = BASE_DIR.'files/purchase_order_invoice/'.$v['po_invoice_doc'];
	  	$docfile = 'https://deckquote.s3.amazonaws.com/files/purchase_order_invoice/'.$v['po_invoice_doc'];
		$newfile = "new_".$v['po_invoice_doc'];
		
       // $source = "https://deckquote.s3.amazonaws.com/files/purchase_order_invoice/".$v['po_invoice_doc'];
        $destination = BASE_DIR.FILE_PATH."files/purchase_order_invoice/".$v['po_invoice_doc'];
        $folder_path = "files/purchase_order_invoice/";
        $source = fetch_file_raw_data($folder_path,$v['po_invoice_doc']);
        copy($source, $destination);
        $docfile = BASE_DIR.'files/purchase_order_invoice/'.$v['po_invoice_doc'];
		$newfile = "new_".$v['po_invoice_doc'];
		
		shell_exec('gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dNOPAUSE -dQUIET -dBATCH -sOutputFile='.$newfile.' '.$docfile);
		
	      //rename($newfile, BASE_DIR.'files/merged/'.$newfile);
         //$newfile2 = BASE_DIR.'files/merged/'.$newfile;
         
         rename($newfile, BASE_DIR.'files/purchase_order_invoice/'.$newfile);
         $newfile3 = BASE_DIR.'files/purchase_order_invoice/'.$newfile; 

       // if ( copy($docfile, $newfile2) ) {
		//if ( copy($newfile, $newfile2) ) {	
           // echo "Copy success!";
        //}else{
           // echo "Copy failed.";
        //}
    	//	rename($newfile, BASE_DIR.'files/merged/'.$newfile);
    	//	$newfile2 = BASE_DIR.'files/merged/'.$newfile;
		//$pdf->addPDF($newfile2);
		$pdf->addPDF($newfile3);
	}

	$pdf->merge('file',BASE_DIR.'files/merged/'.$fn);	
	$fwViewData['download'] ='true';
    $fwViewData['fn'] = $fn;
	$fwViewData['class6'] = 'style="background:#F00!important"'; 
	
	/*remove all files from folder after pdf merge */ 
	$purchase_order_invoice = BASE_DIR.FILE_PATH."files/purchase_order_invoice";
	deleteFiles($purchase_order_invoice);
}

/* delete all files from folder */
function deleteFiles($dir)
{
    // loop through the files one by one
    foreach(glob($dir . '/*') as $file){
        // check if is a file and not sub-directory
        if(is_file($file)){
            // delete file
            unlink($file);
        }
    }
}



