<?php
$fwMainView = 'file:' . getcwd() . '/cust_list.tpl';
$cust_name = trim($fwRequest->getparamget('cust_name', ''));
if($cust_name){
$keydata = explode(" ", $cust_name);
if($keydata)
{
foreach($keydata as $k => $v)
		{
			if(!empty($v)){
			$where.= "bus_customers.bcust_fname LIKE '".search_query(trim($v))."%' OR bus_customers.bcust_lname LIKE '".search_query(trim($v))."' OR ";
			}
		}
	if($where){$setwhere = "WHERE ".substr($where, 0, -4);}	
$sql="SELECT bus_customers.bcust_id, bus_customers.bcust_fname, bus_customers.bcust_lname FROM bus_customers ".$setwhere;

if($sql)
{
$userData= $fwDb->query($sql);
foreach($userData as $k => $v)
		{
		$data = clean_query_for_show($v);	
			$data2[] = $data;
		}
			$fwViewData['detail'] = $data2;
		}
}
}