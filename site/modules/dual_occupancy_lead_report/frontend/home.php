<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$fwViewData['ran'] =  rand(100000,999999);

$heritage = $fwRequest->getParam('heritage', '');
if ($heritage) {
    $keys_2 = array_keys($heritage);
    $ky_2 = $keys_2[0];
    $val_2 = $heritage[$ky_2];
    $detail['dolr_heritage'] = $val_2;
	$detail['dolr_heritage_updated_by'] = $_SESSION['user']['user_name'];
	$detail['dolr_heritage_updated_at'] = date('d-m-Y');
	$table = new Fw_Db_Table($TABLE);
    $table->setWhere("dolr_id = " . $ky_2);
    if ($table->rowExists()) {
        $this_id = $table->updateRow($detail);
    }
	$redirectUrl = $_SERVER['REQUEST_URI'];
	header("Location: $redirectUrl");
	exit;
}

$where = "WHERE 1=1 ";

//$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where." ORDER BY ".$TABLE.".dolr_enquiry_date DESC, ".$TABLE.".".$ID." DESC";	
$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where." ORDER BY STR_TO_DATE(".$TABLE.".dolr_enquiry_date, '%d-%m-%Y') DESC";
//echo $matsql;

if($matsql){$userData = $fwDb->query($matsql);}

if(!empty($userData))
{
if (!(isset($pagenum))){ $pagenum = 1; } 
    $rows = count($userData);
    $page_rows = 100;
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
    if($sql2){
		$lists = $fwDb->query($sql2);
		$listsnew = [];
		foreach($lists as $k => $v ):
		
			$sql_note_date = "SELECT doc_created_at FROM dual_occupancy_notes where doc_docqa_id = ".$v['docqa_id']." order by doc_id desc limit 1";
			$data_note_date = $fwDb->queryOne($sql_note_date);
			$v['note_date'] = $data_note_date['doc_created_at'];
			
			$listsnew[] = $v;
		endforeach;
		
		//echo "<pre>"; print_r($listsnew); exit();
		
		$fwViewData['list'] = $listsnew;
	  }
}

$fwViewData['title'] = $MODULE_PLURAL;


$sql_zoning = "SELECT * FROM dual_occupancy_canberra_zoning";
$fwViewData['data_zoning'] = $data_zoning = $fwDb->query($sql_zoning);

$sql_sc = "SELECT * FROM dual_occupancy_canberra_size_class";
$fwViewData['data_sc'] = $data_sc = $fwDb->query($sql_sc);
