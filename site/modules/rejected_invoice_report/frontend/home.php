 <?php
$pagenum = $fwRequest->getparam('pagenum','');
$tablePages = new Fw_Db_Table($TABLE);

$export = $fwRequest->getParam('export', 0);
$short = $fwRequest->getParam('s', '');

$fwViewData['ran'] =  rand(100000,999999);
$user_name = $_SESSION['user']['user_name'];
$date = date("d-m-Y");

$where = " WHERE 1=1 ";	 $dt = strtotime(date('d-m-Y h:i:s'));

$search = $fwRequest->getParam('search', '');

$clearall = $fwRequest->getParam('clearall', '');
$sqlvar = 0;
	
 if($clearall):
	$where = " WHERE 1=1 ";
	$fwViewData['class9'] = 'style="background:#F00!important"';  
	$fwViewData['class1'] = ''; 
	$sqlvar = 1; 
	unset($_SESSION['keyword']);
	unset($_SESSION['invoice_no']);
	unset($_SESSION['supplier']);
	unset($_SESSION['inv_status']);
  endif;
 
     $_SESSION['where'] = $where; 

  
  $invoice_no = $fwRequest->getParam('inv_no', '');

  if(!empty($invoice_no)):
        
       $where .= " AND ri_invoice_num  = '".$invoice_no."'  ";
       $_SESSION['invoice_no'] = $invoice_no;
       $fwViewData['invoice_no']=$_SESSION['invoice_no'];

  elseif($_SESSION['invoice_no']):
		
       $where .= " AND ri_invoice_num  =  '".$_SESSION['invoice_no']."' ";
       $fwViewData['invoice_no']=$_SESSION['invoice_no'];
	
  endif;
  
  
  $supplier = $fwRequest->getParam('supplier', '');

  if(!empty($supplier)):
        
       $where .= " AND ri_supplier like  '%".$supplier."%'  ";
       $_SESSION['supplier'] = $supplier;
       $fwViewData['supplier']=$_SESSION['supplier'];

  elseif($_SESSION['supplier']):
		
       $where .= " AND ri_supplier  Like  '%".$_SESSION['supplier']."%' ";
       $fwViewData['supplier']=$_SESSION['supplier'];
	
  endif;
  
  $inv_status = $fwRequest->getParam('inv_status', '');

  if(!empty($inv_status)):
        
       $where .= " AND  ri_status like  '%".$inv_status."%'  ";
       $_SESSION['inv_status'] = $inv_status;
       $fwViewData['inv_status']=$_SESSION['inv_status'];

  elseif($_SESSION['inv_status']):
		
       $where .= " AND  	ri_status  Like  '%".$_SESSION['inv_status']."%' ";
       $fwViewData['inv_status']=$_SESSION['inv_status'];
	
  endif;
  
  
    $_SESSION['where'] = $where;
  
    
$sql = "select * from rejected_invoice ".$where;


if($sql){$userData = $fwDb->query($sql);}


if(!empty($userData))
{
  if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
    $page_rows = 350;
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
	
    $max = 'limit ' .($pagenum - 1) * $page_rows .',' .$page_rows;
    
    $sql2 =  $sql." ".$max;

if($sql2)
{  

 $setdata = $fwDb->query($sql2);

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

}

//foreach($setdata as $k2=>$v2)
//{
//	$sql2 = "select is_color from poincc2_invoice_stage where is_id = ".$v2['po_invoice_stage']; 
//	$coldata = $fwDb->queryOne($sql2);
//	$setdata[$k2]['color_code'] = $coldata['is_color'];
//}


//$fwViewData['list'] =  $setdata;

$_SESSION['last_sql'] = $sql;
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Rejected Invoice Report";

$sql2 = "SELECT distinct po_supplier from poincc2 order by po_supplier " ;	
if($sql2){$fwViewData['suplist'] = $fwDb->query($sql2);}

$sql3 = "SELECT distinct po_project_number from poincc2 order by po_project_number " ;	
if($sql3){$fwViewData['projlist'] = $fwDb->query($sql3);}



$sql5 = "SELECT distinct po_type from poincc2 order by po_myobid " ;	
if($sql5){$fwViewData['typelist'] = $fwDb->query($sql5);}

$sql6 = "SELECT  po_invoice_number  from poincc2 order by po_invoice_number  " ;	
if($sql6){$fwViewData['invoicelist'] = $fwDb->query($sql6);}



$sql4 = "select co_company_name from companies order by co_company_name";
$fwViewData['companydetail'] = $fwDb->query($sql4);


// Export to Excel

$export = $fwRequest->getParam('export', 0);

if(!empty($export))
{
	
$sql = "select * from rejected_invoice ";
	$data = $fwDb->query($sql);
	
    require BASE_DIR . "PHPExcel/SimpleXLSXGen/SimpleXLSXGen.php"; $my_excel_data = [];
    $title =  ['<b>RID</b>', '<b>Type</b>', '<b>Email Date</b>', '<b>Invlice Number</b>', '<b>Supplier</b>', 
	           '<b>Invoice Date</b>', '<b>Invoice Due Date</b>', '<b>Invoice Value</b>', '<b>US Invoice Value</b>', 
			   '<b>AUD Invoice Value</b>', '<b>Reason for Rejection</b>','<b>Status</b>', '<b>Project Address if Any</b>',
			   '<b>PO Number</b>', '<b>Value Of PO</b>', '<b>Linked Purchase Order</b>'];
			   
    array_push($my_excel_data,$title);
	foreach($data as $k=>$v)
	
    {
		$values=	[
        $v['ri_rid'],
        $v['ri_type'],
        $v['ri_email_date'],
        $v['ri_invoice_num'],
        $v['ri_supplier'],
        $v['ri_invoice_date'],
        $v['ri_invoice_due_date'],
        $v['ri_invoice_value'],
        $v['ri_us_inv_value'],
        $v['ri_aud_inv_value'],
        $v['ri_reason_rejection'],
       
        $v['ri_status'],
        $v['ri_project_address'],
        $v['ri_po_number'],
        $v['ri_value_of_po'],
		$v['ri_linked_po']
        ];
        array_push($my_excel_data,$values);
    }
		
	
	$xlsx = Shuchkin\SimpleXLSXGen::fromArray( $my_excel_data )->downloadAs('rejected_invoice.xlsx');;
exit;
	
	
}
