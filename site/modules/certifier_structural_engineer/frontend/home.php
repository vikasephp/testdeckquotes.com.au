<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('certifier_structural_engineer');
 
$fwViewData['show'] =  1;
$where =  " where cse_stage = 1";
$fwViewData['report'] =  "Floor System";


if(!empty($show_hidden))
{
	$where =  " where cs_stage = 0";
	$_SESSION['where'] = $where;	
}




if(isset($_SESSION['show']))  { $fwViewData['show'] = $_SESSION['show'] ; }
if(isset($_SESSION['where'])) { $fwViewData['where'] = $_SESSION['where'] ; }
if(isset($_SESSION['report'])) { $fwViewData['report'] = $_SESSION['report'] ; }

$floorsystem = $fwRequest->getParam('floorsystem', '');
if($floorsystem) {
	unset($_SESSION['show']);
	unset($_SESSION['where']);
	unset($_SESSION['report']);
	
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
	
	  $detail['cse_stage'] = $val;
	  $table->setWhere("cse_id = ".$ky);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }
	  $fwViewData['show'] =  1;	  	
}

$move_last = $fwRequest->getParam('move_last', '');
if($move_last)
{
	 $keys = array_keys($move_last);
	 $ky = $keys[0];
	 $val = $move_last[$ky];
	
	  $detail['cse_stage'] = $val;
	  $table->setWhere("cse_id = ".$ky);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }
	  $fwViewData['show'] =  2;	  	
}





