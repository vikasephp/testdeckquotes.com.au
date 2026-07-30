<?php
$page_id = (int)$fwRequest->getparam('page_id', 0);

//$s = "$80,000 + SAV";
//$amt = preg_replace("/[^0-9]/","",$s);
//echo $amt;
//exit;

if ($page_id > 0)
{
	$tablePages = new Fw_Db_Table('pages');
	$tablePages->setWhere("page_id = $page_id");
	$fwViewData['detail'] = $tablePages->getRow();
    $show = $fwViewData['detail']['page_action_params'];
}

$submit  = $fwRequest->getParam('submit', '');
$pagenum = $fwRequest->getparam('pagenum','');
//$show = $fwRequest->getparam('show','');
if(empty($_POST['order']) && empty($_POST['abc']) && empty($pagenum))
	{
	unset($_SESSION['last_query']);
	}

if($_POST['order'])
{
$pr = $_POST['order'];
$fwViewData['last_order'] = $pr;
$_SESSION['ord'] = $pr; 
}else{

		if($_SESSION['ord'])
			{
			$pr = $_SESSION['ord'];
			$fwViewData['last_order'] = $pr;
			$_SESSION['ord'] = $pr; 
			}
			else
			{
			$pr = "ASC";
			$fwViewData['last_order'] = $pr;
			$_SESSION['ord'] = $pr; 
			}
}

if(!empty($submit))
{	
	$detail  = $fwRequest->getParam('search', '');
	$fwViewData['detail'] = $detail;
	
	//db($detail);
	//exit;
	
	if($detail['location'])
	{
		if($detail['location'][0] > 0)
		{
			$end = end($detail['location']);
	
			foreach($detail['location'] as $k => $v)
					{
						if($v != $end){ $lok .= "advertisement.adv_state = ".$v." OR ";}
						else{$lok .= "advertisement.adv_state = ".$v;}
					}
			$parameter_location = " AND ".$lok;
		}
	}


	if($detail['from_price'] > 0 || $detail['to_price'] > 0)
	{
	
		if(empty($detail['to_price']))
		{
			$detail['to_price'] = $detail['from_price'];
		}

	   $price_range = "AND digits(advertisement.adv_iaa) between ".$detail['from_price']." AND ".$detail['to_price']; 
	
		if($detail['no_price'] == 1)
		{
			$price_range .= " OR digits(advertisement.adv_iaa) = 0 ";
		}
	}

	if($detail['abc'])
	{
		if($detail['abc'][0] > 0)
		{
			$end = end($detail['abc']);
	
			foreach($detail['abc'] as $k => $v)
					{
						if($v != $end){ $abc .= "advertisement.adv_industry_code LIKE '%/".$v."/%' OR ";}
						else{$abc .= "advertisement.adv_industry_code LIKE '%/".$v."/%'";}
					}
			$category = " AND ".$abc;
		}
	}

	//if($detail['salemethod'])
//	{
//		if($detail['salemethod'][0] <> '0')
//		{
//			$end = end($detail['salemethod']);
//	
//			foreach($detail['salemethod'] as $k => $v)
//					{
//						if($v != $end){ $sale .= " advertisement.adv_sale_method = '".$v."' OR "; }
//						else{$sale .= " advertisement.adv_sale_method = '".$v."'";}
//					
//					}
//			$salemethod = " AND ".$sale;
//		}
//	}
	
	if($detail['salestatus'])
	{
		if($detail['salestatus'][0] <> '0')
		{
			$end = end($detail['salestatus']);
	
			foreach($detail['salestatus'] as $k => $v)
					{
						if($v != $end){ $status .= " advertisement.adv_sale_status = ".$v." OR "; }
						else{$status .= " advertisement.adv_sale_status = '".$v."'";}
					
					}
			$salestatus = " AND ".$status;
			
		}
	}
	
	$opt_quer = "WHERE 1 = 1 ".$parameter_location.$category.$salestatus.$price_range;
	
	$sql2 = "SELECT advertisement.*, states.*, industry.* FROM advertisement
	LEFT JOIN  states ON advertisement.adv_state = states.s_id
	LEFT JOIN industry ON advertisement.adv_industry = industry.ind_id ".$opt_quer. " AND advertisement.adv_status = 1";
	
	//db($sql2);
	//exit;
}

if(empty($sql2)){if($_SESSION['last_query']){$sql2= $_SESSION['last_query'];}}

$order = " ORDER BY advertisement.adv_ila ASC, advertisement.adv_ilamax ASC, advertisement.adv_ilmin ASC, advertisement.adv_iaa ASC, advertisement.adv_iaa_min ASC, advertisement.adv_iaa_max ASC";

if($sql2){

$order = " ORDER BY advertisement.adv_ila ".$pr.", advertisement.adv_ilamax ".$pr.", advertisement.adv_ilmin ".$pr.", advertisement.adv_iaa ".$pr.", advertisement.adv_iaa_min ".$pr.", advertisement.adv_iaa_max ".$pr." ";
}
	$sql2 = "SELECT advertisement.*, states.*, industry.* FROM advertisement
	LEFT JOIN  states ON advertisement.adv_state = states.s_id
	LEFT JOIN industry ON advertisement.adv_industry = industry.ind_id ".$opt_quer . " AND advertisement.adv_status = 1";
	
$sql = $sql2.$order;

if($sql)
{
$userData = $fwDb->query($sql);

if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);

    $page_rows = 50;
	
    $last = ceil($rows/$page_rows); 
	 
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
	
    $max = 'LIMIT ' .($pagenum - 1) * $page_rows .',' .$page_rows;
   
   	$sqlUsers = $sql." ".$pricesort_ord." ".$max; 

    $newdata = $fwDb->query($sqlUsers);

	foreach($newdata as $k => $v)
			{
			
			$ind_codes = substr($v['adv_industry_code'], 1, -1);
			$ind_code_comma = str_replace("/", ", ", $ind_codes);
			
			if($ind_code_comma)
			{
			$ind_sql = "SELECT bi_id, bi_title FROM business_interest WHERE bi_id IN (".$ind_code_comma.")";
			$data =$fwDb->query($ind_sql);
			$endarr = end($data);
			$ind_codess=" ";
					if($endarr){foreach($data as $k1 => $v1){if($v1 != $endarr){$ind_codess .=$v1['bi_title']." - ";}else{$ind_codess .=$v1['bi_title'];}}
					$v['ind_codes_name'] = $ind_codess;}
			}			
				$sql_image = "SELECT * FROM adv_images WHERE adv_id = ".$v['adv_id'];		
				$imagedata = $fwDb->queryOne($sql_image);	
				if($imagedata){$v['list_image'] = $imagedata['adv_image_name'];}
		
			$data_result[] = $v;
			}
$fwViewData['list'] = $data_result;

}
$_SESSION['last_query'] = $sql2;
$fwViewData['title'] = 'Search Results';

$sqlState = "Select * from states where s_type =  'state'";
$fwViewData['states'] =  $fwDb->query($sqlState);

$sqlInterest = "Select * from business_interest";
$fwViewData['interest'] =  $fwDb->query($sqlInterest);