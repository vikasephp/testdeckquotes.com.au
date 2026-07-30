<?php
$table = new Fw_Db_Table('net_position_report');
$pagenum = $fwRequest->getparamget('pagenum',0);


$qa = $fwRequest->getParam('qa', '');
if(!empty($qa)) {
	$np_id = $fwRequest->getParam('np_id', '');
	$detail['np_qa_date'] = date('d-m-Y');
	$detail['np_qa_user'] = $_SESSION['user']['user_name'];
	
	$table->setWhere("np_id = $np_id");
	$opr = $table->updateRow($detail); 
}


$where = ' Where business_sellers.bs_depo_report_hide  = 0 and business_sellers.bs_xry_add_to_deposite = 1';

$sqlnet = "select * from net_position_report ";
$data = $fwDb->query($sqlnet);

foreach($data as $k1=>$v1)
{
  if($v1['np_what'] == 'Deposit Report')
    {
	  $sql = "SELECT business.bsn_id from business_sellers Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	  		  Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
	 		  Where business_sellers.bs_depo_report_hide = 0 and business_sellers.bs_xry_add_to_deposite = 1 And 
	  		 ( business.bsn_status like '%|2|%' OR business.bsn_status like '%|5|%' OR business.bsn_status like '%|6|%' OR 
	 		 business.bsn_status like '%|3|%' OR business.bsn_status like '%|4|%' ) Group By business.bsn_id";  
	
	$datadr = $fwDb->query($sql);
	
		
	foreach($datadr as $k=>$v)
    {
	$sqltot = "select  ppd_value from  progress_payment_detail where ppd_bsn_id = ".$v['bsn_id'] . " and ( ppd_stage = 'Deposit' OR ppd_stage = 'Planning Approvals Submitted' )";
	$totdata = $fwDb->query($sqltot);
	
	$sqlhia = "select ppd_hia_value from  progress_payment_detail where ppd_bsn_id = ".$v['bsn_id']. " and ppd_stage = 'Deposit' ";
    $dhvData = $fwDb->queryOne($sqlhia);
		
    $sqlplhia = "select ppd_hia_value from  progress_payment_detail where ppd_bsn_id = ".$v['bsn_id']. " and ppd_stage = 'Planning Approvals Submitted' ";
    $plhiaData = $fwDb->queryOne($sqlplhia);
	
	$com_dep = 0;
		
		$value1 = str_replace('$','',$dhvData['ppd_hia_value']);
		$value1 = str_replace(',','',$value1);
		
		$value2 = str_replace('$','',$plhiaData['ppd_hia_value']);
		$value2 = str_replace(',','',$value2);

		$com_dep = (float)$value1 + (float)$value2;
	
	    $total3 = 0;

		foreach($totdata as $kt=>$vt)
		{
			
			$value3=0;
			if(!empty($vt['ppd_value'])) {
				$value3 = $vt['ppd_value'];
				$value3 = str_replace('$','',$value3);
				$value3 = str_replace(',','',$value3);
				$total3 = (float)$total3 + (float)$value3;	
			}
		}
		
		$balance = $com_dep - $total3;
		$totbalance =  $totbalance + $balance;
	
      } //for
	  $data[$k1]['totbalance'] = number_format($totbalance, 2, '.', ',');
	   
   } //if
   
   
   
  		 if(!empty($v1['np_asset'])) {
	   			$value_ass = $v1['np_asset'];
				$value_ass = str_replace('$','',$value_ass);
				$value_ass = str_replace(',','',$value_ass);
				$total_ass = (float)$total_ass + (float)$value_ass;
         }
   
  		 if(!empty($v1['np_liabilities'])) {
	   			$value_lia = $v1['np_liabilities'];
				$value_lia = str_replace('$','',$value_lia);
				$value_lia = str_replace(',','',$value_lia);
				$total_lia = (float)$total_lia + (float)$value_lia;
         }
     
   
} //foreach

$fwViewData['npData'] = $data;
$fwViewData['total_lia'] = $total_lia;

// 30 days account receiable reort
$sqltot = "select td_value from 30_days_rec_report where td_hide = 0";
$totdata = $fwDb->query($sqltot);
$total = 0;
foreach($totdata as $kt=>$vt)
{
	$value=0;
	
	$value = $vt['td_value'];
	$value = str_replace('$','',$value);
	$value = str_replace(',','',$value);
	
	$total = $total + $value;	
}


$fwViewData['total'] = number_format($total, 2, '.', ',');


// work in progress
$matsql = "SELECT * from work_in_progress_report ";
$listsnew = $fwDb->query($matsql);

$tot_val_computed = 0;
$tot_wip_cog;
foreach($listsnew as $k1=>$v1)
{
	$inv1 = str_replace("$",'',$v1['wp_invoice_value']);
	$inv2 = str_replace(",",'',$inv1);
	$listsnew[$k1]['inv2'] = $inv2;

	$listsnew[$k1]['wip_cog'] = $inv2 * $v1['wp_per_completed'] / 100 * $v1['wp_cog_percented'] / 100;
	$tot_wip_cog = $tot_wip_cog + $listsnew[$k1]['wip_cog'];
}

$fwViewData['tot_wip_cog'] = number_format($tot_wip_cog, 2, '.', ',');

$fwViewData['list'] = $listsnew;
$fwViewData['title'] = "Net Position Report";

// NAFP

$sql10 = "Select sum(CAST(REPLACE(REPLACE(po_invoice_value, ',', ''), '$', '') AS decimal(15,2))) as inv_val  from poincc2 
          where po_invoice_stage = 1";
$datanew = $fwDb->queryOne($sql10);

$sqldp = "select * from design_profit where dp_id = 1";
$dpdata = $fwDb->queryOne($sqldp);
$fwViewData['dpdata'] = $dpdata;

$fwViewData['totval'] = number_format($datanew['inv_val'], 2, '.', ',');
$fwViewData['total_lia'] = $total_lia + $datanew['inv_val'];
$fwViewData['total_ass'] = $total_ass + $totbalance + $total + $tot_wip_cog + $dpdata['dp_profit'];


// Cash In Bank

$sqlcb = "select * from cash_in_bank";
$fwViewData['cashdata'] = $fwDb->query($sqlcb);