$move_final = $fwRequest->getParam('move_final', '');
if($move_final)
{
	 $keys = array_keys($move_final);
	 $ky = $keys[0];
	 $val = $move_final[$ky];
	
	  $detail['cse_stage'] = $val;
	  $table->setWhere("cse_id = ".$ky);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
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


$clear = $fwRequest->getParam('clear', '');
if($clear) {
	unset($_SESSION['search_proj']);
	unset($fwViewData['search_proj']);
	$fwViewData['search_proj'] = '';
	unset($whereand);
}

 if(isset($_SESSION['where'])) { $where = $_SESSION['where']; }
 

$hidden = $fwRequest->getParam('hidden', '');
if(!empty($hidden)) {
	$where = " WHERE cse_stage = 3 OR cse_stage = 4";
}

$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where." ".$whereand ;


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
	
	
	$where2 = '';
	$where3 = '';

	
	$sql_116 = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$data['bsn_id']. " and  	doc_name_id  = 116 ";
    $data116 = $fwDb->queryOne($sql_116);
	
	$sql_235 = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$data['bsn_id']. " and  	doc_name_id  = 235 ";
    $data235 = $fwDb->queryOne($sql_235);
	
	$sql_653 = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$data['bsn_id']. " and  	doc_name_id  = 653 ";
    $data653 = $fwDb->queryOne($sql_653);
	
	$sql_478 = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$data['bsn_id']. " and  	doc_name_id  = 478 ";
    $data478 = $fwDb->queryOne($sql_478);
	
	$sql_148 = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$data['bsn_id']. " and  	doc_name_id  = 148 ";
    $data148 = $fwDb->queryOne($sql_148);
	
	if($data653['doc_not_required'] == 0 || $data148['doc_not_required'] == 0 || $data240['doc_not_required'] == 0) {
		if($data116['doc_not_required'] == 0) {
				$where2 .= " 116, ";	
		}
	}
	
	if($data653['doc_not_required'] == 0 || $data148['doc_not_required'] == 0 || $data240['doc_not_required'] == 0 || $data648['doc_not_required'] == 0) {
		if($data235['doc_not_required'] == 0) {
				$where2 .= " 235, ";	
		}	
	}
	
	
	if( $data148['doc_not_required'] == 0 || $data240['doc_not_required'] == 0 ) {
		if($data653['doc_not_required'] == 0) {
				$where2 .= " 653, ";	
		}
	}
	
	if( $data148['doc_not_required'] == 0  ) {
		if($data478['doc_not_required'] == 0) {
				$where2 .= " 478, ";	
		}
	}
	
	if( $data240['doc_not_required'] == 0 || $data648['doc_not_required'] == 0 ) {
		if($data148['doc_not_required'] == 0) {
				$where2 .= " 148, ";	
		}
	}
	
	$whereT = ' And doc_name_id IN (' .$where2 .'0)' ; 
	
	$sqlUC = "Select count(*) as tot from document_check_list
		      where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " ". $whereT ." 
			  And ( doc_file_name IS NULL OR TRIM(doc_file_name) = '')";
			  
			  
	$dataUC = $fwDb->queryOne($sqlUC);
	$listsnew[$k]['tot'] = $dataUC['tot'];
	
	
	
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
	$listsnew[$k]['next'] = $dataUC['tot'] + $dataOA;
	
	
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
	
	if($data152['doc_not_required'] == 0)
	{
		if($data261['doc_not_required'] == 0)
		{
			$where3 .= " 261, ";
		}
		
		if($data289['doc_not_required'] == 0)
		{
			$where3 .= " 289, ";
		}
		
		if($data155['doc_not_required'] == 0)
		{
			$where3 .= " 155, ";
		}
		
		if($data295['doc_not_required'] == 0)
		{
			$where3 .= " 295, ";
		}
		
		
		if($data739['doc_not_required'] == 0)
		{
			$where3 .= " 739, ";
		}
		
		if($data626['doc_not_required'] == 0)
		{
			$where3 .= " 626, ";
		}
	}
	
	
	$whereS = ' And doc_name_id IN (' .$where3 .'0)' ; 
	
	
	$sqlPS1 = "Select count(*) as totPS from document_check_list
		      where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " ". $whereS ." 
			  And (doc_file_name IS NULL OR TRIM(doc_file_name) = '')";
	
	$dataPS1 = $fwDb->queryOne($sqlPS1);
	
		
	
	$sqlDocs = "Select * from ss_required_doc ";
	$dataDocs = $fwDb->query($sqlDocs);
	
	$ctr = 0;
	if($data667['doc_not_required'] == 0) 
	{
		foreach($dataDocs as $k1=>$v1)
		{
			
			$sqlX = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$data['bsn_id']. " and  	doc_name_id  = ".$v1['ss_doc_id'];
    		$dataX = $fwDb->queryOne($sqlX);
			
						
			if($dataX['doc_not_required'] == 0 AND (trim($dataX['doc_file_name']) == ''  OR $dataX['doc_file_name'] == NULL ) )
			{
				$ctr = $ctr + 1;
				
			}
		
		}
		
	}
	
	$sql99 = "select count(*) as  openps  
		  from  construction_alert_report where car_type = 'Certifier - Pre-sheet' 
		  AND car_bsn_id  = " . $data['bsn_id'] . " And car_status = 'Open'";
		  
	$data99 = $fwDb->queryOne($sql99);
	
	$listsnew[$k]['dataOB'] = $dataPS1['totPS'] + $ctr ;
	
	$listsnew[$k]['openps'] = $data99['openps'];
	$listsnew[$k]['next2']  = $dataPS1['totPS'] + $ctr  + $data99['openps'];
	
	
	// final stage
	
	$sql_169 = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$data['bsn_id']. " and  	doc_name_id  = 169 ";
    $data169 = $fwDb->queryOne($sql_169);
	
	$sql_663 = "Select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$data['bsn_id']. " and  	doc_name_id  = 663 ";
			   
    $data663 = $fwDb->queryOne($sql_663);
	
	$listsnew[$k]['doc_not_required169'] = $data169['doc_not_required'];
	$listsnew[$k]['doc_file_name169'] = $data169['doc_file_name'];
	
	
	if($data169['doc_not_required'] == 0)
	{
		if($data663['doc_not_required'] == 0)
		{
			$where4 = " And doc_name_id = 663 ";
		}
	}
	
	$sqlPS2 = "Select count(*) as totPS2 from document_check_list
		      where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " ". $where4 ." 
			  And (doc_file_name IS NULL OR TRIM(doc_file_name) = '')";
			  
	$dataPS2 = $fwDb->queryOne($sqlPS2);
	
	$sql55 = "select count(*) as  openfinal  
		     from  construction_alert_report where car_type = 'Certifier – Final' 
		 	 AND car_bsn_id  = " . $data['bsn_id'] . " And car_status = 'Open'";
		  
	$data55 = $fwDb->queryOne($sql55);
	
	$listsnew[$k]['finsum'] = $dataPS2['totPS2'];
	$listsnew[$k]['alertfinal'] = $data55['openfinal'];	
	$listsnew[$k]['finstage'] = $dataPS2['totPS2'] +  $data55['openfinal']; 
	

}

$fwViewData['list'] = $listsnew;
$fwViewData['title'] = $MODULE_PLURAL;
		

$sql_pro = "select distinct cs_project from construction_scheduler_report";
$fwViewData['project_data'] = $fwDb->query($sql_pro);
