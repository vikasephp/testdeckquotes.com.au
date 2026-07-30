<?php
$pagenum = $fwRequest->getparamget('pagenum','');
$sql = "Select  res_respondent_id, res_column_name, res_column_value from survey_data WHERE res_column_name = 'StartDate' Group By res_respondent_id ORDER BY res_respondent_id DESC"; 

if($sql){$userData = $fwDb->query($sql);}

if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
    $page_rows = 20;
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
    
    $sql2 =  $sql." ".$max;
if($sql2){$data= $fwDb->query($sql2);}
		if($data){
			$in ="(";
	foreach($data as $k => $v){$in .= $v['res_respondent_id'].", ";}
			$in= rtrim($in,", ");			
			$in =$in.")";
			}	
			
	if($in){	
$finalsql = "SELECT * FROM survey_data WHERE  res_respondent_id IN ".$in." GROUP BY res_respondent_id";

$listdata= $fwDb->query($finalsql);	
		}

foreach($listdata as $k => $v)	
						{
							
							
							$sql = "SELECT * from survey_data WHERE res_respondent_id = ".$v['res_respondent_id'];		
							$buyerdata = $fwDb->query($sql);	
							
							if($buyerdata)
								{
									foreach($buyerdata as $k1 => $v1)
											{
											if($v1['res_column_value'])
												{
												$nsdata[replace_string($v1['res_column_name'])] = $v1['res_column_value'];
												}
											}
								}
						$sdata[] = $nsdata;					
					
						}

		
$fwViewData['response_Data'] = $sdata;

//DB($fwViewData['response_Data']);


}
$fwViewData['title'] = 'Response List';

