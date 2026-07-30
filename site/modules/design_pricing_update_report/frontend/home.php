<?php

header("Expires: Tue, 01 Jan 2000 00:00:00 GMT");
header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache");
$tabledi = new Fw_Db_Table('design_interface');
clearstatcache();

$pagenum = $fwRequest->getparamget('pagenum',0);

$listdata = $fwRequest->getParam($TABLE, array());


$online = $fwRequest->getParam('online', '');
if($online)
{
	 $online = $fwRequest->getParam('online', '');
	 $keys_2 = array_keys($online);
	 $ky_2 = $keys_2[0];
	 $val_2 = $online[$ky_2];
	
	  $detail['di_online'] = $val_2;
	  $detail['di_online_date'] = date('d-m-Y');
	  $tabledi->setWhere("di_id = ".$ky_2);
	  if($tabledi->rowExists())
	  {
		 $this_id = $tabledi->updateRow($detail);
	  }	  	
}

$noprice = $fwRequest->getParam('noprice', '');
if($noprice)
{
	 $noprice = $fwRequest->getParam('noprice', '');
	 $keys_2 = array_keys($noprice);
	 $ky_2 = $keys_2[0];
	 $val_2 = $noprice[$ky_2];
	
	  $detail['di_no_price'] = $val_2;
	  $detail['di_no_price_user'] = $_SESSION['user']['user_name'];
	  $detail['di_no_price_date'] = date('d-m-Y');
	  $tabledi->setWhere("di_id = ".$ky_2);
	  if($tabledi->rowExists())
	  {
		 $this_id = $tabledi->updateRow($detail);
	  }	  	
}


$hide = $fwRequest->getParam('hide', '');
if($hide)
{
	 $online = $fwRequest->getParam('hide', '');
	 $keys_2 = array_keys($hide);
	 $ky_2 = $keys_2[0];
	 $val_2 = $hide[$ky_2];
	
	  $detail['di_pricing_hide'] = $val_2;
	  $tabledi->setWhere("di_id = ".$ky_2);
	  if($tabledi->rowExists())
	  {
		 $this_id = $tabledi->updateRow($detail);
	  }	  	
}

$keyword = $listdata['keyword'];
//$where = "WHERE 1=1 ";
$where = " where di_active = 'Yes' ";

//if(empty($keyword)) { unset($_SESSION['keyword']) ; }

$unhide = $fwRequest->getParam('unhide','');
if(!empty($unhide)) {
	$where = " where di_active = 'Yes' ";	
}

$clear = $fwRequest->getParam('clear','');
if(!empty($clear))
{
	unset($_SESSION['keyword']);
	unset($keyword);	
}


if($keyword):
	$where .= "AND ".$TABLE.".di_design_number  = ".$keyword;
	$_SESSION['keyword'] = $keyword;
	//$fwViewData['keyword']=$_SESSION['keyword'];
elseif($_SESSION['keyword']):
	$where .= "AND ".$TABLE.".di_design_number = ".$_SESSION['keyword'];
	//$fwViewData['keyword']=$_SESSION['keyword'];
endif;
	   
$matsql = "Select design_interface.*, design_interface_edropbox.didb_filepath from design_interface 
		   Left join design_interface_edropbox on design_interface.di_id = design_interface_edropbox.didb_di_id
		   AND  design_interface_edropbox.didb_foldername like '%Team%'
		   ".$where. " ORDER BY  design_interface.di_design_number  ASC";


if($matsql){$userData = $fwDb->query($matsql);}


if(!empty($userData))
{
if (!(isset($pagenum))){ $pagenum = 1; } 
    $rows = count($userData);
    $page_rows = 400;
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
  }
}


foreach($listsnew as $k => $v)
{

	
	
	$sql3 = "select design_interface_pricing.* from design_interface_pricing
	         where design_interface_pricing.di_id = " .$v['di_id']. " AND dip_component = 'Rounded Planning Price'";
	$data3 = $fwDb->queryOne($sql3);
	
	$sql4 = "select design_interface_pricing.* from design_interface_pricing
	         where design_interface_pricing.di_id = " .$v['di_id']. " AND dip_component = 'Rounded Build Cost with GP'";
	$data4 = $fwDb->queryOne($sql4);
	
	$sql5 = "select design_interface_pricing.* from design_interface_pricing
	         where design_interface_pricing.di_id = " .$v['di_id']. " AND dip_component = 'Rounded Siteworks Price'";
	$data5 = $fwDb->queryOne($sql5);
	
	$sql6 = "select design_interface_pricing.* from design_interface_pricing
	         where design_interface_pricing.di_id = " .$v['di_id']. " AND dip_component = 'Rounded Planning Price'";
	$data6 = $fwDb->queryOne($sql6);
	
	$sql1 = "select design_interface_pricing.* from design_interface_pricing
	         where design_interface_pricing.di_id = " .$v['di_id']. " AND dip_component = 'Rounded Total Price Total'";
	$data1 = $fwDb->queryOne($sql1);

	$listsnew[$k]['total_price'] = $data1['dip_value_entered'];
	$listsnew[$k]['last_priced'] =  changedate_d_m_Y($data1['dip_date']);
	
	$listsnew[$k]['planning_price'] = $data6['dip_value_entered'];
	$listsnew[$k]['planning_date'] = changedate_d_m_Y($data6['dip_date']);
	
	$listsnew[$k]['siteworks_price'] = $data5['dip_value_entered'];
	$listsnew[$k]['sitework_date'] = changedate_d_m_Y($data5['dip_date']);
	
	$listsnew[$k]['build_price'] = $data4['dip_value_entered'];
	$listsnew[$k]['build_price_date'] =  changedate_d_m_Y($data4['dip_date']);
	
	
		
}

$fwViewData['list'] = $listsnew;
$fwViewData['title'] = "Design Interface Pricing Report";
