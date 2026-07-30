<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$table = new Fw_Db_Table('quote_tracking_report_po');
$tableColumn = new Fw_Db_Table('quote_tracking_columns');
$fwViewData['title'] = "Quote Tracking Report";
//$where = " where 1 = 1";

$purchase_order = $fwRequest->getParam('purchase_order', '');
if(!empty($purchase_order)) {
	$fwViewData['show'] = 1;
}

//$where = " WHERE business_sellers.bs_cpr_hide = 0 ";

$where = " WHERE 1 = 1 ";

//$sql = "SELECT business.bsn_id, business.bsn_name, business.bsn_starting_onsite_date from business_sellers 
//	    Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
//	    Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where . "group by business_sellers.bs_business_id " .$ord;

//$sql = "SELECT   business.bsn_id, business.bsn_name, business.bsn_starting_onsite_date from business_sellers 		
//	    Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
//	    Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where. " 
//	    And  ( business.bsn_status like '%|2|%' Or business.bsn_status like '%|5|%' Or business.bsn_status like '%|6|%' 
//	    Or business.bsn_addto_cpr = 1 Or business.bsn_showin_cpr = 1 ) 
//	    Group By business.bsn_id " .$ord ;
		
$sql = "select qt_bsn_id, qt_project_address from quote_tracking_report";		

$busdata = $fwDb->query($sql);

 $sqlcol = "select qc_column, qc_drop_value from quote_tracking_columns ";
 $datacol2 = $fwDb->query($sqlcol);
 

foreach($busdata as $k=>$v)
{
	$data['qt_bsn_id'] = $v['qt_bsn_id'];
	$data['qt_project_address'] = $v['qt_project_address'];
	$table->setWhere("qt_bsn_id = ".$v['qt_bsn_id']);
	if(!$table->rowExists()){
			$table->insertRow($data);	
	 }
}


$clear = $fwRequest->getParam('clear', '');

if(!empty($clear)) {
	unset($_SESSION['keyword']);
	unset($keyword);
	$fwViewData['keyword']='';	
}
	
if($keyword):
$where .= " AND  quote_tracking_report.qt_project_address LIKE '%".$keyword."%'";
            	
	    $_SESSION['keyword'] = $keyword;
	    $fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword']):

$where .= " AND quote_tracking_report.qt_project_address LIKE '%".$_SESSION['keyword']."%' ";	
	
	    $fwViewData['keyword']=$_SESSION['keyword'];
endif;
 

if(empty($pagenum))
	{
	unset($_SESSION['last_tdsql']);
	}
		

//$sql = "SELECT quote_tracking_report_po.*  from business_sellers 
//	    Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
//	    Inner Join quote_tracking_report_po ON business_sellers.bs_business_id = quote_tracking_report_po.qt_bsn_id  
//		where business_sellers.bs_cpr_hide = 0 group by business_sellers.bs_business_id ";
		

$sql = "SELECT quote_tracking_report_po.*  from business_sellers 
	    Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	    Inner Join quote_tracking_report_po ON business_sellers.bs_business_id = quote_tracking_report_po.qt_bsn_id  
		where business_sellers.bs_qtr_remove = 0 group by business_sellers.bs_business_id ";
		
$userData = $fwDb->query($sql);

if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
    $page_rows = 300;
    $last = ceil($rows/$page_rows); 

    if ($pagenum <= 1)
    {
        $pagenum = 1;
    }
    elseif ($pagenum > $last)
    {
        $pagenum = $last;
    }
	$numstartvounter =  $page_rows * ($pagenum-1) + 1;
	$fwViewData['numstartvounter'] = $numstartvounter;
		
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
  
 $setdata = $fwDb->query($sql2);
 $fwViewData['list'] =  $setdata;
 }
 
 
