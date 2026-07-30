<?php 
$pagenum = $fwRequest->getparam('pagenum','');
$tablePages = new Fw_Db_Table($TABLE);
$tablestatus = new Fw_Db_Table('customers_status');
$tableintrest = new Fw_Db_Table('customers_type');
$submit = $fwRequest->getParam('search', '');
$orderby = $fwRequest->getParam('orderby', '');
if($orderby)
	{
	if($orderby == "ASC"){$fwViewData['ord'] = "DESC";}else{$fwViewData['ord']="ASC";}
	$set_order = " business_qa.bqa_created_date ".$fwViewData['ord']; 
	$_SESSION['ord']=$fwViewData['ord'];
	}
	elseif($_SESSION['ord'])
		{
		$set_order = " business_qa.bqa_created_date ".$_SESSION['ord']; 
		$fwViewData['ord'] = $_SESSION['ord'];
		}
	else{
	$set_order = " business_qa.bqa_created_date DESC";
	$fwViewData['ord'] = "ASC";
	}
	
if(!empty($submit))
	{
	$detail = $fwRequest->getParam($TABLE, array());
	//db($detail);
	$where = "WHERE 1=1";	
	$detail = clean_array($detail);
	
	if($detail['bsn_name']){ $where .= " AND business.bsn_name LIKE '%".$detail['bsn_name']."%'";}
	
	if($detail['bcust_name']){ $where .= " AND bus_customers.bcust_fname LIKE '%".$detail['bcust_name']."%' OR bus_customers.bcust_lname LIKE '%".$detail['bcust_name']."%'";}
	
	if($detail['qa_type'])
			{ 
					switch($detail['qa_type'])
						 {
							case "ANSWERED":
							$where .= " AND length(business_qa.bqa_ans) > 68 ";
							break;
					
							case "UNANSWERED":
							$where .= " AND length(business_qa.bqa_ans) <= 68";
							break;
							
							case "ALL":
							$where .="";
							break;
							
							default:
							$where .="";
							break;
						 }
					
			}
$qandasql = "SELECT business.bsn_id, business.bsn_name, bus_customers.bcust_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
		     business_qa.bqa_id, business_qa.bqa_bsn_id, business_qa.bqa_cust_id, business_qa.bqa_que, business_qa.bqa_ans, business_qa.bqa_created_date,
			 business_qa.bqa_ans_date, business_qa.bqa_notes, business_qa.bqa_status, customers.customer_positions,  positions.p_name
			FROM business_qa 
			LEFT JOIN bus_customers ON bus_customers.bcust_id = business_qa.bqa_cust_id 
			LEFT JOIN business ON business.bsn_id = business_qa.bqa_bsn_id 
			Left Join customers on  customers.user_id  = business_qa.bqa_who 
			Left Join positions on positions.p_id = customers.customer_positions
			".$where;	
	$fwViewData['detail'] = $detail;
	unset($_SESSION['last_qandasql']);
	unset($_SESSION['detail']);
	
	$_SESSION['last_qandasql'] = $qandasql;
	$_SESSION['detail'] = $detail;
	}elseif($_SESSION['last_qandasql']){$qandasql = $_SESSION['last_qandasql']; $fwViewData['detail'] = $_SESSION['detail'];}
	else{
$qandasql = "SELECT business.bsn_id, business.bsn_name, bus_customers.bcust_id, bus_customers.bcust_fname, bus_customers.bcust_lname, business_qa.bqa_id, business_qa.bqa_bsn_id,
			 business_qa.bqa_cust_id, business_qa.bqa_que, business_qa.bqa_created_date, business_qa.bqa_ans, business_qa.bqa_ans_date, business_qa.bqa_notes,
			  business_qa.bqa_status, customers.customer_positions, positions.p_name
			FROM business_qa 
			LEFT JOIN bus_customers ON bus_customers.bcust_id = business_qa.bqa_cust_id 
			LEFT JOIN business ON business.bsn_id = business_qa.bqa_bsn_id
			Left Join customers on  customers.user_id  = business_qa.bqa_who 
			Left Join positions on positions.p_id = customers.customer_positions
			";	
	}


if($qandasql){$qandasql .=" ORDER BY ".$set_order;}

if($qandasql){$userData = $fwDb->query($qandasql);}


if($submit == 'Export to XLS')
	{

	
	$fields = array("bsn_name", "bcust_fname", "bqa_que", "bqa_ans", "bqa_created_date", "bqa_ans_date");
	$first_row = array("Business Name", "Customer Name", "Question", "Answer", "Question Date", "Answer Date");	
$csv_output .= implode("\t", $first_row);
$csv_output .= "\n";


		foreach($userData as $k => $v)
				{
					foreach($v as $k2 => $v2)
							{
								if(in_array($k2, $fields))
								{
								if($k2 == 'bcust_fname'){$csv_output .= trim(stripslashes($v['bcust_fname']))." ".trim(stripslashes($v['bcust_lname']))."\t";}
								else{
								$v2 = ereg_replace("/\n\r|\r\n|\n|\r/", " ", $v2);
                            	 $v2 = preg_replace("/\t/", " ", $v2);
								
								$csv_output .= trim(stripslashes($v2))."\t";}
								}
							}
					$csv_output .= "\n";	
				}			
		$filename ="export"."_".date("YmdHi",time()).".xls";
		header('Content-type: application/ms-excel');
		header('Content-Disposition: attachment; filename='.$filename);
		echo $csv_output;
		exit;
	}
	


if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 
    $rows = count($userData);
  
    $page_rows = 30;
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
	$fwViewData['lastcount'] = ($pagenum-1)*$page_rows;
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
    
    $qandasql2 =  $qandasql." ".$max;

if($qandasql2){$fwViewData['list']= $fwDb->query($qandasql2);}
}

$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Business Q/A List";

