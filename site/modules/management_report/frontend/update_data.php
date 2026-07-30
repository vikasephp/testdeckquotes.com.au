<?php

$cust_id_pm = $fwRequest->getParam('cust_id_pm', '');
$cust_id_pt = $fwRequest->getParam('cust_id_pt', '');
$cust_id_sr = $fwRequest->getParam('cust_id_sr', '');
$cust_id_si = $fwRequest->getParam('cust_id_si', '');
$cust_id_pprs = $fwRequest->getParam('cust_id_pprs', '');
$cust_id_archpp = $fwRequest->getParam('cust_id_archpp', '');
$cust_id_ready = $fwRequest->getParam('cust_id_ready', '');
$cust_id_readyfor = $fwRequest->getParam('cust_id_readyfor', '');
$cust_id_ppsigned = $fwRequest->getParam('cust_id_ppsigned', '');
$cust_id_el = $fwRequest->getParam('cust_id_el', '');
$cust_id_dl = $fwRequest->getParam('cust_id_dl', '');
$cust_id_ba_l = $fwRequest->getParam('cust_id_ba_l', '');
$cust_id_cac = $fwRequest->getParam('cust_id_cac', '');

$value = $fwRequest->getparam('value', '');

if(!empty($cust_id_pm))
{
	$sql = "Update bus_customers set bcust_mr_pl_manager  = '".$value."' where bcust_id = ".$cust_id_pm;	 
	$fwDb -> queryOne($sql);
}


if(!empty($cust_id_pt))
{
	$sql = "Update bus_customers set bcust_mr_pl_type  = '".$value."' where bcust_id = ".$cust_id_pt;	 
	$fwDb -> queryOne($sql);
}

if(!empty($cust_id_sr))
{
	$sql = "Update bus_customers set bcust_mr_surv_rev  = '".$value."' where bcust_id = ".$cust_id_sr;	 
	$fwDb -> queryOne($sql);
}


if(!empty($cust_id_si))
{
	$sql = "Update bus_customers set bcust_mr_surv_impl  = '".$value."' where bcust_id = ".$cust_id_si;	 
	$fwDb -> queryOne($sql);
}

if(!empty($cust_id_pprs))
{
	$sql = "Update bus_customers set bcust_mr_pp_req  = '".$value."' where bcust_id = ".$cust_id_pprs;	 
	$fwDb -> queryOne($sql);
}

if(!empty($cust_id_archpp))
{
	$sql = "Update bus_customers set bcust_mr_arch_pp  = '".$value."' where bcust_id = ".$cust_id_archpp;	 
	$fwDb -> queryOne($sql);
}

if(!empty($cust_id_ready))
{
	$sql = "Update bus_customers set bcust_mr_reday_nick  = '".$value."' where bcust_id = ".$cust_id_ready;	 
	$fwDb -> queryOne($sql);
}

if(!empty($cust_id_readyfor))
{
	$sql = "Update bus_customers set bcust_mr_pr_readyfor  = '".$value."' where bcust_id = ".$cust_id_readyfor;	 
	$fwDb -> queryOne($sql);
}

if(!empty($cust_id_ppsigned))
{
	$sql = "Update bus_customers set bcust_mr_ppsigned  = '".$value."' where bcust_id = ".$cust_id_ppsigned;	 
	$fwDb -> queryOne($sql);
}

if(!empty($cust_id_el))
{
	$sql = "Update bus_customers set bcust_mr_ent_lodg  = '".$value."' where bcust_id = ".$cust_id_el;	 
	$fwDb -> queryOne($sql);
}

if(!empty($cust_id_dl))
{
	$sql = "Update bus_customers set bcust_mr_da_lodged  = '".$value."' where bcust_id = ".$cust_id_dl;	 
	$fwDb -> queryOne($sql);
}

if(!empty($cust_id_ba_l))
{
	$sql = "Update bus_customers set bcust_mr_ba_lodged  = '".$value."' where bcust_id = ".$cust_id_ba_l;	 
	$fwDb -> queryOne($sql);
}

if(!empty($cust_id_cac))
{
	$sql = "Update bus_customers set bcust_mr_csbd_accu  = '".$value."' where bcust_id = ".$cust_id_cac;	 
	$fwDb -> queryOne($sql);
}

 exit;