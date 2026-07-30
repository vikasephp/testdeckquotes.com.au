<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('variation_design_agreement');

$save_sva = $fwRequest->getParam('save_sva', '');
if($save_sva) 
{ 
		if($_FILES['vd_agreement']['name'])
		{

			$docfile_12 = $_FILES['vd_agreement']['name'];
			$docfile_12 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_12);
			$temp_name_12 = $_FILES['vd_agreement']['tmp_name'];
			$clData['vd_sv_agreement'] = $docfile_12;
				
			upload($docfile_12, $temp_name_12);
			
			$vd_id = $fwRequest->getParam('vd_id', '');
				
				$table->setWhere('vd_id = '.$vd_id);
				if($table->rowExists())
				{
				
					$detail = $table->updateRow($clData);	
				}		
		}	
}


//$clear = $fwRequest->getParam('clear', '');
//if($clear) {
//	 $fwViewData['due_date']='';
//}
//
//
//
//   $search_project = $fwRequest->getParam('project_name', '');
//
//  if($search_project):
//    
//       $where .= " AND cp_project_name  LIKE '%".$search_project."%'  ";
//       $_SESSION['search_project'] = $search_project;
//       $fwViewData['search_project']=$_SESSION['search_project'];
//
//  elseif($_SESSION['search_project'] && $pagenum > 0):
//		
//       $where .= " AND cp_project_name LIKE  '%".$_SESSION['search_project']."%' ";
//       $fwViewData['search_project']=$_SESSION['search_project'];
//	
//  endif;
  
$matsql = "Select * from variation_design_agreement";	

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

foreach($listsnew as $k => $v)
{
	
	
	   $dayscount='';
			
		$createdate = changedate_y_m_d($v['vd_create_date']);
		
		if(!empty($createdate))
		{
			$curdate_y_m_d = date('Y-m-d');
			$dayscount = daysDifference($curdate_y_m_d, $createdate);
		}
		$listsnew[$k]['dayscount'] = $dayscount;
		
		 
}

$fwViewData['list'] = $listsnew;

$fwViewData['title'] = $MODULE_PLURAL;

$sql = "SELECT  bsn_name from business where bsn_sub_status = 'Open'";
$fwViewData['projdetail'] = $fwDb->query($sql);

$sqlst = "SELECT  * from variation_design_status ";
$fwViewData['stdetail'] = $fwDb->query($sqlst);

$sqltype = "SELECT  * from variation_design_type ";
$fwViewData['typedetail'] = $fwDb->query($sqltype);


$sqlc = "SELECT  cs_id, cs_first_name,cs_surname from contacts
         INNER JOIN companies on contacts.cs_company = companies.co_id 
		 where contacts.cs_company = 2";
$fwViewData['contactdetail'] = $fwDb->query($sqlc);