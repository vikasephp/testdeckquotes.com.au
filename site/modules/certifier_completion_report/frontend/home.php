<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$table = new Fw_Db_Table('document_check_list');
$where = " where business.bsn_status like '%|3|%'";
$fwViewData['ran'] =  rand(100000,999999);


$savedata_fs = $fwRequest->getParam('savedata_fs', '');
if($savedata_fs) 
{ 
		if($_FILES['floor_system']['name'])
		{
			$docfile_1 = $_FILES['floor_system']['name'];
			$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
			$temp_name_1 = $_FILES['floor_system']['tmp_name'];
			
			$dt1 = date('Y-m-d h:i:sa');
			$fsData['doc_date_uploaded'] = $dt1;
			$fsData['doc_file_name'] = $docfile_1;
			$fsData['doc_user_name'] = $_SESSION['user']['user_id'];
			
			upload($docfile_1, $temp_name_1);
			
			$bsn_id = $fwRequest->getParam('bsn_id', '');
				
			$table->setWhere('doc_bsn_id = '.$bsn_id. " and doc_name_id = 683");
			if($table->rowExists())
			{
			
				$detail = $table->updateRow($fsData);	
			}		
		}	
}

$savedata_ps = $fwRequest->getParam('savedata_ps', '');
if($savedata_ps) 
{ 
		if($_FILES['pre_sheet']['name'])
		{
			$docfile_2 = $_FILES['pre_sheet']['name'];
			$docfile_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
			$temp_name_2 = $_FILES['pre_sheet']['tmp_name'];
			
			$dt2 = date('Y-m-d h:i:sa');
			
			$preData['doc_date_uploaded'] = $dt2;
			$preData['doc_file_name'] = $docfile_2;
			$preData['doc_user_name'] = $_SESSION['user']['user_id'];
			
			upload($docfile_2, $temp_name_2);
			
			$bsn_id = $fwRequest->getParam('bsn_id', '');
	
				
			$table->setWhere('doc_bsn_id = '.$bsn_id . " and doc_name_id = 663");
			if($table->rowExists())
			{
			
				$detail = $table->updateRow($preData);	
			}		
		}	
}



//

$savedata_fi = $fwRequest->getParam('savedata_fi', '');
if($savedata_fi) 
{ 
		if($_FILES['final']['name'])
		{
			$docfile_3 = $_FILES['final']['name'];
			$docfile_3 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_3);
			$temp_name_3 = $_FILES['final']['tmp_name'];
			
			$dt3 = date('Y-m-d h:i:sa');
			
			$fiData['doc_date_uploaded'] = $dt3;
			$fiData['doc_file_name'] = $docfile_3;
			$fiData['doc_user_name'] = $_SESSION['user']['user_id'];
			
			upload($docfile_3, $temp_name_3);
			
			$bsn_id = $fwRequest->getParam('bsn_id', '');
				
		    $table->setWhere('doc_bsn_id = '.$bsn_id . " and doc_name_id = 699");
			if($table->rowExists())
			{
			
				$detail = $table->updateRow($fiData);	
			}		
		}	
}


//




// Save Hide
$hide = $fwRequest->getParam('hide', '');
if(!empty($hide)) {
	$key = array_keys($hide);
	$ky = $key[0];
	$hideDetail['bsn_qar_hide'] = $hide[$ky];
	$table->setWhere('bsn_id = '.$ky);
	$hdetail = $table->updateRow($hideDetail);		
}
// End Hide

$unhide = $fwRequest->getParam('unhide', '');
if($unhide)
{
$where = " where business.bsn_status like '%|3|%' ";		
}
	
if($keyword):
$where .= "AND business.bsn_sub_status LIKE '%".$keyword."%'";
	
	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword'] && $pagenum > 0):

	$where .= "AND business.bsn_sub_status LIKE '%".$_SESSION['keyword']."%'";
	$fwViewData['keyword']=$_SESSION['keyword'];
endif;
   
if(empty($pagenum))
	{
	unset($_SESSION['last_tdsql']);
	}
		
	$sql = "SELECT business.bsn_id, business.bsn_name,  business.bsn_status_sys_date, business.bsn_address, business.bsn_qar_hide,
		    business.bsn_qar_pre_sheet, business.bsn_qar_pre_walk, business.bsn_qar_pre_sheet_date, business.bsn_qar_pre_walk_date,
	        business.bsn_qar_com_aud, business.bsn_qar_com_aud_date, business.bsn_qar_fix_insp, business.bsn_qar_fix_insp_date,
			business.bsn_qar_wall_roof, business.bsn_qar_wall_roof_date
		    from business ". $where. " Order By business.bsn_status_sys_date DESC ";
		

if($sql){$userData = $fwDb->query($sql);}

$fwViewData['total'] = sizeof($userData);

if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

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

if($sql2)
{  

 $setdata2 = $fwDb->query($sql2);
 
foreach($setdata2 as $k => $v)
{
		
		$link = $BASE_URL. "business.detail/bsn_id/".$v['bsn_id'];

        $sql_1 = "SELECT doc_file_name FROM document_check_list WHERE doc_bsn_id = ".$v['bsn_id']. " and doc_name_id = 683 ";
        $data683 = $fwDb->queryOne($sql_1);

        $sql_2 = "SELECT doc_file_name FROM document_check_list WHERE doc_bsn_id = ".$v['bsn_id']. " and doc_name_id = 663 ";
        $data663 = $fwDb->queryOne($sql_2);

        $sql_3 = "SELECT doc_file_name FROM document_check_list WHERE doc_bsn_id = ".$v['bsn_id']. " and doc_name_id = 699 ";
        $data699 = $fwDb->queryOne($sql_3);

		$ccdate = $v['bsn_status_sys_date'];
		$Statusdate = changedate_y_m_d($ccdate);
		$curdate_y_m_d = date('Y-m-d');
		$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
		
		$setdata2[$k]['link'] = $link;
		$setdata2[$k]['status'] = $v['bsn_sub_status'];
		$setdata2[$k]['dayscount'] = $dayscount;
		
		$setdata2[$k]['doc_file_name_683'] = $data683['doc_file_name'];
		$setdata2[$k]['doc_file_name_663'] = $data663['doc_file_name'];
		$setdata2[$k]['doc_file_name_699'] = $data699['doc_file_name'];
				
}

 	$fwViewData['list'] =  $setdata2;

 }
}

//$_SESSION['last_sql'] = $sql;
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Certifier Completion Report";

