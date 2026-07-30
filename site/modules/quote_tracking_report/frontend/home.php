<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$table = new Fw_Db_Table('quote_tracking_report');
$tableColumn = new Fw_Db_Table('quote_tracking_columns');
$fwViewData['title'] = "Quote Tracking Report";

$res_staff = $fwRequest->getParam('res_staff', '');

$purchase_order = $fwRequest->getParam('purchase_order', '');
if(!empty($purchase_order)) {
	$fwViewData['show'] = 1;
}


$ord =  "ORDER BY if(  business.bsn_starting_onsite_date = ' '
OR business.bsn_starting_onsite_date IS NULL , 1, 0 ) , STR_TO_DATE( business.bsn_starting_onsite_date, '%d-%m-%Y' ) ";

$sql = "SELECT   business.bsn_id, business.bsn_name, business.bsn_starting_onsite_date from business_sellers 		
	    Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	    Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where. " 
	    And  ( business.bsn_status like '%|2|%' Or business.bsn_status like '%|5|%' Or business.bsn_status like '%|6|%' Or
		business.bsn_status like '%|3|%' Or business.bsn_addto_cpr = 1 Or business.bsn_showin_cpr = 1 ) 
	    Group By business.bsn_id " .$ord ;


$busdata = $fwDb->query($sql);

 $sqlcol = "select qc_column, qc_drop_value, qc_res_staff  from quote_tracking_columns ";
 $datacol2 = $fwDb->query($sqlcol);
 


foreach($busdata as $k=>$v)
{
	$data['qt_bsn_id'] = $v['bsn_id'];
	$data['qt_project_address'] = $v['bsn_name'];
	$table->setWhere("qt_bsn_id = ".$v['bsn_id']);
	if(!$table->rowExists()){
			$table->insertRow($data);	
	 }
}



$sqlA  = "Select qt_bsn_id, qt_project_address from quote_tracking_report";
$dataA = $fwDb->query($sqlA);

foreach($dataA as $kA=>$vA)
{
	
	$sqlB = "Select  bsn_starting_onsite_date from business where bsn_id  = ".$vA['qt_bsn_id'];
	$dataB = $fwDb->queryOne($sqlB);
	
	
	foreach($datacol2 as $k1=>$v1)
	{
	 	  
			$d1 =  date('d-m-Y', strtotime($dataB['bsn_starting_onsite_date']. $v1['qc_drop_value'] .' days'));
			$sqlu = "update quote_tracking_report set ".$v1['qc_column']. " = '".$d1."' where qt_bsn_id  = ".$vA['qt_bsn_id'];
		
			$fwDb -> queryOne($sqlu);	
	}
	 
}

//---------

$clear = $fwRequest->getParam('clear', '');

if(!empty($clear)) {
	unset($_SESSION['keyword']);
	unset($keyword);
	$fwViewData['keyword']='';	
	unset($_SESSION['res_staff']);
}
	
if($keyword):
$where = " AND  quote_tracking_report.qt_project_address LIKE '%".$keyword."%'";
            	
	    $_SESSION['keyword'] = $keyword;
	    $fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword']):

$where = " AND quote_tracking_report.qt_project_address LIKE '%".$_SESSION['keyword']."%' ";	
	
	    $fwViewData['keyword']=$_SESSION['keyword'];
endif;
 
 
// if($res_staff):
//$where = " AND  quote_tracking_report.qt_responsible_staff LIKE '%".$res_staff."%'";
//            	
//	    $_SESSION['keyword'] = $res_staff;
//	    $fwViewData['keyword']=$_SESSION['res_staff'];
//
//elseif($_SESSION['keyword']):
//
//$where = " AND quote_tracking_report.qt_responsible_staff LIKE '%".$_SESSION['res_staff']."%' ";	
//	
//	    $fwViewData['keyword']=$_SESSION['res_staff'];
//endif;
// 
 
 $submit1 = $fwRequest->getParam('columns', '');
 if(!empty($submit1))
 {
	 $submit1 = $fwRequest->getParam('columns', '');
	 $key = key($submit1);
	 $value = $submit1[$key];
	
	 $sql1 = "select qt_id , qt_project_address  from quote_tracking_report ";
	 $pdata = $fwDb->query($sql1);
	 
	 foreach($pdata as $k=>$v) {
		 $sqla = "Select   bsn_starting_onsite_date from business where bsn_name  = '". $v['qt_project_address']."'" ;
		 $data = $fwDb->queryOne($sqla);
		 $d1 =  date('d-m-Y', strtotime($data['bsn_starting_onsite_date']. $value .' days'));
		 $detail[$key] = $d1;
		 $table->setWhere("qt_id = ".$v['qt_id']);
		 $opr = $table->updateRow($detail); 
	 }
	 
	 
	 $detailcol['qc_drop_value'] = $value;
	 $detailcol['qc_column'] = $key;
	 $tableColumn->setWhere("qc_column = '".$key."'");
	 if(!$tableColumn->rowExists()){
		 $opr = $tableColumn->insertRow($detailcol);
	 } else {
		  $opr = $tableColumn->updateRow($detailcol);
	 }
 }
	 
  
