<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table($TABLE);

$where = "WHERE ld_hide = 0 ";

$actunact = $fwRequest->getParam('actunact', '');
if(!empty($actunact))
{
	$ld_id = $fwRequest->getParam('ld_id', '');
 	$audetail['ld_action'] = $actunact;
	$table->setWhere('ld_id = '.$ld_id);
	if($table->rowExists())
	{
		 $this_id = $table->updateRow($audetail);
	}
}

$hide = $fwRequest->getParam('hide', '');

if($hide)
{
	 foreach($hide as $k=>$v)
	 {
		  $id = $k; 
	 }
	 
	  $detail['ld_hide'] = $v;
	  $table->setWhere('ld_id = '.$id);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }
}

  $showall = $fwRequest->getParam('showall', '');
	if(!empty($showall)) {
		$where = "WHERE 1 = 1";	
	} else {
		$where = " WHERE ld_hide = 0 ";
	}
 
   $searchkey = $fwRequest->getParam('searchkey', '');

  if($searchkey):

       $where .= " AND letter_database.ld_from  LIKE '%".$searchkey."%' OR 
                       letter_database.ld_to    LIKE '%".$searchkey."%' OR  
	               letter_database.ld_who_to_action LIKE '%".$searchkey."%' ";
	
	$_SESSION['searchkey'] = $searchkey;
	$fwViewData['searchkey']=$_SESSION['searchkey'];

       elseif($_SESSION['searchkey'] && $pagenum > 0):
		
       $where .= " AND letter_database.ld_from LIKE  '%".$_SESSION['searchkey']."%' OR
                       letter_database.ld_to   LIKE  '%".$_SESSION['searchkey']."%' OR  
	               letter_database.ld_who_to_action LIKE '%".$_SESSION['searchkey']."%' ";
			
         $fwViewData['searchkey']=$_SESSION['searchkey'];

       elseif(isset($_SESSION['searchkey'])) :
    		
	$where .= " AND letter_database.ld_from LIKE  '%".$_SESSION['searchkey']."%' OR
                        letter_database.ld_to   LIKE  '%".$_SESSION['searchkey']."%' OR  
	                letter_database.ld_who_to_action LIKE '%".$_SESSION['searchkey']."%' ";	
  endif;
 
 
 
 $ptype = $fwRequest->getParam('ptype', '');

 if(!empty($ptype)) {
	$where = "WHERE ld_project_type like '%" .$ptype."%'";	
	$_SESSION['ptype'] = $ptype;
	unset($_SESSION['actioned']);
  }
 
  if(!empty($_SESSION['ptype'])) {
	$where = "WHERE ld_project_type like '%" .$_SESSION['ptype']."%'";	
  }
  
  $actioned = $fwRequest->getParam('actioned', '');

 if(!empty($actioned)) {
	$where = "WHERE ld_action = '" .$actioned."'";	
	$_SESSION['actioned'] = $actioned;
	unset($_SESSION['ptype']);
  }
 
  if(!empty($_SESSION['actioned'])) {
	$where = "WHERE ld_action = '" .$_SESSION['actioned']."'";	
  }
  
  $hide_act = $fwRequest->getParam('hide_act', '');
   if(!empty($hide_act)) {
	$where = "WHERE ld_action = 'Unactioned'";	
	$_SESSION['hide'] = 'Unactioned';
	unset($_SESSION['ptype']);
	unset($_SESSION['actioned']);
  }
 
  if(!empty($_SESSION['hide'])) {
	$where = "WHERE ld_action = 'Unactioned'";	
  }
   
  $clear = $fwRequest->getParam('clear', '');
  if(!empty($clear)) {
	$where = "WHERE ld_hide = 0 ";  
	unset($_SESSION['ptype']);
	unset($_SESSION['actioned']);
	unset($_SESSION['hide']);
	unset($_SESSION['searchkey']);	
  }
  

  
$matsql = "SELECT * FROM letter_database ".$where." ORDER BY STR_TO_DATE(ld_date,'%d-%m-%Y') DESC";	


if($matsql){$userData = $fwDb->query($matsql);}

if(!empty($userData))
{
if (!(isset($pagenum))){ $pagenum = 1; } 
    $rows = count($userData);
    $page_rows = 50;
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

$fwViewData['title'] = $MODULE_PLURAL;