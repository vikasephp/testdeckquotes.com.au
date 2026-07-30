<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$table = new Fw_Db_Table('business');
$where = "where business.bsn_status like '%|3|%' and business.bsn_ppr_hide  = 0 ";
$fwViewData['ran'] =  rand(100000,999999);


// Save Hide
$hide = $fwRequest->getParam('hide', '');
if(!empty($hide)) {
	$key = array_keys($hide);
	$ky = $key[0];
	$hideDetail['bsn_ppr_hide'] = $hide[$ky];
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
		
	$sql = "SELECT business.bsn_id, business.bsn_name,  business.bsn_status_sys_date, business.bsn_address, business.bsn_ppr_hide,
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

}

 	$fwViewData['list'] =  $setdata2;

 }
}

$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Project Payment Report";

