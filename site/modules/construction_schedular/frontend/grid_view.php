<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('construction_schedular_assignto');

$bsn_id = $fwRequest->getParam('bsn_id', '');
$fwViewData['bsn_id'] = $bsn_id;

$sqlT = "Select bsn_name from business where bsn_id =  ".$bsn_id;
$fwViewData['bus_data'] = $fwDb->queryOne($sqlT);

$where = " WHERE 1 = 1";

$save = $fwRequest->getParam('save', ''); 
if(!empty($save))
{
    $cs_id = $fwRequest->getParam('cs_id', 0);
    $assignto = $fwRequest->getParam('assignto', '');
			    
	$detail2['at_cs_id']= $cs_id;
	$detail2['at_assign_to']= $assignto;
		
    $opr = $table->insertRow($detail2); 
    
	$fwViewData['opr'] = $opr;					
}  
  
  
$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE ." where cs_bsn_id = ".$bsn_id ;	

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
			
		$d1 = changedate_y_m_d($v['cs_start_date']);
		$d2 = changedate_y_m_d($v['cs_end_date']);
		
		if(!empty($d2))
		{
			
			$diff = daysDifference($d2, $d1);
			$listsnew[$k]['diff'] = $diff;
		}
		
		$sqlat = "select * from construction_schedular_assignto where at_cs_id = ".$v['cs_id'];
        $dataat = $fwDb->query($sqlat);
		
		$listsnew[$k]['assign_to'] = $dataat;
		
}

$fwViewData['list'] = $listsnew;
$fwViewData['title'] = $MODULE_PLURAL;

$sqlc = "SELECT contacts.cs_first_name, contacts.cs_surname, contacts.cs_primary_email   from contacts 
          Inner join companies ON contacts.cs_company = companies.co_id
	 	  where companies.co_id = 2 group by cs_primary_email order by contacts.cs_is_primary desc ";
		  
$cdata = $fwDb->query($sqlc);	
$fwViewData['cdata'] = $cdata;