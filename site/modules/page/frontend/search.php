<?php
$page_id = (int)$fwRequest->getparam('page_id', 0);

/*************** Location *************/
$thisTablelocation = new Fw_Db_Table('location');
$fwViewData['location'] = $thisTablelocation->getAllRows();

/********** Interest and SubInterest *************/
$business_interest_Table = new Fw_Db_Table('business_interest');
$business_interest_Table->setWhere("bi_parent = 0");
$interest = $business_interest_Table->getAllRows();
$fwViewData['interest'] = $interest;

$business_interest_Table->setWhere("bi_parent != 0");
$business_interest_Table->setOrderBy("bi_title ASC");
$sub_interest = $business_interest_Table->getAllRows();
$fwViewData['sub_interest'] = $sub_interest;

/*****************/



if ($page_id > 0)
{
	$tablePages = new Fw_Db_Table('pages');
	$tablePages->setWhere("page_id = $page_id");
	$fwViewData['detail'] = $tablePages->getRow();
    $show = $fwViewData['detail']['page_action_params'];

}
$submit = $fwRequest->getParam('submit', '');
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
{	$detail = $_POST;

if($detail['location'] > 0)
{
$parameter_location = " advertisement.adv_location = ".$detail['location']." ";
}


if($detail['abc'])
{
$end = end($detail['abc']);


foreach($detail['abc'] as $k => $v)
		{
			if($v != $end){ $abc .= "advertisement.adv_industry_code LIKE '%/".$v."/%' OR ";}
			else{$abc .= "advertisement.adv_industry_code LIKE '%/".$v."/%'";}
		
		}
$category = " AND ".$abc;
}

if($detail['from_price'] > 0 || $detail['to_price'] > 0)
	{
		$price_range = "AND (advertisement.adv_ila between ".$detail['from_price']." AND ".$detail['to_price']. " OR advertisement.adv_ilamax between ".$detail['from_price']." AND ".$detail['to_price']." OR advertisement.adv_ilmin  between ".$detail['from_price']." AND ".$detail['to_price'].")"; 

if($detail['from_price'] == 1)
	{
	$addi = " OR (advertisement.adv_ila = 0 AND advertisement.adv_ilamax = 0 AND advertisement.adv_ilmin = 0 ".$category.")";
	$price_range = $price_range.$addi;
	}
	
}

$opt_quer = "WHERE".$parameter_location.$category.$price_range;
$sql2 = "SELECT advertisement.*, states.*, industry.* FROM advertisement
	LEFT JOIN  states ON advertisement.adv_state = states.s_id
	LEFT JOIN industry ON advertisement.adv_industry = industry.ind_id ".$opt_quer;

}

if(empty($sql2)){if($_SESSION['last_query']){$sql2= $_SESSION['last_query'];}}

if($sql2){
$order = " ORDER BY advertisement.adv_ila ".$pr.", advertisement.adv_ilamax ".$pr.", advertisement.adv_ilmin ".$pr.", advertisement.adv_iaa ".$pr.", advertisement.adv_iaa_min ".$pr.", advertisement.adv_iaa_max ".$pr." ";
}

if($show)
	{
	$sql2 = "SELECT advertisement.*, states.*, industry.* FROM advertisement
	LEFT JOIN  states ON advertisement.adv_state = states.s_id
	LEFT JOIN industry ON advertisement.adv_industry = industry.ind_id ".$opt_quer;
	}
$sql = $sql2.$order;
if($sql)
{
$userData = $fwDb->query($sql);
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);

    $page_rows = 10;
	
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