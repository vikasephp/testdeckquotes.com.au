<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('property_price_report');

$where = " WHERE 1 = 1";

$hidden = $fwRequest->getParam('hidden', '');
	if(!empty($hidden)) {
	$where = " WHERE 1 = 1";	
}


$clear = $fwRequest->getParam('clear', '');
if($clear) {
	 $fwViewData['due_date']='';
}


$upload_checklist = $fwRequest->getParam('upload_checklist', '');
if($upload_checklist)
{
		
	 $keys_2 = array_keys($upload_checklist);
	 $ky_2 = $keys_2[0];
	 $val_2 = $upload_checklist[$ky_2];
	
	  $detail['pp_upload_checklist'] = $val_2;
	  $detail['pp_up_chk_date'] = date('d-m-Y');
	  $detail['pp_up_chk_user'] = $_SESSION['user']['user_name'];
	  $table->setWhere("pp_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}
//exit;

$repo_finished = $fwRequest->getParam('repo_finished', '');
if($repo_finished)
{
	 $keys_2 = array_keys($repo_finished);
	 $ky_2 = $keys_2[0];
	 $val_2 = $repo_finished[$ky_2];
	
	  $detail['pp_report_finished'] = $val_2;
	  $detail['pp_report_finish_user'] = $_SESSION['user']['user_name'];
	  $detail['pp_report_finish_date'] = date('d-m-Y');
	  $table->setWhere("pp_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}

//$ord =  " ORDER BY if(  zm_meeting_date  = ' '
      //    OR zm_meeting_date  IS NULL , 1, 0 ) , STR_TO_DATE( zm_meeting_date, '%d-%m-%Y' ) DESC";

//$keyword = $fwRequest->getParam('keyword', '');
//if($keyword):
//
//	$where .= " AND phone_log.ph_name LIKE '%".$keyword."%' OR 
//	            phone_log.ph_company LIKE '%".$keyword."%' OR 
//                    phone_log.ph_user_created  LIKE '%".$keyword."%' OR 
//		    phone_log.ph_steam  LIKE '%".$keyword."%'  ";
//		    
//	
//	$_SESSION['keyword'] = $keyword;
//	$fwViewData['keyword']=$_SESSION['keyword'];
//
//elseif($_SESSION['keyword'] && $pagenum > 0):
//
//	$where .= " AND phone_log.ph_name LIKE '%".$_SESSION['keyword']."%' OR 
//	            phone_log.ph_company LIKE '%".$_SESSION['keyword']."% OR 
//		    phone_log.ph_user_created 	 LIKE '%".$_SESSION['keyword']."%' OR 
//		    phone_log.ph_steam LIKE '%".$_SESSION['keyword']."%' ";	
//	
//	$fwViewData['keyword']=$_SESSION['keyword'];
//endif;
  
  
 
$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE .' '.$where ." order by pp_id DESC";	

if($matsql){$userData = $fwDb->query($matsql);}

$fwViewData['total'] = sizeof($userData);

if(!empty($userData))
{
if (!(isset($pagenum))){ $pagenum = 1; } 
    $rows = count($userData);
    $page_rows = 200;
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
	
	$fwViewData['list'] = $listsnew;
  }
}


foreach($listsnew as $k=>$v)
{
	$pp_project = addslashes($v['pp_project']);
	$sql_1 = "SELECT bsn_id FROM business WHERE bsn_name = '$pp_project'";
    //$sql_1 = "select bsn_id from business where bsn_name='".$v['pp_project']."'";	
    $data = $fwDb->queryOne($sql_1);
    
    $link = BASE_URL."business.detail/bsn_id/".$data['bsn_id'];
	
	$sql_2 = "select bcust_fname, bcust_lname from business_sellers 
	          Inner Join business on business_sellers.bs_business_id = business.bsn_id
			  Inner Join bus_customers on business_sellers.bs_customers_id  = bus_customers.bcust_id
			  where business_sellers.bs_business_id = ".$data['bsn_id'];
	$data_2 = $fwDb->queryOne($sql_2);
	
	$sql_3 = "select dpn_unique_id from document_proposal_name where dpn_bsn_id = ".$data['bsn_id'];
	$data_3 = $fwDb->query($sql_3);
	
	$sql20 = "Select document_check_list_mini.doc_file_name from document_check_list_mini
			  where document_check_list_mini.doc_bsn_id = ". $data['bsn_id'] . " And document_check_list_mini.doc_name_id = 20";
	$data20 = $fwDb->queryOne($sql20);
	

	$sql64 = "Select document_check_list.doc_file_name from document_check_list
			  where document_check_list.doc_bsn_id = ". $data['bsn_id'] . " And document_check_list.doc_name_id = 64";
	$data64 = $fwDb->queryOne($sql64);
		
	$listsnew[$k]['link'] = $link;
	$listsnew[$k]['customer'] = $data_2['bcust_fname']. ' '.$data_2['bcust_lname'];
	$listsnew[$k]['checklist'] = $data_3;
	$listsnew[$k]['doc_file_name_20'] = $data20['doc_file_name'];
	$listsnew[$k]['doc_file_name_64'] = $data64['doc_file_name'];  	
}

$fwViewData['list'] = $listsnew;

$fwViewData['title'] = $MODULE_PLURAL;

$sql2 = "SELECT  * from  report_type_admin";
$fwViewData['typedetail'] = $fwDb->query($sql2);



