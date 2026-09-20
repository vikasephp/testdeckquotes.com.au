<?php
$fwMainView = 'file:' . getcwd() . '/businessalert_list.tpl';
$pagenum = $fwRequest->getparamget('pagenum','');
$opt = $fwRequest->getparamget('opt','');

$bus_id = $fwRequest->getparamget('bs_id', 0);
$export = $fwRequest->getParam('export', 0);
if($bus_id > 0){
if($export == 0)
	{					
	if($opt){}				
	
	$sql = "SELECT business_alert.* , users.user_name from business_alert
			Inner Join users on business_alert.be_user = users.user_id
			WHERE business_alert.be_business_id = ".$bus_id. " order by business_alert.be_alert_active DESC ";
	
						
$userData = $fwDb->query($sql);
if($sql){$userData = $fwDb->query($sql);}
$_SESSION['sql'] = $sql;
	if(!empty($userData))
	{
	if (!(isset($pagenum)))
		{
			$pagenum = 1;
		} 
	
		$rows = count($userData);
		
		$page_rows = 25;
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
		
		$mdata = $fwDb->query($sql2);
			
		foreach($mdata as $k=>$v)
		{
						$Statusdate = changedate_y_m_d($v['be_created_date']);
						$curdate_y_m_d = date('Y-m-d');
						$days_at_status = daysDifference($curdate_y_m_d, $Statusdate);
						$mdata[$k]['days_count'] = $days_at_status;
		}				
		
		//db($mdata);
		
		//if($sql2){$fwViewData['list']= $fwDb->query($sql2);}
		if($sql2){$fwViewData['list']= $mdata;}
		}
	}
}

//DB($fwViewData['list']);

////////////////////// export to xls ////
if($export > 0)
	{
if($bus_id){

if($_SESSION['sql'])
	{$sql = $_SESSION['sql'];}


$exportData = $fwDb->query($sql);	
}

$csv_output = "";
$fields = array("bcust_fname", "bcust_lname", "bcust_misc_email1", "bcust_misc_moble", "bcust_gendec_signed_date", "cs_name", "be_created_date", "be_answer_required", "be_sed_date", "be_easts_date", "be_ipc_date");
$fields_list = array("Customer_First_Name", "Customer_Last_Name", "Email", "Phone_Number","signed_disclaimer",  "created_date","Status", "answer_required", "Send_dossier", "Email_Advice", "Initial_Phone_Call");

$csv_output .= strtoupper(implode("\t", $fields_list));

$csv_output .= "\n";
if($exportData){
foreach($exportData as $k => $v)
		{
			foreach($v as $k2 => $v2)
					{
						if(in_array($k2, $fields))
						{
							if($v2 == '0000-00-00')
								{
								$csv_output .="NA \t";
								
								}
								else
								{
							if($k2 == 'be_answer_required')
							{
									if($v2 == 1)
										{
										$csv_output .="Yes \t";
										}
										else{
											$csv_output .= "No \t";
											}
							}
							else
							{
							$csv_output .= trim($v2)."\t";
							}	
								}						
						}
					}
			$csv_output .= "\n";	
		}
}

$filename ="export"."_".date("YmdHi",time()).".xls";
$contents = "testdata1 \t testdata2 \t testdata3 \t \n";
header('Content-type: application/ms-excel');
header('Content-Disposition: attachment; filename='.$filename);
echo $csv_output;
exit;
}
