<?php
$pagenum = $fwRequest->getparamget('pagenum',0);

$print_merge_footing = $fwRequest->getParam('print_merge_footing', '');
if ($print_merge_footing != '') {
	$mergeFile = dirname(__FILE__) . '/print_spr_footing_merge.php';
	if (file_exists($mergeFile)) {
		require_once $mergeFile;
	}
}

$table = new Fw_Db_Table('certifier_structural_engineer');
require_once dirname(__FILE__) . '/cse_extra_docs.php';

$ajax_pending = $fwRequest->getParam('ajax_pending', '');
if ($ajax_pending != '') {
	$bsn_id = (int)$fwRequest->getParam('bsn_id', 0);
	$stage = (int)$fwRequest->getParam('stage', 0);
	$payload = cse_ajax_pending_payload($fwDb, $bsn_id, $stage);
	while (ob_get_level()) {
		ob_end_clean();
	}
	header('Content-Type: application/json');
	echo json_encode($payload);
	exit;
}


// Add bsn_name from construction in progress report

$sql = "SELECT   business.bsn_name , business_sellers.bs_cipr_sn
		from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id  WHERE business.bsn_status like '%|3|%' and bus_customers.bcust_cip_hide = 0  
		group by business_sellers.bs_business_id  Order by STR_TO_DATE(business.bsn_cip_com_on_date, '%d-%m-%Y' ) DESC";


$busData = $fwDb->query($sql);

foreach($busData as $k=>$v)
{
	$table->setWhere("cse_project =  '" . $v['bsn_name']."'");
	if (!$table->rowExists()) {
		$detail = array();
		$detail['cse_project'] = $v['bsn_name'];
		$detail['cse_location'] = ($v['bs_cipr_sn'] == 0) ? 'North' : 'South';
		$detail['cse_qa'] = 1;
		$table->insertRow($detail);
		
	}
	
}


// End of Add



 
$fwViewData['show'] =  1;
$where =  " where cse_stage = 1";
$fwViewData['report'] =  "Floor System";

$wherehide =  " and  cse_hide = 0";
$whereH = '';

// Certifier Show Hidden: show rows hidden on THIS report (cse_hide = 1)
$showhidden = $fwRequest->getParam('showhidden', '');
if(!empty($showhidden)) {
	$_SESSION['cse_show_hidden'] = 1;
	$wherehide = " and  cse_hide = 1";
}

// CIPR Hide always stays hidden on Certifier, even after Show Hidden
$whereCiprHide = " AND cse_project NOT IN (
	SELECT DISTINCT business.bsn_name
	FROM business_sellers
	Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id
	Inner Join business ON business_sellers.bs_business_id = business.bsn_id
	WHERE bus_customers.bcust_cip_hide = 1
	AND business.bsn_name IS NOT NULL
	AND business.bsn_name != ''
)";


if(isset($_SESSION['show']))  { $fwViewData['show'] = $_SESSION['show'] ; }
if(isset($_SESSION['where'])) { $fwViewData['where'] = $_SESSION['where'] ; }
if(isset($_SESSION['report'])) { $fwViewData['report'] = $_SESSION['report'] ; }

$floorsystem = $fwRequest->getParam('floorsystem', '');
if($floorsystem) {
	unset($_SESSION['show']);
	unset($_SESSION['where']);
	unset($_SESSION['report']);
	unset($_SESSION['cse_show_hidden']);
	
	$fwViewData['show'] =  1;
	$fwViewData['report'] =  "Floor System";
	$where =  " where cse_stage = 1";
	
	$_SESSION['show'] = 1;
	$_SESSION['where'] = " where cse_stage = 1" ;
	$_SESSION['report'] =  "Floor System";
	
}

$presheet = $fwRequest->getParam('presheet', '');
if($presheet) {
	unset($_SESSION['show']);
	unset($_SESSION['where']);
	unset($_SESSION['report']);
	unset($_SESSION['cse_show_hidden']);
	
	$fwViewData['show'] =  2;
	$fwViewData['report'] =  "Pre Sheet";
	$where =  " where cse_stage = 2";
	
	$_SESSION['show'] = 2;
	$_SESSION['where'] = " where cse_stage = 2" ;
	$_SESSION['report'] =  "Pre Sheet";
	
}

$final = $fwRequest->getParam('final', '');
if($final) {
	
	unset($_SESSION['show']);
	unset($_SESSION['where']);
	unset($_SESSION['report']);
	unset($_SESSION['cse_show_hidden']);
	
	$fwViewData['show'] =  3;
	$fwViewData['report'] =  "Final";
	$where =  " where cse_stage = 3";
	
	$_SESSION['show'] = 3;
	$_SESSION['where'] = " where cse_stage = 3" ;
	$_SESSION['report'] =  "Final";
}




