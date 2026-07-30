<?php

$pagenum = $fwRequest->getparam('pagenum','');
$tablePages = new Fw_Db_Table($TABLE);
$tableMi = new Fw_Db_Table('poincc2_merged_invoice');

$export = $fwRequest->getParam('export', 0);
$short = $fwRequest->getParam('s', '');

$fwViewData['ran'] =  rand(100000,999999);
$user_name = $_SESSION['user']['user_name'];
$date = date("d-m-Y");

require_once(MODULES_DIR . 'PDFMerger.php');
use PDFMerger\PDFMerger;

$where = " WHERE 1=1 ";	 $dt = strtotime(date('d-m-Y h:i:s'));
// Set date for Entered in Myob
$sub_myob = $fwRequest->getParam('po_enter_myob', '');
if(!empty($sub_myob)) {
	$savetorm1 = $fwRequest->getParam('po_enter_myob', '');
	foreach($savetorm1 as $k=>$v)
	{
		$rmDetail['po_myob_date'] = $v;
		$tablerm = new Fw_Db_Table('poincc2');
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
		$tablerm = new Fw_Db_Table('poincc2');
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
		$tablerm = new Fw_Db_Table('poincc2');
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
		$tablerm = new Fw_Db_Table('poincc2');
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
		$tablerm = new Fw_Db_Table('poincc2');
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
		$tablerm = new Fw_Db_Table('poincc2');
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
		$tablerm = new Fw_Db_Table('poincc2');
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
		$tablerm = new Fw_Db_Table('poincc2');
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
		$tablerm = new Fw_Db_Table('poincc2');
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
		$tablerm = new Fw_Db_Table('poincc2');
		$tablerm->setWhere('po_id = '.$k);
		$detail = $tablerm->updateRow($coaDetail);		
	}
}


$search = $fwRequest->getParam('search', '');

$clearall = $fwRequest->getParam('clearall', '');
$sqlvar = 0;
	
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
	unset($_SESSION['keyword']);
	unset($_SESSION['notpayed']);
	unset($_SESSION['inv_stg']);
	
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
	
	$ord =    " ORDER BY poincc2.po_urn DESC";

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
	
	$ord =    " ORDER BY poincc2.po_urn DESC";
 
 else :
	 $ord =    " ORDER BY STR_TO_DATE(poincc2.po_invoice_date,'%d-%m-%Y') DESC";  	
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
	
	$ord =    " ORDER BY poincc2.po_urn DESC";

else :
	 $ord =    " ORDER BY STR_TO_DATE(poincc2.po_invoice_date,'%d-%m-%Y') DESC";  	
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
	
	$ord =    " ORDER BY poincc2.po_urn DESC";
	
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
	
	$ord =    " ORDER BY poincc2.po_urn DESC";


else :
	 $ord =    " ORDER BY STR_TO_DATE(poincc2.po_invoice_date,'%d-%m-%Y') DESC";  	
endif;

  
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
  
    $inv_stg = $fwRequest->getParam('inv_stg', '');
	
	if(!empty($inv_stg)) :

	    $where .= " AND po_invoice_stage   = ".$inv_stg;
		$fwViewData['inv_stg']=$inv_stg;
		$_SESSION['inv_stg'] = $inv_stg;
		
	elseif($_SESSION['inv_stg']):
	
		$where .= " AND po_invoice_stage   = ".$_SESSION['inv_stg'];
		$fwViewData['inv_stg']=$inv_stg;
	endif;
		  
		  
$sql10 = "Select sum(CAST(REPLACE(REPLACE(po_invoice_value, ',', ''), '$', '') AS decimal(15,2))) as inv_val  from poincc2 
          where po_invoice_stage = 1";
$datanew = $fwDb->queryOne($sql10);

$fwViewData['totval'] = $datanew['inv_val'];

$sql = "SELECT SQL_CALC_FOUND_ROWS null as row_name, ".$TABLE.".* FROM ".$TABLE." ".$where . $ord;	
$fwViewData['sql'] = $sql;


if ($sql) {
	if (!(isset($pagenum))) {
		$pagenum = 1;
	}elseif ($pagenum <= 1) {
		$pagenum = 1;
	}
	$page_rows = 100;
	$max = 'limit ' . ($pagenum - 1) * $page_rows . ',' . $page_rows;

$sql2 =  $sql . " " . $max; 


	if ($sql2) {
		$setdata = $fwDb->query($sql2);
	}
	$userData = $setdata;
	$total_rows = $fwDb->query('SELECT FOUND_ROWS() as rows');
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
	
    
//$fwViewData['list'] =  $setdata;
}


foreach($setdata as $k2=>$v2)
{
	$sql2 = "select is_color from poincc2_invoice_stage where is_id = ".$v2['po_invoice_stage']; 
	$coldata = $fwDb->queryOne($sql2);
	$setdata[$k2]['color_code'] = $coldata['is_color'];
}


