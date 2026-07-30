<?php
$pagenum = $fwRequest->getparam('pagenum','');
$tablePages = new Fw_Db_Table($TABLE);
$export = $fwRequest->getParam('export', 0);
$submit = $fwRequest->getParam('buttonname', '');

if($submit)
	{
	$detail = $fwRequest->getParam($TABLE, '');
	$search = trim($detail['search']);
	if($search){$filter['bm_description'] = " bm_description LIKE '".$search."%' ";}
	if($detail['onweb']){$filter['bm_onweb'] = " bm_onweb = 1"; }
	if($detail['bm_like_new_business']){$filter['bm_like_new_business'] = " bm_like_new_business = '".$detail['bm_like_new_business']."'";}
	if($detail['bm_owned_business_before']){$filter['bm_owned_business_before'] = " bm_owned_business_before = 1";}else{$filter['bm_owned_business_before'] = " bm_owned_business_before = 0";}
	if($detail['bm_franchise_business']){$filter['bm_franchise_business'] = " bm_franchise_business = ".$detail['bm_franchise_business'];}
	if($detail['bm_do_you_need_help']){$filter['bm_do_you_need_help'] = " bm_do_you_need_help = ".$detail['bm_do_you_need_help'];}
	
	if($detail['bm_like_new_business_date']){
		$date = changedate_y_m_d($detail['bm_like_new_business_date']);
		$filter['bm_like_new_business_date'] = " bm_like_new_business_date = '".$date."'";}
	
	if($detail['abc'])
		{
		foreach($detail['abc'] as $k => $v){$sectors .= " bm_interest LIKE '%/".$v."/%' OR";}
		$sectors = rtrim($sectors, "OR");			
		$filter['bm_interest']	= 	"(".$sectors.")";
		$fwViewData['ind_codes'] = $detail['abc'];
		
		}
	if($detail['bm_price_range'])
		{
		foreach($detail['bm_price_range'] as $k => $v){$bm_price_range .= " bm_price_range LIKE '%/".$v."/%' OR";}
		$bm_price_range = rtrim($bm_price_range, "OR");			
		$filter['bm_price_range']	= 	"(".$bm_price_range.")";	
		$fwViewData['price_range'] = $detail['bm_price_range'];
		
		
		}
	if($detail['states'])
		{
		foreach($detail['states'] as $k => $v){$states .= " bm_states LIKE '%/".$v."/%' OR";}
		$states = rtrim($states, "OR");			
		$filter['bm_states']= "(".$states.")";	
		$fwViewData['states_codes'] = $detail['states'];
			
		}
	if($filter){foreach($filter as $k => $v){$where .= $v." AND";}if($where){$where = "WHERE ".$where;} $where = rtrim($where, "AND");	}
	
	if($where){ $sql = "SELECT * FROM byer_matches ".$where;}
	$fwViewData['detail'] = $detail;

unset($_SESSION['last_sql']);
	}
	

if(empty($pagenum)){unset($_SESSION['last_sql']);}


if($_SESSION['last_sql'])	
	{$sql = $_SESSION['last_sql'];
	}


if($sql){ $userData = $fwDb->query($sql);}	

if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
    $page_rows = 10;
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



if($sql2){ $newdata = $fwDb->query($sql2);}



										foreach($newdata as $key => $value) 
													{
											$inrest_ids = explode("/", $value['bm_interest']);
											$state_ids	= explode("/", $value['bm_states']);
											$price_range = explode("/", $value['bm_price_range']);	
											
											
											$intt = "";
											foreach($inrest_ids as $k => $v)
													{
													if($v){$intt .= $v.", ";}
													}
											$ints = substr($intt, 0, -2);		
											if($ints)
													{
													$ints_sql = "SELECT bi_id, bi_title FROM business_interest WHERE bi_id IN ($ints)";
													$intrData =$fwDb->query($ints_sql); 
													$intr_code="";												
														foreach($intrData as $key => $val)
														{
														$intr_code .= $val['bi_title']."<br>";
														}
													$value['intrest_code'] = $intr_code;				
													}

											$in = "";
											foreach($state_ids as $k => $v)
													{
													if($v){$in .= $v.", ";}
													}
											$ins = substr($in, 0, -2);		
											if($ins)
													{
								$ins_sql = "SELECT s_id, s_name, s_shortcodes, s_type, s_parent_state FROM states WHERE s_id IN ($ins)";
													$staesData =$fwDb->query($ins_sql);
													$states_code=""; 												
														foreach($staesData as $key => $val)
														{
														$states_code .= $val['s_shortcodes']."<br>";
														}
													$value['states_code'] = $states_code;				
													}
													
													if($price_range)
														{
															foreach($price_range as $k => $v)
																	{
																	if($v){
																	
																	list($min, $max) = explode("-",$v);
																
																		$price_ranges .= "<br>$".number_format($min)." - $". number_format($max);	
																	}
																	}
														$value['price_ranges'] = $price_ranges;
														unset($price_ranges);			
														}			
													
													
								
										$new2data[] = $value;
									}	

$fwViewData['list']=$new2data;
}
if($submit && count($fwViewData['list']) == 0)
	{$fwViewData['listcount'] = 1;}

//DB($fwViewData['list']);



$_SESSION['last_sql'] = $sql;
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = $MODULE_SINGULAR;

/********** Begin business_interest **********/
	$business_interest_Table = new Fw_Db_Table('business_interest');
	$business_interest_Table->setWhere("bi_parent = 0");
	$interest = $business_interest_Table->getAllRows();
	$fwViewData['interest'] =  $interest;
	
	$business_interest_Table->setWhere("bi_parent != 0");
	$business_interest_Table->setOrderBy('bi_title'.' ASC');
	$sub_interest = $business_interest_Table->getAllRows();
	$fwViewData['sub_interest'] =  $sub_interest;
/********** End business_interest **********/

/********** Begin States **********/
	$states_table = new Fw_Db_Table('states');
	$states_table -> setWhere("s_type = 'state'");
	$main_states = $states_table -> getRows();
	$fwViewData['main_states'] = $main_states;
/********** End States **********/	