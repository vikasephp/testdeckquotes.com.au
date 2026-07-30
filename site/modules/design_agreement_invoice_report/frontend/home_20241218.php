<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$table = new Fw_Db_Table('business_sellers');
$tabletask = new Fw_Db_Table('business_tasks');
$tableBusiness = new Fw_Db_Table('business');

$fwViewData['ran'] =  rand(100000,999999);
$where = ' Where business.bsn_dair_hide = 0';

$user = $_SESSION['user']['user_name'];
$dt = date('d-m-Y');


$clear = $fwRequest->getParam('clear', '');
if(!empty($clear)) {
	unset($_SESSION['project_status']);
	unset($_SESSION['paytment_status']);
}

$showhidden = $fwRequest->getParam('showhidden', '');
if(!empty($showhidden)) {
	$where = ' Where 1 = 1';
}



$hide = $fwRequest->getParam('hide', '');
if($hide)
{
	 $keys_2 = array_keys($hide);
	 $ky_2 = $keys_2[0];
	 $val_2 = $hide[$ky_2];
	
	  $detail['bsn_dair_hide'] = $val_2;
	  
	  $tableBusiness->setWhere("bsn_id = ".$ky_2);
	  if($tableBusiness->rowExists())
	  {
		 $this_id = $tableBusiness->updateRow($detail);
	  }	  	
}


$clear_search = $fwRequest->getParam('clear_search', '');
if(!empty($clear_search)) {
	unset($_SESSION['keyword']);
	unset($keyword);
	$fwViewData['keyword']='';	
	unset($_SESSION['designer']);
	unset($_SESSION['client']);
}

$keyword = $fwRequest->getParam('keyword', '');
if($keyword):
		$where .= " AND  business.bsn_name LIKE '%".$keyword."%'";
        $_SESSION['keyword'] = $keyword;
elseif($_SESSION['keyword']):
		$where .= " AND business.bsn_name LIKE '%".$_SESSION['keyword']."%' ";	      
endif;

$client = $fwRequest->getParam('client', '');
if($client):
		$where .= " AND  bus_customers.bcust_fname LIKE '%".$client."%'";
        $_SESSION['client'] = $client;
elseif($_SESSION['client']):
		$where .= " AND bus_customers.bcust_fname LIKE '%".$_SESSION['client']."%' ";	      
endif;

$project_status = $fwRequest->getParam('project_status', '');
if($project_status):
		$where .= " AND  business.bsn_sub_status LIKE '%".$project_status."%'";
        $_SESSION['project_status'] = $project_status;
elseif($_SESSION['project_status']):
		$where .= " AND business.bsn_sub_status LIKE '%".$_SESSION['project_status']."%' ";	      
endif;


$invoice_status = $fwRequest->getParam('invoice_status', '');
if($invoice_status):
		$where .= " AND business.bsn_dair_inv_status = ".$invoice_status;
        $_SESSION['invoice_status'] = $invoice_status;
elseif($_SESSION['invoice_status']):
		$where .= " AND business.bsn_dair_inv_status = ".$_SESSION['invoice_status'];	      
endif;


$paytment_status = $fwRequest->getParam('paytment_status', '');
if($paytment_status):
		$where .= " AND  business.bsn_dair_pay_status = ".$paytment_status;
        $_SESSION['paytment_status'] = $paytment_status;
elseif($_SESSION['paytment_status']):
		$where .= " AND business.bsn_dair_pay_status = ".$_SESSION['paytment_status'];	      
endif;

  $sql = "SELECT business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname, business.bsn_id,
          business.bsn_name, business.bsn_sub_status, document_check_list.doc_date_uploaded, business.bsn_status_sys_date, business.bsn_address,
		 document_check_list.doc_file_name, business.bsn_dair_dasd, business.bsn_dair_pdd , business.bsn_dair_inv_status,
		business.bsn_dair_invoice_num, business.bsn_dair_invoice, business.bsn_dair_invoice_date , business.bsn_dair_amount, business.bsn_dair_pay_status,
		business.bsn_dair_pay_date, business.bsn_dair_hide, business.bsn_dair_type, business.bsn_dair_agree_sent, business.bsn_dair_notes
		from business_sellers 
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
		Inner Join document_check_list ON business_sellers.bs_business_id = document_check_list.doc_bsn_id And 
		document_check_list.doc_name_id = 45 and document_check_list.doc_date_uploaded != '0000-00-00 00:00:00' 
		" . $where ." Group By business.bsn_id order by document_check_list.doc_date_uploaded DESC" ;
		
		$userData = $fwDb->query($sql);

	$total_record = 0;

