<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('companies');
$tableContact = new Fw_Db_Table('companies');

$active = $fwRequest->getParam('active', '');
if($active)
{
	 $keys_2 = array_keys($active);
	 $ky_2 = $keys_2[0];
	 $val_2 = $active[$ky_2];
	
	  $detail['cs_active'] = $val_2;
	  $tableContact->setWhere("cs_id = ".$ky_2);
	  if($tableContact->rowExists())
	  {
		 $this_id = $tableContact->updateRow($detail);
	  }	  	
}



  $co_resp_status = $fwRequest->getParam('co_resp_status', '');
  $partners_training = $fwRequest->getParam('partners_training', '');
  $where = " WHERE 1 = 1 ";


 if(!empty($co_resp_status)) {
	$where = "WHERE companies.co_resp_status = '" .$co_resp_status."'";	
	$fwViewData['costatus'] = $co_resp_status;
  }

 if(!empty($partners_training)) {
	$where = "WHERE contacts.cs_partner_training = '" .$partners_training."'";	
	$fwViewData['pt'] = $partners_training;
  }

$keyword = $fwRequest->getParam('keyword', '');
if($keyword):

	$where .= " AND contacts.cs_first_name LIKE '%".$keyword."%' OR contacts.cs_surname LIKE '%".$keyword."%' OR 
                    contacts.cs_address LIKE '%".$keyword."%' OR contacts.cs_mobile  LIKE '%".$keyword."%' OR
	            contacts.cs_primary_email LIKE '%".$keyword."%' OR
		    contacts.cs_position LIKE '%".$keyword."%' OR
	            companies.co_company_name LIKE '%".$keyword."%' OR 
		    companies.co_categry  LIKE '%".$keyword."%' OR 
		    type_options.to_option  LIKE '%".$keyword."%' ";
		    
	
	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword'] && $pagenum > 0):

	$where .= " AND contacts.cs_first_name LIKE '%".$_SESSION['keyword']."%' OR contacts.cs_surname LIKE '%".$_SESSION['keyword']."%'
	            OR contacts.cs_address LIKE '%".$_SESSION['keyword']."%' OR contacts.cs_mobile LIKE '%".$_SESSION['keyword']."%' 
	            OR contacts.co_resp_status LIKE '%".$_SESSION['keyword']."%'  OR
		    contacts.cs_position LIKE '%".$_SESSION['keyword']."%' OR
	            companies.co_company_name LIKE '%".$_SESSION['keyword']."%' OR 
		    companies.co_categry  LIKE '%".$_SESSION['keyword']."%' OR 
		    type_options.to_option  LIKE '%".$_SESSION['keyword']."%' ";	
	
	$fwViewData['keyword']=$_SESSION['keyword'];
endif;


$matsql = "SELECT contacts.* , companies.co_id, companies.co_company_name, companies.co_categry, type_options.to_option, 
           companies.co_resp_status, companies.co_active  from contacts 
           Left join companies ON contacts.cs_company = companies.co_id
	   Left join type_options on contacts.cs_position = type_options.to_id " . $where . " order by companies.co_company_name";	
	   echo $matsql;
if($matsql){$userData = $fwDb->query($matsql);}


if(!empty($userData))
{
if (!(isset($pagenum))){ $pagenum = 1; } 
    $rows = count($userData);
    $page_rows = 1000;
    $last = ceil($rows/$page_rows);    
    if ($pagenum <= 1)
    {
        $pagenum = 1;
    }
    elseif ($pagenum > $last)
    {
        $pagenum = $last;
    }
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
	
    $max = 'limit ' .($pagenum - 1) * $page_rows .',' .$page_rows;
    
    $sql2 =  $matsql." ".$max;
    if($sql2){$lists= $fwDb->query($sql2);

	foreach($lists as $list):

		$listsnew[] = $list;
	endforeach;
	
	$fwViewData['list'] = $listsnew;
  }
}