if(empty($pagenum))
	{
	unset($_SESSION['last_tdsql']);
	}
		

$sql = " SELECT quote_tracking_report.* , business_sellers.bs_business_id from business_sellers 
	    Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	    Inner Join quote_tracking_report ON business_sellers.bs_business_id = quote_tracking_report.qt_bsn_id  
		where business_sellers.bs_qtr_remove = 0 ".$where;


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
				
			$setdata[$k]['col_1'] = color_set($v['qt_id'], 'Wall & Roof Frames', $v['qt_wall_roof']);
			$setdata[$k]['col_2'] = color_set($v['qt_id'], 'First-floor Floor Frame', $v['qt_ff_floor_frame']);
			$setdata[$k]['col_3'] = color_set($v['qt_id'], 'Ground-floor Floor Frame', $v['qt_gf_floor_frame']);
			$setdata[$k]['col_4'] = color_set($v['qt_id'], 'Windows & Doors',  $v['qt_window_door']);
			$setdata[$k]['col_5'] = color_set($v['qt_id'], 'Water and Gas Upgrades', $v['qt_water_gas']);
			$setdata[$k]['col_6'] = color_set($v['qt_id'], 'Electrical Upgrades', $v['qt_ele_upgrade']);
			$setdata[$k]['col_7'] = color_set($v['qt_id'], "Engineer's Design", $v['qt_eng_design']);
			$setdata[$k]['col_8'] = color_set($v['qt_id'], "Exterior Colours and Materials", $v['qt_ext_colour']);
			
			$setdata[$k]['col_88'] = color_set($v['qt_id'], "Entry Doors", $v['qt_entry_doors']);
			
			$setdata[$k]['col_9'] = color_set($v['qt_id'], "Skylights", $v['qt_skylight']);
			$setdata[$k]['col_10'] = color_set($v['qt_id'], "Close Up", $v['qt_close_up']);
			$setdata[$k]['col_11'] = color_set($v['qt_id'], "Retaining Wall", $v['qt_ret_wall']);
			$setdata[$k]['col_12'] = color_set($v['qt_id'], "Steel Roof", $v['qt_steel_roof']);
			
			$setdata[$k]['col_13'] = color_set($v['qt_id'], "Roof Tiles", $v['qt_roof_tiles']);
			
			$setdata[$k]['col_14'] = color_set($v['qt_id'], "Cupolex Domes", $v['qt_cop_domes']);
			$setdata[$k]['col_15'] = color_set($v['qt_id'], "Footings Steel", $v['qt_foot_steel']);
			$setdata[$k]['col_16'] = color_set($v['qt_id'], "Slab Steel", $v['qt_slab_steel']);
			
			$setdata[$k]['col_17'] = color_set($v['qt_id'], "Construction Package", $v['qt_cons_package']);
			$setdata[$k]['col_18'] = color_set($v['qt_id'], "Job Component", $v['qt_job_comp']);
			$setdata[$k]['col_19'] = color_set($v['qt_id'], "Glass Splashback", $v['qt_glass_spl']);
			
			$setdata[$k]['col_20'] = color_set($v['qt_id'], "Base Brick Accessories", $v['qt_bb_access']);
			$setdata[$k]['col_21'] = color_set($v['qt_id'], "Base Bricks", $v['qt_base_bricks']);
			$setdata[$k]['col_22'] = color_set($v['qt_id'], "Top Brick Accessories", $v['qt_top_bri_acc']);
			
			$setdata[$k]['col_23'] = color_set($v['qt_id'], "Top Bricks", $v['qt_top_brick']);
			$setdata[$k]['col_24'] = color_set($v['qt_id'], "Interior Stairs", $v['qt_int_stair']);
			$setdata[$k]['col_25'] = color_set($v['qt_id'], "Shower Screen", $v['qt_sho_scrren']);
			
			$setdata[$k]['col_26'] = color_set($v['qt_id'], "Lighting & Electrical", $v['qt_light_ele']);
			$setdata[$k]['col_27'] = color_set($v['qt_id'], "Deck", $v['qt_deck']);
			$setdata[$k]['col_28'] = color_set($v['qt_id'], "Deck Handrail", $v['qt_deck_hand']);
			
			$setdata[$k]['col_29'] = color_set($v['qt_id'], "Pergola", $v['qt_pergola']);
			$setdata[$k]['col_30'] = color_set($v['qt_id'], "Carport", $v['qt_carport']);
			$setdata[$k]['col_31'] = color_set($v['qt_id'], "Scaffolding", $v['qt_scaffolding']);
			
			$setdata[$k]['col_32'] = color_set($v['qt_id'], "Windows Flashing", $v['qt_wind_flash']);
			$setdata[$k]['col_33'] = color_set($v['qt_id'], "Inclusions Rough-in Quote", $v['qt_inc_rou_quote']);
			$setdata[$k]['col_34'] = color_set($v['qt_id'], "Inclusions Joinery Quote", $v['qt_inc_join_quote']);
			
			$setdata[$k]['col_35'] = color_set($v['qt_id'], "Inclusions Fit-Off Quote", $v['qt_incl_fit_quote']);
			$setdata[$k]['col_36'] = color_set($v['qt_id'], "Unique Order 1", $v['qt_un_order_1']);
			$setdata[$k]['col_37'] = color_set($v['qt_id'], "Unique Order 2", $v['qt_un_order_2']);
			
			$setdata[$k]['col_38'] = color_set($v['qt_id'], "Heating and Cooling", $v['qt_heat_cool']);
			$setdata[$k]['col_39'] = color_set($v['qt_id'], "Garage Door", $v['qt_garage_door']);
			$setdata[$k]['col_40'] = color_set($v['qt_id'], "Water Tank", $v['qt_water_tank']);
			
			$setdata[$k]['col_41'] = color_set($v['qt_id'], "Wall and Floor Tiles", $v['qt_wall_fl_tiles']);
			$setdata[$k]['col_42'] = color_set($v['qt_id'], "Window Coverings", $v['qt_wind_cove']);
			$setdata[$k]['col_43'] = color_set($v['qt_id'], "Floor Coverings", $v['qt_floor_cov']);
			
			$setdata[$k]['col_44'] = color_set($v['qt_id'], "Mirror", $v['qt_mirror']);
			$setdata[$k]['col_45'] = color_set($v['qt_id'], "Pricelist Calculator", $v['qt_pric_calc']);
			$setdata[$k]['col_46'] = color_set($v['qt_id'], "Brick Sand", $v['qt_brick_sand']);
			
			$setdata[$k]['col_47'] = color_set($v['qt_id'], "Structural Steel", $v['qt_stru_steel']);
			$setdata[$k]['col_48'] = color_set($v['qt_id'], "Insulation", $v['qt_insulation']);
			$setdata[$k]['col_49'] = color_set($v['qt_id'], "Fix-Out", $v['qt_fit_out']);
			
			$setdata[$k]['col_50'] = color_set($v['qt_id'], "Fit-Off", $v['qt_fit_off']);
			$setdata[$k]['col_51'] = color_set($v['qt_id'], "Asbestos Removal", $v['qt_asb_removal']);
			$setdata[$k]['col_52'] = color_set($v['qt_id'], "Scaffold", $v['qt_scaffold']);
			$setdata[$k]['col_53'] = color_set($v['qt_id'], "Hot Water STC Rebate", $v['qt_hot_water']);
			
	}		
}