$fwViewData['list'] =  $setdata;

$_SESSION['last_sql'] = $sql;
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Purchase orders and invoice clearing centre";

$sql2 = "SELECT distinct po_supplier from poincc2 order by po_supplier " ;	
if($sql2){$fwViewData['suplist'] = $fwDb->query($sql2);}

$sql3 = "SELECT distinct po_project_number from poincc2 order by po_project_number " ;	
if($sql3){$fwViewData['projlist'] = $fwDb->query($sql3);}

$sql4 = "SELECT distinct po_myobid from poincc2 order by po_myobid " ;	
if($sql4){$fwViewData['myobidlist'] = $fwDb->query($sql4);}

$sql5 = "SELECT distinct po_type from poincc2 order by po_myobid " ;	
if($sql5){$fwViewData['typelist'] = $fwDb->query($sql5);}

$sql6 = "SELECT  po_invoice_number  from poincc2 order by po_invoice_number  " ;	
if($sql6){$fwViewData['invoicelist'] = $fwDb->query($sql6);}

$credits_response = get_credits(); $fwViewData['remainingCredits'] = number_format($credits_response->remainingCredits,2);
$mergesub = $fwRequest->getParam('merge', '');
$assign_po_number = $fwRequest->getParam('assign_po_number', '');
$merge__po_number_pdf = $fwRequest->getParam('merge__po_number_pdf', '');

if(!empty($assign_po_number))
{
  $lsql = $fwRequest->getParam('sql', '');  $sqlmerge = stripslashes($lsql);
  $data = $fwDb->query($sqlmerge);// echo "<pre>";print_r($data); //exit;
  	foreach($data as $k => $v)
	{
	    if(!empty($v['po_purchase_order_no']))
	    {
	        $print_text = "HAVE PO  - ".$v['po_purchase_order_no'];
	    }
	    else
	    {
	        $print_text = "NO PO";
	    }
        $folder_path = "files/purchase_order_invoice/";
        $source = fetch_file_raw_data($folder_path,$v['po_invoice_doc']);
        $response = assign_po_number_to_pdf($v['po_invoice_doc'],$print_text);   
            
        // echo "<br> URL: " . $response -> url . "\n";       echo "<br> Page Count: " . $response -> pageCount . "\n"; 
        // echo "<br> Error: " . $response -> error . "\n";   echo "<br> Status: " . $response -> status . "\n"; 
        // echo "<br> Name: " . $response -> name ;

		file_put_contents($source, file_get_contents($response -> url)); //exit('<br> checking ...');
	
	}
	$fwViewData['po_number_assign_alert'] = 'true';
}

if(!empty($merge__po_number_pdf))
{
   require_once(MODULES_DIR . 'PDFMerger.php'); 	$pdf = new PDFMerger; $fn = "merged_poincc2_PO_MATCH"."_".$dt.".pdf";
   $lsql = $fwRequest->getParam('sql', '');  $sqlmerge = stripslashes($lsql);
   $data = $fwDb->query($sqlmerge);// echo "<pre>";print_r($data); //exit;
  	foreach($data as $k => $v)
	{
	  $po_pdf_newfile = $_SERVER['DOCUMENT_ROOT'].'/download_files/'.$v['po_invoice_doc']; 
	  if(file_exists($po_pdf_newfile)){ $pdf->addPDF($po_pdf_newfile); }
	}
	$pdf->merge('file',BASE_DIR.'files/merged_poincc2/'.$fn);	
	$fwViewData['download'] ='true';
    $fwViewData['fn'] = $fn;
	$fwViewData['class6'] = 'style="background:#F00!important"';
	
	date_default_timezone_set('Australia/Melbourne');
	$mdetail['mi_file_name']= $fn;
	$mdetail['mi_date_time']= date('d-m-Y h:i A');
	$mdetail['mi_user']= $_SESSION['user']['user_name'];
	$opr = $tableMi->insertRow($mdetail);
}

if(!empty($mergesub))
{
	$lsql = $fwRequest->getParam('sql', ''); 
	$detail = $fwRequest->getParam('docs', array());
	$fwViewData['wait'] = 'true'; $fwViewData['download'] = 'true';
	require_once(MODULES_DIR . 'PDFMerger.php'); 	$pdf = new PDFMerger;
	
	//$fn = "merged_poincc2.pdf";
	$fn = "merged_poincc2"."_".$dt.".pdf";
	$fwViewData['download'] ='false';
  	$sqlmerge = stripslashes($lsql);
	$data = $fwDb->query($sqlmerge); //echo "<pre>";print_r($data); exit;
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
	          
         rename($newfile, BASE_DIR.'files/purchase_order_invoice/'.$newfile);
         $newfile3 = BASE_DIR.'files/purchase_order_invoice/'.$newfile; 

 		$pdf->addPDF($newfile3);
	}
	$pdf->merge('file',BASE_DIR.'files/merged_poincc2/'.$fn);	
	$fwViewData['download'] ='true';
    $fwViewData['fn'] = $fn;
	$fwViewData['class6'] = 'style="background:#F00!important"'; 
	
	date_default_timezone_set('Australia/Melbourne');
	$mdetail['mi_file_name']= $fn;
	$mdetail['mi_date_time']= date('d-m-Y h:i A');
	$mdetail['mi_user']= $_SESSION['user']['user_name'];
	$opr = $tableMi->insertRow($mdetail);
	
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


