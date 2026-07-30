<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$table = new Fw_Db_Table('business');
$where = "where business.bsn_status like '%|3|%' and business.bsn_qar_hide = 0 ";
$fwViewData['ran'] =  rand(100000,999999);


$savedata_wr = $fwRequest->getParam('savedata_wr', '');
if($savedata_wr) 
{ 
		if($_FILES['wall_roof']['name'])
		{
			$docfile_4 = $_FILES['wall_roof']['name'];
			$docfile_4 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_4);
			$temp_name_4 = $_FILES['wall_roof']['tmp_name'];
			$dt1 = date('d-m-Y');
			$wallroofData['bsn_qar_wall_roof_date'] = $dt1;
			$wallroofData['bsn_qar_wall_roof'] = $docfile_4;
			
			upload($docfile_4, $temp_name_4);
			
			$bsn_id = $fwRequest->getParam('bsn_id', '');
				
			$table->setWhere('bsn_id = '.$bsn_id);
			if($table->rowExists())
			{
			
				$detail = $table->updateRow($wallroofData);	
			}		
		}	
}




$savedata_ps = $fwRequest->getParam('savedata_ps', '');
if($savedata_ps) 
{ 
		if($_FILES['pre_sheet']['name'])
		{
			$docfile_1 = $_FILES['pre_sheet']['name'];
			$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
			$temp_name_1 = $_FILES['pre_sheet']['tmp_name'];
			$dt1 = date('d-m-Y');
			$presheetData['bsn_qar_pre_sheet_date'] = $dt1;
			$presheetData['bsn_qar_pre_sheet'] = $docfile_1;
			
			upload($docfile_1, $temp_name_1);
			
			$bsn_id = $fwRequest->getParam('bsn_id', '');
				
			$table->setWhere('bsn_id = '.$bsn_id);
			if($table->rowExists())
			{
			
				$detail = $table->updateRow($presheetData);	
			}		
		}	
}

$savedata_pw = $fwRequest->getParam('savedata_pw', '');
if($savedata_pw) 
{ 
		
		if($_FILES['pre_walk']['name'])
		{

			$docfile_2 = $_FILES['pre_walk']['name'];
			$docfile_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
			$temp_name_2 = $_FILES['pre_walk']['tmp_name'];
				
			$dt1 = date('d-m-Y');
			$prewalkData['bsn_qar_pre_walk_date'] = $dt1;
			$prewalkData['bsn_qar_pre_walk'] = $docfile_2;
			
			upload($docfile_2, $temp_name_2);
			$bsn_id = $fwRequest->getParam('bsn_id', '');
			
				
				$table->setWhere('bsn_id = '.$bsn_id);
				if($table->rowExists())
				{
					
					$detail = $table->updateRow($prewalkData);	
				}		
		}	
}


//

$savedata_fi = $fwRequest->getParam('savedata_fi', '');
if($savedata_fi) 
{ 
		if($_FILES['fix_insp']['name'])
		{
			$docfile_11 = $_FILES['fix_insp']['name'];
			$docfile_11 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_11);
			$temp_name_11 = $_FILES['fix_insp']['tmp_name'];
			$dt1 = date('d-m-Y');
			$fiData['bsn_qar_fix_insp_date'] = $dt1;
			$fiData['bsn_qar_fix_insp'] = $docfile_11;
			
			upload($docfile_11, $temp_name_11);
			
			$bsn_id = $fwRequest->getParam('bsn_id', '');
				
			$table->setWhere('bsn_id = '.$bsn_id);
			if($table->rowExists())
			{
			
				$detail = $table->updateRow($fiData);	
			}		
		}	
}


//





$savedata_car = $fwRequest->getParam('savedata_car', '');
if($savedata_car) 
{ 
		
		if($_FILES['ca_report']['name'])
		{

			$docfile_3 = $_FILES['ca_report']['name'];
			$docfile_3 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_3);
			$temp_name_3 = $_FILES['ca_report']['tmp_name'];
			$dt3 = date('d-m-Y');
			$carData['bsn_qar_com_aud_date'] = $dt3;
			$carData['bsn_qar_com_aud'] = $docfile_3;
			upload($docfile_3, $temp_name_3);
			$bsn_id = $fwRequest->getParam('bsn_id', '');
			
				
				$table->setWhere('bsn_id = '.$bsn_id);
				if($table->rowExists())
				{
					
					$detail = $table->updateRow($carData);	
				}		
		}	
}






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

		$ccdate = $v['bsn_status_sys_date'];
		$Statusdate = changedate_y_m_d($ccdate);
		$curdate_y_m_d = date('Y-m-d');
		$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
			
		$sql_1 = "Select ppd_signoff_doc from progress_payment_detail
			  where ppd_bsn_id = ". $v['bsn_id']. " And ppd_stage like '%Floor Systems Complete%'";
		$data_1 = $fwDb->queryOne($sql_1);
		
		$sql_2 = "Select ppd_signoff_doc from progress_payment_detail
			  where ppd_bsn_id = ". $v['bsn_id']. " And ppd_stage like '%Wall and Roof Frames%'";
		$data_2 = $fwDb->queryOne($sql_2);
		
		$sql_3 = "Select ppd_signoff_doc from progress_payment_detail
			  where ppd_bsn_id = ". $v['bsn_id']. " And ppd_stage like '%Close Up%'";
		$data_3 = $fwDb->queryOne($sql_3);
		
		$sql_4 = "Select ppd_signoff_doc from progress_payment_detail
			  where ppd_bsn_id = ". $v['bsn_id']. " And ppd_stage like '%Fixing%'";
		$data_4 = $fwDb->queryOne($sql_4);
		
		$sql_5 = "Select ppd_signoff_doc from progress_payment_detail
			  where ppd_bsn_id = ". $v['bsn_id']. " And ppd_stage like '%Painting%'";
		$data_5 = $fwDb->queryOne($sql_5);
		
		$sql_6 = "Select ppd_signoff_doc from progress_payment_detail
			  where ppd_bsn_id = ". $v['bsn_id']. " And ppd_stage like '%Project Completion%'";
		$data_6 = $fwDb->queryOne($sql_6);
		
		$setdata2[$k]['link'] = $link;
		$setdata2[$k]['status'] = $v['bsn_sub_status'];
		$setdata2[$k]['dayscount'] = $dayscount;
		$setdata2[$k]['floor_system'] = $data_1['ppd_signoff_doc'];
		$setdata2[$k]['wall_roof'] = $data_2['ppd_signoff_doc'];
		$setdata2[$k]['close_up'] = $data_3['ppd_signoff_doc'];
		$setdata2[$k]['fixing'] = $data_4['ppd_signoff_doc'];
		$setdata2[$k]['painting'] = $data_5['ppd_signoff_doc'];
		$setdata2[$k]['project'] = $data_6['ppd_signoff_doc'];
}

 	$fwViewData['list'] =  $setdata2;

 }
}

//$_SESSION['last_sql'] = $sql;
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Quality Assurance Report";