$move_cal = $fwRequest->getParam('move_cal', '');
if($move_cal)
{
	 $keys = array_keys($move_cal);
	 $ky = $keys[0];
	 $val = $move_cal[$ky];
	
	  $moveData = array();
	  $moveData['cse_stage'] = $val;
	  $moveData['cse_qa'] = 1;
	  $moveData['cse_qa_user'] = '';
	  $moveData['cse_qa_date'] = '';
	  $table->setWhere("cse_id = ".$ky);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($moveData);
	  }
	  $fwViewData['show'] =  1;	  	
}

$hide = $fwRequest->getParam('hide', '');
if($hide)
{
	 $keys = array_keys($hide);
	 $ky = $keys[0];
	 $val = $hide[$ky];
	
	  $detail['cse_hide'] = $val;
	  $table->setWhere("cse_id = ".$ky);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }
	 // $fwViewData['show'] =  1;	  	
}



$move_last = $fwRequest->getParam('move_last', '');
if($move_last)
{
	 $keys = array_keys($move_last);
	 $ky = $keys[0];
	 $val = $move_last[$ky];
	
	  $moveData = array();
	  $moveData['cse_stage'] = $val;
	  $moveData['cse_qa'] = 1;
	  $moveData['cse_qa_user'] = '';
	  $moveData['cse_qa_date'] = '';
	  $table->setWhere("cse_id = ".$ky);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($moveData);
	  }
	  $fwViewData['show'] =  2;	  	
}





$move_final = $fwRequest->getParam('move_final', '');
if($move_final)
{
	 $keys = array_keys($move_final);
	 $ky = $keys[0];
	 $val = $move_final[$ky];
	
	  $moveData = array();
	  $moveData['cse_stage'] = $val;
	  $moveData['cse_qa'] = 1;
	  $moveData['cse_qa_user'] = '';
	  $moveData['cse_qa_date'] = '';
	  $table->setWhere("cse_id = ".$ky);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($moveData);
	  }
	  $fwViewData['show'] =  3;	  	
}







$whereand = '';
  
$search_proj = $fwRequest->getParam('search_proj', '');
if ($search_proj):
	$whereand .= " AND certifier_structural_engineer.cse_project LIKE '%" . $search_proj . "%'";
	$_SESSION['search_proj'] = $search_proj;
	$fwViewData['search_proj'] = $_SESSION['search_proj'];
elseif (!empty($_SESSION['search_proj'])):

	$whereand .= " AND certifier_structural_engineer.cse_project LIKE '%" . $_SESSION['search_proj'] . "%'";
	$fwViewData['search_proj'] = $_SESSION['search_proj'];
else:
	$whereand .= '';
endif;


$search_location = $fwRequest->getParam('search_location', '');
if ($search_location):
	$whereand .= " AND certifier_structural_engineer.cse_location LIKE '%" . $search_location . "%'";
	$_SESSION['search_location'] = $search_proj;
	$fwViewData['search_location'] = $_SESSION['search_location'];
elseif (!empty($_SESSION['search_location'])):

	$whereand .= " AND certifier_structural_engineer.cse_location LIKE '%" . $_SESSION['search_location'] . "%'";
	$fwViewData['search_location'] = $_SESSION['search_location'];
else:
	$whereand .= '';
endif;


$qa_search = $fwRequest->getParam('qa_search', '');
$location_search = $fwRequest->getParam('location_search', '');
$search_qa_param = $fwRequest->getParam('search_qa', '');
if ($qa_search || $location_search || $floorsystem || $presheet || $final) {
	if ($search_qa_param === 'yes' || $search_qa_param === 'no') {
		$_SESSION['search_qa'] = $search_qa_param;
	} else {
		unset($_SESSION['search_qa']);
	}
}

$search_qa = !empty($_SESSION['search_qa']) ? $_SESSION['search_qa'] : '';
$fwViewData['search_qa'] = $search_qa;

if ($search_qa === 'yes') {
	$whereand .= " AND certifier_structural_engineer.cse_qa = 0";
} elseif ($search_qa === 'no') {
	$whereand .= " AND (certifier_structural_engineer.cse_qa = 1 OR certifier_structural_engineer.cse_qa IS NULL)";
}


$clear = $fwRequest->getParam('clear', '');
if($clear) {
	unset($_SESSION['search_proj']);
	unset($fwViewData['search_proj']);
	$fwViewData['search_proj'] = '';
	unset($_SESSION['search_qa']);
	unset($fwViewData['search_qa']);
	$fwViewData['search_qa'] = '';
	unset($whereand);
	$whereand = '';
	unset($_SESSION['cse_show_hidden']);
	$wherehide = " and  cse_hide = 0";
}