function color_set($qt_id,$comp, $k) {
	
		$fwDb = new Fw_Db();
		$sqlcc = "select qp_status from quote_tracking_date_popup where qp_qt_id = ".$qt_id. " and qp_component = '".$comp."'" ;
		$datacc = $fwDb->queryOne($sqlcc);

		
		$curdate_y_m_d = date('d-m-Y');
		$dayscount = daysDifference($curdate_y_m_d, $k);
	   
		
		if(empty($datacc['qp_status']))
		{
		   if($dayscount>0) {
			  
		   	  return('#f70000');
		   }
		   elseif($dayscount >= -14)
		   {
			  return('#9c1ee9');
		   }
		
		} else {
			$col = "select qs_color from quote_tracking_status where qs_name= '".$datacc['qp_status']."'";
			$colab = $fwDb->queryOne($col);
			return($colab['qs_color']);
		}
					
}
 
 //STR_TO_DATE( business.bsn_starting_onsite_date, '%d-%m-%Y' )
 
 
        foreach ($setdata as $key => $row) {
	   			$desig[$key] = strtotime($row['bsn_starting_onsite_date']);
			 //$desig[$key]  = $row['bsn_starting_onsite_date'];
			
		   }
			
	array_multisort($desig, SORT_ASC, $setdata);

 	$fwViewData['list'] =  $setdata;
		
	$sqlcol = "show columns from quote_tracking_report ";
	$datacol = $fwDb->query($sqlcol);
	
	$i=1;
	foreach($datacol as $k1=>$v1)
	{
			
		$sqlcol = "select * from quote_tracking_columns where qc_column = '".$v1['Field']."'";
		$data = $fwDb->queryOne($sqlcol);
		
		$datacol[$k1]['drop_value'] = $data['qc_drop_value'];
		$datacol[$k1]['text_value'] = $data['qc_text_value'];
		$datacol[$k1]['qc_res_staff'] = $data['qc_res_staff'];
	}
	
	$fwViewData['datacol'] = $datacol;
	
	
	
	
$tablest = new Fw_Db_Table('quote_tracking_status');

$fwViewData['pustdetail'] = $tablest->getRows();


    // $ressql = "SELECT concat(contacts.cs_first_name, ' ', contacts.cs_surname) as name , companies.co_company_name  from contacts 
//         	  Inner join companies ON contacts.cs_company = companies.co_id
//	 	      where companies.co_id = 2 group by cs_primary_email  order by contacts.cs_first_name ";
			  
	  $ressql = "SELECT distinct concat(contacts.cs_first_name, ' ', contacts.cs_surname) as name  from contacts 
         	     where contacts.cs_company = 2 group by cs_primary_email  order by contacts.cs_first_name ";		  
		  
	 $fwViewData['reslist'] = $fwDb->query($ressql);