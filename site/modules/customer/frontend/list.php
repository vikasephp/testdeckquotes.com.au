<?php
$pagenum = $fwRequest->getparam('pagenum','');
$tablePages = new Fw_Db_Table($TABLE);
$tablestatus = new Fw_Db_Table('customers_status');
$tableintrest = new Fw_Db_Table('customers_type');
$submit = $fwRequest->getParam('search', '');
$export = $fwRequest->getParam('export', 0);

if($export > 0)
	{
$csv_output = "";
if($_SESSION['last_sql'])
{	
$exportdata = $fwDb->query($_SESSION['last_sql']);
$fields = array("bcust_id", "bcust_fname", "bcust_lname", "bcust_status", "bcust_isbuyer", "bcust_isseller", "bcust_misc_email1", "bcust_misc_email2", "bcust_misc_logged_date_date", "bcust_misc_moble", "bcust_misc_business", "bcust_misc_home");	
$csv_output .= implode("\t", $fields);
$csv_output .= "\n";	
		foreach($exportdata as $k => $v)
				{
					foreach($v as $k2 => $v2)
							{
								if(in_array($k2, $fields))
								{
								$csv_output .= trim($v2)."\t";
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
}

if(empty($pagenum))
	{
	unset($_SESSION['last_sql']);
	}
	
	
	
if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
	$string ="";
	/*if($detail['bcust_fname']){$string.= "(bcust_fname LIKE '".trim($detail['bcust_fname'])."%' OR oc_fname LIKE '".trim($detail['bcust_fname'])."%') AND ";}
	if($detail['bcust_lname']){$string.= "(bcust_lname LIKE '".trim($detail['bcust_lname'])."%' OR oc_lname LIKE '".trim($detail['bcust_lname'])."%') AND ";}
	if($detail['bcust_misc_email1']){$string.= "(bcust_misc_email1 LIKE '%".trim($detail['bcust_misc_email1'])."%' OR bcust_misc_email2 LIKE '%".trim($detail['bcust_misc_email1'])."%') OR (oc_email LIKE '%".trim($detail['bcust_misc_email1'])."%') AND ";}*/
	
	
	if($detail['bcust_fname']){$string.= "(bcust_fname LIKE '".trim($detail['bcust_fname'])."%') AND ";}
	if($detail['bcust_lname']){$string.= "(bcust_lname LIKE '".trim($detail['bcust_lname'])."%') AND ";}
	if($detail['bcust_misc_email1']){$string.= "(bcust_misc_email1 LIKE '%".trim($detail['bcust_misc_email1'])."%')  AND ";}
	
	
	if($detail['bcust_status']){$string.= "bcust_status = ".trim($detail['bcust_status'])." AND ";}
	if($detail['bcust_type']){$string.= "bcust_type = ".trim($detail['bcust_type'])." AND ";}
	
	$detail['bcust_misc_logged_date_date_from'] = changedate_y_m_d($detail['bcust_misc_logged_date_date_from']);
	$detail['bcust_misc_logged_date_date_to'] = changedate_y_m_d($detail['bcust_misc_logged_date_date_to']);
	if($detail['bcust_misc_logged_date_date_from'] AND empty($detail['bcust_misc_logged_date_date_to'])){$string.= "user_logged.ul_date >= '".trim($detail['bcust_misc_logged_date_date_from'])."' AND ";}
	
	if(empty($detail['bcust_misc_logged_date_date_from']) AND $detail['bcust_misc_logged_date_date_to']){$string.= "user_logged.ul_date <= '".trim($detail['bcust_misc_logged_date_date_to'])."' AND ";}
	
	if($detail['bcust_misc_logged_date_date_from'] AND $detail['bcust_misc_logged_date_date_to']){$string.= "user_logged.ul_date BETWEEN '".trim($detail['bcust_misc_logged_date_date_from'])."' AND '".trim($detail['bcust_misc_logged_date_date_to'])."' AND ";}
		
	if(!empty($detail['bcust_isbuyer']) ){$string.= "bcust_isbuyer = 1 AND ";}
	
	if(!empty($detail['bcust_isseller'])){$string.= "bcust_isseller = 1 AND ";}	
	
	if($detail['phones']){$string.= "bcust_misc_moble LIKE '%".trim($detail['phones'])."%' OR bcust_misc_business LIKE '%".trim($detail['phones'])."%' OR bcust_misc_home LIKE '%".trim($detail['phones'])."%' AND ";}

	$string = substr($string, 0, -5);
	unset($_SESSION['last_sql']);
$fwViewData['detail'] = $detail;

if(empty($_SESSION['last_sql']) && empty($pagenum))
{
			if($string)
			{
			$se_string = "WHERE ". $string;
			}else{
			$se_string = "";
			}
			$sql = "SELECT bus_customers.*, customers_status.*, customers_type.*, user_logged.*
					/*, othercontact.oc_fname, othercontact.oc_lname, othercontact.oc_email*/ FROM 	bus_customers 
					LEFT JOIN customers_status ON bus_customers.bcust_status = customers_status.cs_id 
					LEFT JOIN customers_type ON bus_customers.bcust_type = customers_type.ct_id 
					LEFT JOIN user_logged ON bus_customers.bcust_user_id = user_logged.ul_user_id 
				  /*LEFT JOIN othercontact ON othercontact.oc_cust_id = bus_customers.bcust_id  */".$se_string;			
}
}
if(!empty($_SESSION['last_sql']))
{
$sql = $_SESSION['last_sql'];
}
if($sql){$userData = $fwDb->query($sql); if(count($userData) == 0){	$fwViewData['error'] = 1; } }

if(!empty($userData))
{
if (!(isset($pagenum))){ $pagenum = 1; } 
    $rows = count($userData);    
    $page_rows = 20;
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
if($sql2){$fwViewData['list']= $fwDb->query($sql2);}
}
$fwViewData['title'] = $MODULE_PLURAL;
$tablestatus->setOrderBy('cs_id'.' ASC');
$fwViewData['customers_status']=$tablestatus->getAllRows();
$tableintrest->setOrderBy('ct_id'.' ASC');
$fwViewData['customers_type']=$tableintrest->getAllRows();
$_SESSION['last_sql'] = $sql;
$fwViewData['current_date'] = date('Y-m-d');
/////////////////////////////////////////////////////////////////////////////////////////////////////////////