if (!empty($_SESSION['cse_show_hidden'])) {
	$wherehide = " and  cse_hide = 1";
}

 if(isset($_SESSION['where'])) { $where = $_SESSION['where']; }
 

$hidden = $fwRequest->getParam('hidden', '');
if(!empty($hidden)) {
	//$where = " WHERE cse_stage = 3 OR cse_stage = 4";
	$whereH = "  OR cse_stage = 4";
}

$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where." ".$whereH." ".$whereand. " ".$wherehide." ".$whereCiprHide ;



if($matsql){$userData = $fwDb->query($matsql);}

if(!empty($userData))
{
if (!(isset($pagenum))){ $pagenum = 1; } 
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
	
	//$fwViewData['list'] = $listsnew;
  }
}


foreach((array)$listsnew as $k=>$v)
{
	$sq1_1 = "SELECT  business.bsn_id from business where business.bsn_name = '".$v['cse_project']."'";  
	$data = $fwDb->queryOne($sq1_1);
	
	
	$sql_653 = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$data['bsn_id']. " and  	doc_name_id  = 653 ";
    $data653 = $fwDb->queryOne($sql_653);
	
	$sql_148 = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$data['bsn_id']. " and  	doc_name_id  = 148 ";
    $data148 = $fwDb->queryOne($sql_148);
	
	$sql_240 = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$data['bsn_id']. " and  	doc_name_id  = 240 ";
    $data240 = $fwDb->queryOne($sql_240);
	
	$sql_648 = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$data['bsn_id']. " and  	doc_name_id  = 648 ";
    $data648 = $fwDb->queryOne($sql_648);
	

	$listsnew[$k]['link'] = BASE_URL."business.detail/bsn_id/".$data['bsn_id'];


	$listsnew[$k]['bsn_id'] = $data['bsn_id'];
	
	$listsnew[$k]['doc_not_required653'] = $data653['doc_not_required'];
	$listsnew[$k]['doc_not_required148'] = $data148['doc_not_required'];
	$listsnew[$k]['doc_not_required240'] = $data240['doc_not_required'];
	$listsnew[$k]['doc_not_required648'] = $data648['doc_not_required'];
	
	$listsnew[$k]['doc_file_name653'] = $data653['doc_file_name'];
	$listsnew[$k]['doc_file_name148'] = $data148['doc_file_name'];
	$listsnew[$k]['doc_file_name240'] = $data240['doc_file_name'];
	$listsnew[$k]['doc_file_name648'] = $data648['doc_file_name'];
	
	
	$sql_116 = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$data['bsn_id']. " and  	doc_name_id  = 116";
    $data116 = $fwDb->queryOne($sql_116);
	
	$sql_235 = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$data['bsn_id']. " and  	doc_name_id  = 235";
    $data235 = $fwDb->queryOne($sql_235);
	
	$sql_653 = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$data['bsn_id']. " and  	doc_name_id  = 653";
    $data653 = $fwDb->queryOne($sql_653);
	
	$sql_478 = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$data['bsn_id']. " and  	doc_name_id  = 478";
    $data478 = $fwDb->queryOne($sql_478);
	
	$sql_148 = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$data['bsn_id']. " and  	doc_name_id  = 148";
    $data148 = $fwDb->queryOne($sql_148);

	$bsnId = isset($data['bsn_id']) ? (int)$data['bsn_id'] : 0;
	$listsnew[$k]['tot'] = cse_count_stage_pending($fwDb, $bsnId, 1);
	
	
	
	$sqlA = "select count(*) as  openfooting  
		  from  construction_alert_report where car_type = 'Certifier – Footings' 
		  AND car_bsn_id  = " . $data['bsn_id'] . " And car_status = 'Open'";
		  
	$dataA = $fwDb->queryOne($sqlA);
	
	$sqlB = "select count(*) as  openslab  
		  from  construction_alert_report where car_type = 'Certifier – Slab' 
		  AND car_bsn_id  = " . $data['bsn_id'] . " And car_status = 'Open'";
		  
	$dataB = $fwDb->queryOne($sqlB);
	
	//db($dataC);
	
	$sqlC = "select count(*) as  openfloor  
		  from  construction_alert_report where car_type = 'Certifier – Floor System' 
		  AND car_bsn_id  = " . $data['bsn_id'] . " And car_status = 'Open'";
		  
	$dataC = $fwDb->queryOne($sqlC);
	
	$dataOA = $dataA['openfooting'] + $dataB['openslab'] + $dataC['openfloor'];
	
	$listsnew[$k]['dataOA'] = $dataOA;
	$listsnew[$k]['next'] = $listsnew[$k]['tot'] + $dataOA;
	
	$listsnew[$k]['openfooting']  = $dataA['openfooting'];
	$listsnew[$k]['openslab']	 = $dataB['openslab'];
	$listsnew[$k]['openfloor']    = $dataC['openfloor'];
	
	// Stage 2 Pre-Sheet starts
	
	$sql_152 = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$data['bsn_id']. " and  	doc_name_id  = 152 ";
    $data152 = $fwDb->queryOne($sql_152);
	$listsnew[$k]['doc_not_required152'] = $data152['doc_not_required'];
	$listsnew[$k]['doc_file_name152'] = $data152['doc_file_name'];

	$sql_667 = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$data['bsn_id']. " and  	doc_name_id  = 667 ";
    $data667 = $fwDb->queryOne($sql_667);
	$listsnew[$k]['doc_not_required667'] = $data667['doc_not_required'];
	$listsnew[$k]['doc_file_name667']    = $data667['doc_file_name'];
	
	
	
	$sql_261 = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$data['bsn_id']. " and  	doc_name_id  = 261 ";
    $data261 = $fwDb->queryOne($sql_261);
	
	$sql_289 = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$data['bsn_id']. " and  	doc_name_id  = 289 ";
    $data289 = $fwDb->queryOne($sql_289);
	
	$sql_155 = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$data['bsn_id']. " and  	doc_name_id  = 155 ";
    $data155 = $fwDb->queryOne($sql_155);
	
	$sql_295 = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$data['bsn_id']. " and  	doc_name_id  = 295 ";
    $data295 = $fwDb->queryOne($sql_295);
	
	$sql_739 = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$data['bsn_id']. " and  	doc_name_id  = 739 ";
    $data739 = $fwDb->queryOne($sql_739);
	
	$sql_626 = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$data['bsn_id']. " and  	doc_name_id  = 626 ";
    $data626 = $fwDb->queryOne($sql_626);

	$listsnew[$k]['dataOB'] = cse_count_stage_pending($fwDb, $bsnId, 2);
	
	$sql99 = "select count(*) as  openps  
		  from  construction_alert_report where car_type = 'Certifier - Pre-sheet' 
		  AND car_bsn_id  = " . $data['bsn_id'] . " And car_status = 'Open'";
		  
	$data99 = $fwDb->queryOne($sql99);
	
	$listsnew[$k]['openps'] = $data99['openps'];
	$listsnew[$k]['next2']  = $listsnew[$k]['dataOB'] + $data99['openps'];
	
	
	// final stage
	
	$sql_169 = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$data['bsn_id']. " and  	doc_name_id  = 169 ";
    $data169 = $fwDb->queryOne($sql_169);
	
	$sql_663 = "Select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$data['bsn_id']. " and  	doc_name_id  = 663 ";
			   
    $data663 = $fwDb->queryOne($sql_663);
	
	$listsnew[$k]['doc_not_required169'] = $data169['doc_not_required'];
	$listsnew[$k]['doc_file_name169'] = $data169['doc_file_name'];

	$listsnew[$k]['finsum'] = cse_count_stage_pending($fwDb, $bsnId, 3);
	
	$sql55 = "select count(*) as  openfinal  
		     from  construction_alert_report where car_type = 'Certifier – Final' 
		 	 AND car_bsn_id  = " . $data['bsn_id'] . " And car_status = 'Open'";
		  
	$data55 = $fwDb->queryOne($sql55);
	
	$listsnew[$k]['alertfinal'] = $data55['openfinal'];	
	$listsnew[$k]['finstage'] = $listsnew[$k]['finsum'] +  $data55['openfinal']; 
	
	
	//New Color Logs Starts
	
	$mw = 0;
	$fi = 0;
	$si = 0;
	$fl = 0;
	
	//Piar Inspection
	if($data116['doc_not_required'] == 0  AND empty(trim($data116['doc_file_name']))) {
		$mw = 1;	
	}
	
	if($data235['doc_not_required'] == 0  AND empty(trim($data235['doc_file_name']))) {
		$mw = 1;	
	}
	
	$listsnew[$k]['setcolor'] = $mw;
	
	//Footing Inspection
	if($data235['doc_not_required'] == 0  AND empty(trim($data235['doc_file_name']))) {
		$fi = 1;	
	}
	
	if($data653['doc_not_required'] == 0  AND empty(trim($data653['doc_file_name']))) {
		$fi = 1;	
	}
	
	if($data478['doc_not_required'] == 0  AND ( empty(trim($data478['doc_file_name'])) OR $data478['doc_file_name'] == NULL )) {
		$fi = 1;	
	}
	
	
	if($data116['doc_not_required'] == 0  AND empty(trim($data116['doc_file_name']))) {
		$fi = 1;	
	}
	

	//Slab Inspections
	
	
	$listsnew[$k]['setcolorFI'] = $fi;
	
	if($data235['doc_not_required'] == 0  AND empty(trim($data235['doc_file_name']))) {
		$si = 1;	
	}
	
	if($data653['doc_not_required'] == 0  AND empty(trim($data653['doc_file_name']))) {
		$si = 1;	
	}
	if($data116['doc_not_required'] == 0  AND empty(trim($data116['doc_file_name']))) {
		$si = 1;	
	}
	
	if($data148['doc_not_required'] == 0  AND empty(trim($data148['doc_file_name']))) {
		$si = 1;	
	}
	
	$listsnew[$k]['setcolorSI'] = $si;
	
	if($data148['doc_not_required'] == 0  AND empty(trim($data148['doc_file_name']))) {
		$fl = 1;	
	}
	if($data235['doc_not_required'] == 0  AND empty(trim($data235['doc_file_name']))) {
		$fl = 1;	
	}
	
	
	$listsnew[$k]['setcolorFL'] = $fl;
	
	// Pre Sheet 
	
	$ps = 0;
	$fnl = 0;
	
	if($data261['doc_not_required'] == 0  AND empty(trim($data261['doc_file_name']))) {
		$ps = 1;	
	}
	
	
	
	if($data289['doc_not_required'] == 0  AND empty(trim($data289['doc_file_name']))) {
		$ps = 1;	
	}
	
	
	if($data295['doc_not_required'] == 0  AND empty(trim($data295['doc_file_name']))) {
		$ps = 1;	
	}
	
	if($data155['doc_not_required'] == 0  AND empty(trim($data155['doc_file_name']))) {
		$ps = 1;	
	}
	
	
	if($data739['doc_not_required'] == 0  AND empty(trim($data739['doc_file_name']))) {
		$ps = 1;	
	}
	
	if($data626['doc_not_required'] == 0  AND empty(trim($data626['doc_file_name']))) {
		$ps = 1;	
	}
	
	$listsnew[$k]['setcolorPS'] = $ps;
	
	// Final
	
	//New Color Loginc Ends
	
	if($data663['doc_not_required'] == 0  AND empty(trim($data663['doc_file_name']))) {
		$fnl = 1;	
	}
	
	$listsnew[$k]['setcolorFNL'] = $fnl;
	
	
	// Adding more sections
	
	$sql_728 = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$data['bsn_id']. " and  	doc_name_id  = 728 ";
    $data728 = $fwDb->queryOne($sql_728);
	$listsnew[$k]['doc_file_name728'] = $data728['doc_file_name'];
	$listsnew[$k]['doc_not_required728'] = $data728['doc_not_required'];
	
	$sql_730 = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$data['bsn_id']. " and  	doc_name_id  = 730 ";
    $data730 = $fwDb->queryOne($sql_730);
	$listsnew[$k]['doc_file_name730'] = $data730['doc_file_name'];
	$listsnew[$k]['doc_not_required730'] = $data730['doc_not_required'];
	
	$sql_729 = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$data['bsn_id']. " and  	doc_name_id  = 729 ";
    $data729 = $fwDb->queryOne($sql_729);
	$listsnew[$k]['doc_file_name729'] = $data729['doc_file_name'];
	$listsnew[$k]['doc_not_required729'] = $data729['doc_not_required'];
	
	$sql_731 = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$data['bsn_id']. " and  	doc_name_id  = 731 ";
    $data731 = $fwDb->queryOne($sql_731);
	$listsnew[$k]['doc_file_name731'] = $data731['doc_file_name'];
	$listsnew[$k]['doc_not_required731'] = $data731['doc_not_required'];
	
	$sql_785 = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$data['bsn_id']. " and  	doc_name_id  = 785 ";
    $data785 = $fwDb->queryOne($sql_785);
	$listsnew[$k]['doc_file_name785'] = $data785['doc_file_name'];
	$listsnew[$k]['doc_not_required785'] = $data785['doc_not_required'];

}

$fwViewData['list'] = $listsnew;
$fwViewData['title'] = $MODULE_PLURAL;
		

$sql_pro = "select distinct cs_project from construction_scheduler_report";
$fwViewData['project_data'] = $fwDb->query($sql_pro);