$sql4 = "select co_company_name from companies order by co_company_name";
$fwViewData['companydetail'] = $fwDb->query($sql4);


$sql2 = "select * from poincc2_invoice_stage";
$fwViewData['isdetail'] = $fwDb->query($sql2);

// Export to Excel

$export = $fwRequest->getParam('export', 0);

if(!empty($export))
	{
			
require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";
//require BASE_DIR . "PHPExcel/Classes/PHPExcel/Writer/Excel2007.php";

// Create new PHPExcel object
$objPHPExcel = new PHPExcel();

// Set document properties
$objPHPExcel->getProperties()->setCreator("Deckquotes")
							 ->setLastModifiedBy("Nick C")
							 ->setTitle("Office 2007 XLSX Test Document")
							 ->setSubject("Office 2007 XLSX Test Document")
							 ->setDescription("Poincc 2 exported to Office 2007 XLSX.")
							 ->setKeywords("office 2007 openxml php")
							 ->setCategory("Purchase orders and invoice clearing centre");


//$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth(50);
$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth(30);
$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('G')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('H')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('I')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('J')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('L')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('M')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('N')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('O')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('P')->setAutoSize(true);

	
// Add some data
$objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A1', 'URN')
            ->setCellValue('B1', 'Type')
			->setCellValue('C1', 'P Or NP')
            ->setCellValue('D1', 'Project')
            ->setCellValue('E1', 'Email Date')
			->setCellValue('F1', 'Invoice No')
			->setCellValue('G1', 'Supplier')
			->setCellValue('H1', 'Invoice Date')
			->setCellValue('I1', 'Invoice Due Date')
			->setCellValue('J1', 'Invoice Value')
			->setCellValue('K1', 'US Invoice Value')
			->setCellValue('L1', 'Invoice Stage')
			->setCellValue('M1', 'MYOBID')
			->setCellValue('N1', 'PO Number')
			->setCellValue('O1', 'Value of PO')
			->setCellValue('P1', 'Chart of Acc')			
			;

$from = "A1"; // or any value
$to = "T1"; // or any value
$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold( true );

$row=2;
$sr=1;
foreach($setdata as $k=>$v)
{
	
			
	$sqlis = "select is_option from poincc2_invoice_stage where is_id = ".$v['po_invoice_stage'];
	$isdata = $fwDb->queryOne($sqlis);
	
	$is =$isdata['is_option'];
	
	$objPHPExcel->getActiveSheet()
				->setCellValue('A'.$row, $v['po_urn'])
				->setCellValue('B'.$row, $v['po_type'])
				->setCellValue('C'.$row, $v['po_pornp'])
				->setCellValue('D'.$row, $v['po_project_number'])
				->setCellValue('E'.$row, $v['po_email_date'])
				->setCellValue('F'.$row, $v['po_invoice_number'])
				->setCellValue('G'.$row, $v['po_supplier'])
				->setCellValue('H'.$row, $v['po_invoice_date'])
				->setCellValue('I'.$row, $v['po_invoice_due_date'])
				->setCellValue('J'.$row, $v['po_invoice_value'])
				->setCellValue('K'.$row, $v['po_us_invoice_value'])
				->setCellValue('L'.$row, $is)
				->setCellValue('M'.$row, $v['po_myobid'])
				->setCellValue('N'.$row, $v['po_purchase_order_no'])
				->setCellValue('O'.$row, $v['po_po_value'])
				->setCellValue('P'.$row, $v['po_chartof_acc'])
				;	
				
	$row= $row+1;			
	$sr=$sr+1;
}

// Rename worksheet
//$objPHPExcel->getActiveSheet()->setTitle("Purchase orders and invoice clearing centre");

// Set active sheet index to the first sheet, so Excel opens this as the first sheet
$objPHPExcel->setActiveSheetIndex(0);

// Redirect output to a client’s web browser (Excel5)
header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="poincc2.xls"');
header('Cache-Control: max-age=0');
// If you're serving to IE 9, then the following may be needed
header('Cache-Control: max-age=1');

// If you're serving to IE over SSL, then the following may be needed
header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
header ('Pragma: public'); // HTTP/1.0

$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
$objWriter->save('php://output');
exit;

}
