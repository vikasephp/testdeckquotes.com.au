<?php
$pagenum = $fwRequest->getparam('pagenum','');
$tablePages = new Fw_Db_Table($TABLE);
$export = $fwRequest->getParam('export', 0);
$short = $fwRequest->getParam('s', '');

if($short)
	{
	switch ($short)
			{
				case 'lc':
				$_SESSION['sort_order'] = $TABLE.".mlbs_update_date DESC";
				break;
				
				case 'bl':
				$_SESSION['sort_order'] = $TABLE.".mlbs_last_buyer_feedback ASC";
				break;
			
			}
	}

if($_SESSION['sort_order']){$order = "ORDER BY ".$_SESSION['sort_order'];}else{$order = "ORDER BY ".$TABLE.".mlbs_update_date DESC";}
	
	
	
$logged_username = $_SESSION['user']['user_username'];

if(empty($pagenum))
	{
	unset($_SESSION['last_sql']);
	}
if(!empty($submit))
	{
		$detail = $fwRequest->getParam($TABLE, array());
		$fwViewData['detail'] = $detail;
		$fwViewData['ord_id'] = $detail['orderBy'];	
	}	

if($sql = $_SESSION['last_sql'])	
	{$sql = $_SESSION['last_sql'];
	}
	else
		{
		$sql = "SELECT ".$TABLE.".*, business.bsn_name, business.bsn_status, busness_status.st_name FROM ".$TABLE." 
			LEFT JOIN business ON business.bsn_id = ".$TABLE.".mlbs_business_id 
			LEFT JOIN busness_status ON busness_status.st_id = business.bsn_status ".$order;
		}

if($sql){ $userData = $fwDb->query($sql);}	

if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
    $page_rows = 50;
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
    
    $sql2 =  $sql." ".$max;



if($sql2){ $setdata = $fwDb->query($sql2);}




foreach($setdata as $k => $v)
		{
		$bsnid = $v['mlbs_business_id'];
		
		$sqlcount = "SELECT count(byer_enquiry.be_id) as allbuyers FROM byer_enquiry WHERE byer_enquiry.be_business_id = ".$bsnid;
		/*$sqlcount = "SELECT count(bus_customers.bcust_id) as allbuyers FROM bus_customers  LEFT JOIN 
			byer_enquiry ON byer_enquiry.be_customer_id = bus_customers.bcust_id WHERE byer_enquiry.be_business_id = ".$bsnid;*/
			
		$v = array_merge($v,$fwDb->queryOne($sqlcount));
		

	$sqlcount = "SELECT count(byer_enquiry.be_id) as activebuyers FROM byer_enquiry WHERE byer_enquiry.be_status= 1 AND byer_enquiry.be_business_id = ".$bsnid;
			
		/*$sqlcount = "SELECT count(bus_customers.bcust_id) as activebuyers FROM bus_customers  LEFT JOIN 
			byer_enquiry ON byer_enquiry.be_customer_id = bus_customers.bcust_id WHERE bus_customers.bcust_status = 1 AND byer_enquiry.be_business_id = ".$bsnid;*/
			
		$v = array_merge($v, $fwDb->queryOne($sqlcount));
		$fwViewData['list'][] = $v;
	
		
		}


//DB($fwViewData['list']);

	}

$_SESSION['last_sql'] = $sql;
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = $MODULE_SINGULAR;
if($export > 0)
	{
$csv_output = "";	
$sql = "SELECT business.bsn_name, ".$TABLE.".mlbs_current_status, busness_status.st_name, ".$TABLE.".mlbs_completedby, ".$TABLE.".mlbs_last_buyer_feedback FROM ".$TABLE." 
LEFT JOIN business ON business.bsn_id = ".$TABLE.".mlbs_business_id 
LEFT JOIN busness_status ON busness_status.st_id = business.bsn_status 
".$order;

$exportdata = $fwDb->query($sql);

	$fields = array("bsn_name", "st_name", "mlbs_completedby", "mlbs_last_buyer_feedback");
	$fields_name = array("Business for Sale", "Status", "Complete By", "Last Buyer Feedback");	
$csv_output .= strtoupper(implode("\t", $fields_name));
$csv_output .= "\n";	
foreach($exportdata as $k => $v)
		{
			foreach($v as $k2 => $v2)
					{
						if(in_array($k2, $fields))
						{
						if($k2 == 'sl_current_status')
							{
					
								switch ($v2)
									{
									case 1:
									$st ="For Sale";
									break;
									
									case 2:
									$st ="Under Offer";
									break;
									
									case 3:
									$st ="Sold";
									break;
									
									}
						$csv_output .= trim($st)."\t";
							}else{
						$csv_output .= trim($v2)."\t";
							}
						}
					}
			$csv_output .= "\n";	
		}
		

		
$filename ="export"."_".date("YmdHi",time()).".xls";
$contents = "testdata1 \t testdata2 \t testdata3 \t \n";
header('Content-type: application/ms-excel');
header('Content-Disposition: attachment; filename='.$filename);
echo $csv_output;
exit;
}

	$tablestatus = new Fw_Db_Table('busness_status');
	$fwViewData['status']  = $tablestatus->getRows();