if($userData)
{
     if(!empty($userData)){ $total_record = count($userData); }
}



if(!empty($total_record))
{
    
        if (!(isset($pagenum)))
            {
                $pagenum = 1;
            } 
        
            $rows = $total_record;
            
            $page_rows = 200;
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
         $sql = $sql." ".$max ;
    if($sql)
    {
    
    $userData = $fwDb->query($sql);
    //echo "<pre>"; print_r($userData); echo "</pre>"; exit("checking");
            foreach($userData as $user_k => $user_v)
           {
               $sqlg = "SELECT business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname, business.bsn_id, business.bsn_name, business.bsn_sub_status,business.bsn_status_sys_date, business.bsn_address, business.bsn_dair_dasd, business.bsn_dair_pdd , business.bsn_dair_inv_status, business.bsn_dair_invoice_num, business.bsn_dair_invoice, business.bsn_dair_invoice_date , business.bsn_dair_amount, business.bsn_dair_pay_status, business.bsn_dair_pay_date, business.bsn_dair_hide, business.bsn_dair_type, business.bsn_dair_agree_sent, business.bsn_dair_notes from business_sellers Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id Inner Join business ON business_sellers.bs_business_id = business.bsn_id ".$where." and  business.bsn_id = ".$user_v['bs_business_id']."  Group By business.bsn_id";
               $userData_rt = $fwDb->query($sqlg);
               if(!empty($userData_rt))
               {
                   foreach($userData_rt as $user_rt_k => $user_rt_v)
                   {
                       $userData[$user_k]['bs_business_id'] = $user_rt_v['bs_business_id'];
                        $userData[$user_k]['bs_customers_id'] = $user_rt_v['bs_business_id'];
                        $userData[$user_k]['bcust_fname']     = $user_rt_v['bcust_fname'];
                        $userData[$user_k]['bcust_lname']     = $user_rt_v['bcust_lname'];
                        $userData[$user_k]['bsn_id']          = $user_rt_v['bsn_id'];
                        $userData[$user_k]['bsn_name']        = $user_rt_v['bsn_name'];
                        $userData[$user_k]['bsn_sub_status']  = $user_rt_v['bsn_sub_status'];
                        $userData[$user_k]['bsn_status_sys_date'] = $user_rt_v['bsn_status_sys_date'];
                        $userData[$user_k]['bsn_address']     = $user_rt_v['bsn_address'];
                        $userData[$user_k]['bsn_dair_dasd']   = $user_rt_v['bsn_dair_dasd'];
                        $userData[$user_k]['bsn_dair_pdd']    = $user_rt_v['bsn_dair_pdd'];
                        $userData[$user_k]['bsn_dair_inv_status']  = $user_rt_v['bsn_dair_inv_status'];
                        $userData[$user_k]['bsn_dair_invoice_num'] = $user_rt_v['bsn_dair_invoice_num'];
                        $userData[$user_k]['bsn_dair_invoice']     = $user_rt_v['bsn_dair_invoice'];
                        $userData[$user_k]['bsn_dair_invoice_date'] = $user_rt_v['bsn_dair_invoice_date'];
                        $userData[$user_k]['bsn_dair_amount']      = $user_rt_v['bsn_dair_amount'];
                        $userData[$user_k]['bsn_dair_pay_status']  = $user_rt_v['bsn_dair_pay_status'];
                        $userData[$user_k]['bsn_dair_pay_date']    = $user_rt_v['bsn_dair_pay_date'];
                        $userData[$user_k]['bsn_dair_hide']        = $user_rt_v['bsn_dair_hide'];
                        $userData[$user_k]['bsn_dair_type']        = $user_rt_v['bsn_dair_type'];
                        $userData[$user_k]['bsn_dair_agree_sent']  = $user_rt_v['bsn_dair_agree_sent'];
                        $userData[$user_k]['bsn_dair_notes']       = $user_rt_v['bsn_dair_notes'];
                   }
                   
               }
               else
               {
                   echo "record does not exists";
               }
              
           }
           // echo "<pre>"; print_r($userData); echo "</pre>"; exit("checking");
        }
          
        foreach($userData as $k => $v)
        {
        		$link = $BASE_URL."business.detail/bsn_id/".$v['bsn_id'];	
        	    $userData[$k]['link'] = $link;
        		
        		$sql214 = "select doc_file_name from document_check_list where doc_name_id = 214 and doc_bsn_id =".$v['bsn_id'];
        		$data214 = $fwDb->queryOne($sql214);
        		$userData[$k]['doc_file_name_214'] = $data214['doc_file_name'];
        		
        }
          	$fwViewData['list'] =  $userData;
        			
    
}