if(!empty($setdata)) { 
	foreach($setdata as $k => $v)
	{
			$sqla = "Select bsn_id, bsn_type, bsn_starting_onsite_date from business where bsn_name  = '". $v['qt_project_address']."'" ;
			$data = $fwDb->queryOne($sqla);
			
			$sqlb = "select pt_name from project_type where pt_id = ".$data['bsn_type'];
			$data_2 = $fwDb->queryOne($sqlb);
		
			$setdata[$k]['bsn_id']  = $data['bsn_id'];
			$setdata[$k]['bsn_starting_onsite_date']  = $data['bsn_starting_onsite_date'];
			$setdata[$k]['pt_name'] = $data_2['pt_name'];
				
			$setdata[$k]['col_1'] = color_set($v['qt_wall_roof']);
			$setdata[$k]['col_2'] = color_set($v['qt_ff_floor_frame']);
			$setdata[$k]['col_3'] = color_set($v['qt_gf_floor_frame']);
			$setdata[$k]['col_4'] = color_set($v['qt_window_door']);
			$setdata[$k]['col_5'] = color_set($v['qt_water_gas']);
			$setdata[$k]['col_6'] = color_set($v['qt_ele_upgrade']);
			$setdata[$k]['col_7'] = color_set($v['qt_eng_design']);
			$setdata[$k]['col_8'] = color_set($v['qt_ext_colour']);
			$setdata[$k]['col_88'] = color_set($v['qt_entry_doors']);
			
			$setdata[$k]['col_9'] = color_set($v['qt_skylight']);
			$setdata[$k]['col_10'] = color_set($v['qt_close_up']);
			$setdata[$k]['col_11'] = color_set($v['qt_ret_wall']);
			$setdata[$k]['col_12'] = color_set($v['qt_steel_roof']);
			
			$setdata[$k]['col_13'] = color_set($v['qt_roof_tiles']);
			
			$setdata[$k]['col_14'] = color_set($v['qt_cop_domes']);
			$setdata[$k]['col_15'] = color_set($v['qt_foot_steel']);
			$setdata[$k]['col_16'] = color_set($v['qt_slab_steel']);
			
			$setdata[$k]['col_17'] = color_set($v['qt_cons_package']);
			$setdata[$k]['col_18'] = color_set($v['qt_job_comp']);
			$setdata[$k]['col_19'] = color_set($v['qt_glass_spl']);
			
			$setdata[$k]['col_20'] = color_set($v['qt_bb_access']);
			$setdata[$k]['col_21'] = color_set($v['qt_base_bricks']);
			$setdata[$k]['col_22'] = color_set($v['qt_top_bri_acc']);
			
			$setdata[$k]['col_23'] = color_set($v['qt_top_brick']);
			$setdata[$k]['col_24'] = color_set($v['qt_int_stair']);
			$setdata[$k]['col_25'] = color_set($v['qt_sho_scrren']);
			
			$setdata[$k]['col_26'] = color_set($v['qt_light_ele']);
			$setdata[$k]['col_27'] = color_set($v['qt_deck']);
			$setdata[$k]['col_28'] = color_set($v['qt_deck_hand']);
			
			$setdata[$k]['col_29'] = color_set($v['qt_pergola']);
			$setdata[$k]['col_30'] = color_set($v['qt_carport']);
			$setdata[$k]['col_31'] = color_set($v['qt_scaffolding']);
			
			$setdata[$k]['col_32'] = color_set($v['qt_wind_flash']);
			$setdata[$k]['col_33'] = color_set($v['qt_inc_rou_quote']);
			$setdata[$k]['col_34'] = color_set($v['qt_inc_join_quote']);
			
			$setdata[$k]['col_35'] = color_set($v['qt_incl_fit_quote']);
			$setdata[$k]['col_36'] = color_set($v['qt_un_order_1']);
			$setdata[$k]['col_37'] = color_set($v['qt_un_order_2']);
			
			$setdata[$k]['col_38'] = color_set($v['qt_heat_cool']);
			$setdata[$k]['col_39'] = color_set($v['qt_garage_door']);
			$setdata[$k]['col_40'] = color_set($v['qt_water_tank']);
			
			$setdata[$k]['col_41'] = color_set($v['qt_wall_fl_tiles']);
			$setdata[$k]['col_42'] = color_set($v['qt_wind_cove']);
			$setdata[$k]['col_43'] = color_set($v['qt_floor_cov']);
			
			$setdata[$k]['col_44'] = color_set($v['qt_mirror']);
			$setdata[$k]['col_45'] = color_set($v['qt_pric_calc']);
			$setdata[$k]['col_46'] = color_set($v['qt_brick_sand']);
			
			$setdata[$k]['col_47'] = color_set($v['qt_stru_steel']);
			$setdata[$k]['col_48'] = color_set($v['qt_insulation']);
			$setdata[$k]['col_49'] = color_set($v['qt_fit_out']);
			
			$setdata[$k]['col_50'] = color_set($v['qt_fit_off']);
			$setdata[$k]['col_51'] = color_set($v['qt_asb_removal']);
			$setdata[$k]['col_52'] = color_set($v['qt_scaffold']);
			$setdata[$k]['col_53'] = color_set($v['qt_hot_water']);
			
	}		
}

function color_set($k) {
	
		$fwDb = new Fw_Db();
		$sqlcc = "select qs_color from quote_tracking_status_po where qs_name = '".$k."'" ;
		$datacc = $fwDb->queryOne($sqlcc);
        return($datacc['qs_color']);					
}

   foreach ($setdata as $key => $row) {
	   			$desig[$key] = strtotime($row['bsn_starting_onsite_date']);
				}
				
	array_multisort($desig, SORT_ASC, $setdata);			

 	$fwViewData['list'] =  $setdata;
			
$tablest = new Fw_Db_Table('quote_tracking_status_po');
$fwViewData['pustdetail'] = $tablest->getRows();