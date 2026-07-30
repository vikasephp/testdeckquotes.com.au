<?php

$table = new Fw_Db_Table('document_proposal_name');
$pagenum = $fwRequest->getparamget('pagenum',0);

$archive = $fwRequest->getParam('archive', '');
if($archive)
{
	 $keys_2 = array_keys($archive);
	 $ky_2 = $keys_2[0];
	 $val_2 = $archive[$ky_2];

	  $detail['dpn_archived'] = $val_2;
	  $table->setWhere("dpn_unique_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}

	$clearsearch = $fwRequest->getParam('clearsearch', '');
	if(!empty($clearsearch)) {
			unset($fwViewData['keyword']);
			unset($_SESSION['keyword']);	
		}


	$keyword = $fwRequest->getParam('searchkey', '');
		
	if($keyword):
	$where .= " AND business.bsn_name LIKE '%".$keyword."%'";
		
		$_SESSION['keyword'] = $keyword;
		$fwViewData['keyword']=$_SESSION['keyword'];
	
	elseif($_SESSION['keyword'] ):
	
		$where .= " AND business.bsn_name LIKE '%".$_SESSION['keyword']."%'";
		$fwViewData['keyword']=$_SESSION['keyword'];
	endif;
	
	   
 $matsql = "SELECT dpn_bsn_id, dpn_unique_id, dpn_archived, bsn_name FROM document_proposal_name
			Inner join business on document_proposal_name.dpn_bsn_id =  business.bsn_id
			where document_proposal_name.dpn_archived =  1 " .$where;

if($matsql){$userData = $fwDb->query($matsql);}


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
    if($sql2){
        
        $lists= $fwDb->query($sql2); 
  }
}

foreach($lists as $k=>$v)
{
   			
	    $link = $BASE_URL. "business.detail/bsn_id/".$v['dpn_bsn_id'];
	
		$lists[$k]['link'] =  $link;		
}


$fwViewData['list'] = $lists;
$fwViewData['title'] = "Archive Checklist Report";