$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Design Agreement Invoices Report";

$sqlst = "Select * from design_agr_inv_status";
$fwViewData['stdata'] = $fwDb->query($sqlst);

$sqlpay = "Select * from design_agr_inv_pament";
$fwViewData['paydata'] = $fwDb->query($sqlpay);

$sqlst = "Select * from design_agr_inv_type";
$fwViewData['typedata'] = $fwDb->query($sqlst);



// Export to Excel

$export = $fwRequest->getParam('export', 0);

if(!empty($export))
{
	
	
    require BASE_DIR . "PHPExcel/SimpleXLSXGen/SimpleXLSXGen.php"; 
	
	$my_excel_data = [];
    $title =  ['<b>Project Address</b>', '<b>Project Status</b>', '<b>Sent Date</b>', '<b>Date Uploaded</b>',  
	           '<b>Design Agreement Signed Date</b>', '<b>Proposal Document Date</b>', '<b>Type</b>', '<b>Invoice Status </b>', '<b>Invoice Number</b>', 
			   '<b>Invoice Date</b>', '<b>Amount</b>','<b>Payment Date </b>', '<b>Payment Status</b>'];
			   
    array_push($my_excel_data,$title);
	
	
	 $sql = "SELECT business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
	        business.bsn_id,
            business.bsn_name, business.bsn_sub_status, document_check_list.doc_date_uploaded, business.bsn_status_sys_date, business.bsn_address,
		    document_check_list.doc_file_name, business.bsn_dair_dasd, business.bsn_dair_pdd , business.bsn_dair_inv_status,
			business.bsn_dair_invoice_num, business.bsn_dair_invoice, business.bsn_dair_invoice_date , business.bsn_dair_amount,
			 business.bsn_dair_pay_status,
			business.bsn_dair_pay_date, business.bsn_dair_hide, business.bsn_dair_type, business.bsn_dair_agree_sent, business.bsn_dair_notes
			from business_sellers 
			Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
			Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
			Inner Join document_check_list ON business_sellers.bs_business_id = document_check_list.doc_bsn_id And 
			document_check_list.doc_name_id = 45 and document_check_list.doc_date_uploaded != '0000-00-00 00:00:00' 
			" .$where . " Group By business.bsn_id order by document_check_list.doc_date_uploaded DESC" ;
		
		$userData = $fwDb->query($sql);
	
	
	foreach($userData as $k=>$v)
	{
		$proj = $v['bcust_fname']. ' '. $v['bcust_lname']. "\n".$v['bsn_address'];
		
		$sql_1 = "Select * from design_agr_inv_type where dt_id = ".$v['bsn_dair_type'];
		$typedata =  $fwDb->queryOne($sql_1);
		
		$sql_2 = "Select * from design_agr_inv_status where st_id = ".$v['bsn_dair_inv_status'];
		$statusdata =  $fwDb->queryOne($sql_2);
		
		$sql_3 = "Select * from design_agr_inv_pament where dp_id = ".$v['bsn_dair_pay_status'];
		$paymentdata =  $fwDb->queryOne($sql_3);
		
		$values=	[
        $proj,
        $v['bsn_sub_status'],
        $v['bsn_dair_agree_sent'],
        $v['doc_date_uploaded'],
        $v['bsn_dair_dasd'],
        $v['bsn_dair_pdd'],
		$typedata['dt_option'],
        $statusdata['st_option'],
        $v['bsn_dair_invoice'],
        $v['bsn_dair_invoice_date'],
        $v['bsn_dair_amount'],
        $v['bsn_dair_pay_date'],
       
        $paymentdata['dp_option']     
        ];
        array_push($my_excel_data,$values);
    }
		
	
	$xlsx = Shuchkin\SimpleXLSXGen::fromArray( $my_excel_data )->downloadAs('Design_agree_inv_report.xlsx');;
exit;
	
	
}