$fwViewData['title'] = $MODULE_PLURAL;


// Export to Excel

$export = $fwRequest->getParam('export', 0);

if($export > 0)
  {

	$sqlexport = "SELECT contacts.* , companies.co_company_name, companies.co_categry, type_options.to_option, 
		     companies.co_resp_status  from contacts 
		     Left join companies ON contacts.cs_company = companies.co_id
		     Left join type_options on contacts.cs_position = type_options.to_id";
	   
        if($sqlexport){$exportData = $fwDb->query($sqlexport);}
		
require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";
//require BASE_DIR . "PHPExcel/Classes/PHPExcel/Writer/Excel2007.php";

$objPHPExcel = new PHPExcel();

$objPHPExcel->getProperties()->setCreator("Deckquotes")
							 ->setLastModifiedBy("Nick C")
							 ->setTitle("Office 2007 XLSX Test Document")
							 ->setSubject("Office 2007 XLSX Test Document")
							 ->setDescription("Contacts exported to Office 2007 XLSX.")
							 ->setKeywords("office 2007 openxml php")
							 ->setCategory("Contacts");

//$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth(50);
$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('G')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('H')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('I')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('J')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('L')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('M')->setAutoSize(true);	
	
// Add some data
$objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A1', 'Category')
            ->setCellValue('B1', 'Company Name')
	    ->setCellValue('C1', 'Positions')
	    ->setCellValue('D1', 'First Name')
	    ->setCellValue('E1', 'Surname')
	    ->setCellValue('F1', 'Landline')
	    ->setCellValue('G1', 'Mobile')
	    ->setCellValue('H1', 'Emergency')
	    ->setCellValue('I1', 'Primary Email')
	    ->setCellValue('J1', 'Secondary Email')
	    ->setCellValue('K1', 'Calendar Link')
	    ->setCellValue('L1', 'Address')
	    ->setCellValue('M1', 'Responsible Status')
	  ;

$from = "A1"; // or any value
$to = "M1"; // or any value
$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold( true );

$row=2;
$sr=1;
foreach($exportData as $k=>$v)
{
	if(empty($v['to_option'])) { $pos = "Others"; } else { $pos = $v['to_option']; }

	$objPHPExcel->getActiveSheet()
		    ->setCellValue('A'.$row, $v['co_categry'])
		    ->setCellValue('B'.$row, $v['co_company_name'])
		    ->setCellValue('C'.$row, $pos)
		    ->setCellValue('D'.$row, $v['cs_first_name'])
		    ->setCellValue('E'.$row, $v['cs_surname'])
		    ->setCellValue('F'.$row, $v['cs_landline'])
		    ->setCellValue('G'.$row, $v['cs_mobile'])
		    ->setCellValue('H'.$row, $v['cs_emergency'])
		    ->setCellValue('I'.$row, $v['cs_primary_email'])
		    ->setCellValue('J'.$row, $v['cs_secondary_email'])	    
		    ->setCellValue('K'.$row, $v['cs_calendar_link'])
		    ->setCellValue('L'.$row, $v['cs_address'])
		    ->setCellValue('M'.$row, $v['co_resp_status'])		    
                  ;	
	$row= $row+1;			
	$sr=$sr+1;
}

$objPHPExcel->getActiveSheet()->setTitle('Contacts');
$objPHPExcel->setActiveSheetIndex(0);

header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="contacts.xls"');
header('Cache-Control: max-age=0');
header('Cache-Control: max-age=1');
header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
header ('Pragma: public'); // HTTP/1.0

$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
$objWriter->save('php://output');
exit;
	}

	
$sql_bs = "SELECT  * from busness_status ";
$fwViewData['bsdata'] = $fwDb->query($sql_bs);

$sql_contacts_position = "SELECT * FROM contacts_position";
$fwViewData['contacts_position'] = $fwDb->query($sql_contacts_position);



